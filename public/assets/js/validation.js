$(function validationSignUp() {
  $("#frmSignUp").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      "Name": {
        required: true,
        maxlength: 15,
      },
      "Password": {
        required: true,
        minlength: 8,
      },
      "Email": {
        required: true,
      },
    },
  });
});

$(function validationLogin() {
  $("#frmLogin").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      "Email": {
        required: true,
      },
      "Password": {
        required: true,
        minlength: 8,
      },
    },
  });
});


$(function validationPostNewNews() {
  $("#frmPostNewNews").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      "Title": {
        required: true,
      },
      "TinyContent":{
        required: true,
      },
      "TagsList":{
        required: true,
      },
      "ImgAvatar":{
        required: true,
      },
      "Content":{
        required: true
      }
    },
  });
});