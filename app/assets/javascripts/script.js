$(document).ready(function() {
  attachListeners();
});

function claimTask(event) {
  alert("Prevented Default");
  var claimed = $(event).serialize();
  var user_id = event.user_id.value
  var posting = $.post('/user_tasks', claimed);
  posting.done(function() {
    $.get("/users/" + user_id + ".json", function(data) {
      var user = data
      $("#taskUsers").append(user["username"])
    });
  });
}

function attachListeners() {
  $("form#claim_task").submit(function(event) {
    event.preventDefault();
    claimTask(this);
  })
}

