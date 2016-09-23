%{--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--}%
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

    <!-- start Mixpanel --><script type="text/javascript">(function (e, a) {
    if (!a.__SV) {
        var b = window;
        try {
            var c, l, i, j = b.location, g = j.hash;
            c = function (a, b) {
                return (l = a.match(RegExp(b + "=([^&]*)"))) ? l[1] : null
            };
            g && c(g, "state") && (i = JSON.parse(decodeURIComponent(c(g, "state"))), "mpeditor" === i.action && (b.sessionStorage.setItem("_mpcehash", g), history.replaceState(i.desiredHash || "", e.title, j.pathname + j.search)))
        } catch (m) {
        }
        var k, h;
        window.mixpanel = a;
        a._i = [];
        a.init = function (b, c, f) {
            function e(b, a) {
                var c = a.split(".");
                2 == c.length && (b = b[c[0]], a = c[1]);
                b[a] = function () {
                    b.push([a].concat(Array.prototype.slice.call(arguments,
                            0)))
                }
            }

            var d = a;
            "undefined" !== typeof f ? d = a[f] = [] : f = "mixpanel";
            d.people = d.people || [];
            d.toString = function (b) {
                var a = "mixpanel";
                "mixpanel" !== f && (a += "." + f);
                b || (a += " (stub)");
                return a
            };
            d.people.toString = function () {
                return d.toString(1) + ".people (stub)"
            };
            k = "disable time_event track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config reset people.set people.set_once people.increment people.append people.union people.track_charge people.clear_charges people.delete_user".split(" ");
            for (h = 0; h < k.length; h++)e(d, k[h]);
            a._i.push([b, c, f])
        };
        a.__SV = 1.2;
        b = e.createElement("script");
        b.type = "text/javascript";
        b.async = !0;
        b.src = "undefined" !== typeof MIXPANEL_CUSTOM_LIB_URL ? MIXPANEL_CUSTOM_LIB_URL : "file:" === e.location.protocol && "//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//) ? "https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js" : "//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";
        c = e.getElementsByTagName("script")[0];
        c.parentNode.insertBefore(b, c)
    }
})(document, window.mixpanel || []);
mixpanel.init("5699ec9fbf8b453b85ae21f2819f6d0d");</script><!-- end Mixpanel -->

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
    $(document).ready(function () {
        $('#example').DataTable();
    });

    mixpanel.track_links("#store", "link event", {
        id: "storeAll",
        "userId": "${user?.id}",
        "email": "${user?.username}"
    });
</script>
</body>
</html>