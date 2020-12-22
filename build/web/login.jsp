<%--
    Document   : login
    Created on : Oct 19, 2020, 11:54:29 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            <%@include file="css/css_base.css" %>
            <%@include file="css/css_login.css" %>
        </style>
    </head


    <body>
        <%@include file="header.jsp"%>
        <div id="loginpage">
            <div id="background">
            </div>
            <div id="loginform">
                <form action="login" method="post">
                    <h1>Login Account</h1>
                    <div class="input-container">
                        <input name="account" id="account" type="text" required="" autocomplete="off">
                        <label>Account</label>
                    </div>
                    <div class="input-container">
                        <input name="pass" id="pass" type="password" required="">
                        <label>Password</label>
                    </div>
                    <div class="submit-container">
                        <input type="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>
        function warning() {
            alert("Wrong account/password");
        }
    </script>
</html>
