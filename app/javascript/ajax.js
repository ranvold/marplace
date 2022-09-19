$(document).on("change", "#brand_id", function(){
  var brand_id = $(this).val();
  $("#model_id").empty();
  $("#model_id").prop('disabled', true);
  $("#submodel_id").empty();
  $("#submodel_id").prop('disabled', true);
  $.ajax({
    url: "/api/models/" + brand_id,
    method: "GET",  
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
    method: "GET",  
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