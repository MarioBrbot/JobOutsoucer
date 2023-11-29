var dataTable;

$(document).ready(function () {
    var url = window.location.search;
    if (url.includes("refundiran")) {
        loadList("refundiran");
    }
    else {
        if (url.includes("obavljen")) {
            loadList("obavljen");
        }
        else if (url.includes("preuzet")) {
            loadList("preuzet");
        }
        else {
            loadList("objavljen");
        }
    }
});

function loadList(param) {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/order?status=" + param,
            "type": "GET", 
            "datatype": "json"
        },
        "columns": [
            { "data": "orderHeader.id", "width": "20%" },
            { "data": "applicationUser.firstName", "width": "20%"}, 
            { "data": "applicationUser.email", "width": "20%" },
            { "data": "orderHeader.orderTotal", "width": "20%" },
            {
                "data": "orderHeader.id",
                "render": function (data) {
                    return ` <div class="text-center">
                                <a href="/Admin/Order/OrderDetails?id=${data}" class="btn btn-success text-white" style="cussor:pointer; width:100px;">
                                    <i class="far fa-edit"></i> Detalji
                                </a>
                               
                    </div>`;
                }, "width": "20%"
            }
        ],
        "language": {
            "emptyTable": "no data found."
        },
        "width": "100%"
    });
}