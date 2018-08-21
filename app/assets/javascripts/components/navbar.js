function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-black');
      } else {
        navbar.classList.remove('navbar-wagon-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
