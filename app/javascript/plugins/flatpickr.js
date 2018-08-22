import flatpickr from "flatpickr"
import "flatpickr/dist/themes/confetti.css" // Note this is important!

const rentingForm = document.getElementById('renting-form-div');
const rentings = JSON.parse(rentingForm.dataset.rentings);

flatpickr(".datepicker", {
  dateFormat: "Y-m-d",
  "disable": rentings,
})
