%{--<div id="slider" class="box">--}%
%{--<div id="slider-holder">--}%
%{--<ul>--}%
%{--<li><a href="#"><img src="${resource(dir: 'images',file: 'slide1.jpg')}" alt=""/></a> </li>--}%
%{--<li><a href="#"><img src="${resource(dir: 'images',file: 'slide1.jpg')}" alt=""/></a> </li>--}%
%{--<li><a href="#"><img src="${resource(dir: 'images',file: 'slide1.jpg')}" alt=""/></a> </li>--}%
%{--<li><a href="#"><img src="${resource(dir: 'images',file: 'slide1.jpg')}" alt=""/></a> </li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--<div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>--}%
%{--</div>--}%

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${resource(dir: 'images', file: 'slide1.jpg')}" alt="Chania">
        </div>

        <div class="item">
            <img src="${resource(dir: 'images', file: 'slide1.jpg')}" alt="Chania">
        </div>

        <div class="item">
            <img src="${resource(dir: 'images', file: 'slide1.jpg')}" alt="Chania">
        </div>

        <div class="item">
            <img src="${resource(dir: 'images', file: 'slide1.jpg')}" alt="Chania">
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<style>
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
    width: 70%;
    margin: auto;
}
</style>