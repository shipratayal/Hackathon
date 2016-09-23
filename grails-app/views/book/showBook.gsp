<%--
  Created by IntelliJ IDEA.
  User: vijay
  Date: 13/8/15
  Time: 4:05 PM
--%>

<%@ page import="com.Author; com.SubCategory; com.Publication" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>
</head>

<body>
<div class="col-md-10">
    <form action="${createLink(controller: 'book', action: 'saveBook')}" method="post" class="form-horizontal"
          role="form">

        <div class="form-group">
            <label class="control-label col-sm-2" for="book">
                Title:
            </label>

            <div class="col-sm-10">
                <g:textField name="title" id="book" value="${book.title}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                ISBN:
            </label>

            <div class="col-sm-10">
                <g:textField name="ISBN" id="isbn" value="${book.ISBN}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">
                Price:
            </label>

            <div class="col-sm-10">
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <g:textField name="price" value="${book.price}" class="form-control"/>
                    <span class="input-group-addon">.00</span>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Released Date:
            </label>

            <div class="col-sm-10">
                <g:datePicker name="releasedDate" value="${book.releasedDate}"
                              precision="day" years="${1930..2016}" noSelection="['': '-Choose-']"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Description:
            </label>

            <div class="col-sm-10">
                <g:textField name="description" value="${book.description}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                SubCategory:
            </label>

            <div class="col-sm-10">
                <g:select name="subcategory" from="${SubCategory.list()}" value="${book?.subCategory?.name}"
                          class="form-control" optionKey="id" optionValue="name"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Publication:
            </label>

            <div class="col-sm-10">
                <g:select name="publication" from="${Publication.list()}" value="${book?.publication?.name}"
                          class="form-control" optionKey="id" optionValue="name"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="leftValues">
                Author:
            </label>

            <div class="col-md-4">
                <g:select id="leftValues" name="authors" from="${book.authors}" value="" optionKey="id" optionValue="name"
                          class="form-control" multiple="true"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnLeft" value="&lt;&lt;"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnRight" value="&gt;&gt;"/>
            </div>

            <div class="col-md-4">
                <g:select id="rightValues" name="book" from="${authorList}" value="" optionKey="id"
                          class="form-control" optionValue="name" multiple="true"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="reviews">
                Reviews:
            </label>

            <div class="col-sm-10">
                <g:textField name="myField" value="" class="form-control"/>
            </div>
        </div>

        <div class="col-sm-10">
            <g:submitButton name="save" value="Update" class="btn btn-success"
                            onclick="return confirm('Are you sure???')"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <g:submitButton name="clear" value="Reset" class="btn btn-danger"/>
        </div>
    </form>
</div>
<script>
    $("#btnLeft").click(function () {
        var selectedItem = $("#rightValues option:selected");
        $("#leftValues").append(selectedItem);
    });

    $("#btnRight").click(function () {
        var selectedItem = $("#leftValues option:selected");
        $("#rightValues").append(selectedItem);
    });

    $("#rightValues").change(function () {
        var selectedItem = $("#rightValues option:selected");
        $("#txtRight").val(selectedItem.text());
    });
</script>
</body>
</html>