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

// Mostrar solo las promos del día y dejar las demás ocultas hasta que el usuario pida ver más.
const promoSections = document.querySelectorAll('section[id^="combos-"]');
const showPromosButtons = document.querySelectorAll('.btn-ver-mas-promos');
const hidePromosButtons = document.querySelectorAll('.btn-ver-menos-promos');

const daySectionMap = {
    0: ['combos-domingo', 'combos-domingo3'],
    1: ['combos-lunes', 'combos-lunes2'],
    2: ['combos-martes', 'combos-martes2'],
    3: ['combos-miercoles', 'combos-miercoles2'],
    4: ['combos-jueves', 'combos-jueves2'],
    5: ['combos-viernes', 'combos-viernes2'],
    6: ['combos-sabado', 'combos-sabado2'],
};

const today = new Date().getDay();
const todaySectionIds = daySectionMap[today] || daySectionMap[1];

function collapsePromos() {
    promoSections.forEach(section => {
        if (!todaySectionIds.includes(section.id)) {
            section.classList.add('promo-oculto');
        }
    });
    showPromosButtons.forEach(btn => {
        btn.classList.remove('hidden');
        btn.style.display = 'inline-flex';
    });
    hidePromosButtons.forEach(btn => {
        btn.classList.add('hidden');
        btn.style.display = '';
    });
}

function expandPromos() {
    promoSections.forEach(section => section.classList.remove('promo-oculto'));
    showPromosButtons.forEach(btn => {
        btn.classList.add('hidden');
        btn.style.display = 'none';
    });
    hidePromosButtons.forEach(btn => {
        btn.classList.remove('hidden');
        btn.style.display = 'inline-flex';
    });
}

collapsePromos();

showPromosButtons.forEach(button => {
    button.addEventListener('click', () => {
        expandPromos();
        const promosAnchor = document.getElementById('promos');
        if (promosAnchor) {
            promosAnchor.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

hidePromosButtons.forEach(button => {
    button.addEventListener('click', () => {
        collapsePromos();
        const promosAnchor = document.getElementById('promos');
        if (promosAnchor) {
            promosAnchor.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

// --- Header: reducir y suavizar al hacer scroll ---
const header = document.querySelector('.header');
const SCROLL_THRESHOLD = 60;

function handleHeaderOnScroll() {
    if (!header) return;
    if (window.scrollY > SCROLL_THRESHOLD) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
}

window.addEventListener('scroll', handleHeaderOnScroll, { passive: true });
// Ejecutar en carga por si la página abre con scroll
handleHeaderOnScroll();