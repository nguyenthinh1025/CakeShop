/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Phu Thinh
 */
public class MainController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String LOGOUT = "LogoutController";
    private static final String DELETE = "DeleteController";
    private static final String INSERT = "InsertController";
    private static final String UPDATE = "UpdateController";
    private static final String EDIT = "EditController";
    private static final String SEARCH_PRODUCT = "SearchProductController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String VIEW_CART = "viewCart.jsp";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String DELETE_CART = "DeleteCartController";
    private static final String SEARCH_PRICE = "SearchPriceController";
    private static final String BUY_PRODUCT = "BuyProductController";
    private static final String HISTORY = "HistoryController";
    private static final String MOREDETAIL = "MoreDetailController";
    private static final String INSERT_CATA = "InsertCataController";

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
            String action = request.getParameter("btnAction");
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("home".equals(action)) {
                url = LOGIN;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Delete".equals(action)) {
                url = DELETE;
            } else if ("Insert Product".equals(action)) {
                url = INSERT;
            } else if ("Update".equals(action)) {
                url = UPDATE;
            } else if ("Edit".equals(action)) {
                url = EDIT;
            } else if ("Search Product".equals(action)) {
                url = SEARCH_PRODUCT;
            } else if ("Order Now".equals(action)) {
                url = ADD_TO_CART;
            } else if ("View".equals(action)) {
                url = VIEW_CART;
            } else if ("Update Quantity".equals(action)) {
                url = UPDATE_CART;
            } else if ("Delete Quantity".equals(action)) {
                url = DELETE_CART;
            } else if ("Search Price".equals(action)) {
                url = SEARCH_PRICE;
            } else if ("Buy Product".equals(action)) {
                url = BUY_PRODUCT;
            } else if ("History".equals(action)) {
                url = HISTORY;
            } else if ("MoreDetail".equals(action)) {
                url = MOREDETAIL;
            } else if ("InsertCata".equals(action)) {
                url = INSERT_CATA;
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
