$(document).ready(function() {
  attachListeners();
});

class Task {
  constructor(data) {
    this.description = data.description;
    this.priority = data.priority;
    this.due_date = data.due_date;
    this.complete = data.complete;
    this.group_id = data.group_id;
  }
  markComplete() {
    this.complete = true;
    $("#task_status").attr('class', 'done')
    debugger;
    $("#task_status").text("COMPLETE")

  }
}

function attachListeners() {
  $("form#complete_task").submit(function(event) {
    event.preventDefault();
    $.get("/tasks/" + this.task_id.value + ".json", function(data) {
      debugger;
      var task = new Task(data);
      task.markComplete();
    });
  });
}
