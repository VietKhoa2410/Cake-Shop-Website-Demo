<%--
    Document   : login_error
    Created on : Oct 20, 2020, 7:55:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
        <style>
            <%@include file="css/css_error.css" %>
        </style>
    </head>
    <body>
        <div id="error_login">
            <h1>Can not login to to account</h1>
            <h2>If your account really exist, please check user name and password again</h2>
            <a href="loginPage">Try to login again</a>
        </div>
    </body>
</html>
