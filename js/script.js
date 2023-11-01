const carousel = document.querySelector('.carousel');
let currentIndex = 0;

setInterval(() => {
    currentIndex = (currentIndex + 1) % 3;
    updateCarousel();
}, 3000); // Cambia de imagen cada 3 segundos

function updateCarousel() {
    const translateX = -currentIndex * 410; // 400px + 10px de margen
    carousel.style.transform = `translateX(${translateX}px)`;
}