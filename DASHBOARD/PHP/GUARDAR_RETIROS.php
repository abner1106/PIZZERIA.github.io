<?php
// Añadir session_start() al inicio
session_start();
header('Content-Type: application/json');
require_once 'CONEXION.php';

// Verificar que el usuario esté logueado
if (!isset($_SESSION['empleado_id']) || $_SESSION['empleado_tipo'] !== 'administrativo') {
    http_response_code(401);
    echo json_encode([
        'success' => false,
        'message' => 'No autorizado. Debe iniciar sesión como administrativo.'
    ]);
    exit;
}

try {
    // Obtener datos del cuerpo de la solicitud
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    // Validar datos - CAMBIO: id_empleado NO viene del JSON, viene de la sesión
    if (!isset($data['monto']) || !isset($data['motivo'])) {
        throw new Exception('Datos incompletos para el retiro');
    }

    // CAMBIO: Tomar id_empleado de la sesión, no del JSON
    $id_empleado = $_SESSION['empleado_id']; // Esto viene de la sesión
    $monto = floatval($data['monto']);
    $motivo = trim($data['motivo']);

    if ($monto <= 0) {
        throw new Exception('El monto debe ser mayor que cero');
    }

    // Validar que el motivo no esté vacío
    if (empty($motivo)) {
        throw new Exception('El motivo no puede estar vacío');
    }

    // Insertar retiro en la base de datos - Añadimos fecha automática
    $stmt = $conn->prepare("
        INSERT INTO retiros_caja (id_empleado, monto, motivo, fecha)
        VALUES (:id_empleado, :monto, :motivo, NOW())
    ");

    $stmt->bindParam(':id_empleado', $id_empleado, PDO::PARAM_INT);
    $stmt->bindParam(':monto', $monto);
    $stmt->bindParam(':motivo', $motivo);

    if (!$stmt->execute()) {
        throw new Exception('Error al registrar el retiro');
    }

    // Obtener información del retiro registrado
    $id_retiro = $conn->lastInsertId();

    $stmtRetiro = $conn->prepare("
        SELECT 
            r.*, 
            e.nombre AS empleado,
            DATE_FORMAT(r.fecha, '%Y-%m-%d %H:%i:%s') as fecha_formateada
        FROM retiros_caja r
        JOIN empleados e ON r.id_empleado = e.id_empleado
        WHERE r.id_retiro = :id_retiro
    ");

    $stmtRetiro->bindParam(':id_retiro', $id_retiro, PDO::PARAM_INT);
    $stmtRetiro->execute();
    $retiro = $stmtRetiro->fetch(PDO::FETCH_ASSOC);

    echo json_encode([
        'success' => true,
        'retiro' => $retiro,
        'message' => 'Retiro registrado exitosamente'
    ]);

} catch (Exception $e) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'message' => 'Error al registrar retiro: ' . $e->getMessage()
    ]);
}
?>