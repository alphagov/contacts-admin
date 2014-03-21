$(document).ready(function(){
  $(".js-select2").select2({allowClear: true})

  $("section.diff").each(function( index ) {
    GOVUK.diff($(this).attr("id"));
  });
});