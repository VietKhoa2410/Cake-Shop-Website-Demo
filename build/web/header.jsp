<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    <%@include file="css/css_base.css" %>
    <%@include file="/css/css_header.css" %>
    <%@include file="/css/font-awesome.css" %>
    <%@include file="css/css_home.css" %>
    <%@include file="css/css_find_us.css"%>
    <%@include file="css/css_background.css" %>
    <%@include file="css/css_combo.css" %>
    <%--<%@include file="css/css_myCake.css" %>--%>
</style>
<meta property="og:url"           content="http://localhost:8080/Cake/homePage" />
<meta property="og:type"          content="Hey" />
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Hello" />
<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<a href="https://icons8.com/icon/7703/cancel" style="display: none;"></a>

<script src="https://kit.fontawesome.com/1c44e4d82c.js" crossorigin="anonymous"></script>

<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="rKUSiXot"></script>

<div id="header">
    <input type="checkbox" id="check">
    <label for="check">
        <img src="https://img.icons8.com/ios/50/000000/menu.png" id="menu" />
        <img src="https://img.icons8.com/ios-filled/50/000000/cancel.png" id="cancel"/>

    </label>

    <div id="header-container">
        <div id="manager">
            <%
                System.out.println("User: " + session.getAttribute("user"));;
                if (session.getAttribute("user") != null) {
                    out.print("<a href=\"managerPage\">Manager</a>");
                }
            %>
        </div>
        <ul id="nav">
            <li><a href="homePage">Home</a></li>
            <li><a href="myCakePage">About my cake</a></li>
            <li><a href="findUsPage">Find us</a></li>
            <li><a href="loginPage">Login</a></li>
        </ul>
        <div id="sharing">
            <p>Share for your friend</p>
            <div class="fb-share-button" data-href="http://www.localhost:8080"  data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.localhost%3A8080%2FCake%2FhomePage&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
        </div>
        <div id="logout">
            <%
                System.out.println("User: " + session.getAttribute("user"));;
                if (session.getAttribute("user") != null) {
                    out.print("<a href=\"logout\">Log out</a>");
                }
            %>
        </div>
        <div id="viewCount">
            <%
                out.print("<p>View count: " + session.getAttribute("view") + "</p>");
            %>
        </div>

    </div>



</div>
