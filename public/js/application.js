$(document).ready(function(){
  $('#make_snake_link').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      method: 'GET',
      url: "/snakes/new"
      //data:
    }).done(function(response) {
      $('#main_content').html(response);
    }).fail(function(response) {
      console.log("There was an error: " + response);
    });
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
  })
});





// // Primitive types:
// var string = "Chris";
// var numeric = 1.2
// var bool = true

// var x; null
// //console.log(y); //== undefined


// // Data structures:
// // Array

// var ar = []
// ar.push(value)

// // Object

// var obj = {
//           key: 'value',
//           name: 'Chris',
//           age: 36
//         }
