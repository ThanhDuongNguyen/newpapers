$(function validationSignUp() {
  $("#frmSignUp").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      Name: {
        required: true,
      },
      Password: {
        required: true,
        minlength: 8,
      },
      Email: {
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
      Email: {
        required: true,
      },
      Password: {
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
      Title: {
        required: true,
      },
      TinyContent: {
        required: true,
      },
      TagsList: {
        required: true,
      },
      ImgAvatar: {
        required: true,
      },
      Content: {
        required: true,
      },
    },
  });
});

$(function validationEditNews() {
  $("#frmEditNews").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      Title: {
        required: true,
      },
      TinyContent: {
        required: true,
      },
      TagsList: {
        required: true,
      },
      ImgAvatar: {
        required: true,
      },
      Content: {
        required: true,
      },
    },
  });
});

$(function validationEditProfile() {
  $("#frmEditProfile").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      Name: {
        required: true,
      },
      Alias: {
        required: true,
      },
      Email: {
        required: true,
      },
      DOB: {
        required: true,
      },
    },
  });
});

$.validator.addMethod(
  "validatePassword",
  function (value, element) {
    return (
      this.optional(element) ||
      /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value)
    );
  },
  "Password must contain one lowercase letter, one number, and be at least 8 characters long."
);

$(function validationChangePassword() {
  $("#frmChangePassword").validate({
    onfocusout: false,
    onkeyup: false,
    rules: {
      Password: {
        required: true,
        minlength: 8,
        maxlength: 16
      },
      "New_Password": {
        required: true,
        // minlength: 8,
        validatePassword: true,
      },
      "Confirm_Password": {
        required: true,
        equalTo: "#New_Password",
      },
    },
  });
});
