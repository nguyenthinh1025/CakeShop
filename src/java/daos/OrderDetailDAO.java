/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDetailDTO;
import dtos.ProductDTO;
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
public class OrderDetailDAO {

    public int getNoOfOrderDetail() throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "SELECT Count(orderDetailID) as NoOfOrderDetail\n"
                    + "FROM tbl_OrderDetail";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("NoOfOrderDetail");
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

    public void createDetailOrder(OrderDetailDTO orderDetail) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "INSERT INTO tbl_OrderDetail(orderDetailID,price,quantity,orderID,productID)"
                    + "VALUES(?,?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, orderDetail.getOrderDetailID());
            stm.setFloat(2, orderDetail.getPrice());
            stm.setInt(3, orderDetail.getQuantity());
            stm.setString(4, orderDetail.getOrderID());
            stm.setString(5, orderDetail.getProductID().getProductID());

            stm.executeUpdate();
        } catch (Exception e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public ArrayList<OrderDetailDTO> getListDetailByOrderID(String ID) throws SQLException {
        ArrayList<OrderDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO dao = new ProductDAO();
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "select price, quantity,orderID,productID\n"
                        + "from tbl_OrderDetail\n"
                        + "where orderID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO product = dao.searchbyID(rs.getString("productID"));
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String orderID = rs.getString("orderID");
                    list.add(new OrderDetailDTO("", price, quantity, orderID, product));
                }
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
        return list;
    }
}
