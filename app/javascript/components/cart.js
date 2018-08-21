function cart() {
  $('.buy').click(function(){
    $('.bottom').addClass("clicked");
  });
  $('.remove').click(function(){
    $('.bottom').removeClass("clicked");
  });
}

export { cart };
