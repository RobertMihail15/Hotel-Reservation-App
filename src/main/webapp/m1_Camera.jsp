<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Camere</title> 

        <link href="table.css" rel="stylesheet" type="text/css" media="screen" /> 

	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center">Modifica Camera</h1> 

        <br/> 

       

        <% 

            jb.connect(); 

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey")); 

            ResultSet rs = jb.intoarceLinieDupaId("camere", "idcamera", aux); 

            rs.first(); 

            String tip_camera = rs.getString("tip_camera"); 

            String dotari = rs.getString("dotari"); 

            String numar_camera = rs.getString("numar_camera"); 

            rs.close(); 

            jb.disconnect(); 

        %> 

        <form action="m2_Camera.jsp" method="post"> 

            <table align="center"> 

                <tr> 

                    <td align="right">IdCamera:</td> 

                    <td> <input type="text" name="id_camera" size="30" value="<%= aux%>" readonly/></td> 

                </tr> 

                <tr> 

                    <td align="right">Tip Camera:</td> 

                    <td> <input type="text" name="tip_camera" size="30" value="<%= tip_camera%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Dotari:</td> 

                    <td> <input type="text" name="dotari" size="30" value="<%= dotari%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Numar Camera:</td> 

                    <td> <input type="text" name="numar_camera" size="30" value="<%= numar_camera%>"/></td> 

                </tr> 

            </table><p align="center"> 

                <input type="submit" value="Modifica linia"> 

            </p> 

        </form> 

       <p align="center"> 
    <a href="index.html"><b>Home</b></a> 
    <br/> 
</p> 

    </body> 

</html> 