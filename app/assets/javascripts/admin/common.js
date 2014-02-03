$(document).ready(function(){
  $(".js-chosen-select").each(function (i, select){
    var $select = $(select);
    $select.chosen({
      allow_single_deselect: $select.data("allow-single-deselect")
    });
  });

  //expand questions accordion
  $(".js-expand-list").addClass("js-hidden");
  $(".js-expand-link").click(function(){
    $(this).closest(".js-expand-list").toggleClass("js-hidden");
  })
  $("section.diff").each(function( index ) {
    GOVUK.diff($(this).attr("id"));
  });
});