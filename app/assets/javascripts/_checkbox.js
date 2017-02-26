$(function() {
  var checkboxValues = JSON.parse(sessionStorage.getItem('checkboxValues')) || {},
    $checkboxes = $("#filter :checkbox");

  $checkboxes.on("change", function(){
    $checkboxes.each(function(){
      checkboxValues[this.id] = this.checked;
    });

    sessionStorage.setItem("checkboxValues", JSON.stringify(checkboxValues));
  });

  // On page load
  $.each(checkboxValues, function(key, value) {
    $("#" + key).prop('checked', value);
  });
  
  $(":checkbox").click(function() {
      $(this).closest("form").submit();
  });
});
