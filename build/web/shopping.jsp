<%-- 
    Document   : shopping
    Created on : Sep 10, 2021, 10:07:49 AM
    Author     : Phu Thinh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dtos.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Shopping.css">
        <title>Shopping Page</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <a class="navbar-brand" href="#"><font color="red">Well Come :${sessionScope.LOGIN_USER.getUserName()}</font></a>
                    </c:if>
                <a class="btn btn-danger" href="MainController?btnAction=View">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>View
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        <c:if test="${sessionScope.LOGIN_USER == null}">
                            <li class="nav-item">                            
                                <p class="fs-1">You Should Login Before Buy Product</p>
                                <a class="btn btn-danger" class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER != null}">

                            <li class="nav-item">
                                <div class="dropdown">
                                    <form action="MainController" method="POST" class="d-flex">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                            Search Price
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li> <input class="form-control me-2"  type="number" min="1" name="txtSeachPriceMin" value="${param.Search}" placeholder="Search Price Min" aria-label="Search"></li>
                                            <li><input class="form-control me-2"  type="number"  min="1" name="txtSeachPriceMax" value="${param.Search}" placeholder="Search Price Max" aria-label="Search"></li>
                                            <li><input class="btn btn-outline-success" type="submit" name="btnAction" value="Search Price"/></li>
                                        </ul>
                                    </form>
                                </div>   
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="MainController?btnAction=History">History Order</a>
                            </li>  
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="MainController?btnAction=Logout">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                    <form action="MainController" method="POST" class="d-flex">
                        <input class="form-control me-2" type="text" name="txtSeachName" value="${param.Search}" placeholder="Search Name" aria-label="Search">


                        <select class="form-control me-2" name="txtSeachCatagory" placeholder="Search Cata">

                            <c:if test="${requestScope.LIST_CATA != null}">
                                <c:if test="${not empty requestScope.LIST_CATA}">
                                    <option value=""> All </option>
                                    <c:forEach var="dto" items="${requestScope.LIST_CATA}">
                                        <option value="${dto.getCatagoryID()}"> ${dto.getCatagoryName()} </option>
                                    </c:forEach>                               
                                </c:if>
                            </c:if>
                        </select>
                        <input class="btn btn-outline-success" type="submit" name="btnAction" value="Search Product"/>
                    </form>
                </div>
            </div>
        </nav>                     

        <c:if test="${not empty requestScope.ERROR}">
            <font color ="red">
            <h1>${requestScope.ERROR}</h1>
            </font>
            <br/>
        </c:if>          

        <div id="mainContainer">
            <c:if test="${requestScope.LIST_PRODUCT != null}">
                <c:if test="${not empty requestScope.LIST_PRODUCT}">

                    <c:forEach var="dto" items="${requestScope.LIST_PRODUCT}">
                        <div id="item">
                            <form action="MainController"method="POST">                               
                                <div id="itemName">${dto.getProductName()}</div>
                                <img src="${dto.getImage()}" >
                                <div id="itemDescription">${dto.getDescription()}</div>                                
                                <div class="info">Create Product : ${dto.getCreateDate()}</div>
                                <div class="info">Expiration Product : ${dto.getExpirationDate()}</div>
                                <div class="info">Price : ${dto.getPrice()}$</div>
                                <div> <input class="info" type ="number" name="txtQuantity"value="1" min="1" max="${dto.getQuantity()}" step="1"/></div>                               

                                <div>                         
                                    <input  id="orderButton" type="submit"  name="btnAction" value="Order Now" />
                                </div>

                                <input type ="hidden" name="txtID" value="${dto.getProductID()}" readonly="true"/>
                                <input type ="hidden" name="txtName" value="${dto.getProductName()}"/>
                                <input type ="hidden" name="txtDescription" value="${dto.getDescription()}"/>
                                <input type ="hidden" name="txtPrice" value="${dto.getPrice()}"/>
                                <input type ="hidden" name="txtQuantity" value="${dto.getQuantity()}"/>     
                                <input type="hidden" name="txtSeachName" value="<%= request.getParameter("txtSeachName") == null ? "" : request.getParameter("txtSeachName")%>">
                                <input type="hidden" name="txtSeachCatagory" value="<%= request.getParameter("txtSeachCatagory") == null ? "" : request.getParameter("txtSeachCatagory")%>">
                            </form> 
                        </div>
                    </c:forEach>

                </c:if>
            </c:if>

        </div>           
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
</html>