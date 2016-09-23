<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>

</head>

<body>
<table class="table table-bordered table-striped table-hover table-responsive" id="example">
    <thead>
    <tr>
        <th>Title</th>
        <th>ISBN</th>
        <th>Price</th>
        <th>Released Date</th>
        <th>Authors</th>
        <th>Publication</th>
        <th>Category</th>
        <th>Description</th>
        <th>Operation</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>Title</th>
        <th>ISBN</th>
        <th>Price</th>
        <th>Released Date</th>
        <th>Authors</th>
        <th>Publication</th>
        <th>Category</th>
        <th>Description</th>
        <th>Operation</th>
    </tr>
    </tfoot>
    <tbody>
    <g:if test="${bookList}">
        <g:each in="${bookList}" var="book">
            <g:render template="bookList" model="[book: book]"/>
        </g:each>
    </g:if>
    </tbody>

</table>
%{--<g:paginate total="${bookTotal}"/>--}%
<a href="${createLink(controller: "book", action: "addBook")}" class="btn btn-primary btn-sm">Add Book</a>
%{--<script type="text/javascript">--}%
    %{--$(document).ready(function() {--}%
        %{--$('#example').DataTable();--}%
    %{--} );--}%
%{--</script>--}%
</body>
</html>