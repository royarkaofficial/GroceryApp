<%@ Page Title="Grocery App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="GroceryApp.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-content">
        <div class="container mx-2">
            <div class="row">

            </div>
        </div>
    </div>
    <style>
        .container.body-content {
            margin-left: 60px;
            margin-right: 60px;
        }

        .fa:hover {
            cursor: pointer;
        }
    </style>
    <script>
        let products;
        let productToBeDeleted;
        let modal;

        function setProducts() {
            const endpoint = "products";
            const onOk = function (response) {
                products = response.data;
                const parser = new DOMParser();
                if (currentUser.role == UserRole.ADMIN) {
                    let content = parser.parseFromString(`<div id="card-add" class="col-2 mb-3">
                                          <div class="card shadow-lg" style="width: 200px;">
                                              <div class="border border-primary" style="background-image: url('./Assets/product-add.png'); height: 202px; width: 175px; background-size: cover; margin: 11.5px;"></div>
                                              <div class="card-body pt-0">
                                                  <div class="d-grid">
                                                      <a class="btn btn-primary btn-sm" href="ProductDetails">Add Product</a>
                                                  </div>
                                               </div>
                                          </div>
                                      </div>`, 'text/html')
                    $('#page-content .container .row')[0].append(content.getElementById(`card-add`));
                }
                products.forEach(p => {
                    const isAlreadyAddedToTheCart = productsUnderCart.findIndex(x => x == p.id) > -1;
                    content = parser.parseFromString(`<div id="card-${p.id}" class="col-2 mb-3">
                                                              <div class="card shadow-lg" style="width: 200px;">
                                                                  <div class="border" style="background-image: url('${p.imageUrl}'); height: 175px; width: 175px; background-size: cover; margin: 11.5px;"></div>
                                                                  <div class="card-body pt-0">
                                                                      <h6 class="card-title">${p.name}</h6>
                                                                      <div class="row">
                                                                          <div class="col-5 mt-1">
                                                                              <a class="btn btn-primary btn-sm" onclick="false"><small>&#x20B9;${p.price}/-</small></a>
                                                                          </div>
                                                                          <div class="col-7 mt-1 ps-0 text-end" style="height: max-content;">` +
                        ((currentUser.role == UserRole.ADMIN) ?
                            `<i class="fa fa-trash-o pe-2" style="font-size: 24px; color: red;" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Delete" onclick="onDelete(${p.id})"></i>
                            <i class="fa fa-pencil" style="font-size: 24px; color: blue;" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Edit" onclick="redirectToEditProductPage(${p.id})"></i>` :
                            `<button id="cart-btn-${p.id}" type="button" class="btn btn-outline-${isAlreadyAddedToTheCart ? "danger" : "primary"} btn-sm" onclick="modifyCart(${p.id})">${isAlreadyAddedToTheCart ? "Remove" : "Add to Cart"}</button>`) +
                                                                          `</div>
                                                                      </div>
                                                                   </div>
                                                              </div>
                                                          </div>`, 'text/html')
                    $('#page-content .container .row')[0].append(content.getElementById(`card-${p.id}`));
                });
                const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
                const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
            };
            const onError = function (response) {

            };
            send(HttpMethod.GET, endpoint, null, onOk, onError);
        }

        function onDelete(id, confirm) {
            if (confirm) {
                toggleForm(true);
                const endpoint = `products/${productToBeDeleted}`;
                const onOk = setTimeout(function () {
                    $(`#card-${productToBeDeleted}`)[0].remove();
                    $(".toast")[0].classList.remove("bg-danger");
                    $(".toast")[0].classList.add("show", "bg-success");
                    $(".toast-body")[0].innerText = `Product removed successfully.`;
                    modal.hide();
                }, 4000);
                const onError = function () {
                    $(".toast-body")[0].innerText = `Something went wrong.`;
                };
                send(HttpMethod.DELETE, endpoint, null, onOk, onError);
            }
            else {
                modal = new bootstrap.Modal($('.modal')[0]);
                productToBeDeleted = id;
                modal.show();
            }
        }

        function redirectToEditProductPage(id) {
            window.location.href = `ProductDetails?productId=${id}&mode=edit`;
        }

        function modifyCart(id) {
            const button = $(`#cart-btn-${id}`)[0];
            const isAlreadyAddedToTheCart = productsUnderCart.findIndex(x => x == id) > -1;
            let mode;
            if (isAlreadyAddedToTheCart) {
                productsUnderCart = productsUnderCart.filter(x => x != id);
                button.classList.add('btn-outline-primary');
                button.classList.remove('btn-outline-danger');
                button.innerText = "Add to Cart";
                mode = CartMode.DELETE;
            }
            else {
                productsUnderCart.push(id);
                button.classList.add('btn-outline-danger');
                button.classList.remove('btn-outline-primary');
                button.innerText = "Remove";
                mode = CartMode.ADD;
            }
            updateCartBadge();
            const data = {
                productId: id,
                operationType: mode
            }
            if (cartId) {
                const endpoint = `users/${userId}/carts/${cartId}`;
                const onOk = function (response) {
                    $(".toast")[0].classList.remove("bg-danger");
                    $(".toast")[0].classList.add("show", "bg-success");
                    $(".toast-body")[0].innerText = `Product ${mode == CartMode.ADD ? 'added to' : 'removed from'} the cart.`;
                    if (productsUnderCart.length == 0) {
                        cartId = null;
                    }
                };
                const onError = function () {
                    $(".toast")[0].classList.add('show');
                    $(".toast-body")[0].innerText = `Something went wrong.`;
                };
                send(HttpMethod.PUT, endpoint, data, onOk, onError);
            }
            else {
                const endpoint = `users/${userId}/carts`;
                const onOk = function (response) {
                    $(".toast")[0].classList.remove("bg-danger");
                    $(".toast")[0].classList.add("show", "bg-success");
                    $(".toast-body")[0].innerText = `Product ${mode == CartMode.ADD ? 'added to' : 'removed from'} the cart.`;
                    cartId = response.data.id;
                };
                const onError = function () {
                    $(".toast")[0].classList.add('show');
                    $(".toast-body")[0].innerText = `Something went wrong.`;
                };
                send(HttpMethod.POST, endpoint, data, onOk, onError);
            }
        }
    </script>
</asp:Content>
