<tr>
    <td><g:link controller="category" action="showCategory"
                id="${category?.id}">${category.name}</g:link></td>
    <td>
        <g:select name="subcategory" from="${category.subCategories}" value="" optionKey="id" optionValue="name" class="btn-default btn btn-sm"/>
    </td>
    <td><a href="${createLink(controller:"category", action:"updateCategory",params: [id:category.id])}" class="btn-success btn btn-xs">Update</a>

        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${category.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click","#delete_${category.id}",function(){
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete ${category.name}",
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
                url:"${createLink(controller: 'category',action: 'deleteCategory')}",
                dataType:'json',
                data:{
                    id:'${category.id}'
                },
                success:function(data){
//                    alert("not failed");
                    if(data.success=="success")
                        bootbox.alert({
                            size: 'small',
                            message: "${category.name} has been deleted Successfully",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    else if(data.failed=="failed"){
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the SubCategory in ${category.name}",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    }
                },
                error:function(request,status,error){
                    bootbox.alert({
                        size: 'small',
                        message: "Please check the SubCategory in  ${category.name}",
                        callback: function(result){
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>