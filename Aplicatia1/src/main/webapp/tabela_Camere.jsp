<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Camere</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center"> Tabela Camere</h1> 

        

	<p align="center">
		<a href="nou_Camera.jsp"><b>Adauga o noua camera</b></a>
	</p>
	<p align="center">
		<a href="modifica_Camera.jsp"><b>Modifica o camera</b></a>
	</p>
	

	<form action="sterge_Camera.jsp" method="post"> 

            <table border="1" align="center"> 

                <tr class="tablehead"> 

                    <td><b>Mark</b></td> 

                    <td><b>IdCamera</b></td> 

                    <td><b>Tip Camera</b></td> 

                    <td><b>Dotari</b></td> 

                    <td><b>Numar Camera</b></td> 

 

                </tr> 

                <% 

                    jb.connect(); 

                    ResultSet rs = jb.vedeTabela("camere"); 

                    long x; 

                    while (rs.next()) { 

                        x = rs.getInt("idcamera"); 

                %> 

                <tr> 

                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td> 

                    <td><%= rs.getString("tip_camera")%></td> 

                    <td><%= rs.getString("dotari")%></td> 

                    <td><%= rs.getString("numar_camera")%></td> 

                    <% 

                        } 

                    %> 

                </tr> 

            </table><br/> 

            <p align="center"> 

                <input type="submit" value="Sterge liniile marcate"> 

            </p> 

        </form> 

        <% 

            rs.close(); 

            jb.disconnect(); 

        %> 

       

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

           

        </p> 

    </body> 

</html> 