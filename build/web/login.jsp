<%-- 
    Document   : login
    Created on : Sep 7, 2021, 9:45:04 PM
    Author     : Phu Thinh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Login.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Yellow Moon Store</h1>
        <div class="wapper">
            <div class="Login-form">
                <form action="MainController" method="POST">
                    <h2 class="Form-header">Please Login</h2>
                    <div class="Form-group">     
                        <i class="far fa-user"></i>
                        <input class="Form-input" type="text" name="userID" value="" placeholder="Input UserID"/><br />
                    </div>
                    <div class="Form-group">
                        <i class="fas fa-key"></i>
                        <input class="Form-input" type="password" name="password" value="" placeholder="Input Password"/><br />
                    </div>

                    <font class="Form-error">
                    ${requestScope.ERROR}
                    </font>
                    <br/>

                    <input class="Form-submit"type="submit" name="btnAction" value="Login"/>
                    <a class="Form-submit"   href="shopping.jsp">Shopping Page</a>/>
                </form>
            </div>
        </div>
    </body>
</html>
