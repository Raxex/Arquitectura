<%-- 
    Document   : index
    Created on : 4/07/2018, 11:18:13 PM
    Author     : Raxex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String usuario;
    usuario=request.getParameter("user");
    String sql;
    sql="SELECT `tipo` FROM `usuario` WHERE `email`='"+usuario+"'";
    classes.Conectar x= new classes.Conectar();
    ResultSet rs=x.executeQuery(sql);
    int c=0;
    while(rs.next()){
        c=rs.getInt("tipo");
    }
    if(c==1){
        //admin
        
%><%@include file="/admin/builder/navAdmin.jsp" %>

<%
    classes.SelectorController lol= new classes.SelectorController();
    String k=lol.selectorPag(request.getParameter("pag"));
%>
    <jsp:include page="<%=k%>"/>
<%
    }else{
        //user
%>

<%@include file="/admin/builder/navUser.jsp" %>

<%
    }

    
%>


<%@include file="/admin/builder/builder_bot.jsp" %>