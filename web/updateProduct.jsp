<%-- 
    Document   : updateProduct
    Created on : Sep 9, 2021, 1:24:36 PM
    Author     : Phu Thinh
--%>
<%@page import="dtos.AccountDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" method="POST">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Cake</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">                                  
                                    <input value="${update.getProductID()}" name="id" type="hidden" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${update.getProductName()}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${update.getImage()}" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input value="${update.getDescription()}" name="description" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Create Date</label>
                                    <input value="${update.getCreateDate()}" name="createDate" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Expiration Date</label>
                                    <input value="${update.getExpirationDate()}" name="expirationDate" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input value="${update.getQuantity()}" name="quantity" type="number" min ="1"  class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${update.getPrice()}" name="price" type="number" min ="1" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Catagory</label>
                                    <input value="${update.getCatagoryID()}" name="catagory"  type="text" class="form-control" required>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <input type="submit" name="btnAction" class="btn btn-success" value="Edit">

                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
    <
</html>
