package murach;

public class BLOBTestApp {

    public static void main(String args[]) {

        String productsDir = "C:/murach/oracle_sql/java/ch18files/";
        String filePath;
        int byteCount;

        // Read 3 images from file and write to database
        filePath = productsDir + "8601_cover.jpg";
        byteCount = ProductDB.writeImage(1, filePath);
        System.out.println(byteCount + " bytes written to the database.");

        filePath = productsDir + "pf01_cover.jpg";
        byteCount = ProductDB.writeImage(2, filePath);
        System.out.println(byteCount + " bytes written to the database.");

        filePath = productsDir + "jr01_cover.jpg";
        byteCount = ProductDB.writeImage(3, filePath);
        System.out.println(byteCount + " bytes written to the database.");

        // Read 1 image from database and write to file
        filePath = productsDir + "8601_temp.jpg";
        byteCount = ProductDB.readImage(1, filePath);
        System.out.println(byteCount + " bytes read from the database.");
    }
}