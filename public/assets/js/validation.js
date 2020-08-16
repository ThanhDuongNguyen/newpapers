$(document).ready(function () {
  $.validator.addMethod(
    "validatePassword",
    function (value, element) {
      return (
        this.optional(element) ||
        /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value)
      );
    },
    "Mật khẩu phải chứa một chữ cái thường, một số và dài ít nhất 8 ký tự."
  );

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
          validatePassword: true,
        },
        Re_Password: {
          required: true,
          equalTo: "#Password",
          minlength: 8,
        },
        Email: {
          required: true,
        },
      },
      messages: {
        Name: {
          required: "Bắt buộc nhập username",
        },
        Password: {
          required: "Bắt buộc nhập password",
          minlength: "Hãy nhập ít nhất 8 ký tự",
        },
        Re_Password: {
          equalTo: "Hai password phải giống nhau",
          minlength: "Hãy nhập ít nhất 8 ký tự",
        },
        Email: {
          required: "Bắt buộc phải nhập Email",
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
      messages: {
        Email: {
          required: "Bắt buộc nhập Email",
        },
        Password: {
          required: "Bắt buộc nhập password",
          minlength: "Hãy nhập ít nhất 8 ký tự",
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
      messages: {
        Title: {
          required: "Bắt buộc nhập Tiêu đề",
        },
        TinyContent: {
          required: "Bắt buộc nhập Tiêu đề phụ",
        },
        TagsList: {
          required: "Bắt buộc nhập Thẻ",
        },
        ImgAvatar: {
          required: "Bắt buộc nhập Đường dẫn ảnh đại diện bài viết",
        },
        Content: {
          required: "Bắt buộc nhập Nội dung",
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
          minlength: 100,
        },
        TagsList: {
          required: true,
        },
        ImgAvatar: {
          required: true,
        },
        Content: {
          required: true,
          minlength: 3000,
        },
      },
      messages: {
        Title: {
          required: "Bắt buộc nhập Tiêu đề",
        },
        TinyContent: {
          required: "Bắt buộc nhập Tiêu đề phụ",
          minlength: "Độ dài tối thiểu là 100 ký tự",
        },
        TagsList: {
          required: "Bắt buộc nhập Thẻ",
        },
        ImgAvatar: {
          required: "Bắt buộc nhập Đường dẫn ảnh đại diện bài viết",
        },
        Content: {
          required: "Bắt buộc nhập Nội dung",
          minlength: "Độ dài tối thiểu là 3000 ký tự",
        },
      },
    });
  });

  $(function validationComment() {
    $("#frmComment").validate({
      onfocusout: false,
      onkeyup: false,
      rules: { 
        Comment: {
          required: true,
        }
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
      messages: {
        Name: {
          required: "Bắt buộc nhập Tên",
        },
        Alias: {
          required: "Bắt buộc nhập Bút danh",
        },
        Email: {
          required: "Bắt buộc nhập Email",
        },
        DOB: {
          required: "Bắt buộc nhập Ngày sinh",
        },
      },
    });
  });

  $(function validationChangePassword() {
    $("#frmChangePassword").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {
        Password: {
          required: true,
          minlength: 8,
        },
        New_Password: {
          required: true,
          validatePassword: true,
        },
        Confirm_Password: {
          required: true,
          equalTo: "#New_Password",
        },
      },
      messages: {
        Password: {
          required: "Bắt buộc nhập Mật khẩu",
          minlength: "Mật khẩu dài tối thiểu 8 ký tự",
        },
        New_Password: {
          required: "Bắt buộc nhập Mật khẩu mới",
        },
        Confirm_Password: {
          required: "Bắt buộc nhập lại Mật khẩu mới",
          equalTo: "Hai password phải giống nhau",
        },
      },
    });
  });

  $(function validationEditCategory() {
    $("#frmEditCategory").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {
        CatName: {
          required: true,
        },
        "IDUser[]": {
          required: true,
          minlength: 1,
        },
      },
      messages: {
        CatName: {
          required: "Bắt buộc nhập Tên danh mục",
        },
        "IDUser[]": {
          required: "Bắt buộc nhập Tên danh mục",
          minlength: "Bắt buộc phải chọn 1 Người dùng",
        },
      },
    });
  });

  $(function validationEditAssignCat() {
    $("#frmEditAssignCat").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {        
        "CatID[]": {
          required: true,
          minlength: 1,
        },
      },
      messages: {
        "CatID[]": {
          required: "Bắt buộc chọn 1 chuyên mục",
          minlength: "Bắt buộc phải chọn 1 chuyên mục",
        },
      },
    });
  });

  $(function validationAddCat() {
    $("#frmAddCat").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {
        CatName: {
          required: true,
        },
        "IDUser[]": {
          required: true,
          minlength: 1,
        },
      },
      messages: {
        CatName: {
          required: "Bắt buộc nhập Tên danh mục",
        },
        "IDUser[]": {
          required: "Bắt buộc nhập Tên danh mục",
          minlength: "Bắt buộc phải chọn 1 Người dùng",
        },
      },
    });
  });

  $(function validationAddTags() {
    $("#frmAddTags").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {
        TagName: {
          required: true,
        },
      },
      messages: {
        TagName: {
          required: "Bắt buộc nhập Tên Thẻ",
        },
      },
    });
  });

  $(function validationEditTag() {
    $("#frmEditTag").validate({
      onfocusout: false,
      onkeyup: false,
      rules: {
        TagName: {
          required: true,
        },
      },
      messages: {
        TagName: {
          required: "Bắt buộc nhập Tên Thẻ",
        },
      },
    });
  });
});
