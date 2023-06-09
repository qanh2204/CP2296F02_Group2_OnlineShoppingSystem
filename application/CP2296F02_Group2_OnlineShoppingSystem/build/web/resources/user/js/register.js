function checkValidateRegisterForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
    var birthday = document.getElementById("birthday").value;
    var address = document.getElementById("address").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    if (username == "") {
        document.getElementById("username").focus();
        document.getElementById("errUsername").innerHTML = "Please enter username";
        return false;
    } else {
        document.getElementById("errUsername").innerHTML = "";
    }

    if (password == "" || password.length < 8) {
        document.getElementById("password").focus();
        document.getElementById("errPassword").innerHTML = "Please enter password must length greater 8 character";
        return false;
    } else {
        document.getElementById("errPassword").innerHTML = "";
    }
    if (repassword == "" || repassword != password) {
        document.getElementById("repassword").focus();
        document.getElementById("errRePassword").innerHTML = "Repassword doesn't match";
        return false;
    } else {
        document.getElementById("errRePassword").innerHTML = "";
    }

    if (birthday == "") {
        document.getElementById("birthday").focus();
        document.getElementById("errBirthday").innerHTML = "Please choose date of birth";
        return false;
    } else {
        document.getElementById("errBirthday").innerHTML = "";
    }

    if (address == "") {
        document.getElementById("address").focus();
        document.getElementById("errAddress").innerHTML = "Please enter address";
        return false;
    } else {
        document.getElementById("errAddress").innerHTML = "";
    }
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if (email == "" || !regex.test(email)) {
        document.getElementById("email").focus();
        document.getElementById("errEmail").innerHTML = "Please enter valid email";
        return false;
    } else {
        document.getElementById("errEmail").innerHTML = "";
    }
    let regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (phone == "" || !regexPhone.test(phone)) {
        document.getElementById("phone").focus();
        document.getElementById("errPhone").innerHTML = "Please enter valid phone number";
        return false;
    } else {
        document.getElementById("errPhone").innerHTML = "";
    }
}
function onchangeUsername() {
    var username = document.getElementById("username").value;
    if (username == "") {
        document.getElementById("username").focus();
        document.getElementById("errUsername").innerHTML = "Please enter username";
        return false;
    } else {
        document.getElementById("errUsername").innerHTML = "";
    }
}
function onchangePassword() {
    var password = document.getElementById("password").value;
    if (password == "" || password.length < 8) {
        document.getElementById("password").focus();
        document.getElementById("errPassword").innerHTML = "Please enter password must length greater than 8 character";
        return false;
    } else {
        document.getElementById("errPassword").innerHTML = "";
    }
}
function onchangeRepassword() {
    var password = document.getElementById("password").value;

    var repassword = document.getElementById("repassword").value;
    if (repassword == "" || repassword != password) {
        document.getElementById("repassword").focus();
        document.getElementById("errRePassword").innerHTML = "Repassword doesn't match";
        return false;
    } else {
        document.getElementById("errRePassword").innerHTML = "";
    }
}
function onchangeBirthday() {
    var birthday = document.getElementById("birthday").value;
    if (birthday == "") {
        document.getElementById("birthday").focus();
        document.getElementById("errBirthday").innerHTML = "Please choose date of birth";
        return false;
    } else {
        document.getElementById("errBirthday").innerHTML = "";
    }

}
function onchangeAddress() {
    var address = document.getElementById("address").value;
    if (address == "") {
        document.getElementById("address").focus();
        document.getElementById("errAddress").innerHTML = "Please enter address";
        return false;
    } else {
        document.getElementById("errAddress").innerHTML = "";
    }
}
function onchangeEmail() {
    var email = document.getElementById("email").value;
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if (email == "" || !regex.test(email)) {
        document.getElementById("email").focus();
        document.getElementById("errEmail").innerHTML = "Please enter valid email";
        return false;
    } else {
        document.getElementById("errEmail").innerHTML = "";
    }
}

function onchangePhone() {
    var phone = document.getElementById("phone").value;
    let regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (phone == "" || !regexPhone.test(phone)) {
        document.getElementById("phone").focus();
        document.getElementById("errPhone").innerHTML = "Please enter valid phone number";
        return false;
    } else {
        document.getElementById("errPhone").innerHTML = "";
    }
}
function checkValidateProfileForm() {
    var birthday = document.getElementById("birthday").value;
    if (birthday == "") {
        document.getElementById("birthday").focus();
        document.getElementById("errBirthday").innerHTML = "Please choose date of birth";
        return false;
    } else {
        document.getElementById("errBirthday").innerHTML = "";
    }
    var address = document.getElementById("address").value;
    if (address == "") {
        document.getElementById("address").focus();
        document.getElementById("errAddress").innerHTML = "Please enter address";
        return false;
    } else {
        document.getElementById("errAddress").innerHTML = "";
    }
    var phone = document.getElementById("phone").value;
    let regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (phone == "" || !regexPhone.test(phone)) {
        document.getElementById("phone").focus();
        document.getElementById("errPhone").innerHTML = "Please enter valid phone number";
        return false;
    } else {
        document.getElementById("errPhone").innerHTML = "";
    }

    var email = document.getElementById("email").value;
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if (email == "" || !regex.test(email)) {
        document.getElementById("email").focus();
        document.getElementById("errEmail").innerHTML = "Please enter valid email";
        return false;
    } else {
        document.getElementById("errEmail").innerHTML = "";
    }
}