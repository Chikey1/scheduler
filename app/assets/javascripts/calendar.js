function ready() {
  $('[data-close]').click(
    ({target}) => $(target).closest('.closeable').remove()
  )
  $('select').formSelect();
  $('.timepicker').timepicker();
  $('.tabs').tabs();
}

$(document).ready(ready)
document.addEventListener("turbolinks:load", function() {
  ready()
})
