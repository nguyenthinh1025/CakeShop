<%-- 
    Document   : insertProduct
    Created on : Sep 8, 2021, 10:00:19 PM
    Author     : Phu Thinh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="dtos.CatagoryDTO"%>
<%@page import="dtos.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Insert.css">
        <title>Insert Page</title>
    </head>
    <%

        AccountDTO user = (AccountDTO) session.getAttribute("LOGIN_USER");
        if (user == null || !"AD".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <body> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">${sessionScope.LOGIN_USER.getUserName()}</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="admin.jsp">Home</a>
                        </li>                       
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?btnAction=Logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div id="mainContainer">
            <div id="containerHeader">
                Add new product
            </div>
            <div id="formInput">
                <form action="MainController" method="POST">
                    <div class="inputText">
                        <span id="formContent">Product ID</span>
                        <input type="text" name="txtProductID" >
                        <c:if test="${not empty requestScope.ERR_PROID}">
                            <font color ="red">
                            ${requestScope.ERR_PROID}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent">Product Name</span>
                        <input type="text" name="txtProductName">
                        <c:if test="${not empty requestScope.ERR_PRONAME}">
                            <font color ="red">
                            ${requestScope.ERR_PRONAME}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent">Image</span>
                        <input type="text" name="txtProductImage">
                        <c:if test="${not empty requestScope.ERR_PROIMG}">
                            <font color ="red">
                            ${requestScope.ERR_PROIMG}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent">Description</span>
                        <input type="text" name="txtDescription" >
                        <c:if test="${not empty requestScope.ERR_PRODES}">
                            <font color ="red">
                            ${requestScope.ERR_PRODES}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">                    
                        <span id="formContent">Create Date</span>                       
                        <input type="date" name="txtCreateDate" >
                        <c:if test="${not empty requestScope.ERR_PROCRE}">
                            <font color ="red">
                            ${requestScope.ERR_PROCRE}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent">Expiration Date</span>
                        <input type="date" name="expirationDate" >
                        <c:if test="${not empty requestScope.ERR_PROEXDATE}">
                            <font color ="red">
                            ${requestScope.ERR_PROEXDATE}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent"> Price</span>
                        <input type="number" min="1"  name="txtPrice" >
                        <c:if test="${not empty requestScope.ERR_PROPRICE}">
                            <font color ="red">
                            ${requestScope.ERR_PROPRICE}
                            </font>
                            <br/>
                        </c:if>
                    </div>
                    <div class="inputText">
                        <span id="formContent">Quantity</span>
                        <input type="number" min="1" name="txtQuantity" >
                        <c:if test="${not empty requestScope.ERR_PROQUANTITY}">
                            <font color ="red">
                            ${requestScope.ERR_PROQUANTITY}
                            </font>
                            <br/>
                        </c:if>
                    </div>

                    <div class="inputText">
                        <span id="formContent">Catagory</span>                       
                        <select type="text" name="txtCatagory" placeholder="Search Cata">

                            <c:if test="${requestScope.LIST_CATA != null}">
                                <c:if test="${not empty requestScope.LIST_CATA}">                                  
                                    <c:forEach var="dto" items="${requestScope.LIST_CATA}">
                                        <option value="${dto.getCatagoryID()}"> ${dto.getCatagoryName()} </option>
                                    </c:forEach>                               
                                </c:if>
                            </c:if>
                        </select>
                    </div>

                    <input class="inputText" id="btnSubmit" type="submit" name="btnAction" value="Insert Product" />
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
</html>
