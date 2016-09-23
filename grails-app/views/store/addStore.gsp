<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin"/>
</head>

<body>
<g:if test="${storeCO.hasErrors()}">
    <div class="tb1">
        <div style="color: #ff0000">
            <g:hasErrors bean="${storeCO}">
                <g:renderErrors bean="${storeCO}"/>
            </g:hasErrors>
        </div>
    </div>
</g:if>
<div class="col-md-10">
    <form action="${createLink(controller: 'store', action: 'saveStore')}" method="post" class="form-horizontal"
          role="form">

        <div class="form-group">
            <label class="control-label col-sm-2" for="storeName">
                Store Name:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeName" id="storeName" value="${storeCO?.name}" class="form-control"
                             placeholder="Enter Store Name"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="storeOwner">
                Store Owner:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeOwner" value="${storeCO?.owner}" class="form-control"
                             placeholder="Enter Store Owner"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="address1">
                Store Address1:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeAdd1" id="address1" value="${storeCO?.address1}" class="form-control"
                             placeholder="Address Line 1"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="address2">
                Store Address2:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeAdd2" id="address2" value="${storeCO?.address2}" class="form-control"
                             placeholder="Address Line 2"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="state">
                State:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeState" id="state" value="${storeCO?.state}" class="form-control"
                             placeholder="State"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="state">
                City:
            </label>

            <div class="col-sm-10">
                <g:textField name="storeCity" value="${storeCO?.city}" class="form-control"
                             placeholder="City"/>
            </div>
        </div>

        <div class="col-sm-10">
            <g:submitButton name="save" value="Submit" class="btn btn-primary btn-sm"
                            onclick="return confirm('Are you sure???')"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button value="Reset" type="reset" class="btn btn-danger btn-sm">Reset</button>
        </div>
    </form>
</div>
</body>
</html>