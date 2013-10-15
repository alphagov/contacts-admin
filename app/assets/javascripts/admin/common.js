$(document).ready(function(){
  $(".js-chosen-select").chosen();

  //expand questions accordion
  $(".js-expand-list").addClass("js-hidden");
  $(".js-expand-link").click(function(){
    $(this).closest(".js-expand-list").toggleClass("js-hidden");
  })
  $("section.diff").each(function( index ) {
    GOVUK.diff($(this).attr("id"));
  });
});