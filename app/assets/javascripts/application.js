//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require_tree .


// home - index
$(document).ready(function(){
  $('#create_room').on('click', function(){
    $('#room_create_form').toggle();
  });
});

// users registration - new , edit
$(document).ready(function(){
  $('#new_upload_button').on('click', function(){
    $('input#new_image_upload').trigger('click');
  });

  $('#edit_upload_button').on('click', function(){
    $('input#edit_image_upload').trigger('click');
  });

  $('input#new_image_upload').on('change', function(){
    readURL(this);
  });

  $('input#edit_image_upload').on('change', function(){
    readURL(this);
  });
});

function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();

           reader.onload = function (e) {
               $('#profile_image').attr('src', e.target.result);
           };

           reader.readAsDataURL(input.files[0]);
       }
   }
