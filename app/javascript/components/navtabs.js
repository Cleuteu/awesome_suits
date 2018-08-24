function navTabClick() {
  $('.nav-tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
    sessionStorage.setItem('navtab', e.target.dataset.name);
  })
}

function activeButton() {
  var data = sessionStorage.getItem('navtab');
  const activeButton = document.querySelector(`[data-name='${data}']`)
  if (activeButton) {
    activeButton.click()
  }
}

export { navTabClick };
export { activeButton };
