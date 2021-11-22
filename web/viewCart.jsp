<%-- 
    Document   : viewCart
    Created on : Sep 11, 2021, 8:38:12 PM
    Author     : Phu Thinh
--%>
<%@page import="dtos.AccountDTO"%>
<%@page import="dtos.CartDTO"%>
<%@page import="dtos.ProductDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Header.css">
        <title>View Page</title>
    </head>
    <body>


    </nav>
    <c:if test="${sessionScope.CART== null}">
        <h2>Shopping Cart Empty</h2>          
        <a href="shopping.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Buy Product Now!</a>         
    </c:if>
    <c:if test="${sessionScope.CART != null}">    
        <div id="headers">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <a class="navbar-brand" href="#"><font color="red">Well Come :${sessionScope.LOGIN_USER.getUserName()}</font></a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?btnAction=Logout">Logout</a>
                        </li>
                    </ul>
                </c:if>
            </nav>
            <div id="mainContent">View Bill Page</div>
            <div id="secondaryContent">All the selected products in your cart</div>
        </div>

        <c:if test="${not empty requestScope.ERROR}">
            <font color ="red">
            <h3>${requestScope.ERROR}</h3>
            </font>
            <br/>
        </c:if>       
        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <th> Name</th>                   
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Price</th>
                    <td>Update</td>                    
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    float totalMoney = 0;
                    for (ProductDTO list : cart.getCart().values()) {

                        totalMoney += list.getPrice() * list.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%= list.getProductName()%></td>                  
                    <td><input  type="number" name="txtQuantity" value="<%= list.getQuantity()%>"</td>  
                    <td><%= list.getPrice()%>$</td>
                    <td><%= list.getPrice() * list.getQuantity()%>$</td>
                    <td><input id="btn" type="submit" name="btnAction" value="Update Quantity"/></td>
                    <td><input id="btn" type="submit" name="btnAction" value="Delete Quantity"/></td>
                <input  type="hidden" name="txtID" value="<%= list.getProductID()%>"/>
                </tr>
            </form>
            <%
                }
            %>
            <tr >

                <td colspan="3"><b>Grand Total</b></td>
                <td id="grandTotal" colspan="2"><b><%=totalMoney%></b></td>

            </tr>
        </tbody>
    </table>

    <form action="MainController" >
        <input class="btn btn-primary" type="submit" name="btnAction" value="Buy Product"/>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <%
                response.sendRedirect("login.jsp");
            %>
            <h1>You need login</h1>
        </c:if>
        <input type="hidden" name="txtUserID" value="${sessionScope.LOGIN_USER.getUserID()}"/>    
        <input type="hidden" name="totalPrice" value="<%=totalMoney%>"/> 



    </form>
</c:if>
<c:if test="${sessionScope.CART != null}">         
    <a href="shopping.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Buy More!!!</a>         
</c:if>


</body>
</html>
