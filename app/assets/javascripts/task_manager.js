$(function() {
  $("#complete_task").on("submit", function(e) {
    event.preventDefault();
    var url = this.action;
    var data = {
      "authenticity_token": $("input[name='authenticity_token']").attr("value"),
      "task": {
        "complete": $("input[name='task[complete]']").attr("value"),
        "task_id": $("input[name='task_id']").attr("value")
      }
    }
    $.ajax({
      type: "PATCH",
      url: url,
      data: data,
      dataType: "json",
      success: function(resp) {
        $("#task_status").attr('class', 'done');
        $("#task_status").text("COMPLETE");
        $("#claim_task").hide();
        $("#complete_task").hide();
      }
    })
    console.log(data);
  });
});

class Task {
  constructor(data) {
    this.id = data.id;
    this.description = data.description;
    this.priority = data.priority;
    this.due_date = new Date(data.due_date);
    this.complete = data.complete;
    this.group = data.group.name;
  }

  overdue() {
    if (this.due_date < Date.now()) {
      return true;
    } else {
      return false;
    }
  }
}

function loadAdminTasks() {
  $.get("/tasks.json", function(data) {
    createTable(data);
  });
}

function loadUserTasks() {
  var page_url = window.location.href
  var group_id = page_url.substring(
    page_url.lastIndexOf("groups/") + 7,
    page_url.lastIndexOf("/tasks")
  );
  $.get("/groups/" + group_id + "/tasks.json", function(data) {
    createTable(data, group_id);
  });
}

function createTable(data) {
  for (let i = 0; i < data.length; i++) {
    var task = new Task(data[i]);
    var link = `<a href="/tasks/${task.id}">${task.description}</a>`;
    var status;
    if (task.complete) {
      status = '<td class="done">done</td>'
      $("#completed-tasks").append("<tr><td>"+ task.group + "</td><td>" + link + "</td><td>" + task.priority + "</td><td>" + task.due_date.toLocaleDateString() + "</td>" + status + "</tr>");
    } else if (task.overdue()) {
      status = '<td class="overdue">overdue</td>'
      $("#pending-tasks").append("<tr><td>"+ task.group + "</td><td>" + link + "</td><td>" + task.priority + "</td><td>" + task.due_date.toLocaleDateString() + "</td>" + status + "</tr>");
    } else {
      status = '<td class="due">pending</td>'
      $("#pending-tasks").append("<tr><td>"+ task.group + "</td><td>" + link + "</td><td>" + task.priority + "</td><td>" + task.due_date.toLocaleDateString() + "</td>" + status + "</tr>");
    }
  }
}
