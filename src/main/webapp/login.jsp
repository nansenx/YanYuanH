<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>YanYuanOrder-Login</title>
</head>

<body >
<style type="text/css">
    body{background:#f9f9f9;}
    .login{
        width:598px;height:230px;
        margin:40px auto;
        padding-top:30px;
        background:#EEE;
        border:1px #ccc solid;
        border-top:0;
    }
    .login .table{width:500px;margin:50px auto;}
    .login .table td{border:0;}
    .login .table label{font-size:16px;}


</style>
<script>

    var u = cookie.get('remember-username');
    if($.trim(u)) {
        $('#remember')[0].checked = true;
        $(':text[name="username"]').val($.trim(u));
    }
    function formcheck() {
        if($('#remember:checked').length == 1) {
            cookie.set('remember-username', $(':text[name="username"]').val());
        } else {
            cookie.del('remember-username');
        }
        return true;
    }
</script>
<div align="center">
    <img style="width: 200px; align-self: center;" src="http://49.232.44.19:8080/images/uploadFiles/AWSL.jpeg" />
</div>
<form action="${pageContext.request.contextPath}/weChat/findAdmin.order" method="post" target="_top" onsubmit="return formcheck();">
    <div class="login" id="myLogin">
        <table class="table">
            <tr>
                <td style="width:120px;"><label>用户名：</label></td>
                <td><input id="username" type="text" class="span4" autocomplete="off" name="username"></td>
            </tr>
            <tr>
                <td><label>密码：</label></td>
                <td><input id="password" type="password" class="span4" autocomplete="off" name="password"></td>
            </tr>
            <tr>
                <td></td>
                <td><label for="remember" class="checkbox inline"><input type="checkbox" value="1" id="remember" checked> 记住账号</label>   </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"
                           name="submit" class="btn span2" value="登录"/><input type="hidden" name="token" value="33b4efe4" /></td>
            </tr>
        </table>
    </div>
</form>

</body>

</html>
