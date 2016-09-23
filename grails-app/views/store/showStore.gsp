<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Store Details</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<div class="col-md-10">
    <form action="${createLink(controller: 'store', action: 'saveStore')}" method="post" class="form-horizontal"
          role="form">

        <div class="form-group">
            <label class="control-label col-sm-2" for="storeName">
                Store Name:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeName" value="${store?.name}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="storeOwner">
                Store Owner:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeOwner" value="${store?.owner}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="address1">
                Store Address1:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeAdd1" value="${store?.address1}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="address2">
                Store Address2:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeAdd2" value="${store?.address2}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="state">
                State:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeState" value="${store?.state}" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="state">
                City:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeCity" value="${store?.city}" class="form-control"/>
            </div>
        </div>

        <div class="col-sm-10">
            <g:submitButton name="save" value="Update" class="btn btn-success"
                            onclick="return confirm('Are you sure???')"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <g:submitButton name="clear" value="Reset" class="btn btn-danger"/>
        </div>
    </form>
</div>
</body>
</html>