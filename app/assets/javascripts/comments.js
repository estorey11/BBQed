class Comment {
  constructor(content, user_name, id) {
    this.content = content;
    this.user_name = user_name;
    this.id=id;
  }

  truncate_if_long() {
    if (this.content.length > 240){
      return `<li id="comment-${this.id}">${this.content.substring(0, 240)}...</li><br><li>Submitted by: ${this.user_name}<br><button class="js-more" data-id="${this.id}">See Full Comment</button></li><br><br>`;
    }
    return `<li>${this.content}</li><br><li>Submitted by: ${this.user_name}</li><br><br>`;
  }
}

$(document).ready(function() {
  const recipe_id=$(".comments").data("id");
  $.get("/recipes/" + recipe_id + ".json", function(recipe_data){
    recipe_data["comments"].forEach(function(comment_data){
      let comment= new Comment(comment_data["content"], comment_data["user"]["username"], comment_data["id"])
      $("#comments").append(comment.truncate_if_long());
    });
  });
});

$(function() {
  $(document).on("click", ".js-more", function() {
    let id = $(this).data("id");
    $.get("/comments/" + id + ".json", function(comment_data) {
      $(`#comment-${id}`).text(`${comment_data["content"]}`);
    });
    $(this).remove();
  });
});

$(function () {
  $('.comment_form').submit(function(event) {
    event.preventDefault();

    let values = $(this).serialize();

    let posting = $.post('/comments', values);

    posting.done(function(data) {
      $("#comments").append(`<li>${data["content"]}</li><br><li>Submitted by: ${data["user"]["username"]}</li><br><br>`);
    });
  });
});
