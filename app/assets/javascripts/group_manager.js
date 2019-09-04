$(document).ready(function() {
  attachListeners();
});

function nextGroup() {
  alert("Next");
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/tasks/" + nextId + ".json", function(data) {
    var group = data;
    $(".group-name").text(group["title"]);
    $(".group-description").text(group["description"]);
    $(".js-next").attr("data-id", group["id"]);
  });
}


function attachListeners() {
  $(".js-next").on("click", nextGroup());
}
