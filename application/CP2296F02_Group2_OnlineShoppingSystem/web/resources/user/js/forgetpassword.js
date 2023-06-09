function checkValidate() {
    if (document.getElementById("email").value == "") {
        document.getElementById("errEmail").innerHTML = "Please enter your email";
        return false;
    } else {
        document.getElementById("errEmail").innerHTML = "";

    }
}
function checkResetPasswordForm() {
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
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
}
