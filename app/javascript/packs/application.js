import "bootstrap";

import "../plugins/flatpickr"
import "../components/navtabs"

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { changeNavbarBackOnHomepage } from '../components/navbar';
changeNavbarBackOnHomepage();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
