$(document).ready(function() {
  attachListeners();
});

class Task {
  constructor(data) {
    this.id = data.id;
    this.description = data.description;
    this.priority = data.priority;
    this.due_date = data.due_date;
    this.complete = data.complete;
    this.group_id = data.group_id;
  }
  markComplete() {
    this.complete = true;
    var data = {complete: true}
    $.post("/tasks/" + this.id, data, function() {
      $("#task_status").attr('class', 'done');
      $("#task_status").text("COMPLETE");
    });
  }
}

function attachListeners() {
  $("form#complete_task").submit(function(event) {
    event.preventDefault();
    var task;
    $.get("/tasks/" + this.task_id.value + ".json").then( resp => {
      task = new Task(resp);
      task.markComplete();
    });
  });
}
