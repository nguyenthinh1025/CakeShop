/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import static controllers.InsertCataController.SUCCESS;
import daos.CatagoryDAO;
import daos.ProductDAO;
import dtos.CatagoryDTO;
import dtos.ProductDTO;
import dtos.ProductERROR;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Phu Thinh
 */
public class InsertController extends HttpServlet {

    private final static String ERROR = "insertProduct.jsp";
    private final static String SUCCESS = "admin.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductERROR error = new ProductERROR();
        try {
            String productID = request.getParameter("txtProductID");
            String productName = request.getParameter("txtProductName");
            String image = request.getParameter("txtProductImage");
            String description = request.getParameter("txtDescription");
            String createDate = request.getParameter("txtCreateDate");
            String expirationDate = request.getParameter("expirationDate");
            String price = request.getParameter("txtPrice");
            String quantity = request.getParameter("txtQuantity");
            String catagoryID = request.getParameter("txtCatagory");
            ProductDAO dao = new ProductDAO();
            CatagoryDAO daoC = new CatagoryDAO();
            List<CatagoryDTO> dto = daoC.getListCatagory();
            if (dto != null) {
                request.setAttribute("LIST_CATA", dto);
               
            }
            boolean check = true;
            if (productID.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROID", "ProductID is wrong format !");
            }
            if (productName.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PRONAME", "ProductName is wrong format !");
            }
            if (image.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROIMG", "Image is wrong format !");
            }
            if (description.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PRODES", "Description is wrong format !");
            }
            if (createDate.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROCRE", "Create Date is wrong format !");
            }
            if (expirationDate.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROEXDATE", "Expriration Date is wrong format !");
            }
            if (price.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROPRICE", "Price is wrong format !");
            }
            if (quantity.isEmpty()) {
                check = false;
                request.setAttribute("ERR_PROQUANTITY", "Quantity is wrong format !");
            }
            if (catagoryID.isEmpty()) {
                check = false;
                request.setAttribute("ERR_CATAGORY", "Catagory is wrong format !");
            }

            if (check == true) {
                boolean checkDulicate = dao.Duplicate(productID);
                if (checkDulicate) {
                    request.setAttribute("ERR_PROID", "ProductID is Duplicate !");
                } else {
                    ProductDTO insertProduct = new ProductDTO(productID, productName, image, description, createDate, expirationDate, Integer.parseInt(quantity), Float.parseFloat(price), catagoryID);
                    dao.insert(insertProduct);
                    url = SUCCESS;
                    request.setAttribute("ERROR", "INSERT THANH CONG!!!!!");
                }
            }

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
