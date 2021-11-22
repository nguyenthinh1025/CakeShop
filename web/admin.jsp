<%-- 
    Document   : admin
    Created on : Sep 7, 2021, 9:51:51 PM
    Author     : Phu Thinh
--%>


<%@page import="dtos.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Admin.css">
        <title>Admin Page</title>
    </head>
    <body>

        <%

            AccountDTO user = (AccountDTO) session.getAttribute("LOGIN_USER");
            if (user == null || !"AD".equals(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">${sessionScope.LOGIN_USER.getUserName()}</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?btnAction=InsertCata">Insert Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?btnAction=Logout">Logout</a>
                        </li>                      
                    </ul>

                    <form action="MainController" method="POST" class="d-flex">
                        <input class="form-control me-2" type="text" name="txtSeachName" value="${param.Search}" placeholder="Search Name" aria-label="Search">
                        <input class="form-control me-2" type="text" name="txtSeachCatagory" value="${param.Search}" placeholder="Search Catagory" aria-label="Search"/>
                        <input class="btn btn-outline-success" type="submit" name="btnAction" value="Search"/>
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

        <div class="table0">
            <c:if test="${requestScope.LIST_PRODUCT != null}">
                <c:if test="${not empty requestScope.LIST_PRODUCT}">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <td> ID</td>
                                <td> NAME</td>
                                <td> IMAGE</td>
                                <td> DESCRIPTION</td>
                                <td> CREATE DATE</td>
                                <td> EXPIRATION DATE</td>
                                <td> QUANTITY</td>
                                <td> PRICE</td>
                                <td> CATAGORY</td>
                                <td> DELETE</td>
                                <td>UPDATE</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${requestScope.LIST_PRODUCT}">
                            <form action="MainController"method="POST">
                                <tr>
                                    <td>${dto.getProductID()}</td>
                                    <td>${dto.getProductName()}</td>
                                    <td><img src="${dto.getImage()}" type="text" width="150px" height="100px"></td>
                                    <td>${dto.getDescription()}</td>
                                    <td>${dto.getCreateDate()}</td>
                                    <td>${dto.getExpirationDate()}</td>
                                    <td>${dto.getQuantity()}</td>
                                    <td>${dto.getPrice()}$</td>
                                    <td>${dto.getCatagoryID()}</td>
                                    <td>
                                        <c:url var="deleteLink" value="MainController">
                                            <c:param name="btnAction" value="Delete"></c:param>
                                            <c:param name="txtProductID" value="${dto.getProductID()}"></c:param> 
                                            <c:param name="txtSeachName" value="${param.Search}"></c:param>
                                            <c:param name="txtSeachCatagory" value="${param.Search}"></c:param>
                                        </c:url>
                                        <a   class="btn btn-outline-success" aria-current="page" href="${deleteLink}">Delete</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-success" aria-current="page" href="MainController?btnAction=Update&UID=${dto.getProductID()}">Update</a>
                                    </td>
                                </tr>
                            </form> 
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </body>
</html>
