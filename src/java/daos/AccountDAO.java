/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBHelpers;

/**
 *
 * @author Phu Thinh
 */
public class AccountDAO {

    public AccountDTO getAccount(String userID, String password) throws SQLException {
        AccountDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            String sql = "SELECT userID , userName , phone , address , password,role\n"
                    + "FROM tbl_Accounts\n"
                    + "WHERE userID = ? AND password = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                String userName = rs.getString("userName");
                int phone = rs.getInt("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");
                result = new AccountDTO(userID, userName, phone, address, password, role);
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
}
