<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="GroceryApp.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reset-password-container">
            <div class="reset-password-form-container">
                <div class="reset-password-form-subcontainer">
                    <center>
                        <h3>Reset Password</h3>
                    </center>
                    <form action="/" method="post">
                        <div class="form-group">
                            <label class="mb-1" for="email">Email</label>
                            <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label class="mb-1" for="newpassword">New Password</label>
                            <input type="password" class="form-control" id="newpassword">
                        </div>
                        <div class="form-group">
                            <label class="mb-1" for="confirmpassword">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmpassword">
                        </div>
                        <div class="container">
                            <div class="row">
                                <button type="submit" class="btn btn-primary mt-2">Reset</button>
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
.reset-password-container {
    background-image: url("./Assets/background.png");
    height: 100vh;
    width: 100vw;
}

.reset-password-form-container {
    width: 400px;
    height: 380px;
    background-color: #f2f3f5;
    position: absolute;
    margin: auto;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    border: 1px solid black;
}

.reset-password-form-subcontainer {
    margin: 20px;
}

.form-group {
    margin-bottom: 15px;
}
</style>
