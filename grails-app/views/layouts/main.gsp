<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <title>Shop Around</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shop Item - Start Bootstrap Template</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}" type="text/css"/>
    <g:javascript src="jquery-2.1.4.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src="bootstrap-slider.js"/>
    <g:javascript src="jquery.dataTables.min.js"/>
    <g:javascript src="jquery-ui.min.js"/>
    <g:javascript src="jqModal.js"/>
</head>

<body>
<g:render template="/layouts/navbar"/>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-3">
            <g:render template="/layouts/search"/>
            <g:render template="/layouts/showCategory"/>
            <g:render template="/layouts/showAuthor"/>
            <g:render template="/layouts/showStore"/>
            <g:render template="/layouts/showPublication"/>
        </div>

        <div class="col-md-9">
            <g:render template="/layouts/slider"/>
            <g:layoutBody/>
        </div>
        <g:render template="/layouts/moreSlider"/>
        <g:render template="/layouts/textCols"/>
        %{--<g:render template="/layouts/footer"/>--}%
    </div>
</div>
</body>
</html>