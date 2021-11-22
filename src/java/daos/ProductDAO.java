/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBHelpers;

/**
 *
 * @author Phu Thinh
 */
public class ProductDAO {

    public List<ProductDTO> getListProduct(String searchName, String searchCata) throws SQLException {
        List<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "Select productID,productName,image,description,createDate,expirationDate, price,quantity,catagoryID\n"
                        + "from tbl_Products\n"
                        + "where productName like ? and catagoryID like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchName + "%");
                stm.setString(2, "%" + searchCata + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID").trim();
                    String productName = rs.getString("productName").trim();
                    String image = rs.getString("image");
                    String description = rs.getString("description").trim();
                    String createDate = rs.getString("createDate");
                    String expirationDate = rs.getString("expirationDate");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String catagoryID = rs.getString("catagoryID").trim();
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new ProductDTO(productID, productName, image, description, createDate, expirationDate, quantity, price, catagoryID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<ProductDTO> getbyPrice(float num1, float num2) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "Select productID,productName,image,description,createDate,expirationDate, price,quantity,catagoryID\n"
                    + "from tbl_Products\n"
                    + "Where price between ? and ?";
            stm = conn.prepareStatement(sql);
            stm.setFloat(1, num1);
            stm.setFloat(2, num2);
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID").trim();
                String productName = rs.getString("productName").trim();
                String image = rs.getString("image");
                String description = rs.getString("description").trim();
                String createDate = rs.getString("createDate");
                String expirationDate = rs.getString("expirationDate");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                String catagoryID = rs.getString("catagoryID").trim();
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new ProductDTO(productID, productName, image, description, createDate, expirationDate, quantity, price, catagoryID));
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

    public int getQuantity(int ID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "select quantity\n"
                        + "from tbl_Products\n"
                        + "where productID = ? ";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
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
        return quantity;
    }

    public ProductDTO searchbyID(String ID) throws SQLException {
        ProductDTO b = new ProductDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "Select productID,productName,image,description,createDate,expirationDate, price,quantity,catagoryID\n"
                        + "from tbl_Products\n"
                        + "where productID= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID").trim();
                    String productName = rs.getString("productName").trim();
                    String image = rs.getString("image");
                    String description = rs.getString("description").trim();
                    String createDate = rs.getString("createDate");
                    String expirationDate = rs.getString("expirationDate");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String catagoryID = rs.getString("catagoryID").trim();

                    b = new ProductDTO(productID, productName, image, description, createDate, expirationDate, quantity, price, catagoryID);
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
        return b;
    }

    public void delete(String ProductID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "DELETE tbl_Products\n"
                    + "WHERE productID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, ProductID);;
            stm.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean Duplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT productID\n"
                        + "FROM tbl_Products\n"
                        + "WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return check;
    }

    public void insert(ProductDTO product) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "insert into tbl_Products(productID,productName,image,description,createDate,expirationDate, price,quantity,catagoryID)\n"
                        + "values (?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getProductName());
                stm.setString(3, product.getImage());
                stm.setString(4, product.getDescription());
                stm.setString(5, product.getCreateDate());
                stm.setString(6, product.getExpirationDate());
                stm.setFloat(7, product.getPrice());
                stm.setInt(8, product.getQuantity());
                stm.setString(9, product.getCatagoryID());

                stm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateProduct(ProductDTO product) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tbl_Products\n"
                        + "SET productName = ? ,image = ? ,description = ? ,createDate = ? ,expirationDate = ?, price = ? ,quantity = ? ,catagoryID = ?\n"
                        + "Where productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setString(2, product.getImage());
                stm.setString(3, product.getDescription());
                stm.setString(4, product.getCreateDate());
                stm.setString(5, product.getExpirationDate());
                stm.setFloat(6, product.getPrice());
                stm.setInt(7, product.getQuantity());
                stm.setString(8, product.getCatagoryID());
                stm.setString(9, product.getProductID());
                stm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean checkQuantity(String productID, int quantity) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT productName\n"
                        + "FROM tbl_Products\n"
                        + "WHERE productID = ? AND quantity >= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                stm.setInt(2, quantity);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
}
