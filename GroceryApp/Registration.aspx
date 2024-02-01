<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="GroceryApp.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <div class="registration-form-container">
                <div class="registration-form-subcontainer">
                    <center>
                        <h3 class="pb-3">Registration</h3>
                    </center>
                    <form action="/" method="post">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="firstname">Firstname</label>
                                        <input type="text" class="form-control" id="firstname">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="lastname">Lastname</label>
                                        <input type="text" class="form-control" id="lastname">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="address">Address</label>
                                        <input type="text" class="form-control" id="address">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="gender">Gender</label>
                                        <select class="form-select" aria-label="Default select example" id="gender">
                                            <option selected>Select One</option>
                                            <option value="1">Male</option>
                                            <option value="2">Gender</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="email">Email</label>
                                        <input type="text" class="form-control" id="email">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mb-1" for="password">Password</label>
                                        <input type="text" class="form-control" id="password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label class="mb-1" for="captcha">Enter Captcha</label>
                                        <input type="text" class="form-control" id="captcha">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group">
                                        <img />
                                    </div>
                                </div>
                                <div class="col-6 d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary mt-4" onclick="exec()">Register</button>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col text-end mt-2">
                                    <a href="Login">Already registered? Login here</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<style>
.registration-container {
    background-image: url("./Assets/background.png");
    height: 100vh;
    width: 100vw;
}

.registration-form-container {
    width: 800px;
    height: 500px;
    background-color: #f2f3f5;
    position: absolute;
    margin: auto;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    border: 1px solid black;
}

.registration-form-subcontainer {
    margin: 20px;
}

.form-group {
    margin-bottom: 15px;
}

button {
    height: fit-content;
}
</style>

<script>
    function exec() {
        let endpoint = "http://groceryapp.api.com/registration";
        let body = JSON.stringify({
            firstName: document.getElementById("firstname").value,
            lastName: document.getElementById("lastname").value,
            address: document.getElementById("password").value,
            gender: parseInt(document.getElementById("gender").value),
            role: 1,
            email: document.getElementById("email").value,
            password: document.getElementById("password").value,
        });
        var xhr = new XMLHttpRequest();
        xhr.open('POST', endpoint, true);
        xhr.onload = function () {
            var status = xhr.status;
            if (status == 200) {
                window.location.href = "Login";
            } else {
                window.alert("Something went wrong");
            }
        };
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(body);
    }

    function createCaptcha() {
        //clear the contents of captcha div first 
        document.getElementById('captcha').innerHTML = "";
        var charsArray =
            "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*";
        var lengthOtp = 6;
        var captcha = [];
        for (var i = 0; i < lengthOtp; i++) {
            //below code will not allow Repetition of Characters
            var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
            if (captcha.indexOf(charsArray[index]) == -1)
                captcha.push(charsArray[index]);
            else i--;
        }
        var canv = document.createElement("canvas");
        canv.id = "captcha";
        canv.width = 100;
        canv.height = 50;
        var ctx = canv.getContext("2d");
        ctx.font = "25px Georgia";
        ctx.strokeText(captcha.join(""), 0, 30);
        //storing captcha so that can validate you can save it somewhere else according to your specific requirements
        code = captcha.join("");
        document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
    }
</script>