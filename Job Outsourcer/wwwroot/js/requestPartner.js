var dataTable;

$(document).ready(function () {
    loadList();
});

function loadList() {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/partnerRequest",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "applicationUser.fullName", "width": "25%" },
            { "data": "title", "width": "15%" },
            { "data": "status", "width": "20%" },
            {
                "data": "id",
                "render": function (data) {
                    return ` <div class="text-center">
                                <a href="/Admin/Requests/ViewPartnerRequest?id=${data}" class="btn btn-success text-white" style="cussor:pointer; width:100px;">
                                    <i class="far fa-edit"></i> Pogledaj
                                </a>
                              
                    </div>`;
                }, "width": "30%"
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
        "width": "100%",
        "order": [[2, "asc"]]
    });
}
