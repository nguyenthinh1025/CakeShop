/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBHelpers;

/**
 *
 * @author Phu Thinh
 */
public class OrderDAO {

    public int getNoOfOrder() throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBHelpers.makeConnection();
            String sql = "SELECT Count(orderID)as NoofOrder\n"
                    + "FROM tbl_Orders";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("NoOfOrder");
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void createOrder(OrderDTO order) {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "INSERT INTO tbl_Orders(orderID,orderDate,totalPrice,userID)\n"
                    + "VALUES(?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, order.getOrderID());
            stm.setString(2, order.getOrderDate());
            stm.setFloat(3, order.getTotalPrice());
            stm.setString(4, order.getUserID());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

     public ArrayList<OrderDTO> listOrderID(String UserID) throws SQLException {
        ArrayList<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "select orderID,orderDate,totalPrice,userID\n"
                        + "from tbl_Orders\n"
                        + "where UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String orderDate = rs.getString("orderDate");
                    float price = rs.getFloat("totalPrice");

                    list.add(new OrderDTO(orderID, orderDate, price, UserID));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
}
