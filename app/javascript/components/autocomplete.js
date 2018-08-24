function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var suitAddress = document.getElementById('suit_address');

    if (suitAddress) {
      var autocomplete = new google.maps.places.Autocomplete(suitAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(suitAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });
}

export { autocomplete };
