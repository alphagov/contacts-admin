$(document).ready(function(){
  $(".js-chosen-select").each(function (i, select){
    var $select = $(select);
    $select.chosen({
      allow_single_deselect: $select.data("allow-single-deselect")
    });
  });

  $("section.diff").each(function( index ) {
    GOVUK.diff($(this).attr("id"));
  });
});