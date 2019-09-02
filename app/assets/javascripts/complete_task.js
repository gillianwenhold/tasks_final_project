$(document).ready(function() {
  attachListeners();
});

class Task {
  constructor(data) {
    this.id = data.id;
    this.description = data.description;
    this.priority = data.priority;
    this.due_date = new Date(data.due_date);
    this.complete = data.complete;
    this.group = data.group.name;
    if (this.due_date < Date.now) {
      this.overdue = true;
    } else {
      this.overdue = false;
    }
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

function loadTasks() {
  $.get("/tasks.json", function(data) {
    for (let i = 0; i < data.length; i++) {
      var task = new Task(data[i]);
      var link = `<a href="/tasks/${task.id}">${task.description}</a>`;
      var status;
      if (task.complete) {
        status = '<td class="done">done</td>'
      } else if (task.overdue) {
        status = '<td class="overdue">overdue</td>'
      } else {
        status = '<td class="due">pending</td>'
      }

      $("#pending-tasks").append("<tr><td>"+ task.group + "</td><td>" + link + "</td><td>" + task.priority + "</td><td>" + task.due_date.toLocaleDateString() + "</td>" + status + "</tr>");
      console.log(status)
      console.log(this.overdue)
    }
  });
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
