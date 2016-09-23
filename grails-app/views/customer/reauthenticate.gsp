<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<script>
    $(document).ready(

        function(){
            $("#wrong_span_id").css("color", "red");
            $("#wrong_span_id").html("Please Logged In First");
            $("#myBtn").click()
    });
</script>
<div class="row">
    <div class="col-md-4">
        <div class="img-thumbnail">
            <img src="${resource(dir: 'images',file: 'big1.jpg')}" class="img-responsive" alt="Cinque Terre">
            <div class="col-md-9" style="background-color:rosybrown;">
                <span>Description</span>
                %{--<span>Price</span>:50--}%
                %{--<span>Author</span>:Vijay--}%
                <span>Category</span>:Criminal
            </div>
        </div>
    </div>
    <div class="col-md-4">
        2
    </div>
    <div class="col-md-4">
        3
    </div>
</div>
</body>
</html>