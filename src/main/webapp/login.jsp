<html>

<head>
    <title>YanYuanOrder-Login</title>
</head>

<body>
    <form action="http://localhost:8080/login/login.order" method="post">
        <input type="text" name="username" placeholder="请输入用户名">
        <br>
        <input type="text" name="password" placeholder="请输入密码">
        <br>
        <input type="code" name = "code" placeholder="请输入验证码">
        <img src="/login/code.order"/>
        <br>
        <input type="submit" value="登录">
        <input type="reset" value="重置">

    </form>
</body>
</html>