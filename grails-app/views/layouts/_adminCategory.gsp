<%@ page import="com.Category; com.Store; com.Publication; com.Book; com.Author; com.SubCategory" %>
<div class="panel panel-primary">
    <div class="panel-heading">Operation</div>
    <div class="panel-body">
        <ul class="list-group">
            <li class="list-group-item"><a href= ${createLink(controller: 'category', action: 'addCategory')}>Add Category&nbsp;<span class="badge">${Category.count}</span></a></li>
            <li class="list-group-item"><a href="${createLink(controller: 'category', action: 'addSubCategory')}">Add SubCategory&nbsp;<span class="badge">${SubCategory.count}</span></a></li>
            <li class="list-group-item"><a href="${createLink(controller: 'author', action: 'addAuthor')}">Add Author&nbsp;<span class="badge">${Author.count}</span></a></li>
            <li class="list-group-item"><a href="${createLink(controller: 'book', action: 'addBook')}">Add Book&nbsp;<span class="badge">${Book.count}</span></a></li>
            <li class="list-group-item"><a href="${createLink(controller: 'publication', action: 'addPublication')}">Add Publication&nbsp;<span class="badge">${Publication.count}</span></a></li>
            <li class="list-group-item"><a href="${createLink(controller: 'store', action: 'addStore')}">Add Store&nbsp;<span class="badge">${Store.count}</span></a></li>
        </ul>
    </div>
</div>


