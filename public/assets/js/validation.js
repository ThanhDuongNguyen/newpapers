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
