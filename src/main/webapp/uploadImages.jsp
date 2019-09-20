<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <title>UpLoadImages</title>
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <title>UploadImages</title>
</head>

<body>
<!DOCTYPE html>
<html>
<head>

</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <title>UploadImages</title>
</head>

<body style="padding: 30px;">
<table>
    <h2 style="color: red">添加菜品：</h2><br>
    <form action="http://49.232.44.19:8080/file/uploadImages.order" method="post" enctype="multipart/form-data">


        <label>请选择要上传菜品的商家: </label>
        <select name="dataBase">
            <option value="publicity">宣传相册</option>
            <option value="budaimo">大嘴布袋馍</option>
            <option value="dapanji">大盘鸡</option>
            <option value="gaijiaofan">特色盖浇饭</option>
        </select>
        <br>
        <br>
        <label>请输入要存入菜品的名字：</label><input type="text" name="foodName"><br><br>
        <label>请输入要存入菜品的分类：</label><input type="text" name="menuClass"><br><br>
        <label>请输入要存入的图片名称：</label><input type="text" name="imgName"><br><br>

        <label>请选择上传菜品的价格: </label>
        <select name="foodPrice">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
        </select>
        <label>  元</label>
        <br>
        <br>
        </option>
        <input type="file" name="file" size="38">
        <input type="submit"  value="提交" size="50">

    </form>
</table>
</body>
</html>