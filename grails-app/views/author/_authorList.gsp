<tr>
    <td>
        <g:link controller="author" action="showAuthor"
                id="${author?.id}">${author.name}</g:link>
    </td>
    <td>
        <g:select name="subcategory" from="${author.books}" value="" optionKey="id" optionValue="title" class="btn btn-default btn-sm"/>
    </td>
    <td><a href="${createLink(controller:"author", action:"updateAuthor",params: [id:author.id])}" class="btn btn-success btn-xs">Update</a>

        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${author.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click","#delete_${author.id}",function(){
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete Author",
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
                url:"${createLink(controller: 'author',action: 'deleteAuthor')}",
                dataType:'json',
                data:{
                    id:'${author.id}'
                },
                success:function(data){
//                    alert("not failed");
                    if(data.success=="success")
                    bootbox.alert({
                        size: 'small',
                        message: "Author has been deleted Successfully",
                        callback: function(result){
                            location.reload()
                        }
                    });
                    else if(data.failed=="failed"){
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the book written by ${author.name}",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    }
                },
                error:function(request,status,error){
                    bootbox.alert({
                        size: 'small',
                        message: "Please check the book written by  "+data.name,
                        callback: function(result){
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>