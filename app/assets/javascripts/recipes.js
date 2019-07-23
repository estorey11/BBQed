

$(function() {
  $(document).on("click", ".js-more", function() {
    let id = $(this).data("id");
    $.get("/recipes/" + id + ".json", function(data) {
      $(`#recipe-${id}`).append(`<ul>
        <li>Time in hours: ${data["time"]}</li>
        <li>Temp in Fahrenheit: ${data["temp"]}</li>
        <li>Smoker: ${data["smoker"]["name"]}</li>
        <li>Smoker Type: ${data["smoker"]["smoker_type"]}</li>
        <li>Rub: ${data["rub"]}</li>
        <li>Wood: ${data["wood"]}</li>
        <li>Wrap: ${data["wrap"]}</li>
        <li>Result: ${data["result"]}</li>
        <li><a href="/recipes/${id}">View Recipe Page</a></li>
      </ul>`);
    });
    $(this).remove();
  });
});


const user_id=$("#recipes").data("id");
$.get("/users/" + user_id + ".json", function(user_data) {
  user_data["recipes"].forEach(function(recipe_data){
    $("#recipes").append(`<li id="recipe-${recipe_data["id"]}">${recipe_data["food_amount"] ? recipe_data["food_amount"] : ''} ${recipe_data["food_unit"]} ${recipe_data["food"]["animal"]} ${recipe_data["food"]["cut"]}  <button class="js-more" data-id="${recipe_data["id"]}">See Full Recipe</button></li><br><br>`);
  });
});
