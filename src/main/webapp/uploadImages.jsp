<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>UpLoadImages</title>
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--
    密码保护
    <script language="JavaScript">
        var password = "#include";
        password = prompt('请输入管理员密码');
        if(password != "admin123"){
            alert("密码不正确，无法进入本站！！");
            window.opener = null;
            window.close();
        }
    </script>
    --%>
    <meta charset="utf-8">
    <title>UploadImages</title>
</head>

<body>
    <table>
        <h2 style="color: red">上传图片：</h2><br>
        <form action = "/file/uploadImages.order" method="post" enctype="multipart/form-data">


            <label>请输入要存入的图片名称：</label><input type="text" name="imgName"><br>
            <label>请输入要存入的图片备注：</label><input type="text" name="imgRemark"><br>
            <input type="file" name = "file">
            <input type="submit" value="提交">
        </form>
    </table>
</body>
</html>
