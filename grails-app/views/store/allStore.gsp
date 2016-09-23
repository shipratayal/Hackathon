<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Store</title>
    <meta name="layout" content="admin"/>

</head>

<body>
    <table class="table table-bordered table-striped table-hover" id="example">
        <thead>
        <tr>
            <th>Name</th>
            <th>Owner</th>
            <th>Authors</th>
            <th>Books</th>
            <th>Publication</th>
            <th>Category</th>
            <th>SubCategory</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Action</th>
        </tr>

        </thead>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>Owner</th>
            <th>Authors</th>
            <th>Books</th>
            <th>Publication</th>
            <th>Category</th>
            <th>SubCategory</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Action</th>
        </tr>
        </tfoot>
        <tbody>
        <g:if test="${storeList}">
            <g:each in="${storeList}" var="store">
                <g:render template="storeList" model="[store: store]"/>
            </g:each>
        </g:if>
        </tbody>

    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate total="${storeTotal}"/>--}%
    %{--</div>--}%
    <a href="${createLink(controller: "store", action: "addStore")}" class="btn-primary btn btn-sm">Add Store</a>
</body>
</html>