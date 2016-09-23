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
            <th>Author's Name</th>
            <th>Books</th>
            <th>Operations</th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th>Author's Name</th>
            <th>Books</th>
            <th>Operations</th>
        </tr>
        </tfoot>
        <tbody>
        <g:if test="${authorList}">
            <g:each in="${authorList}" var="author">
                <g:render template="authorList" model="[author: author]"/>
            </g:each>
        </g:if>
        </tbody>
    </table>
    <a href="${createLink(controller: "author", action: "addAuthor")}" class="btn-primary btn btn-sm">Add Author</a>
</body>
</html>