let StatusCode = {
    OK: 200
}

let HttpMethod = {
    GET: "GET",
    POST: "POST",
    PUT: "PUT",
    PATCH: "PATCH",
    DELETE: "DELETE"
}

function send(method, endpoint, data, onOk, onError) {
    const baseUrl = "http://groceryapp.api.com/";
    let address = baseUrl + endpoint;
    data = JSON.stringify(data);
    const xhr = new XMLHttpRequest();
    xhr.open(method, address, true);
    xhr.onload = function () {
        xhr.status == StatusCode.OK ? onOk(xhr.response) : onError(xhr.response);
    };
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(data);
}