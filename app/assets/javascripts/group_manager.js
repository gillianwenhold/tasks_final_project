$(document).ready(function() {
  attachListeners();
});

function nextGroup() {
  alert("in nex tfunction");
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/groups/" + nextId + ".json", function(data) {
    var group = data;
    console.log(group);
    $(".group-name").text(group["title"]);
    $(".group-description").text(group["description"]);
    $(".js-next").attr("data-id", group["id"]);
  });
}


function attachListeners() {
  $(".js-next").on("click", function() {
    nextGroup();
  });
}
