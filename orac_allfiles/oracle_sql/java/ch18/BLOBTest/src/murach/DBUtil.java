package murach;

import java.sql.*;

public class DBUtil {

    public static Connection getConnection() {
        
        // Load the database driver
        // NOTE: This block is necessary for Oracle 10g (JDBC 3.0),
        // but not for Oracle 11g (JDBC 4.0)
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println(e);
            return null;
        }

        // Return a connection to the database
        try {
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "ex";
            String password = "ex";
            Connection connection = DriverManager.getConnection(
                    dbUrl, username, password);
            return connection;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public static void rollback(Connection c) {
        try {
            if (c != null) {
                c.rollback();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void closePreparedStatement(PreparedStatement ps) {
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}