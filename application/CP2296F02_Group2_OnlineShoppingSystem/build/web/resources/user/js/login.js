function checkValidateLogin(){
    var username = document.getElementById("username").value;
    var pass = document.getElementById("password").value;
    if(username==""){
        document.getElementById("errUsername").innerHTML = "Please enter username";
        return false;
    }
    else{
        document.getElementById("errUsername").innerHTML = "";
    }
    if(pass==""){
        document.getElementById("errPassword").innerHTML = "Please enter password";
        return false;
    }
    else{
        document.getElementById("errPassword").innerHTML = "";
    }
    
    
}


