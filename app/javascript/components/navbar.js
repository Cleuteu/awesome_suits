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

function changeNavbarBackOnHomepage() {
  const path = window.location.pathname
  const navbar = document.querySelector('.navbar-wagon');
  if (path === "/") {
    navbar.classList.add('navbar-wagon-background-transparent');
  }
}

export { initUpdateNavbarOnScroll };
export { changeNavbarBackOnHomepage };
