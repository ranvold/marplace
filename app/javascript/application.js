// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import "./src/jquery"
import "./src/jquery-ui"
import "./ajax"

$(document).on("click", ".deleteAction", function(){
  var current_item_url_tr = $(this).parents('tr')[0];
  if(confirm("Are you sure?")) {
    $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: $(current_item_url_tr).attr('url'),
      method: 'POST',
      data: { _method: 'DELETE' },
      success: function() {
        $(current_item_url_tr).fadeOut(300);
      }
    });
  };
});