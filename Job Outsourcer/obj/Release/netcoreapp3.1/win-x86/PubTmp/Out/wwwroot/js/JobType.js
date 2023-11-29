﻿var dataTable;

$(document).ready(function () {
    loadList();
});


function loadList() {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/JobType",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
           
            { "data": "name", "width": "30%" },
            { "data": "category.name", "width": "30%" },
            {
                "data": "id",
                "render": function (data) {
                    return `<div class="text-center"> 
                                <a href="/Admin/Job_Type/upsert?id=${data}" class="btn btn-success text-white" style="cursor: pointer; width: 100px;" > 
                                    <i class="far fa-edit"></i> Uredi
                                </a>
                                <a class="btn btn-danger text-white" style="cursor: pointer; width: 100px;" onclick=Delete('/api/jobtype/'+${data})>  
                                    <i class="far fa-trash-alt"></i> Obriši
                                </a>
                            </div> `;

                }, "width": "40%"
            }


        ],
        "language": {
            "emptyTable": "nisu pronađeni podaci"
        },
        "width": "100%"
    });
}

function Delete(url) {
    swal({
        title: "Jeste li sigurni da želite obrisati?",
        text: "Nećete moći vratiti podatke!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    type: 'DELETE',
                    url: url,
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
        });
}