function validateForm() {
    var userName = document.getElementById("uname").value;
    var password = document.getElementById("psw").value;

    if (userName == "" || password == "") {
        alert("Name must be filled out");
        return false;
    }

    return true;
}