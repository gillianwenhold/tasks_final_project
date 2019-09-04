$(document).ready(function() {
  attachListeners();
});

class Group {
  constructor(data) {
    this.id = data.id;
    this.name = data.name;
    this.description = data.description;
    this.users = []
  }

  getUsers(data) {
    for (let i=0; i<data.length; i++) {
      this.users.push(data[i].username);
    }
  }
}

function nextGroup() {
  let nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/groups/" + nextId + ".json", function(data) {
    let group = new Group(data);
    console.log(group);
    group.getUsers(data.users);
    console.log(group.users)
    $(".group-name").text(group.name);
    $(".group-description").text(group.description);
    $(".group-count").text("(" + group.users.length + " Users)");
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
