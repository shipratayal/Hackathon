<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin View</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<div>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script>
            $( function() {
                $( "#datepicker" ).datepicker();
                $( "#datepickeTo" ).datepicker();

            } );
            $(".datepicker").click(function(){
                $( ".datepicker").hide()
            })
        </script>

        <div class="row">
            <g:form controller="mixPanel" action="fetchRecord"  name="fetchEvents" method="post"     >
                <div class="col-md-3">
                    <p>From: <input type="text" id="datepicker" name="fromDate" required="required" placeholder="Date"></p></div>
                <div class="col-md-3"><p>To : <input type="text" id="datepickeTo" name="toDate" required="required" placeholder="Date"></p></div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-cubes"></i></span>
                        <select name="event" class="form-control" id="accountType" required="required">
                            <option value="">Select Event</option>
                            <option value="page event">Page View</option>
                            <option value="button event">Button Click</option>
                            <option value="link event">Link Click</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <input type="submit" class="btn btn-primary btn-block" value="Submit"/>    </div>
            </g:form>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h2>Event Details</h2>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Event Type</th>
                        <th>Event Id</th>
                        <th>User Id</th>
                        <th>User Email</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventList}" var="dataList" status="i">
                        <tr>
                            <td>${dataList?.eventType}</td>
                            <td>${dataList?.eventId}</td>
                            <td>${dataList?.userId}</td>
                            <td>${dataList?.userEmailId}</td>
                        </tr>
                    </g:each>

                    </tbody>
                </table>

            </div>
        </div><!--/.row-->

        <div class="row">
            <div class="col-md-12">
                <h2>User Details</h2>
                <table class="table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Last Seen</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userList}" var="data" status="i">
                        <tr class="success">
                            <td>${data.id}</td>
                            <td>${data.$properties.$first_name}</td>
                            <td>${data.$properties.$last_name}</td>
                            <td>${data.$properties.$email}</td>
                            <td>${data.$properties.$last_seen}</td>
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </div>
        </div><!--/.row-->
    </div>

</div>
<script>

</script>
</body>
</html>