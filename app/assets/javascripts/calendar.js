$(document).ready(function(){
  $('[data-close]').click(
    ({target}) => $(target).closest('.closeable').remove()
  )
});