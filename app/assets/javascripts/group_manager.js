$(document).ready(function() {
  attachListeners();
});

class Group {
  constructor(data) {
    this.id = data.id;
    this.name = data.name;
    this.description = data.description;
    this.users = data.users
  }

  getUsers(data) {
    $(".group-member").empty();
    for (let i=0; i<this.users.length; i++) {
      let user = this.users[i]
      let user_link = `<a href="/users/${user.id}">${user.first_name} ${user.last_name}</a>`
      $(".group-member").append("<p>" + user_link + "</p>");
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
    $(".group-members").text(group.name);
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
