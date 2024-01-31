<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroceryApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-form-container">
                <div class="login-form-subcontainer">
                    <center>
                        <h3>Login</h3>
                    </center>
                    <form action="/" method="post">
                        <div class="form-group">
                            <label class="mb-1" for="email">Email</label>
                            <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label class="mb-1" for="password">Password</label>
                            <input type="password" class="form-control" id="password">
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-8 ps-0">
                                    <div class="row mb-1">
                                        <small><a href="#">Forgot Password</a></small>
                                    </div>
                                    <div class="row">
                                        <small><a href="#">New User? Register here</a></small>
                                    </div>
                                </div>
                                <div class="col-4 pe-0">
                                    <button type="submit" class="btn btn-primary d-flex justify-content-emd">Login</button>
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
.login-container {
    background-image: url("./Assets/background.png");
    height: 100vh;
    width: 100vw;
}

.login-form-container {
    width: 400px;
    height: 300px;
    background-color: #f2f3f5;
    position: absolute;
    margin: auto;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    border: 1px solid black;
}

.login-form-subcontainer {
    margin: 20px;
}

.form-group {
    margin-bottom: 15px;
}
</style>