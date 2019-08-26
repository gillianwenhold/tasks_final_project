$(document).ready(function() {
  attachListeners();
});

function claimTask(event) {
  alert("Prevented Default");
  var claimed = $(event).serialize();
  debugger;
  var posting = $.post('/user_tasks', claimed);
  posting.done(function() {
    $("#taskUsers").append("Added User")
  });
}

function attachListeners() {
  $("form#claim_task").submit(function(event) {
    event.preventDefault();
    claimTask(this);
  })
}

