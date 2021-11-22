/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.OrderDAO;
import daos.OrderDetailDAO;
import daos.ProductDAO;
import dtos.CartDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Phu Thinh
 */
public class BuyProductController extends HttpServlet {

    public static final String ERROR = "viewCart.jsp";
    public static final String SUCCESS = "shopping.jsp";

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
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            String userID = request.getParameter("txtUserID");
            String totalPrice = request.getParameter("totalPrice");
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            Date date = new Date(System.currentTimeMillis());
            ProductDAO dao = new ProductDAO();
            boolean check = true;
            for (ProductDTO productDTO : cart.getCart().values()) {
                if (!dao.checkQuantity(productDTO.getProductID(), productDTO.getQuantity())) {
                    check = false;
                }
            }
            if (check == true) {
                OrderDAO orderDao = new OrderDAO();
                String orderID = "O" + (orderDao.getNoOfOrder() + 1);
                String orderDate = formatter.format(date);
                OrderDTO orderDTO = new OrderDTO(orderID, orderDate, Float.parseFloat(totalPrice), userID);
                orderDao.createOrder(orderDTO);
                
                OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                String orderDetailID;
                for (ProductDTO productDTO : cart.getCart().values()) {

                    orderDetailID = "D" + (orderDetailDao.getNoOfOrderDetail() + 1);
                    OrderDetailDTO orderDetailDto = new OrderDetailDTO(orderDetailID, Float.parseFloat(totalPrice), productDTO.getQuantity(), orderID, productDTO);
                    orderDetailDao.createDetailOrder(orderDetailDto);

                }
                request.setAttribute("ERROR", "Buy successful !");
                url = SUCCESS;
                session.setAttribute("CART", null);
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
