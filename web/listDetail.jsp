<%-- 
    Document   : listDetail
    Created on : Sep 14, 2021, 8:32:22 PM
    Author     : Phu Thinh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">

                            <h2>Detail <b>Order</b></h2>
                            <h2><b>Your Bill :</b></h2>
                            <h3>Customer Name : ${sessionScope.LOGIN_USER.getUserName()}</h3>
                            <h3>Phone : ${sessionScope.LOGIN_USER.getPhone()}</h3>
                            <h3>Address : ${sessionScope.LOGIN_USER.getAddress()}</h3>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Name Product</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.DETAIL}" var="d">
                            <tr>  
                                <td>${d.getProductID().getProductName()}</td>
                                <td><img src ="${d.getProductID().getImage()}" witdth="150px" height="100px" /></td> 
                                <td>${d.getProductID().getPrice()}$</td> 
                                <td>${d.getQuantity()}</td>
                            </tr>                           
                        </c:forEach>
                    </tbody>                   
                </table>                      
            </div>
            <a href="shopping.jsp"><button type="button" class="btn btn-primary">Back to home</button>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
</html>
