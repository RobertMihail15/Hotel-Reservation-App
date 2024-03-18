<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

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

        

        <br/> 

 

        <% 

            jb.connect(); 

            int aux = java.lang.Integer.parseInt(request.getParameter("idhotel")); 

            String nume_hotel = request.getParameter("nume_hotel"); 

            String adresa = request.getParameter("adresa"); 

            String numar_stele = request.getParameter("numar_stele"); 
            
            String spatii_cazare = request.getParameter("spatii_cazare"); 

 

            String[] valori = {nume_hotel, adresa, numar_stele, spatii_cazare }; 

            String[] campuri = {"nume_hotel", "adresa", "numar_stele", "spatii_cazare"}; 

            jb.modificaTabela("hoteluri", "idhotel", aux, campuri, valori); 

            jb.disconnect(); 

        %> 

        <h1 align="center">Modificarile au fost efectuate !</h1> 
         <p align="center">
		<a href="tabela_Hoteluri.jsp"><b>Vizualizare hoteluri</b></a>
	</p>

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

            <br/> 
</p>
    </body> 
    

</html> 