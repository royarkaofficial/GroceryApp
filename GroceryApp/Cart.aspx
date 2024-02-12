<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GroceryApp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="empty-cart" class="hide-container form-container">
        <div class="container">
            <div class="row mt-3">
                <div class="col-2">
                    <img class="ms-2" src="./Assets/empty-cart.png" height="45" width="45" />
                </div>
                <div class="col-10 mt-2">
                    <p class="ms-4 ps-2" style="font-size: 20px;">Cart is empty</p>
                </div>
            </div>
        </div>
    </div>
    <div id="existing-cart" class="container hide-container">
        <div class="row justify-content-between">
            <div id="cart-container" class="col-9 p-0 border border-black bg-white">
                <div class="row px-4 pt-4 pb-2">
                    <div class="col">
                        <h3>Cart Details</h3>
                    </div>
                    <div class="col text-end">
                        <buton class="btn btn-danger rounded-pill" onclick="emptyCart()">Empty Cart</buton>
                    </div>
                </div>
                <div class="row ps-4">
                    <p id="deliver-to"></p>
                </div>
                <div class="row ps-4">
                    <p id="delivery-address"></p>
                </div>
                <div class="mx-4 overflow-y-scroll border" style="height: calc(100vh - 254px);">
                    <div id="products-under-cart" class="m-3">

                    </div>
                </div>
            </div>
            <div id="payment-container" class="col-3"></div>
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

        #delivery-address {
            margin-top: -8px;
        }

        #empty-cart {
            height: 80px;
            width: 240px;
        }

        #payment-container {
            height: 400px;
            background-color: #000000;
        }
    </style>
    <script>
        function emptyCart() {
            const endpoint = `users/${userId}/carts/${cartId}`;
            const onOk = function () {
                cartId = null;
                productsUnderCart = [];
                updateCartBadge();
                isCartEmpty();
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
                $("#deliver-to")[0].innerText = `Deliver To: ${currentUser.firstName} ${currentUser.lastName}`;
                $("#delivery-address")[0].innerText = `Address: ${currentUser.address}`;
                const endpoint = `products?productIds=${productsUnderCart.join(",")}`;
                const onOk = function (response) {
                    const parser = new DOMParser();
                    const root = $("#products-under-cart")[0];
                    productsUnderCart.forEach(id => {
                        const product = response.data.find(x => x.id == id);
                        const component = parser.parseFromString(`<div id="product-under-cart-${id}" class="container mb-3 border" style="border-radius: 10px; background-color: #f2f3f5;">
                                                                      <div class="row p-2">
                                                                          <div class="col-3 px-0">
                                                                              <div class="border border-1" style="background-image: url('${product.imageUrl}'); height: 130px; width: 130px; background-size: cover;"></div>
                                                                          </div>
                                                                          <div class="col-9 px-0" style="margin-left: -26px;">
                                                                            <div class="row" style="font-size: 17px; margin-top: 10px;">
                                                                                <p class="px-0">${product.name}</p>
                                                                            </div>
                                                                            <div class="row" style="font-size: 17px; margin-top: -3px;">
                                                                                <p class="px-0">Price - ${product.price}</p>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col px-0">
                                                                                    <button type="button" class="btn btn-danger btn-sm rounded-pill mt-0" onclick="modifyCart({id: ${product.id}, price: ${product.price}})">Remove</button>
                                                                                </div>
                                                                            </div>
                                                                          </div>
                                                                      </div>
                                                                  </div>`, 'text/html');
                        const node = component.getElementById(`product-under-cart-${id}`);
                        root.append(node);
                    });
                };
                const onError = function () { };
                send(HttpMethod.GET, endpoint, null, onOk, onError);
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
