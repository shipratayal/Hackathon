<%@ page import="com.SubCategory" %>
<div class="panel panel-primary">
    <div class="panel-heading">Search By</div>

    <div class="panel-body">
        <form action="#" method="post" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12">
                    <g:textField name="title" id="keyword" value="" class="form-control" placeholder="Keyword"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <g:select name="category" from="${SubCategory.list()}" value="" optionValue="name" optionKey="id"
                              class="form-control" noSelection="['': 'Category']"/>
                </div>
            </div>
            <g:render template="/layouts/price"/>
            <g:submitButton name="save" value="Search" class="form-control btn btn-primary btn-sm"/>

            <p><a href="#" class="bul">Advanced search</a><br/>
                <a href="#" class="bul">Contact Customer Support</a></p>
        </form>
    </div>
</div>


