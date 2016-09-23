<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <g:layoutHead/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dataTables.bootstrap.min.css')}" type="text/css"/>
    <g:javascript src="jquery-2.1.4.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src="jquery.dataTables.min.js"/>
    <g:javascript src="bootbox.min.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <g:render template="/layouts/adminNavigate"/>

        <div class="col-mod-12">

            <div class="col-md-2">
                <g:render template="/layouts/adminCategory"/>
            </div>

            <div class="col-md-10">
                <g:layoutBody/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <p><a href="#">Home</a> <span>|</span> <a href="#">Support</a> <span>|</span> <a
                    href="#">My Account</a> <span>|</span> <a href="#">The Store</a> <span>|</span> <a
                    href="#">Contact</a>
            </p>
        </div>

        <div class="col-md-4 right">
            <p>&copy; 2010 Shop Around. Design by <a
                    href="http://chocotemplates.com">Chocotemplates.com</a>
            </p>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>
</body>
</html>