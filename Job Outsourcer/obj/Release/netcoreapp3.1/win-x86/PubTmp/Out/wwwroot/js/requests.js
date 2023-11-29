var dataTable;

$(document).ready(function () {
    loadList();
});

function loadList() {
    dataTable = $('#DT_load').DataTable({
        "ajax": {
            "url": "/api/request",
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
                                <a href="/Admin/Requests/ViewRequest?id=${data}" class="btn btn-success text-white" style="cussor:pointer; width:100px;">
                                    <i class="far fa-edit"></i> Pogledaj
                                </a>
                              
                    </div>`;
                }, "width": "30%"
            }
        ],
        "language": {
            "emptyTable": "nisu pronađeni podaci"
        },
        "width": "100%",
        "order": [[2, "asc"]]
    });
}


