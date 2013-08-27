marked.setOptions({
  tables: true,
  pendatic: true,
  sanitize: true,
  breaks: true
});

$(document).ready(function(){
  var Previewer = {
    preview: function(content, output) {
      output.html(marked(content.val()));
    }
  };

  $("[data-preview]").each(function(){
    var source_field = $($(this).data('preview-for'));
    var render_area = $(this);

    source_field.keyup(function() {
      Previewer.preview(source_field, render_area);
    })

    Previewer.preview(source_field, render_area);
  });
});
