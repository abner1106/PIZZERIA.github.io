<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once 'CONEXION.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

try {
    // Obtener el contenido JSON del cuerpo de la solicitud
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    // Validar que el JSON sea correcto
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Error al decodificar JSON: ' . json_last_error_msg());
    }

    // Validar campos obligatorios
    $requiredFields = ['id_empleado', 'total', 'productos', 'cliente_nombre', 'metodo_pago'];
    foreach ($requiredFields as $field) {
        if (!isset($data[$field])) {
            throw new Exception("Campo requerido faltante: $field");
        }
    }

    // Validar método de pago
    $metodo_pago = $data['metodo_pago'] ?? null;
    if (!in_array($metodo_pago, ['efectivo', 'transferencia'])) {
        throw new Exception("Debe seleccionar un método de pago válido: efectivo o transferencia");
    }

    // Validar productos
    if (!is_array($data['productos']) || empty($data['productos'])) {
        throw new Exception("El campo 'productos' debe ser un array no vacío");
    }

    // Preparar datos para la venta
    $ventaData = [
        'id_empleado' => $data['id_empleado'],
        'tipo_venta' => $data['tipo_venta'] ?? 'local',
        'cliente_nombre' => $data['cliente_nombre'],
        'direccion' => $data['direccion'] ?? null,
        'telefono' => $data['telefono'] ?? null,
        'total' => $data['total'],
        'concepto' => $data['concepto'] ?? null,
        'detalles' => $data['detalles'] ?? null,
        'metodo_pago' => $metodo_pago,
    ];

    // Iniciar transacción
    $conn->beginTransaction();

    // 1. Insertar venta principal
    $stmtVenta = $conn->prepare("
        INSERT INTO ventas (
            id_empleado, 
            tipo_venta, 
            cliente_nombre, 
            direccion, 
            telefono, 
            total, 
            metodo_pago,
            concepto, 
            detalles
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");

    if (
        !$stmtVenta->execute([
            $ventaData['id_empleado'],
            $ventaData['tipo_venta'],
            $ventaData['cliente_nombre'],
            $ventaData['direccion'],
            $ventaData['telefono'],
            $ventaData['total'],
            $ventaData['metodo_pago'],
            $ventaData['concepto'],
            $ventaData['detalles']
        ])
    ) {
        throw new Exception("Error al insertar la venta principal: " . implode(", ", $stmtVenta->errorInfo()));
    }

    $id_venta = $conn->lastInsertId();

    // 2. Insertar o actualizar productos en la tabla productos
    $stmtProducto = $conn->prepare("
        INSERT INTO productos (nombre, descripcion, precio, activo, cantidad_disponible)
        VALUES (?, ?, ?, 1, ?)
        ON DUPLICATE KEY UPDATE 
            precio = VALUES(precio),
            cantidad_disponible = cantidad_disponible - VALUES(cantidad_disponible)
    ");

    // 3. Insertar detalles de venta
    $stmtDetalle = $conn->prepare("
        INSERT INTO detalle_venta (
            id_venta, 
            nombre_producto, 
            precio_unitario, 
            cantidad,
            especialidades,
            observaciones
        ) VALUES (?, ?, ?, ?, ?, ?)
    ");

    foreach ($data['productos'] as $producto) {
        $requiredProductFields = ['nombre', 'cantidad', 'precio'];
        foreach ($requiredProductFields as $field) {
            if (!isset($producto[$field])) {
                throw new Exception("Producto sin campo requerido: $field");
            }
        }

        // Insertar o actualizar producto en la tabla productos
        $descripcion = $producto['descripcion'] ?? $producto['nombre'];
        $cantidad_disponible = $producto['cantidad'] ?? 1; // Para el control de inventario

        if (
            !$stmtProducto->execute([
                $producto['nombre'],
                $descripcion,
                $producto['precio'],
                $cantidad_disponible
            ])
        ) {
            throw new Exception("Error al insertar/actualizar producto: {$producto['nombre']}");
        }

        // Insertar detalle de venta
        if (
            !$stmtDetalle->execute([
                $id_venta,
                $producto['nombre'],
                $producto['precio'],
                $producto['cantidad'],
                $producto['especialidades'] ?? null,
                $producto['observaciones'] ?? null
            ])
        ) {
            throw new Exception("Error al insertar detalle de venta para producto: {$producto['nombre']}");
        }
    }

    // Confirmar transacción
    $conn->commit();

    // Respuesta exitosa
    echo json_encode([
        'success' => true,
        'id_venta' => $id_venta,
        'message' => 'Venta registrada correctamente',
        'data' => [
            'metodo_pago' => $metodo_pago,
            'total' => $ventaData['total'],
            'productos_count' => count($data['productos'])
        ]
    ]);

} catch (Exception $e) {
    // Revertir transacción si hay error
    if (isset($conn) && $conn->inTransaction()) {
        $conn->rollBack();
    }

    // Respuesta de error
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'message' => 'Error al procesar la venta: ' . $e->getMessage(),
        'error_info' => $e->getTraceAsString()
    ]);
}
?>