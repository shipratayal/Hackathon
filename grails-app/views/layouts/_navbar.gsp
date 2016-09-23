<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink(uri: '/')}">Shoopers</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${createLink(uri: '/')}">Home</a></li>
                <li><a href="${createLink(uri: '/store')}">The Store</a></li>
                <li><a href="${createLink(uri: '/support')}">Support</a></li>

                <li><a href="${createLink(uri: '/contact')}">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:ifLoggedIn>
                        <a href="${createLink(controller: 'logout')}"><span class="glyphicon glyphicon-log-out">Logout</span></a>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        %{--<a href="${createLink(controller: 'login', action: 'auth')}"></a>--}%
                        <a href="javascript:void(0)" id="myBtn"><span class="glyphicon glyphicon-log-in"></span>My Account</a>
                    </sec:ifNotLoggedIn>
                </li>
            </ul>
        </div>
    </div>
</nav>
<g:render template="/layouts/loginModal"/>
<script>
    $(document).ready(function(){
        $("#myBtn").click(function(){
            $("#myModal").modal();
        });
    });
</script>
