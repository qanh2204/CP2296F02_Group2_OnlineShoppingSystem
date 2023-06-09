function checkValidateCategoryForm() {
    var categoryName = document.getElementById("categoryName").value;
  
    if (categoryName == "") {
        document.getElementById("categoryName").focus();
        document.getElementById("errCategoryName").innerHTML = "Please enter  category name";
        return false;
    } else {
        document.getElementById("errCategoryName").innerHTML = "";
    }
    }