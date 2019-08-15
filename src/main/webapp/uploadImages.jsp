<!DOCTYPE html>
<html>
<head>
    <script language="JavaScript">
        var password = "#include";
        password = prompt('请输入管理员密码');
        if(password != "admin123"){
            alert("密码不正确，无法进入本站！！");
            window.opener = null;
            window.close();
        }
    </script>
    <meta charset="utf-8">
    <title></title>
</head>

<body>
    <h2>点击上传图片：</h2>
        <formaction = "UploadServlet.do" method = "post">

</body>
网站：https://www.jb51.net/article/107000.htm
</html>
