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
            <th>SubCategory</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>SubCategory</th>
            <th>Operations</th>
        </tr>
        </tfoot>
        <tbody>
        <g:if test="${categoryList}">
            <g:each in="${categoryList}" var="category">
                <g:render template="listOfCategory" model="[category: category]"/>
            </g:each>
        </g:if>
        </tbody>

    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate total="${categoryTotal}"/>--}%
    %{--</div>--}%

    <a href="${createLink(controller: "category", action: "addCategory")}" class="btn btn-primary btn-sm">Add Category</a>
<a href="${createLink(controller: "category", action: "addSubCategory")}" class="btn btn-primary btn-sm">Add SubCategory</a>


</body>
</html>