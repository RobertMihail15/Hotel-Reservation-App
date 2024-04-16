<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Rezervari</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center"> Tabela Rezervari</h1> 

        <br/> 

   

        <form action="m1_Rezervare.jsp" method="post"> 

            <table border="1" align="center"> 

                <tr class="tablehead"> 

                    <td><b>Mark</b></td> 

                    <td><b>IdRezervare</b></td> 

                    <td><b>IdHotel</b></td> 

                    <td><b>Nume Hotel</b></td> 

                    <td><b>Adresa</b></td> 

                    <td><b>Numar Stele</b></td>
                    
                    <td><b>Spatii Cazare</b></td>  

                    <td><b>IdCamera</b></td> 

                    <td><b>Tip Camera</b></td> 

                    <td><b>Dotari</b></td> 

                    <td><b>Numar Camera</b></td> 

                    <td><b>Data Rezervare</b></td> 

                    <td><b>Suma Rezervare</b></td> 

                    <td><b>Perioada Rezervata</b></td> 

                </tr> 

                <% 

                    jb.connect(); 

                    ResultSet rs = jb.vedeRezervare(); 

                    long x; 

                    while (rs.next()) { 

                        x = rs.getInt("idrezervare"); 

                %> 

                <tr> 

                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td> 

                    <td><%= rs.getInt("idhotel_r")%></td> 

                    <td><%= rs.getString("nume_hotel")%></td> 

                    <td><%= rs.getString("adresa")%></td> 

                    <td><%= rs.getString("numar_stele")%></td> 
                    
                    <td><%= rs.getString("spatii_cazare")%></td> 

                    <td><%= rs.getInt("idcamera_r")%></td> 

                    <td><%= rs.getString("tip_camera")%></td> 

                    <td><%= rs.getString("dotari")%></td> 

                    <td><%= rs.getString("numar_camera")%></td> 

                    <td><%= rs.getDate("data_rezervare")%></td> 

                    <td><%= rs.getString("suma_rezervare")%></td> 

                    <td><%= rs.getString("perioada_rezervata")%></td> 

                    <% 

                        } 

                    %> 

                </tr> 

            </table><br/> 

            <p align="center"> 

                <input type="submit" value="Modifica linia"> 

            </p> 

        </form> 

        <% 

    jb.disconnect();%> 

        

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

           

        </p> 

    </body> 

</html> 