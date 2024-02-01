<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="GroceryApp.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>This is the welcome page.</h1>
    <script>
        window.onload = function exec() {
            var accessToken = localStorage.getItem("groceryapp_access_token");
            if (accessToken && accessToken.length > 0) {
                window.location.href = "Login";
            }
        }
    </script>
</asp:Content>