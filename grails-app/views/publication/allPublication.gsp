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
        <th>Title</th>
        <th>Publication Start Date</th>
        <th>Books</th>
        <th>Operations</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>Title</th>
        <th>Publication Start Date</th>
        <th>Books</th>
        <th>Operations</th>
    </tr>
    </tfoot>
    <tbody>
    <g:if test="${listOfPublications}">
        <g:each in="${listOfPublications}" var="publication">
            <g:render template="publicationList" model="[publication: publication]"/>
        </g:each>
    </g:if>
    </tbody>

</table>


%{--<div class="pagination">--}%
%{--<g:paginate total="${publicationTotal}"/>--}%
%{--</div>--}%
<a href="${createLink(controller: "publication", action: "addPublication")}" class="btn btn-primary btn-sm">Add Publication</a>
</body>
</html>