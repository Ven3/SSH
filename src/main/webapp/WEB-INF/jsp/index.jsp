<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <script src="js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <fieldset>
                <legend>Register</legend>
                <form action="/register" method="post">
                    <input type="text" class="form-control input-lg username" id="regname" name="username" placeholder="UsrName">
                    <input type="password" class="form-control input-lg"
                           name="password" placeholder="Password">
                    <button class="btn btn-lg bg-success">Register</button>
                    <button type="reset" class="btn btn-lg bg-danger">Reset</button>
                </form>

            </fieldset>
        </div>
        <div class="col-lg-4" style="margin: auto 0;">

            <fieldset>
                <legend>Login</legend>
                <form action="/login" method="post" id="loginform">
                    <input type="text" class="form-control input-lg username" name="username" placeholder="UsrName">
                    <input type="password" class="form-control input-lg"
                           name="password" placeholder="Password">
                    <button class="btn btn-lg bg-success" id="login">Login</button>
                    <button type="reset" class="btn btn-lg bg-danger">Reset</button>
                    <a class="btn btn-lg bg-danger" href="/logout">Logout</a>
                </form>
            </fieldset>
        </div>

        <div class="col-lg-4">
            <fieldset>
                <legend>Update</legend>
                <form action="/update" method="post">
                    <input type="text" class="form-control input-lg" name="username" placeholder="UserName">
                    <input type="password" class="form-control input-lg"
                           name="password" placeholder="Password">
                    <input type="password" class="form-control input-lg"
                           name="newpassword" placeholder="NewPassword">
                    <button class="btn btn-lg bg-success">Update</button>
                    <button type="reset" class="btn btn-lg bg-danger">Reset</button>
                </form>
            </fieldset>
        </div>
    </div>

    <table class="table">
        <caption class="h1 bg-success">
            <button class="btn btn-lg bg-success" onclick="getAll()">点击获取所有用户</button>
        </caption>
        <thead>
        <tr>
            <th>用户ID</th>
            <th>用户名</th>
            <th>密码</th>
        </tr>
        </thead>
        <tbody id="userdata">

        </tbody>
    </table>
</div>

<script>

//    $(function () {
//        $(".username").change(function(){
//            $.get("/getusername",{username:$("#regname").val()},function (data) {
//                if(data==true){
//                    alert("用户名已存在");
//                }
//            })
//        });
//
//        $("#loginform").submit(function (data) {
//            $.post(function () {
//
//            });
//        });
//    });

    function getAll() {
        $.get("/getusers", function (data) {
            var str = "";
            for (var i = 0; i < data.length; i++) {
                str += "<tr>";
                str += "<td>" + data[i].userid + "</td>";
                str += "<td>" + data[i].username + "</td>";
                str += "<td>" + data[i].password + "</td>";
                str += "</tr>";
            }
            $("#userdata").html(str);
        });
    }
    ;


</script>

</body>
</html>