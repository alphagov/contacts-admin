(function ($) {
  $(".js-chosen-select").chosen();

  //toggle hide class
  $(".js-hide-link").click(function(event){
    event.preventDefault();

    $(this).closest(".js-hide-container").toggleClass("js-hide");
  })
})(jQuery);