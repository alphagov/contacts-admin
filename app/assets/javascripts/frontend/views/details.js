(function ($) {
  if ($(".privacy-security-info").size() > 0){
    $(".privacy-security-info").addClass("js-hidden");

    $(".privacy-security-info a").click(function(e){
      e.preventDefault();
      $(this).closest(".privacy-security-info").removeClass("js-hidden");
    });
  }
})(jQuery);
