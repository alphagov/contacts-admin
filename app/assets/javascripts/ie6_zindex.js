$(document).ready(function() {
  // Fixes IE6 z-index for select elements so that the dropdown sits above
  $(".dropdown-menu").each(function(){
    $(this).closest(".dropdown").addClass("open");
    $(this).before('<iframe class="ie6-select-iframe" width="'+$(this).width()+'" height="'+(parseInt($(this).height())+parseInt($(this).css('padding-top'))+parseInt($(this).css('padding-bottom')))+'"></iframe>');
    $(this).closest(".dropdown").removeClass("open");
  });
});