/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bicyclerent.Func;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Gabriel
 */
public class Koneksi {
    private static Connection connect;  
 private static String driverName = "oracle.jdbc.driver.OracleDriver";  
 private static String jdbc = "jdbc:oracle:thin:";  
 private static String host = "@localhost:";  
 private static String port = "1521:";  
 private static String SID = "xe";   
 private static String database = "vignette";   
 private static String url = jdbc + host + port + SID;  
 private static String username = "vignette";   
 private static String password = "vignette";  
 public static Connection getKoneksi() throws SQLException {  
   if (connect == null) {  
    try {  
      Class.forName(driverName);  
      System.out.println("Class Driver Ditemukan");  
      try {  
       connect = DriverManager.getConnection(url, username, password);  
       System.out.println("Koneksi Database Sukses");  
      } catch (SQLException se) {  
       System.out.println("Koneksi Database Gagal : " + se);  
       System.exit(0);  
      }  
    } catch (ClassNotFoundException cnfe) {  
      System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : " + cnfe);  
      System.exit(0);  
    }  
   }  
   return connect;  
   
 } 
 
}
