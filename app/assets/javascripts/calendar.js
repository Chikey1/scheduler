function ready() {
  $('[data-close]').click(
    ({target}) => $(target).closest('.closeable').remove()
  )
  $('select').formSelect();
  $('.timepicker').timepicker();
  $('.tabs').tabs();
  $('.dropdown-trigger').dropdown({coverTrigger: false});
}

$(document).ready(ready)
document.addEventListener("turbolinks:load", function() {
  ready()
})
