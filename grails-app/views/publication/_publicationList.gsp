<tr>
    <td>
        <g:link controller="publication" action="showPublication"
                id="${publication?.id}">${publication.name}</g:link>
    </td>
    <td>${publication.startDate}</td>
    <td>
        <g:select name="subcategory" from="${publication.books}" value="" optionKey="id" class="btn-default btn btn-sm"
                  optionValue="title"/>
    </td>
    <td><a href="${createLink(controller: "admin", action: "updatePublication", params: [id: publication.id])}" class="btn btn-success btn-xs">Update</a>

        %{--<a href="${createLink(controller: "admin", action: "deletePublication", params: [id: publication.id])}" class="btn btn-danger btn-xs">Delete</a>--}%
        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${publication.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click","#delete_${publication.id}",function(){
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete Publication",
            callback: function(result){
                if(result){
                    perform()
                }
                else{
//                    alert("failed");
                }
            }
        });

        function perform(){
            $.ajax({
                url:"${createLink(controller: 'publication',action: 'deletePublication')}",
                dataType:'json',
                data:{
                    id:'${publication.id}'
                },
                success:function(data){
                    if(data.success=="success")
                        bootbox.alert({
                            size: 'small',
                            message: "Publication has been deleted Successfully",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    else if(data.failed=="failed"){
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the book under ${publication.name}",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    }
                },
                error:function(request,status,error){
                    bootbox.alert({
                        size: 'small',
                        message: "Publication has not been deleted "+data.id,
                        callback: function(result){
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>