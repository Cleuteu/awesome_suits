import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Not all superheroes wear capes."],
    typeSpeed: 80,
    backSpeed: 0,
    fadeOut: true,
    loop: true
  });
}

export { loadDynamicBannerText };
