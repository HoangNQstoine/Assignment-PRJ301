<%-- 
    Document   : login
    Created on : May 31, 2023, 2:22:49 PM
    Author     : HoangNQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 380px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            color: #1877f2;
            font-size: 28px;
            margin: 0;
            padding: 0;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            font-size: 14px;
            color: #65676b;
            display: block;
            margin-bottom: 8px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 95%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #dddfe2;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #1877f2;
        }

        .form-group .button {
            background-color: #1877f2;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .form-group .button:hover {
            background-color: #166fe5;
        }

        .form-group .links {
            margin-top: 16px;
            text-align: center;
        }

        .form-group a{
            margin: auto;
            justify-content: center;
            color: #1877f2;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h2>Login</h2>
        </div>
        <form action="MainController" method="POST">
            <div class="form-group">
                <label for="userID">User ID</label>
                <input type="text" name="userID" required=""/>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" required=""/>
            </div>
            <div class="form-group">
                <button class="button" type="submit" name="action" value="Login">Login</button>
            </div>
        </form>
        <div class="form-group a">
            <a href="MainController?action=CreatePage">Sign up for an account</a>
        </div>
    </div>


        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>
