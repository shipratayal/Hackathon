<%@ page import="com.Publication" %>
<div class="panel panel-primary">
    <div class="panel-heading">Publication</div>

    <div class="panel-body">
        <ul id="tree1">
            <g:each in="${Publication.list()}" var="publication">
                <li>
                   <a href="#">${publication.name}</a>
                    <ul>
                        <g:each in="${publication.books}" var="book">
                            <li>
                                <a href="#">${book.title}</a>
                            </li>
                        </g:each>
                    </ul>
                </li>
            </g:each>
        </ul>
    </div>
</div>
<script>
    $.fn.extend({
        treed: function (o) {

            var openedClass = 'glyphicon-minus-sign';
            var closedClass = 'glyphicon-plus-sign';

            if (typeof o != 'undefined') {
                if (typeof o.openedClass != 'undefined') {
                    openedClass = o.openedClass;
                }
                if (typeof o.closedClass != 'undefined') {
                    closedClass = o.closedClass;
                }
            };

            //initialize each of the top levels
            var tree = $(this);
            tree.addClass("tree");
            tree.find('li').has("ul").each(function () {
                var branch = $(this); //li with children ul
                branch.prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
                branch.addClass('branch');
                branch.on('click', function (e) {
                    if (this == e.target) {
                        var icon = $(this).children('i:first');
                        icon.toggleClass(openedClass + " " + closedClass);
                        $(this).children().children().toggle();
                    }
                });
                branch.children().children().toggle();
            });
            //fire event from the dynamically added icon
            tree.find('.branch .indicator').each(function () {
                $(this).on('click', function () {
                    $(this).closest('li').click();
                });
            });
            //fire event to open branch if the li contains an anchor instead of text
            tree.find('.branch>a').each(function () {
                $(this).on('click', function (e) {
                    $(this).closest('li').click();
                    e.preventDefault();
                });
            });
            //fire event to open branch if the li contains a button instead of text
            tree.find('.branch>button').each(function () {
                $(this).on('click', function (e) {
                    $(this).closest('li').click();
                    e.preventDefault();
                });
            });
        }
    });

    $('#tree1').treed({openedClass: 'glyphicon-chevron-right', closedClass: 'glyphicon-chevron-down'});

</script>
<style>
ul{
    list-style-type: none;
}
</style>
