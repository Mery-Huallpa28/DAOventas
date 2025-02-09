
package com.emergentes.controlador;

import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (request.getParameter("action") == null) ? "view": request.getParameter("action");
        if(action.equals("logout"))
        {
            HttpSession ses = request.getSession();
            ses.invalidate();
        }
        
       response.sendRedirect("login.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            String sl = "SELECT * FROM usuarios WHERE correo =? and password =?";
            ResultSet rs;
            
            ConexionDB canal = new ConexionDB();
            Connection cn = canal.conectar();
            PreparedStatement ps = cn.prepareStatement(sl);
            ps.setString(1, correo);
            ps.setString(2, password);
            
             rs =ps.executeQuery();
             
             if(rs.next())
             {
                 //variables de session para el uso de la aplicacion
                 HttpSession ses = request.getSession();
                 
                 ses.setAttribute("logueado", "OK");
                 ses.setAttribute("usuario", rs.getString("nombres")+" "+rs.getString("apellidos"));
                 response.sendRedirect("ProductoControlador");
             }
             else
             {
                 //
                 response.sendRedirect("login.jsp");
                 
             }
            
        } catch (SQLException ex) {
            System.out.printf("Error al conectar a la Base de Datos"+ ex.getMessage());
        }
       

    }

   

}
