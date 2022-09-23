$(document).on("change", "#brand_id", function(){
  var brand_id = $(this).val();
  $("#model_id").empty();
  $("#model_id").prop('disabled', true);
  $("#submodel_id").empty();
  $("#submodel_id").prop('disabled', true);
  $.ajax({
    url: "/api/models/" + brand_id,
    method: "get",  
    dataType: "json",
    data: {brand_id: brand_id},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      var models = response["models"];

      if (models.length > 0){
        $("#model_id").prop('disabled', false);
        $("#model_id").append('<option>Select model</option>');
        for(var i=0; i< models.length; i++){
          $("#model_id").append('<option value="' + models[i]["id"] + '">' + models[i]["name"] + '</option>');
        }
      }
    }
  });
});

$(document).on("change", "#model_id", function(){
  var model_id = $(this).val();
  $("#submodel_id").empty();
  $.ajax({
    url: "/api/submodels/" + model_id,
    method: "get",  
    dataType: "json",
    data: {model_id: model_id},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      var submodels = response["submodels"];

      if (submodels.length > 0){
        $("#submodel_id").prop('disabled', false);
        for(var i=0; i< submodels.length; i++){
          $("#submodel_id").append('<option value="' + submodels[i]["id"] + '">' + submodels[i]["name"] + '</option>');
        }
      }
      else
        $("#submodel_id").prop('disabled', true);
    }
  });
});

$(document).on("click", ".deleteAction", function(){
  var current_item_url = $(this).parents('tr')[0];
  if(confirm("Are you sure?")) {
    $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: $(current_item_url).attr('url'),
      method: 'post',
      data: { _method: 'delete' },
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function() {
        $(current_item_url).fadeOut(300);
      }
    });
  };
});

$(document).on("click", "#unfavorite_button", function(){
  var car_id = $(this).val();
    $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: "/favorites/" + car_id,
      method: 'post',
      data: { _method: 'patch' },
      success: function() {
        $("#unfavorite_button").replaceWith(`<button type='button' class='btn btn-outline-danger bi bi-star' id='favorite_button' value='${car_id}'>Favorite</button>`);
      }
    });
});

$(document).on("click", "#favorite_button", function(){
  var car_id = $(this).val();
    $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: "/favorites/" + car_id,
      method: 'post',
      data: { _method: 'patch' },
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function() {
        $("#favorite_button").replaceWith(`<button type='button' class='btn btn-danger bi bi-star' id='unfavorite_button' value='${car_id}'>Unfavorite</button>`);
      }
    });
});