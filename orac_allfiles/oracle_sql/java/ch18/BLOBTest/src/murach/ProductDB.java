package murach;

// import all necessary Java JDBC and IO classes
import java.sql.*;
import java.io.*;

// import two Oracle JDBC classes for better performance!
import oracle.sql.BLOB;
import oracle.jdbc.OracleResultSet;

public class ProductDB {

    public static int writeImage(int product_id, String file_path) {

        Connection connection = DBUtil.getConnection();
        PreparedStatement ps = null;
        OracleResultSet rs = null;
        try {
            // set up the input stream from file
            File inputFile = new File(file_path);
            FileInputStream fileInputStream = new FileInputStream(inputFile);

            // initialize the BLOB in the database
            String sql
                    = "INSERT INTO product_images (product_id, product_image) "
                    + "   VALUES(?, EMPTY_BLOB())";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            ps.executeUpdate();

            // get a reference to the BLOB
            sql
                    = "SELECT product_image "
                    + "FROM product_images "
                    + "WHERE product_id = ? "
                    + "FOR UPDATE";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            rs = (OracleResultSet) ps.executeQuery();
            rs.next();
            BLOB productImageBLOB = rs.getBLOB("product_image");

            // set up the output stream to the database
            OutputStream outputStream = productImageBLOB.setBinaryStream(0);

            // set up the buffer
            int chunkSize = productImageBLOB.getChunkSize();
            byte[] byteBuffer = new byte[chunkSize];

            // read input and write output
            int byteCount = 0;
            int bytesRead;
            while ((bytesRead = fileInputStream.read(byteBuffer)) != -1) {
                outputStream.write(byteBuffer, 0, bytesRead);
                byteCount += bytesRead;
            }

            // close the input and output streams
            fileInputStream.close();
            outputStream.close();

            // commit the change!
            connection.commit();

            return byteCount;
        } catch (Exception e) {
            System.out.println(e);
            DBUtil.rollback(connection);
            return 0;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            DBUtil.closeConnection(connection);
        }
    }

    public static int readImage(int product_id, String filename) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement ps = null;
        OracleResultSet rs = null;
        try {
            // set up output stream to file
            File outputFile = new File(filename);
            FileOutputStream outputStream = new FileOutputStream(outputFile);

            // set up input steam from database
            String sql
                    = "SELECT product_image "
                    + "FROM   product_images "
                    + "WHERE  product_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            rs = (OracleResultSet) ps.executeQuery();
            rs.next();
            BLOB productImageBLOB = rs.getBLOB("product_image");
            InputStream inputStream = productImageBLOB.getBinaryStream();

            // set up the buffer
            int chunkSize = productImageBLOB.getChunkSize();
            byte[] binaryBuffer = new byte[chunkSize];

            // read input and write output
            int byteCount = 0;
            int bytesRead;
            while ((bytesRead = inputStream.read(binaryBuffer)) != -1) {
                outputStream.write(binaryBuffer, 0, bytesRead);
                byteCount += bytesRead;
            }

            // close the input and output streams
            outputStream.close();
            inputStream.close();

            return byteCount;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            DBUtil.closeConnection(connection);
        }
    }
}