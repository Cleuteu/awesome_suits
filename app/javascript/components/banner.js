import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "Not all superheros wear capes"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
