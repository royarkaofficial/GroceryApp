<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GroceryApp.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
    <div class="m-4">
        <center>
            <h3 class="pb-3">Profile Details</h3>
        </center>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="firstname">Firstname</label>
                        <input type="text" class="form-control" id="firstname" required>
                        <div class="invalid-feedback">
                            Please enter your first name.
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="lastname">Lastname</label>
                        <input type="text" class="form-control" id="lastname" required>
                        <div class="invalid-feedback">
                            Please enter your last name.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="address">Address</label>
                        <input type="text" class="form-control" id="address" required>
                        <div class="invalid-feedback">
                            Please enter your valid address.
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="gender">Gender</label>
                        <select class="form-select" aria-label="Default select example" id="gender" disabled>
                            <option value="" selected>Select One</option>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select your gender.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="email">Email</label>
                        <input type="email" class="form-control" id="email" disabled>
                        <div class="invalid-feedback">
                            Please enter your valid email address.
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label class="mb-1" for="password">Password</label>
                        <input type="password" class="form-control" id="password" disabled>
                        <div class="invalid-feedback">
                            Please enter a strong password with at least 6 characters.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <label class="mb-1" for="role">Role</label>
                    <select class="form-select" aria-label="Default select example" id="role" disabled>
                        <option value="" selected>Select One</option>
                        <option value="2">User</option>
                        <option value="1">Admin</option>
                    </select>
                    <div class="invalid-feedback">
                        Please select a role.
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-primary form-btn" onclick="onSubmit()">
                        Save
                        <span class="spinner-border-sm" role="status" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
    <style>
        div.form-container {
    width: 800px;
}

.fa:hover {
    cursor: pointer;
}

.regenerate-captcha {
    margin-top: 34px;
    margin-left: -40px;
}

.spinner {
    height: 100vh;
}
    </style>
    <script>
        let code;

        function onSubmit() {
            $(".needs-validation")[0].classList.add("was-validated");
            if ($("input:invalid").length > 0 || $("select:invalid").length > 0) {
                return;
            }
            toggleForm(true);
            let userId = localStorage.getItem("grocery_app_user_id");
            const endpoint = `users/${userId}`;
            let data = JSON.stringify({
                firstName: $("#firstname")[0].value,
                lastName: $("#lastname")[0].value,
                address: $("#password")[0].value,
            });
                $(".toast")[0].classList.add("show", "bg-success");
            const onOk = function () {
                $(".toast")[0].classList.remove("bg-danger");
                $(".toast-body")[0].innerText = `Hi ${data.firstName}, your profile details have been update successfully.`;
                setTimeout(() => { window.location.href = "Login" }, 7000);
            };
            const onError = function () {
                toggleForm(false);
                $(".toast")[0].classList.add("show");
            }
            send(HttpMethod.POST, endpoint, data, onOk, onError);
        }
    </script>
</asp:Content>