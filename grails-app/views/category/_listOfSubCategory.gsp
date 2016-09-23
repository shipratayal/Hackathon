<tr>
    <td>
        <g:link controller="category" action="showSubCategory"
                id="${subCategory?.id}">${subCategory.name}</g:link>
    </td>
    <td>${subCategory.category.name}</td>
    <td>
        <g:select name="subcategory" from="${subCategory.books}" value="" optionKey="id" optionValue="title" class="btn btn-default btn-sm"/>
    </td>
    <td><a href="${createLink(controller: "category", action: "updateSubCategory", params: [id: subCategory.id])}" class="btn btn-success btn-xs">Update</a>

        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${subCategory.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click","#delete_${subCategory.id}",function(){
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete ${subCategory.name}",
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
                url:"${createLink(controller: 'category',action: 'deleteSubCategory')}",
                dataType:'json',
                data:{
                    id:'${subCategory.id}'
                },
                success:function(data){
//                    alert("not failed");
                    if(data.success=="success")
                        bootbox.alert({
                            size: 'small',
                            message: "${subCategory.name} has been deleted Successfully",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    else if(data.failed=="failed"){
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the book in ${subCategory.name}",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    }
                },
                error:function(request,status,error){
                    bootbox.alert({
                        size: 'small',
                        message: "Please check the book in  ${subCategory.name}",
                        callback: function(result){
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>