document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('loginForm');

    loginForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        // Validación básica
        if (username.trim() === '' || password.trim() === '') {
            showError('Por favor complete todos los campos');
            return;
        }

        // Aquí iría la lógica de autenticación real
        authenticateUser(username, password);
    });

    function authenticateUser(username, password) {
        // Simulación de autenticación (en un caso real, sería una petición al servidor)
        console.log('Autenticando usuario:', username);

        // Mostrar efecto de carga
        const btnLogin = document.querySelector('.btn-login');
        btnLogin.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Autenticando...';
        btnLogin.disabled = true;


    }

    function showError(message) {
        // Eliminar notificaciones previas
        const oldAlert = document.querySelector('.alert');
        if (oldAlert) oldAlert.remove();

        const alert = document.createElement('div');
        alert.className = 'alert error';
        alert.innerHTML = `<i class="fas fa-exclamation-circle"></i> ${message}`;
        loginForm.insertBefore(alert, loginForm.firstChild);

        setTimeout(() => {
            alert.classList.add('show');
        }, 10);

        // Eliminar después de 5 segundos
        setTimeout(() => {
            alert.classList.remove('show');
            setTimeout(() => {
                alert.remove();
            }, 300);
        }, 5000);
    }

    function showSuccess(message) {
        const alert = document.createElement('div');
        alert.className = 'alert success';
        alert.innerHTML = `<i class="fas fa-check-circle"></i> ${message}`;
        loginForm.insertBefore(alert, loginForm.firstChild);

        setTimeout(() => {
            alert.classList.add('show');
        }, 10);
    }
});

// Añadir estilos dinámicos para las alertas
const style = document.createElement('style');
style.textContent = `
    .alert {
        position: relative;
        padding: 15px 20px;
        margin-bottom: 20px;
        border-radius: 8px;
        font-size: 0.9rem;
        opacity: 0;
        transform: translateY(10px);
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
    }
    
    .alert.show {
        opacity: 1;
        transform: translateY(0);
    }
    
    .alert i {
        margin-right: 10px;
        font-size: 1.2rem;
    }
    
    .alert.error {
        background-color: #f8d7da;
        color: #721c24;
        border-left: 4px solid #f5c6cb;
    }
    
    .alert.success {
        background-color: #d4edda;
        color: #155724;
        border-left: 4px solid #c3e6cb;
    }
`;
document.head.appendChild(style);

document.addEventListener('DOMContentLoaded', function () {
    // Crear líneas de velocidad dinámicas
    createSpeedLines();

    // Efectos de entrada para inputs
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        // Efecto al focus
        input.addEventListener('focus', function () {
            this.style.transform = 'translateY(-2px)';
            this.style.boxShadow = '0 0 15px rgba(255, 214, 10, 0.4), inset 0 2px 5px rgba(0, 0, 0, 0.1)';
        });

        // Efecto al blur
        input.addEventListener('blur', function () {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '';
        });

        // Efecto al escribir
        input.addEventListener('input', function () {
            const icon = this.previousElementSibling;
            if (this.value.length > 0) {
                this.style.background = 'rgba(255, 255, 255, 0.12)';
                icon.style.color = '#FF9500';
                icon.style.transform = 'translateY(-50%) scale(1.1)';
            } else {
                this.style.background = 'rgba(255, 255, 255, 0.08)';
                icon.style.color = '#FFD60A';
                icon.style.transform = 'translateY(-50%) scale(1)';
            }
        });
    });

    // Efecto especial en el botón
    const loginBtn = document.querySelector('.btn-login');
    loginBtn.addEventListener('mouseenter', function () {
        this.style.letterSpacing = '1.5px';
        createButtonParticles(this);
    });

    loginBtn.addEventListener('mouseleave', function () {
        this.style.letterSpacing = '1px';
    });

    // Efecto al enviar el formulario
    const form = document.querySelector('form');
    form.addEventListener('submit', function (e) {
        const btn = this.querySelector('.btn-login');
        const originalText = btn.innerHTML;

        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> INGRESANDO...';
        btn.disabled = true;
        btn.style.background = 'linear-gradient(45deg, #FF9500, #FFD60A)';

        // Simular carga
        setTimeout(() => {
            if (!document.querySelector('.error-message')) {
                createLoginSuccess();
            } else {
                btn.innerHTML = originalText;
                btn.disabled = false;
                btn.style.background = 'linear-gradient(45deg, var(--primary), var(--secondary))';
            }
        }, 1500);
    });

    // Efecto de error si existe
    const errorMessage = document.querySelector('.error-message');
    if (errorMessage) {
        shakeElement(errorMessage);
    }

    // Efecto en las hamburguesas decorativas
    const burgers = document.querySelectorAll('.agave-decoration');
    burgers.forEach((burger, index) => {
        burger.addEventListener('mouseenter', function () {
            this.style.filter = 'drop-shadow(0 0 15px var(--accent)) drop-shadow(0 0 30px rgba(255, 149, 0, 0.4))';
        });

        burger.addEventListener('mouseleave', function () {
            this.style.filter = 'drop-shadow(0 0 8px var(--accent)) drop-shadow(0 0 15px rgba(255, 149, 0, 0.2))';
        });
    });
});

