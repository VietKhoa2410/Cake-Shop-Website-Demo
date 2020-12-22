<%--
    Document   : my-cake
    Created on : Nov 3, 2020, 5:06:01 PM
    Author     : ASUS
--%>

<%@page import="model.Combo"%>
<%@page import="model.ComboDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About my cake</title>
        <link rel="stylesheet" href="css/css_my_cake.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="my-cake-container">
            <div id="item-list">
                <h1>List item</h1>
                <div class="container">
                    <div class="carousel" id="carousel">

                        <%                            ProductDAO pdao = new ProductDAO();
                            ArrayList<Product> pAl = pdao.getAll();
                            boolean showable = true;
                            char item = 'a';
                            for (Product product : pAl) {
                                out.print("<div class=\"item " + item);
                                if (showable) {
                                    out.print(" showable");
                                    showable = false;
                                }
                                out.print("\" onclick=\"activate(this)\">");
                                out.print("<div class=\"item-data\">");
                                out.print("<div class=\"cover\"></div>");
                                out.print("<div class=\"info\">");
                                String[] line = product.getDescription().split("//n");
                                for (String temp : line) {
                                    System.out.println("line: " + temp);
                                    out.print("<p>" + temp + "." + "</p>");
                                }
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                item += 1;
                            }

                        %>

                    </div>
                </div>
                <div class="next" onclick="rotate(-72)">Next</div>
                <div class="prev" onclick="rotate(72)">Prev</div>

            </div>
            <div id="item-contain">
                <h1>Sản phẩm</h1>
                <%    for (Product pr : pAl) {
                        out.print("<div class=\"itemShow\">");
                        out.print("<a href=\"item?id=" + pr.getId() + "\"><img src=\"" + pr.getImage() + "\"></a>");
                        out.print("<h1>" + pr.getName() + "</h1>");
                        out.print("<p>Giá tiền: " + pr.getPrice() + "</p>");
                        out.print("</div>");
                    }
                %>
            </div>

            <div id="combo">
                <h1>Combo</h1>
                <%                    ComboDAO cbdao = new ComboDAO();
                    ArrayList<Combo> cbAl = cbdao.getAll();
                    int i = 1;
                    for (Combo cb : cbAl) {
                        out.print("<a href=\"combo?id=" + cb.getId() + "\"><div class=\"card card" + i + "\">");
                        out.print("<img src=\"" + cb.getImage() + "\">");
                        out.print("<h3>" + cb.getName() + "</h3>");
                        out.print("<p>" + cb.getDescription() + "</p>");
                        out.print("<p>Giá tiền: " + cb.getPrice() + "</p>");
//                        out.print("<form action=\"combo\" method=\"get\">");
//                        out.print("<input type=\"hidden\" name=\"id\" value=\"" + cb.getId() + "\">");
//                        out.print("<input type=\"submit\" class=\"submit\" value=\"See more\">");
//                        out.print("</form>");
                        out.print("</div></a>");
                        i++;
                    }
                %>


            </div>


        </div>
        <script>
            setInterval(function () {
                rotate(-72);
                clearInterval();
//                alert("hello world");
            }, 3000);
        </script>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/myCake.js"></script>
</html>
