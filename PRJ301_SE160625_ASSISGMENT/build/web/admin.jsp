<%--
    Document   : admin
    Created on : May 31, 2023, 2:27:58 PM
    Author     : HoangNQ
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Page</title>
    </head>
    <body>
        <style>

            body {
                font-family: Arial, sans-serif;
                justify-content: center;
                margin-left: 50px;
                background-color: #f5f5f5;

            }
            table {
                margin:50px 0;
                border-collapse: collapse;
                width: 60%;
            }
            th {
                background-color: background;
                padding: 8px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                background-color: #1877f2;
            }
            h1{
                color: #1877f2;

            }
            td {
                padding: 8px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                font-weight: bold;
                font-size: 16px; 
            }
            .text {
                display: none;
                background-color: #f5f5f5;

            }
            tr td input[type="text"],
            tr td a {
                border: none;
                outline: none;
                background-color: #f5f5f5;

            }
            input[type="submit"] {
                padding: 5px 10px;
                background-color:  #1877f2;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            form {
                display: flex;
                color: #1877f2;

                margin-top: 20px;
                margin-bottom: 20px;
            }

            form input[type="text"] {
                width: 200px; /* Adjust the width as needed */
                padding: 5px;

            }
        </style>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <a href="MainController?action=ShoppingPageAdmin">Management Store</a><br/>

        <!--dưới đây là chức năng welcome-->
        <h1>
            Welcome:${sessionScope.LOGIN_USER.fullName}

        </h1>

        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>


        <form action="MainController">
            Search<input type="text" name="search" value="${param.search}" />
            <input type="submit" name="action" value="Search"/>
        </form>
        <c:if test="${requestScope.LIST_USER != null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password </th>
                            <th>Update </th>
                            <th>Delete </th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController" method="POST">

                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                </td>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                </td><td>${user.password}</td>
                                <td>
                                    <input type="submit" name="action" value="Update"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                        <c:param name="userID" value="${user.userID}"></c:param>
                                    </c:url>
                                    <a href="${deleteLink}">delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>                
        </c:if>

    </c:if>

    ${requestScope.ERROR}

</body>
</html>