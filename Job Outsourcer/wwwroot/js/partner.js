var dataTable;

$(document).ready(function () {
    loadList();
});

function loadList() {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/partner",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "applicationUser.fullName", "width": "15%" },
            { "data": "applicationUser.email", "width": "15%" },
            { "data": "applicationUser.phoneNumber", "width": "15%" },
            { "data": "rating", "width" : "15%" },
            {
                "data": "applicationUser",
                "render": function (data) {
                    var today = new Date().getTime();
                    var lockout = new Date(data.lockoutEnd).getTime();
                    if (lockout > today) {
                        //trenutno je korisnik zaključan
                        return ` <div class="text-center">
                                  <a href="/Admin/Partners/editPartnerRights?id=${data.id}" class="btn btn-success text-white" style="cussor:pointer; width:100px;">
                                    <i class="far fa-edit"></i> Uredi prava
                                </a>
                                <a class="btn btn-danger text-white" style="cursor:pointer; width:100px;" onclick=LockUnlock('${data.id}')>
                                   <i class="fas fa-lock-open"></i> Otključaj
                                </a></div>`;

                    }
                    else {
                        return `  <div class="text-center">
                                   <a href="/Admin/Partners/editPartnerRights?id=${data.id}" class="btn btn-success text-white" style="cussor:pointer; width:100px;">
                                    <i class="far fa-edit"></i> Uredi prava
                                </a>
                                <a class="btn btn-success text-white" style="cursor:pointer; width:100px;" onclick=LockUnlock('${data.id}')>
                                    <i class="fas fa-lock"></i> Zaključaj
                                </a></div>`;
                    }
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
        "width": "100%"
    });
}

function LockUnlock(id) {
    $.ajax({
        type: 'POST',
        url: '/api/partner',
        data: JSON.stringify(id),
        contentType: "application/json",
        success: function (data) {
            if (data.success) {
                toastr.success(data.message);
                dataTable.ajax.reload();
            }
            else {
                toastr.error(data.message);
            }
        }
    });

} 