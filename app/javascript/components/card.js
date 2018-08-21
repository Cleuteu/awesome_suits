function cartAnim() {
  $('.buy').click(function(){
    $('.bottom').addClass("clicked");
  });
  $('.remove').click(function(){
    $('.bottom').removeClass("clicked");
  });
}

export { cartAnim };
