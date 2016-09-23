<div class="col-sm-12">
    <div class="well">
        <div id="myCarousel1" class="carousel slide" data-ride="carousel">

            <ol class="carousel-indicators">
                <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel1" data-slide-to="1"></li>
                <li data-target="#myCarousel1" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="row-fluid">
                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small1.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small2.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small3.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small4.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small5.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small6.jpg')}" alt="Image"/>
                            </a>
                        </div>
                    </div><!--/row-fluid-->
                </div><!--/item-->

                <div class="item">
                    <div class="row-fluid">
                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small7.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small1.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small2.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small3.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small4.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small5.jpg')}" alt="Image"/>
                            </a>
                        </div>
                    </div><!--/row-fluid-->
                </div><!--/item-->

                <div class="item">
                    <div class="row-fluid">
                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small6.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small7.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small1.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small2.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small3.jpg')}" alt="Image"/>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="#x" class="thumbnail">
                                <img src="${resource(dir: 'images', file: 'small4.jpg')}" alt="Image"/>
                            </a>
                        </div>
                    </div><!--/row-fluid-->
                </div><!--/item-->

            </div><!--/carousel-inner-->

            <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div><!--/myCarousel-->
    </div><!--/well-->
</div>
<script>
    $(document).ready(function () {
        $('#myCarousel1').carousel({
            interval: 10000
        })
    });
</script>