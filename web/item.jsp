<%--
    Document   : item
    Created on : Nov 9, 2020, 8:09:08 AM
    Author     : ASUS
--%>

<%@page import="model.Combo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ComboDAO"%>
<%@page import="model.Product"%>
<%@page import="model.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item</title>
        <link rel="stylesheet" href="css/css_item.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="item-container">
            <%    ProductDAO pdao = new ProductDAO();
                Product p = pdao.getProduct(request.getParameter("id"));
                out.print("<div class=\"product\">");
                out.print("<img src=\"" + p.getImage() + "\">");
                out.print("<h3>" + p.getName() + "</h3>");
                String[] line = p.getDescription().split("//n");
                for (String temp : line) {
                    System.out.println("line: " + temp);
                    out.print("<p>" + temp + "." + "</p>");
                }
                out.print("<p>Giá tiền: " + p.getPrice() + "</p>");
                out.print("</div>");
            %>

            <div id="combo-list">
                <%
                    ComboDAO cbdao = new ComboDAO();
                    ArrayList<Combo> alCb = cbdao.getComboList(request.getParameter("id"));
                    for (Combo cb : alCb) {
                        out.print("<div class=\"item-combo\">");
                        out.print("<a href=\"combo?id=" + cb.getId() + "\"><img src=\"" + cb.getImage() + "\"></a>");
                        out.print("<h3>" + cb.getName() + "</h3>");
                        out.print("<p>" + cb.getDescription() + "</p>");
                        out.print("<p>Giá tiền: " + cb.getPrice() + "</p>");
                        out.print("</div>");
                    }
                %>
            </div>
        </div>
    </body>
</html>
