<%-- 
    Document   : user
    Created on : May 31, 2023, 2:30:17 PM
    Author     : HoangNQ
--%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            .user-info {
                margin: 20px;
                padding: 20px;
                background-color: #fff;


                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #1877f2;

            }

            .info-label {
                font-weight: bold;
                display: inline-block;
                width: 120px;
                color: #1877f2;

            }

            .info-value {
                display: inline-block;
                margin-left: 10px;
            }

            .shopping-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #1877f2;
                text-decoration: none;
            }

            .shopping-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
        <c:redirect url="login.html"></c:redirect>
    </c:if>

    <div class="user-info">
        <h2>User's Information</h2>
        <p><span class="info-label">User ID:</span><span class="info-value">${LOGIN_USER.userID}</span></p>
        <p><span class="info-label">Full Name:</span><span class="info-value">${LOGIN_USER.fullName}</span></p>
        <p><span class="info-label">Role ID:</span><span class="info-value">${LOGIN_USER.roleID}</span></p>
        <p><span class="info-label">Password:</span></p>
    </div>

    <a class="shopping-link" href="MainController?action=ShoppingPage">Go to Quynh's Store</a>
</body>
</html>
