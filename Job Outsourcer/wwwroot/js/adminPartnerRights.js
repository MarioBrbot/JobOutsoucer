var dataTable;


    $(document).ready(function () {
        var url_string = window.location.href;
      
        var url = new URL(url_string);

        var param = url.searchParams.get("id");

        console.log(param);
        loadList(param);
    });




function loadList(param) {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/adminPartnerRights?id=" + param,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "jobType.name", "width": "20%" },
            { "data": "status", "width": "20%" },
            {
                "data": { param, status: "status"},
                "render": function (data) {
                    
                    
                    if (data.status == "Dozvoljeno") {
                        //trenutno je pravo nedozvoljeno
                        return ` <div class="text-center">
                                <a class="btn btn-danger text-white" style="cursor:pointer; width:100px;" onclick=LockUnlock('${param}','${data.jobType.id}')>
                                   <i class="fas fa-lock-open"></i> Skini dozvolu
                                </a></div>`;

                    }
                    else {
                        return ` <div class="text-center">
                                <a class="btn btn-success text-white" style="cursor:pointer; width:100px;" onclick=LockUnlock('${param}','${data.jobType.id}')>
                                    <i class="fas fa-lock"></i> Dozvoli
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

function LockUnlock(id, jobTypeId) {

    console.log(id);
    console.log(jobTypeId);
  
    $.ajax({
          headers: { 
        'Accept': 'application/json',
        'Content-Type': 'application/json' 
    },
        type: 'POST',
        url: "/api/adminPartnerRights?id=" + id,
        data: JSON.stringify({ id, jobTypeId }),
        contentType: "application/json charset=utf-8",
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