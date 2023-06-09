function checkValidateForm() {
    var customerName = document.getElementById("customerName").value;
    var address = document.getElementById("address").value;
    var phone = document.getElementById("phone").value;

    if (customerName == "") {
        document.getElementById("customerName").focus();
        document.getElementById("errCustomerName").innerHTML = "Please enter  customer name";
        return false;
    } else {
        document.getElementById("errCustomerName").innerHTML = "";
    }

    if (address == "") {
        document.getElementById("address").focus();
        document.getElementById("errAddress").innerHTML = "Please enter a receive address";
        return false;
    } else {
        document.getElementById("errAddress").innerHTML = "";
    }
    let regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (phone == "" || !regexPhone.test(phone)) {
        document.getElementById("phone").focus();
        document.getElementById("errPhone").innerHTML = "Please enter a valid phone number";
        return false;
    } else {
        document.getElementById("errPhone").innerHTML = "";
    }

}

function onchangeCustomerName() {
     var customerName = document.getElementById("customerName").value;
    if (customerName == "") {
        document.getElementById("errCustomerName").innerHTML = "Please enter  customer name";
        return false;
    } else {
        document.getElementById("errCustomerName").innerHTML = "";
    }
}
function onchangeAddress() {
     var address = document.getElementById("address").value;
    if (address == "") {
        document.getElementById("errAddress").innerHTML = "Please enter a receive address";
        return false;
    } else {
        document.getElementById("errAddress").innerHTML = "";
    }
}
function onchangePhone() {
      var phone = document.getElementById("phone").value;
    let regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (phone == "" || !regexPhone.test(phone)) {
        document.getElementById("errPhone").innerHTML = "Please enter a valid phone number";
        return false;
    } else {
        document.getElementById("errPhone").innerHTML = "";
    }
}