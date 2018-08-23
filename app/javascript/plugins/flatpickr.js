import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const rentingForm = document.getElementById('renting-form-div');
const rentings = JSON.parse(rentingForm.dataset.rentings);

if (rentingForm) {
  flatpickr("#renting_start_date", {
    mode: "range",
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    plugins: [new rangePlugin({ input: "#renting_end_date"})],
    "disable": rentings,
  })
}
