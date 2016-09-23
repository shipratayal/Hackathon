<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${createLink(uri: '/admin')}">Shoopers</a>
        </div>

        <div>
            <ul class="nav navbar-nav">
                <li><a href="${createLink(controller: 'store', action: 'allStore')}">All Store</a></li>
                <li><a href="${createLink(controller: 'book', action: 'allBook')}">All Book</a></li>
                <li><a href="${createLink(controller: 'author', action: 'allAuthor')}">All Author</a></li>
                <li><a href="${createLink(controller: 'publication', action: 'allPublication')}">All Publication</a>
                </li>
                <li><a href="${createLink(controller: 'category', action: 'allCategory')}">All Category</a></li>
                <li><a href="${createLink(controller: 'category', action: 'allSubCategory')}">All SubCategory</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${createLink(uri: '/admin')}"><span
                        class="glyphicon glyphicon-user"></span><sec:loggedInUserInfo field="username"/></a></li>
                <li>
                    <sec:ifLoggedIn>
                        <a href="${createLink(controller: 'logout')}"><span class="glyphicon glyphicon-log-out">Logout</a>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <a href="${createLink(controller: 'login', action: 'auth')}"><span class="glyphicon glyphicon-log-in"></span>My Account</a>
                    </sec:ifNotLoggedIn>
                </li>
            </ul>
        </div>
    </div>
</nav>
