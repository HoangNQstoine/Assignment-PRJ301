<%-- 
    Document   : viewCart
    Created on : Jun 17, 2023, 4:25:25 PM
    Author     : HoangNQ
--%>


<%@page import="sample.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.Comestic"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color:  #1877f2;

        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }



        input[type="text"],
        input[type="number"] {
            padding: 5px;
            width: 95%;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        a {
            padding: 5px 10px;
            background-color:  #1877f2;
            justify-content: center;
            color: #fff;
            border: none;
            text-decoration: none;
            cursor: pointer;
            font-size: 20px;
        }



        form {
            display: inline-block;
            margin-bottom: 10px;
        }

        form:last-child {
            margin-bottom: 0;
        }

        .total {
            text-align: right;
            margin-bottom: 20px;
        }
    </style>
   <body>
        <%
            List<Comestic> ListProduct = (List<Comestic>) session.getAttribute("LIST_PRODUCT");
            double total = 0;
        %>
        <h1>List product in stocks </h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ProductID</th>
                    <th>ProductName</th>
                    <th>ProductPrice</th>
                    <th>ProductQuantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int num = 1;
                    for (Comestic co : ListProduct) {
                %>
                <tr>
                    <td><%=num++%></td>
                    <td><%=co.getId()%></td>
                    <td><%=co.getName()%></td>
                    <td><%=co.getPrice()%></td>
                    <td><%=co.getQuantity()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <br/>
        <h1>Your selected product</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>                   
                    <th>Edit</th>
                    <th>Remove</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%  int count = 1;
                    for (Comestic elem : cart.getCart().values()) {
                        total += elem.getQuantity() * elem.getPrice();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td> <%= count++%></td>
                    <td> <input type="text" name="id" value="<%= elem.getId()%>" readonly=" "</td>                    
                    <td><%= elem.getName()%> </td>
                    <td><%= elem.getPrice()%>
                    </td>
                    <%  int maxQuantity = 0;
                        for (Comestic co : ListProduct) {
                            if (elem.getId().equals(co.getId())) {
                                maxQuantity = co.getQuantity();
                            }
                        }
                    %>
                    <td> <input type="number" name="quantity"  min="1" max="<%=maxQuantity%>" value="<%= elem.getQuantity()%>" required=""</td>
                    <!--edit here-->
                    <td> <input type="submit" name="action" value="Edit" </td>
                    <!--remove here-->
                    <td> <input type="submit" name="action" value="Remove" </td>
                    <td><%= elem.getPrice() * elem.getQuantity()%>$</td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
            }
        }
    %>
    <h1>Total : <%= total%>$</h1>
    <a href="shopping.jsp">Add more </a>
    <br/>
    <br/>
    <%
        //CheckOut here
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        String UserID = user.getUserID();
    %>
    <form action="MainController">
        <input type="submit" name="action" value="Checkout"/>
        <input type="hidden" name="total" value="<%=total%>"/>
        <input type="hidden" name="userID" value="<%=UserID%>"/>
        <%
            String MESSAGE = (String) request.getAttribute("MESSAGE");
            if (MESSAGE == null) {
                MESSAGE = "";
            }
        %>
        <%=MESSAGE%>
    </form>

</body>
</html>


