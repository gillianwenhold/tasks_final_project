$(document).ready(function() {
  attachListeners();
});

function nextGroup() {
  alert("In next group")
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/groups/" + nextId + ".json", function(data) {
    var group = data;
    console.log(group);
    $(".group-name").text(group.name);
    $(".group-description").text(group.description);
    $(".js-next").attr("data-id", group.id);
    return false
  });
}

function attachListeners() {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    nextGroup();
  });
}
