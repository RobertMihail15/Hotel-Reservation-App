<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Adauga Hotel</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <% 

            String nume_hotel = request.getParameter("nume_hotel"); 

            String adresa = request.getParameter("adresa"); 

            String numar_stele = request.getParameter("numar_stele"); 
            
            String spatii_cazare = request.getParameter("spatii_cazare"); 

            if (nume_hotel != null) { 

                jb.connect(); 

                jb.adaugaHotel(nume_hotel, adresa, numar_stele, spatii_cazare); 

                jb.disconnect(); 

        %> 

        <p>Datele au fost adaugate.</p>
        
          <p align="center">
		<a href="tabela_Hoteluri.jsp"><b>Vizualizare hoteluri</b></a>
	</p>
        
        
        <% 

        } else { 

        %> 

        <h1> Adauga un nou hotel</h1> 

        <form action="nou_Hotel.jsp" method="post"> 

            <table align="center"> 

                <tr> 

                    <td align="right">Nume Hotel:</td> 

                    <td> <input type="text" name="nume_hotel" size="40" /></td> 

                </tr> 

                <tr> 

                    <td align="right">Adresa:</td> 

                    <td> <input type="text" name="adresa" size="30" /></td> 

                </tr> 

                <tr> 
    <td align="right">Numar Stele:</td> 
    <td> <input type="text" name="numar_stele" size="30" /></td>
</tr> <!-- Add the missing closing </tr> tag here -->

<tr>
    <td align="right">Spatii Cazare:</td> 
    <td> <input type="text" name="spatii_cazare" size="30" /></td> 
</tr>  

            </table> 

            <p align="center"> 
            <input type="submit" value="Adauga hotelul"/> 
			</p>
			
        </form> 

        <% 

            } 

        %> 

        
        <p align="center"> 
        <a href="index.html"><b>Home</b></a> 
		</p>
        

    </body> 

</html> 