<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="GroceryApp.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="product-form-container">
        <div class="product-form-subcontainer">
            <center>
                <h3 class="pb-2">Add Product</h3>
            </center>
            <form action="/" method="post">
                <div class="form-group">
                    <label class="mb-1" for="name">Product name</label>
                    <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                    <label class="mb-1" for="price">Price</label>
                    <input type="number" class="form-control" id="price">
                </div>
                <div class="form-group">
                    <label class="mb-1" for="stock">Stock</label>
                    <input type="number" class="form-control" id="stock">
                </div>
                <div class="form-group">
                    <label class="mb-1" for="imageurl">Image Url</label>
                    <input type="url" class="form-control" id="imageurl">
                </div>
                <div class="container">
                    <div class="row">
                        <button type="submit" class="btn btn-primary mt-2">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <style>
    body {
        background-image: url("./Assets/background.png");
    }

    .product-form-container {
        width: 400px;
        height: 460px;
        background-color: #f2f3f5;
        position: absolute;
        margin: auto;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        border: 1px solid black;
    }

    .product-form-subcontainer {
        margin: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }
    </style>
</asp:Content>
