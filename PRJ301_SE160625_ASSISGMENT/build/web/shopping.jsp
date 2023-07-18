<%-- 
    Document   : shopping
    Created on : Jun 17, 2023, 4:04:23 PM
    Author     : HoangNQ
--%>

<%@page import="java.util.List"%>
<%@page import="sample.shopping.Comestic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comestics Store</title>
    </head>     <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;

                margin: 0;
                padding: 0;
            }

            h1,h3 {
                
                text-align: center;
                margin-top: 30px;
                color:  #1877f2;

            }

            form {
                max-width: 400px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }

            select, input[type="submit"] {
                padding: 5px;
                width: 100%;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            input[type="submit"] {
                margin-top: 10px;
                background-color:  #1877f2;

                color: #fff;
                cursor: pointer;
            }
        </style>
    <body>
   
        <h1> Comestics Store</h1>
        <%
            List<Comestic> ListProduct = (List<Comestic>) session.getAttribute("LIST_PRODUCT");
        %>
        <form action="MainController" method="POST">
            <select name="cmbComestics">
                <%
                    for (Comestic co : ListProduct) {
                %>
                <%
                    String tmp = co.getId() + "-" + co.getName().replaceAll("\\s", "") + "-" + co.getPrice();
                    String tmp1 = co.getName() + "-" + co.getPrice() + "$";
                %>
                <option value=<%=tmp%>><%=tmp1%></option>
                <%
                    }
                %>
            </select>
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="View"/>
        </form>
        <br/>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <h3> <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
        </h3>
    </body>
</html>
