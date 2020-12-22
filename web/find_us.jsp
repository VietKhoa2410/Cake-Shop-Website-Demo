<%--
    Document   : find_us
    Created on : Oct 21, 2020, 10:56:15 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find us</title>
    </head>
    <body>


        <%@include file="header.jsp" %>
        <div id="find-us">
            <div id="find-us-title">
                <h1>Find Us</h1>
            </div>
            <div id="content">

                <div id="address-contact">
                    <h1>Address and contact:</h1>
                    <p>The Sushi restaurant</p>
                    <p>FPT City, Ngu Hanh Son, Da Nang</p>
                    <a href="mailto:vietkhoa2410@gmail.com"><i class="icon-envelope-alt">vietkhoa2410@gmail.com</i></a><br/>
                    <a href="tel:0862102734"><i class="icon-phone">0862102734</i></a><br/>
                    <a href="https://www.facebook.com/profile.php?id=100009186848301"><i class="icon-facebook-sign">Do Viet Khoa</i></a><br/>
                </div>
                <div id="calendar">
                    <h1>Opening hours:</h1>
                    <ul>
                        <li>Monday, 7:00 am - 6:00 pm</li>
                        <li>Tuesday, 7:00 am - 6:00 pm</li>
                        <li>Wednesday, 7:00 am - 6:00 pm</li>
                        <li>Thursday, 7:00 am - 6:00 pm</li>
                        <li>Friday, 7:00 am - 6:00 pm</li>
                        <li>Saturday, 7:00 am - 12:00 am</li>

                    </ul>
                </div>
            </div>
            <div id="map">
                <div class="mapouter">
                    <div class="gmap_canvas">
                        <iframe width="700" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=%C4%90%E1%BA%A1i%20h%E1%BB%8Dc%20FPT%20%C4%90%C3%A0%20N%E1%BA%B5ng&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                        <a href="https://www.embedgooglemap.net"></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