function createSpeedLines() {
    const body = document.body;
    const linesCount = 5; // Menos líneas para no saturar

    for (let i = 0; i < linesCount; i++) {
        const line = document.createElement('div');
        line.className = 'speed-line';

        // Posición aleatoria
        const top = Math.random() * 100;
        const deg = Math.random() * 360;
        const delay = Math.random() * 1.5;
        const duration = 1.5 + Math.random() * 1;

        line.style.setProperty('--deg', `${deg}deg`);
        line.style.top = `${top}%`;
        line.style.left = `${-300}px`;
        line.style.animationDelay = `${delay}s`;
        line.style.animationDuration = `${duration}s`;

        // Color aleatorio de la paleta cálida
        const colors = ['#FF3B30', '#FF9500', '#FFD60A'];
        const color = colors[Math.floor(Math.random() * colors.length)];
        line.style.background = `linear-gradient(90deg, transparent, ${color}, transparent)`;

        body.appendChild(line);
    }
}

function createButtonParticles(button) {
    const particleCount = 6; // Menos partículas para tamaño pequeño

    for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';

        // Color según posición
        const colors = ['#FF3B30', '#FF9500', '#FFD60A'];
        const color = colors[i % 3];

        particle.style.background = color;
        particle.style.borderRadius = '50%';
        particle.style.position = 'absolute';
        particle.style.width = '5px';
        particle.style.height = '5px';
        particle.style.filter = 'blur(1px)';

        // Posición inicial (centro del botón)
        particle.style.left = '50%';
        particle.style.top = '50%';

        // Animación explosiva
        const angle = (i / particleCount) * Math.PI * 2;
        const distance = 60; // Menor distancia para tamaño pequeño
        const x = Math.cos(angle) * distance;
        const y = Math.sin(angle) * distance;

        particle.style.animation = `buttonParticle 0.4s ease-out forwards`;

        // Crear keyframes dinámicamente
        const style = document.createElement('style');
        style.textContent = `
            @keyframes buttonParticle {
                0% {
                    transform: translate(-50%, -50%) scale(1);
                    opacity: 1;
                }
                100% {
                    transform: translate(calc(-50% + ${x}px), calc(-50% + ${y}px)) scale(0);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);

        button.appendChild(particle);

        // Remover después de la animación
        setTimeout(() => {
            particle.remove();
            style.remove();
        }, 400);
    }
}

function createLoginSuccess() {
    const container = document.querySelector('.login-container');

    // Efecto de brillo suave
    container.style.boxShadow = '0 0 30px rgba(46, 204, 113, 0.5), 0 0 50px rgba(46, 204, 113, 0.3)';

    // Restaurar botón
    setTimeout(() => {
        const btn = document.querySelector('.btn-login');
        btn.innerHTML = '<i class="fas fa-check"></i> ¡ACCESO OK!';
        btn.style.background = 'linear-gradient(45deg, #2ECC71, #27AE60)';
        btn.style.fontSize = '1rem';

        // Redirección simulada
        setTimeout(() => {
            window.location.href = 'dashboard.php';
        }, 1000);
    }, 500);
}

function shakeElement(element) {
    element.style.animation = 'errorPulse 2s infinite';
}