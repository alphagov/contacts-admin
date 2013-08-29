(function ($) {
  $("#commonly-asked-questions .js-chosen-select").chosen().change(function(){
    update_common_questions($(this).val());
  });
  $("#commonly-asked-questions select").change(function(){
    update_common_questions($(this).val());
  });

  update_common_questions = function(section){
    $(".common-sections-active").removeClass("common-sections-active");
    $(section).addClass("common-sections-active");
  }
})(jQuery);
