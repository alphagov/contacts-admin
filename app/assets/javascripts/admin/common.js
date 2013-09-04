$(document).ready(function(){
  $(".js-chosen-select").chosen();

  //expand questions accordion
  $(".js-expand-link").click(function(){
    $(this).closest(".js-expand-list").toggleClass("js-expanded");
  })
});