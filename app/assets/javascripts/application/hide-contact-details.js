jQuery(function($) {
  $(".js-hide-link").click(function(event){
    event.preventDefault();

    $(this).closest(".js-hide-container").toggleClass("js-hidden");
  })
});