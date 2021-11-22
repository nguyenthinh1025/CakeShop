/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Phu Thinh
 */
public class DBHelpers implements Serializable {

    private static String port = "1433";
    private static String protocol_server = "jdbc:sqlserver";
    private static String host = "SE140764";
    private static String dbname = "SE140764_NguyenPhuThinh_Project1";
    private static String username = "sa";
    private static String password = "25102000";

    public static Connection makeConnection()
            throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = protocol_server
                + "://"
                + host
                + ":"
                + port
                + ";"
                + "databaseName="
                + dbname;
        Connection con = DriverManager.getConnection(url, username, password);
        return con;
    }
}
