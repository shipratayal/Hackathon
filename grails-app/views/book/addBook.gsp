<%@ page import="com.Author; com.Publication; com.SubCategory" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>
</head>

<body>
<g:if test="${bookCO.hasErrors()}">
    <div class="tb1">
        <div style="color: #ff0000">
            <g:hasErrors bean="${bookCO}">
                <g:renderErrors bean="${bookCO}"/>
            </g:hasErrors>
        </div>
    </div>
</g:if>
<div class="col-md-10">
    <form action="${createLink(controller: 'book', action: 'saveBook')}" method="post" class="form-horizontal"
          role="form">

        <div class="form-group">
            <label class="control-label col-sm-2" for="book">
                Title:
            </label>

            <div class="col-sm-10">
                <g:textField name="title" id="book" value="${bookCO.title}" class="form-control"
                             placeholder="Enter Book"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                ISBN:
            </label>

            <div class="col-sm-10">
                <g:textField name="ISBN" id="isbn" value="${bookCO.ISBN}" class="form-control"
                             placeholder="Enter ISBN"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Price:
            </label>

            <div class="col-sm-10">
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <g:textField name="price" value="${bookCO.price}" class="form-control"
                                 placeholder="Enter Price" aria-label="Amount (to the nearest dollar)"/>
                    <span class="input-group-addon">.00</span>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Released Date:
            </label>

            <div class="col-sm-10">
                <g:datePicker name="releasedDate" value="${bookCO.releasedDate}"
                              precision="day" years="${1930..1970}" noSelection="['': '-Choose-']"
                              class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                Description:
            </label>

            <div class="col-sm-10">
                <g:textField name="description" value="${bookCO.description}" class="form-control"
                             placeholder="Enter Description"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="isbn">
                SubCategory:
            </label>

            <div class="col-sm-10">
                <g:select name="subcategory" from="${SubCategory.list()}" value="${bookCO?.subCategory?.name}"
                          class="form-control" optionKey="id" optionValue="name"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">
                Publication:
            </label>

            <div class="col-sm-10">
                <g:select name="publication" from="${Publication.list()}" value="${bookCO?.publication?.name}"
                          class="form-control" optionKey="id" optionValue="name"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="leftValues">
                Author:
            </label>

            <div class="col-md-4">
                <g:select id="leftValues" name="authors" from="" value="" optionKey="id" optionValue="name"
                          class="form-control" multiple="true"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnLeft" value="&lt;&lt;"/>
            </div>

            <div class="col-md-1">
                <input type="button" id="btnRight" value="&gt;&gt;"/>
            </div>

            <div class="col-md-4">
                <g:select id="rightValues" name="book" from="${Author.list()}" value="" optionKey="id"
                          class="form-control" optionValue="name" multiple="true"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="reviews">
                Reviews:
            </label>

            <div class="col-sm-10">
                <g:textField name="myField" id="reviews" value="" class="form-control"
                             placeholder="Enter Reviews"/>
            </div>
        </div>

        <div class="col-sm-10">
            <g:submitButton name="save" value="Submit" class="btn btn-primary btn-sm"
                            onclick="return confirm('Are you sure???')"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <g:submitButton name="clear" value="Reset" class="btn btn-danger btn-sm"/>
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