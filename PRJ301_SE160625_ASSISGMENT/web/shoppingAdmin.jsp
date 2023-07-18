<%-- 
    Document   : shoppingAdmin
    Created on : Jul 1, 2023, 8:38:52 PM
    Author     : HoangNQ
--%>

<%@page import="java.util.List"%>
<%@page import="sample.shopping.Comestic"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Shopping Page</title>
    </head>
    <body>
        <style>

            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #333;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background-color: #f2f2f2;
            }

            input[type="text"] {
                padding: 5px;
                width: 200px;
            }

            input[type="submit"] {
                padding: 5px 10px;
                background-color:  #1877f2;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            a {
                color: #337ab7;
                text-decoration: none;
            }
        </style>
         <h1>ADMIN SHOPPING PAGE </h1> 
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <% int count = 1; %>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController">
            SearchProduct <input type="text" name="search" value="<%= search%>"/>
            <input type="hidden" name="action" value="SearchProduct"/>
            <input type="submit" value="Search"/>
        </form>


        <%
            List<Comestic> list = (List<Comestic>) request.getAttribute("LIST_PRODUCT");
            if (list != null) {
                if (list.size() > 0) {
        %>   
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Product Quantity</th>

                </tr>
            </thead>
            <tbody>

                <%
                    for (Comestic product : list) {
                %>
            <form action="MainController">

                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getId()%></td>
                    <td>
                        <input type="text" name="productName" value="<%=product.getName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="productPrice" value="<%=product.getPrice()%>" required=""/>
                    </td>
                    <td> 
                        <input type="text" name="productQuantity" value="<%= product.getQuantity()%>"/>
                    </td>
                    <!--update here-->
                    <td>
                        <input type="hidden" name="productID" value="<%=product.getId()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/>
                        <input type="hidden" name="action" value="UpdateProduct"/>
                        <input type="submit" value="Update"/>     


                    </td>

                    <!-- delete here-->
                    <td>
                        <a href="MainController?search=<%=search%>&action=DeleteProduct&productID=<%= product.getId()%>">Delete</a>
                    </td>

                </tr>
            </form>
            <%
                }
            %>
            <tbody/>
            <table/>
            <%
                    }
                }
            %>
            <%
                String ERRORSEARCH = (String) request.getAttribute("ERROR_SEARCH");
                if (ERRORSEARCH == null) {
                    ERRORSEARCH = "";
                }
            %>
            <%=ERRORSEARCH%>
            <br/>
            <br/>
            <br/>
            ADD PRODUCT 
            <br/>
            <br/>
            <form action="MainController">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Product Price</th>
                            <th>Product Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" name="productID" required=""/>
                            </td>    

                            <td>
                                <input type="text" name="productName" required=""/>
                            </td>
                            <td>
                                <input type="text" name="productPrice" pattern="[0-9]+" title="please enter number here" required=""/>
                            </td>
                            <td> 
                                <input type="text" name="productQuantity" pattern="[0-9]+" title="please enter number here" required="" />
                            </td>
                            <td>
                                <input type="submit" name="action" value="AddProduct"/>
                                <input type="hidden" name="search" value="<%=search%>"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <br/>
            <%
                String ERRORADD = (String) request.getAttribute("ERROR_ADD");
                if (ERRORADD == null) {
                    ERRORADD = "";
                }
            %>
            <%=ERRORADD%>

    </body>
</html>
