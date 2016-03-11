// A Java class that gets data from an Oracle database
import java.sql.*;
import java.text.NumberFormat;

public class JDBCOracleMurach {

    public static void main(String args[]) 
    {

        // Load the database driver
        // NOTE: This block is necessary for 10g and earlier
        // (JDBC 3.0), but not for 11g or later (JDBC 4.0)
        try 
        {
            Class.forName("oracle.jdbc.OracleDriver");
        }
        catch(ClassNotFoundException e) 
        {
            e.printStackTrace();
        }
        // define common JDBC objects
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        try 
        {
            // Connect to the database
            String dbUrl =
                "jdbc:oracle:thin:@cdmorasvr.cti.depaul.edu:1521:def";
            String username = args[0];
            String password = args[1];
            connection = DriverManager.getConnection(
                dbUrl, username, password);

            // Execute a SELECT statement
            statement = connection.createStatement();
            String query =
                "SELECT vendor_name, invoice_number, invoice_total " +
                "FROM vendors INNER JOIN invoices " +
                "    ON vendors.vendor_id = invoices.vendor_id " +
                "WHERE invoice_total >= 500 " +
                "ORDER BY vendor_name, invoice_total DESC";
            rs = statement.executeQuery(query);

            // Display the results of a SELECT statement
            System.out.println(
                "Invoices with totals over 500:\n");

            while(rs.next()) 
            {
                String vendorName =
                    rs.getString("vendor_name");
                String invoiceNumber =
                    rs.getString("invoice_number");
                double invoiceTotal =
                    rs.getDouble("invoice_total");

                NumberFormat currency =
                    NumberFormat.getCurrencyInstance();
                String invoiceTotalString =
                    currency.format(invoiceTotal);

                System.out.println(
                    "Vendor:     " + vendorName + "\n" +
                    "Invoice No: " + invoiceNumber + "\n" +
                    "Total:      " + invoiceTotalString +
                    "\n");
            }  // end loop

        } 
        catch(SQLException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            try 
            {
                if (rs != null)
                    rs.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } 
            catch(SQLException e) 
            {
                e.printStackTrace();
            }
        }
    }
}
