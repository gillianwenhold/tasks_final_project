$(document).ready(function() {
  attachListeners();
});

class Task {
  constructor(description, priority, due_date, complete, group_id) {
    this.description = description;
    this.priority = priority;
    this.due_date = due_date;
    this.complete = complete;
    this.group_id = group_id;
  }
  markComplete() {
    this.complete = true;
    $("#task_status").attr('class', 'done')
    $("#task_status").text("COMPLETE")
  }
}

function attachListeners() {
  $("form#complete_task").submit(function(event) {
    event.preventDefault();
    var task = new Task;
    task.markComplete();
  })
}
