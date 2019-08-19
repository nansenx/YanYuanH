<%--
  Created by IntelliJ IDEA.
  User: Beam
  Date: 2019/8/17
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Upload Succeed</title>
    </head>
    <body>
        <h3 style="color: rebeccapurple;">上传成功！</h3>
        <h5>Upload Succeed!</h5><br>
        <h6 style="color: yellowgreen">文件名称：${imageName}</h6>
        <h6 style="color: yellowgreen">文件地址：${imagePath}</h6>
        <h6 style="color: yellowgreen">文件备注：${imageRemark}</h6>
        <a href="${imagePath}">ImagePath</a>
        <hr>
        <img src="${imagePath}">
    </body>
</html>
