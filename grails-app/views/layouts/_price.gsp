<div class="panel panel-success">
    <div class="panel-heading">Price</div>

    <div class="panel-body">
        <div class="form-group">
            <div class="col-sm-12">
            <input type="text" id="amount" class="form-control" readonly
                   style="border:0; color:#f6931f; font-weight:bold;">
            <br/>
            <div id="slider-range" class="col-sm-12"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
        $( "#slider-range" ).slider({
            range: true,
            min: 5,
            max: 500,
            values: [ 10, 300 ],
            slide: function( event, ui ) {
                $( "#amount" ).val( "Rs." + ui.values[ 0 ] + " - Rs." + ui.values[ 1 ] );
            }
        });
        $( "#amount" ).val( "Rs." + $( "#slider-range" ).slider( "values", 0 ) +
        " - Rs." + $( "#slider-range" ).slider( "values", 1 ) );
    });
</script>