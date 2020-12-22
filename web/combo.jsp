<%--
    Document   : combo
    Created on : Nov 6, 2020, 5:18:13 PM
    Author     : ASUS
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Combo"%>
<%@page import="model.ComboDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Combo</title>
        <link rel="stylesheet" href="css/css_combo.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="combo-container">
            <div id="combo-content">
                <%                    ComboDAO cbdao = new ComboDAO();

                    Combo cb = cbdao.getCombo(request.getParameter("id"));

                    out.print("<img src=\"" + cb.getImage() + "\">");
                    out.print("<h3>" + cb.getName() + "</h3>");
                    out.print("<p>" + cb.getDescription() + "</p>");
                    out.print("<p>Giá tiền: " + cb.getPrice() + "</p>");
                    int total = cbdao.getTotalProductPrice(request.getParameter("id"));
                    int percen = (int) (total / (float) cb.getPrice() * 100);
                    out.print("<p class=\"percen\">Chỉ " + percen + "% giá gốc</p>");
                %>
            </div>

            <div id="combo-item">
                <h1>Các sản phẩm bao gồm</h1>
                <%                    ArrayList<Product> pAl = cbdao.getProduct(request.getParameter("id"));
                    for (Product pr : pAl) {
                        out.print("<div class=\"product\">");
                        out.print("<a href=\"item?id=" + pr.getId() + "\"><img src=\"" + pr.getImage() + "\"></a>");
                        out.print("<h3>" + pr.getName() + "</h3>");
                        String[] line = pr.getDescription().split("//n");
                        for (String temp : line) {
                            System.out.println("line: " + temp);
                            out.print("<p>" + temp + "." + "</p>");
                        }
                        out.print("<p>Giá tiền: " + pr.getPrice() + "</p>");
                        out.print("</div>");
                    }
                %>
            </div>
        </div>

    </body>
</html>
