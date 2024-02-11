<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GroceryApp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="empty-cart" class="hide-container">
        Cart is empty
    </div>
    <div id="existing-cart" class="container hide-container">
        <div class="row justify-content-between">
            <div id="cart-container" class="col-8 p-0 border border-black bg-white">
                <div class="row p-4">
                    <div class="col">
                        <h3>Cart Details</h3>
                    </div>
                    <div class="col text-end">
                        <button class="btn btn-danger rounded-pill" onclick="emptyCart()">Empty Cart</button>
                    </div>
                </div>
            </div>
            <div id="payment-container" class="col-4"></div>
        </div>
    </div>
    <style>
        #cart-container {
            height: calc(100vh - 83px);
        }

        .hide-container {
            display: none;
        }

        .show-container {
            display: block;
        }
    </style>
    <script>
        function emptyCart() {
            const endpoint = `users/${userId}/carts/${cartId}`;
            const onOk = function () {
                cartId = null;
                productsUnderCart = [];
            };
            const onError = function () { };
            send(HttpMethod.DELETE, endpoint, null, onOk, onError);
        }

        function isCartEmpty() {
            const emptyCart = $("#empty-cart")[0];
            const existingCart = $("#existing-cart")[0];
            if (productsUnderCart.length > 0) {
                emptyCart.classList.remove("show-container");
                emptyCart.classList.add("hide-container");
                existingCart.classList.add("show-container");
                existingCart.classList.remove("hide-container");
            }
            else {
                emptyCart.classList.remove("hide-container");
                emptyCart.classList.add("show-container");
                existingCart.classList.add("hide-container");
                existingCart.classList.remove("show-container");
            }
        }
    </script>
</asp:Content>
