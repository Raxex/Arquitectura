<%-- 
    Document   : nav
    Created on : 28-11-2017, 16:13:00
    Author     : ROyarzun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="builder_top.jsp" %>
            
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti3">Envios</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti3">
                <li>
                  <a href="index.jsp?pag=crear_estrella">Crear</a>
                </li>
                <li>
                  <a href="index.jsp?pag=estrella">Ver</a>
                </li>
                
                <li>
                  <a href="index.jsp?pag=eliminar_estrella">Eliminar</a>
                </li>
              </ul>
            </li>
<%@include file="builder_bot.jsp" %>