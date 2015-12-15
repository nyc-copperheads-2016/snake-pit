$(document).ready(function(){
  $('#make_snake_link').on('click', function(e) {
    e.preventDefault();

    if ($('#new-snake-form').length) {
      load_index();
    } else {
      $.ajax({
        method: 'GET',
        url: "/snakes/new"
        //data:
      }).done(function(response) {
        $('#main_content').html(response);
      }).fail(function(response) {
        console.log("There was an error: " + response);
      });
    }
  });

  $('#delete-snakes').on('click', function(event){
    event.preventDefault();
    $('body').append("<h1>HIISSSSSSSSSSSSSSSSSSSSS</h1>");
  });

  $('#main_content').on('submit', '#new-snake-form', function(event) {
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: 'post',
      data: $(event.target).serialize()
    }).done(function(result) {
      $('#main_content').html(result);
    }).fail(function(error) {
      console.log("Error: " + error);
    })
  });

  $('#main_content').on('click', '#new-snake-form input[value="Return to Index"]', function(event) {
    load_index();
  });

  $('.growsnake').on('submit', function(event) {
    event.preventDefault();

    var growsnake = $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    });

    var snakecolor = $.ajax({
      url: event.target.action,
      method: 'get',
      dataType: 'json'
    });

    $.when(growsnake, snakecolor).done(function(growsnake_response, snakecolor_response) {
      $(event.target).parent().find('span.snakeskin').html(growsnake_response[0].skins.length);
      $(event.target).parent().find('span.color').html(snakecolor_response[0].color);
      $(event.target).parent().css('color', snakecolor_response[0].color);
    }).fail(function(growsnake_error, colorsnake_error) {
      console.log('Could not shed skin');
    });
  })
});

function load_index() {
  $.ajax({
    url: '/'
  }).done(function(result) {
    $('#main_content').html(result);
  });
}
