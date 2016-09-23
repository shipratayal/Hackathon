<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>

</head>

<body>
    <table class="table table-bordered table-striped table-hover" id="example">
        <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Books</th>
            <th>Operation</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Books</th>
            <th>Operation</th>
        </tr>
        </tfoot>
        <tbody>
        <g:if test="${subCategoryList}">
            <g:each in="${subCategoryList}" var="subCategory">
                <g:render template="listOfSubCategory" model="[subCategory:subCategory]"/>
            </g:each>
        </g:if>
        </tbody>

    </table>
    %{--<g:paginate total="${subCategoryTotal}"/>--}%

    <a href="${createLink(controller: "category", action: "addSubCategory")}" class="btn btn-primary btn-sm">Add SubCategory</a>
</body>
</html>