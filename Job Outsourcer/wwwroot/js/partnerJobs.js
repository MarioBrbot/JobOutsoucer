var dataTable;

$(document).ready(function () {

    var url = window.location.search;

    var type = url.split('=');
    var hash = '';
    if (type.length > 1)
        hash = type[1];
  
    console.log(hash);
    loadList(hash);

});

function loadList(param) {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "encoding": "UTF-8",
            "url": "/api/partnerJobList?category=" + param,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "county.name", "width": "25%" },
            { "data": "orderHeader.applicationUser.address", "width": "25%" },
            { "data": "orderHeader.pickUpTime", "width": "25%", "render": function (data) { return data.replace("T" , "   ") } },
            { "data": "orderDetails.name", "width": "25%" },
            { "data": "orderDetails.count", "width": "25%" },
            {
                "data": "orderDetails.id",
                "render": function (data) {
                    return ` <div class="text-center">
                                    <a href="/Partner/Jobs/Summary?id=${data}" class="btn btn-success text-white" style="cursor:pointer; width:100px;">
                                            <i class="far fa-edit"></i> Detalji
                                    </a>
                        </div>`;
                }, "width": "25%"
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