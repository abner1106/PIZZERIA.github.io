// Menú hamburguesa para móviles
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');

if (menuToggle && navLinks) {
    menuToggle.addEventListener('click', () => {
        navLinks.classList.toggle('active');
    });

    // Cerrar menú al hacer clic en un enlace (en móvil)
    navLinks.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', () => {
            navLinks.classList.remove('active');
        });
    });
}

// Enviar pedidos de promos por WhatsApp
const phoneNumber = '529511620311';
const promoButtons = document.querySelectorAll('.combo-card .btn.btn-oscuro');

promoButtons.forEach(button => {
    button.addEventListener('click', () => {
        const card = button.closest('.combo-card');
        const title = card?.querySelector('h3')?.textContent.trim() || 'Promo';
        const promoDay = title.replace('🎯', '').trim();
        const message = `🎯Hola me gustaría ordenar la promo (${promoDay})`;
        window.open(`https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`, '_blank', 'noopener,noreferrer');
    });
});