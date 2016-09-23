<tr>
    <td>
        <g:link controller="book" action="showBook"
                id="${book?.id}">${book.title}</g:link>
    </td>
    <td>${book.ISBN}</td>
    <td>${book.price}</td>
    <td>${book.releasedDate}</td>
    <td>
        <g:select name="subcategory" from="${book.authors}" value="" optionKey="id" optionValue="name" class="btn-default btn btn-sm"/>
    </td>
    <td>${book.publication.name}</td>
    <td>${book.subCategory.name}</td>
    <td>${book.description}</td>
    <td><a href="${createLink(controller: "book", action: "updateBook", params: [id: book.id])}" class="btn btn-success btn-xs">Update</a>
        <br/><br/>
        <a href="javascript:void(0);" class="btn btn-danger btn-xs" id="delete_${book.id}">Delete</a>
    </td>
</tr>
<script>
    $(document).on("click","#delete_${book.id}",function(){
        bootbox.confirm({
            size: 'small',
            message: "You are going to delete Book",
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
                url:"${createLink(controller: 'book',action: 'deleteBook')}",
                dataType:'json',
                data:{
                    id:'${book.id}'
                },
                success:function(data){
                    if(data.success=="success")
                        bootbox.alert({
                            size: 'small',
                            message: "Book has been deleted Successfully",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    else if(data.error=="failed"){
                        bootbox.alert({
                            size: 'small',
                            message: "Please check the book under ${book.title}",
                            callback: function(result){
                                location.reload()
                            }
                        });
                    }
                },
                error:function(request,status,error){
                    bootbox.alert({
                        size: 'small',
                        message: "Book has not been deleted ",
                        callback: function(result){
                            location.reload()
                        }
                    });
                }
            })
        }
    });
</script>