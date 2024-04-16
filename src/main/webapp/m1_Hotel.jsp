<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Hoteluri</title> 

        <link href="table.css" rel="stylesheet" type="text/css" media="screen" /> 
        <link rel="stylesheet" href="style.css">

    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center">Modifica Hotelul</h1> 

        <br/> 

        

        <% 

            jb.connect(); 

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey")); 

            ResultSet rs = jb.intoarceLinieDupaId("hoteluri", "idhotel", aux); 

            rs.first(); 

            String nume_hotel = rs.getString("nume_hotel"); 

            String adresa = rs.getString("adresa"); 

            String numar_stele = rs.getString("numar_stele");
            
            String spatii_cazare = rs.getString("spatii_cazare");

            rs.close(); 

            jb.disconnect(); 

        %> 

        <form action="m2_Hotel.jsp" method="post"> 

            <table align="center"> 

                <tr> 

                    <td align="right">IdHotel:</td> 

                    <td> <input type="text" name="idhotel" size="30" value="<%= aux%>" readonly/></td> 

                </tr> 

                <tr> 

                    <td align="right">Nume Hotel:</td> 

                    <td> <input type="text" name="nume_hotel" size="30" value="<%= nume_hotel%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Adresa:</td> 

                    <td> <input type="text" name="adresa" size="30" value="<%= adresa%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Numar Stele:</td> 

                    <td> <input type="text" name="numar_stele" size="30" value="<%= numar_stele%>"/></td> 

                </tr> 
                
                <tr> 

                    <td align="right">Spatii Cazare:</td> 

                    <td> <input type="text" name="spatii_cazare" size="30" value="<%= spatii_cazare%>"/></td> 

                </tr> 
                

            </table><p align="center"> 

                <input type="submit" value="Modifica linia"> 

            </p> 

        </form> 

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

            <br/> 

    </body> 

</html> 