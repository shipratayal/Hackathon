<tr>
    <td>
        <g:link controller="store" action="showStore"
                id="${store?.id}">${store.name}</g:link>
    </td>
    <td>${store.owner}</td>
    <td>
        <g:select name="subcategory" from="${store.authors}" noSelection="${['null': 'Not Any']}"
                  value="" optionKey="id" optionValue="name" class="btn btn-default btn-sm"/>
    </td>
    <td>
        <g:select name="subcategory" from="${store.books}" noSelection="${['null': 'Not Any']}"
                  value="" optionKey="id" optionValue="title" class="btn btn-default btn-sm"/>
    </td>
    <td>
        <g:select name="subcategory" from="${store.publications}"
                  noSelection="${['null': 'Not Any']}" value="" optionKey="id"
                  optionValue="name" class="btn btn-default btn-sm"/>
    </td>
    <td>
        <g:select name="subcategory" from="${store.categories}"
                  noSelection="${['null': 'Not Any']}" value="" optionKey="id"
                  optionValue="name" class="btn btn-default btn-sm"/>
    </td>
    <td>
        <g:select name="subcategory" from="${store.subCategory}"
                  noSelection="${['null': 'Not Any']}" value="" optionKey="id"
                  optionValue="name" class="btn btn-default btn-sm"/>
    </td>

    <td>${store.getTheAddress()}</td>
    <td>${store.city}</td>
    <td>${store.state}</td>
    <td><a href="${createLink(controller: "store", action: "updateStore", params: [id: store.id])}"
           class="btn btn-success btn-xs">Update</a>
        <br/>
        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${store.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click", "#delete_${store.id}", function () {
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete the Store",
            callback: function (result) {
                if (result) {
                    perform()
                }
                else {
                    alert("failed");
                }
            }
        });

        function perform() {
            $.ajax({
                url: "${createLink(controller: 'store',action: 'deleteStore')}",
                dataType: 'json',
                data: {
                    id: '${store.id}'
                },
                success: function (data) {
//                    alert("not failed");
                    if (data.success == "success")
                        bootbox.alert({
                            size: 'small',
                            message: "Store has been deleted Successfully",
                            callback: function (result) {
                                location.reload()
                            }
                        });
                    else if (data.failed == "failed") {
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the store ${store.name}",
                            callback: function (result) {
                                location.reload()
                            }
                        });
                    }
                },
                error: function (request, status, error) {
                    bootbox.alert({
                        size: 'small',
                        message: "Please check the store ${store.name}",
                        callback: function (result) {
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>