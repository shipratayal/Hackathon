<%--
  Created by IntelliJ IDEA.
  User: vijay
  Date: 24/6/15
  Time: 9:11 AM
--%>

<%@ page import="com.Book; com.Category" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>
</head>

<body>
<div class="col-md-10">
    <form action="${createLink(controller: 'category', action: 'saveSubCategory')}" class="form-horizontal" role="form">

        <div class="form-group">
            <label class="control-label col-sm-3" for="subCategoryName">
                SubCategory Name:
            </label>
            <div class="col-sm-9">
                <g:textField name="name" value="${subCategory.name}" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="subCategoryName">
                Category Name:
            </label>

            <div class="col-sm-9">
                <g:select name="category" from="${Category.list()}" value="${subCategory?.category?.name}"
                          class="form-control" optionKey="id" optionValue="name"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="book">
                Book:
            </label>
            <div class="col-md-4">
                <g:select id="leftValues" name="books" from="" value="" optionKey="id" optionValue="name"
                          class="form-control" multiple="true"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnLeft" value="&lt;&lt;"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnRight" value="&gt;&gt;"/>
            </div>

            <div class="col-md-3">
                <g:select id="rightValues" name="book" from="${Book.list()}" value="" optionKey="id"
                          class="form-control" optionValue="title" multiple="true"/>
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