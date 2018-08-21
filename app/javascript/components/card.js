function cart(){
  console.log('Hello World')
  $('.buy').click(function(){
    $('.bottom').addClass("clicked");
  });

  $('.remove').click(function(){
    $('.bottom').removeClass("clicked");
  });
}


export { cart };

