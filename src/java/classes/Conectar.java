package classes;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.*;
import javax.swing.JOptionPane;

public class Conectar {

    private Connection conexion = null;
    private String servidor = "localhost";
    private String database = "cartasexpress";
    private String usuario = "root";
    private String password = "";
    private String url = "";

    public Conectar(String servidor, String database, String usuario, String password) {
        try {

            this.servidor = servidor;
            this.database = database;

            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            url = "jdbc:mysql://" + servidor + "/" + database;
            conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion a Base de Datos " + url + " . . . . .Ok");

        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }

    public Conectar() {
        try {
            
            this.servidor = servidor;
            this.database = database;

            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            url = "jdbc:mysql://" + servidor + "/" + database;
            conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion a Base de Datos " + url + " . . . . .Ok");

        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (Exception e) {
            System.out.println( e.getMessage());
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public void executeUpdate(String sql) {
        try {
            Statement s = (Statement) this.getConexion().createStatement();
            s.executeUpdate(sql);
            System.out.println("Ejecutado: " + sql);
        } catch (Exception e) {
            System.out.println("Error en: " + sql);
            System.out.println( e.getMessage());
        }
    }

    public ResultSet executeQuery(String sql) {
        ResultSet rs = null;
        try {

            Statement s = (Statement) this.getConexion().createStatement();
            rs = (ResultSet) s.executeQuery(sql);
            System.out.println("Ejecutado: " + sql);
        } catch (Exception e) {
            System.out.println("Error en: " + sql);
            System.out.println( e.getMessage());
        }
        return rs;
    }
   
    public Connection cerrarConexion() {
        try {
            conexion.close();
            System.out.println("Cerrando conexion a " + url + " . . . . . Ok");
        } catch (SQLException ex) {
             System.out.println("Error cierre de coneccion");
            System.out.println(ex); 
        } catch (Exception e) { 
             System.out.println("Error cierre de coneccion");
            System.out.println( e.getMessage());
        }
        conexion = null;
        return conexion;
    }

   Connection conect = null;
   public Connection conexion()
    {
       
      try {
             
           //Cargamos el Driver MySQL
           Class.forName("com.mysql.jdbc.Driver");
           conect = DriverManager.getConnection("jdbc:mysql://localhost/cartasexpress","root","");
           //JOptionPane.showMessageDialog(null, "conectado");
           //Cargamos el Driver Access
           //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           //Conectar en red base 
           //String strConect = "jdbc:odbc:Driver=Microsoft Access Driver (*.mdb);DBQ=//servidor/bd_cw/cw.mdb";
           //Conectar Localmente
           //String strConect = "jdbc:odbc:Driver=Microsoft Access Driver (*.mdb);DBQ=D:/cwnetbeans/cw.mdb";
          //conect = DriverManager.getConnection(strConect,"",""); 
        } catch (Exception e) {
            
        }
        return conect;
     
}
}

