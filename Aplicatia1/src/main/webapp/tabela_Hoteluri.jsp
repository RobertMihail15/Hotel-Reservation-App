<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Hoteluri</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center"> Tabela Hoteluri</h1> 

       

      <p align="center">
		<a href="nou_Hotel.jsp"><b>Adauga un nou hotel</b></a>
	</p>
	<p align="center">
		<a href="modifica_Hotel.jsp"><b>Modifica un hotel</b></a>
	</p>

        <form action="sterge_Hotel.jsp" method="post"> 

            <table border="1" align="center"> 

                <tr class="tablehead"> 

                    <td><b>Mark</b></td> 

                    <td><b>IdHotel</b></td> 

                    <td><b>Nume</b></td> 

                    <td><b>Adresa</b></td> 

                    <td><b>Numar Stele</b></td>
                    <td><b>Spatii Cazare</b></td> 

 

                </tr> 

                <% 

                    jb.connect(); 

                    ResultSet rs = jb.vedeTabela("hoteluri"); 

                    long x; 

                    while (rs.next()) { 

                        x = rs.getInt("idhotel"); 

                %> 

                <tr> 

                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td> 

                    <td><%= rs.getString("nume_hotel")%></td> 

                    <td><%= rs.getString("adresa")%></td> 

                    <td><%= rs.getString("numar_stele")%></td> 
                    
                    <td><%= rs.getString("spatii_cazare")%></td> 

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