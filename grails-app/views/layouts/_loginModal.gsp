<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
            </div>
            <div class="modal-body">
                <g:if test='${flash.message}'>
                    <div style="color: #cc3333" class='login_message'>${flash.message}</div>
                </g:if>
                <span id="wrong_span_id"></span>
                <form id='ajaxLoginForm' class='cssform' autocomplete='off'>
                    <div class="form-group">
                        <label for="j_username"><span class="glyphicon glyphicon-user"></span><g:message code="springSecurity.login.username.label"/></label>
                        <input type="text" autofocus="autofocus" required class="form-control" id="j_username" placeholder="Enter email" name='j_username'>
                    </div>
                    <div class="form-group">
                        <label for="j_password"><span class="glyphicon glyphicon-eye-open"></span><g:message code="springSecurity.login.password.label"/></label>
                        <input type="password" class="form-control" required id="j_password" placeholder="Enter password" name='j_password'>
                    </div>
                    <div class="checkbox">
                        <label for='remember_me'><input type="checkbox" name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>><g:message code="springSecurity.login.remember.me.label"/></label>
                    </div>
                    <input type='button' id="submit" class="btn btn-default btn-success btn-block" value="${message(code: "springSecurity.login.button")}" onclick="loginByAjax()"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                <p>Not a member? <a href="#">Sign Up</a></p>
                <p>Forgot <a href="#">Password?</a></p>
            </div>
        </div>
    </div>
</div>
<style>
.modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
}
.modal-footer {
    background-color: #f9f9f9;
}
</style>
<script>
    function loginByAjax() {

        var url = "${request.contextPath}/j_spring_security_check";
        $.ajax({
            url: url,
            datatype: 'json',
            type: 'POST',
            data: {
                j_username: $("#j_username").val(),
                j_password: $("#j_password").val()
            },
            success: function (response) {
                if (response.success) {
                    location.reload();
                    %{--location.href="${request.contextPath}--}%
                }
                else {
                    emptyForm();
                    $("#wrong_span_id").css("color", "red");
                    $("#wrong_span_id").html("Wrong username or password");
                }
            },
            error: function (data) {
                alert("got you " + data);
                emptyForm();
            }
        });
    }
    $("#loginForm").validate({
        rules: {},
        messages: {
            j_username: {
                required: "Please enter username"
            },
            j_password: {
                required: "Please enter password"
            }
        }
    });
    function emptyForm() {
//        $('#j_username').val('');
        $('#j_password').val('');
        $('#remember_me').val('');
    }
</script>
