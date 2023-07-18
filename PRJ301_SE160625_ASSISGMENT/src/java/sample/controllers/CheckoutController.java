/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Comestic;
import sample.shopping.ShoppingDAO;
import shopping.dto.OrderDTO;
import shopping.dto.OrderDetalsDTO;

/**
 *
 * @author HoangNQ
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkoutError.jsp";
    private static final String SUCCESS = "checkoutSuccess.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            double total = Double.parseDouble(request.getParameter("total"));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART"); // take the cart
            LocalDate currentDate = LocalDate.now();
            Map<String, Comestic> items = cart.getCart();
            ShoppingDAO sd = new ShoppingDAO();
            double randomDouble = Math.random();
            int id = (int) (randomDouble * 12371);
            if (session != null) {
                if (cart != null) {
                    boolean rsODD = false;
                    boolean rsQtt =false;
                    OrderDTO orderdto = new OrderDTO(id, userID, currentDate, total);
                    boolean rsOrder = sd.insertOrder(orderdto);
                    for (Comestic p : cart.getCart().values()) {
                        randomDouble = Math.random();
                        int detailsID = (int) (randomDouble * 12897);
                        rsODD = sd.insertDetails(detailsID, id, p.getId(), p.getPrice(), p.getQuantity());
                        rsQtt = sd.CheckQuantityByProductID(p.getId(), cart);
                    }
                    if (rsOrder && rsODD && rsQtt) {
                        session.removeAttribute("CART");
                        url = SUCCESS;
                    }//end if remove attribute
                }
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            response.sendRedirect(url);
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
