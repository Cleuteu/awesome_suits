import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

const rentingForm = document.getElementById('renting-form-div');
const rentings = JSON.parse(rentingForm.dataset.rentings);

if (rentingForm) {
  flatpickr(".datepicker", {
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    "disable": rentings,
  })
}
