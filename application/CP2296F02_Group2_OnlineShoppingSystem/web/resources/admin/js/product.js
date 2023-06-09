function check() {
    var productName = document.getElementById("productName").value;
    var productImage = document.getElementById("productImage").value;
    var productPrice = document.getElementById("productPrice").value;
    var description = document.getElementById("description").value;
    var quantity = document.getElementById("quantity").value;

    if (productName == "")
    {
        document.getElementById("productName").focus();
        document.getElementById("errProductName").innerHTML = "Please enter product name";
        return false;
    } else {
        document.getElementById("errProductName").innerHTML = "";

    }
    if (productImage == "")
    {
        document.getElementById("productImage").focus();
        document.getElementById("errProductImage").innerHTML = "Please choose product image";
        return false;
    } else {
        document.getElementById("errProductImage").innerHTML = "";

    }
    if (productPrice == "")
    {
        document.getElementById("productPrice").focus();
        document.getElementById("errProductPrice").innerHTML = "Please choose product image";
        return false;
    } else {
        document.getElementById("errProductPrice").innerHTML = "";

    }
    if (description == "")
    {
        document.getElementById("description").focus();
        document.getElementById("errDescription").innerHTML = "Please enter description of product ";
        return false;
    } else {
        document.getElementById("errDescription").innerHTML = "";

    }
    if (quantity == "")
    {
        document.getElementById("quantity").focus();
        document.getElementById("errQuantity").innerHTML = "Please enter quantity of product ";
        return false;
    } else {
        document.getElementById("errQuantity").innerHTML = "";

    }

}