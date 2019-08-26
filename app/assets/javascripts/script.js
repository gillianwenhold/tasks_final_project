$(document).ready(function() {
  attachListeners();
});

function claimTask(event) {
  alert("Prevented Default");
  var claimed = $(this).serialize();
  var posting = $.post('/user_tasks', claimed);

}

function attachListeners() {
  $("form#claim_task").submit(function(event) {
    debugger;
    event.preventDefault();
    claimTask(this);
  })
}

