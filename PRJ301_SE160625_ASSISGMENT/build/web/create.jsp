<%-- 
    Document   : create
    Created on : Jun 10, 2023, 2:20:59 PM
    Author     : HoangNQ
--%>

<%@page import="sample.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            form {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            form label {
                display: inline-block;
                width: 120px;
                text-align: right;
                margin-right: 10px;
            }

            form input[type="text"],
            form input[type="password"] {
                padding: 5px;
                width: 220px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-bottom: 10px;
            }

            .sb {
                text-align: center;
            }

            .sb input[type="submit"],
            .sb input[type="reset"] {
                padding: 5px 10px;
                background-color:  #1877f2;

                color: #fff;
                border: none;
                cursor: pointer;
            }
        </style>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
    <c:if test="${requestScope.USER_ERROR != null}">
        <c:if test="${not empty requestScope.LIST_USER}">

            <form action="MainController" method="POST">

                <label for="userID">User ID:</label>
                <input type="text" name="userID" required=""/>${USER_ERROR.getFullNameError()}
                <br/>

                <label for="fullName">Full Name:</label>
                <input type="text" name="fullName" required=""/>${USER_ERROR.getUserIDError()}
                <br/>

                <label for="roleID">Role ID:</label>
                <input type="text" name="roleID" value="US" readonly=""/>
                <br/>

                <label for="password">Password:</label>
                <input type="password" name="password" required=""/>${USER_ERROR.getPasswordError()}
                <br/>

                <label for="confirm">Confirm:</label>
                <input type="password" name="confirm" required=""/>
                <br/>
                <div class="sb">
                    <input type="submit" name="action" value="Create"/>
                    <input type="reset" value="Reset"/>
                </div>

        </c:if>

    </c:if>
   ${USER_ERROR.getError()}
</form>
</body>
</html>
