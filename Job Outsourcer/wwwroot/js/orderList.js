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
            { "data": "applicationUser.fullName", "width": "20%"}, 
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
            "emptyTable": "Nema podataka u tablici",
            "info": "Prikazano _START_ do _END_ od _TOTAL_ rezultata",
            "infoEmpty": "Prikazano 0 do 0 od 0 rezultata",
            "infoFiltered": "(filtrirano iz _MAX_ ukupnih rezultata)",
            "infoThousands": ",",
            "lengthMenu": "Prikaži _MENU_ rezultata po stranici",
            "loadingRecords": "Dohvaćam...",
            "processing": "Obrađujem...",
            "search": "Pretraži:",
            "zeroRecords": "Ništa nije pronađeno",
            "paginate": {
                "first": "Prva",
                "previous": "Nazad",
                "next": "Naprijed",
                "last": "Zadnja"
            }
        },
        "width": "100%"
    });
}