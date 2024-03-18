<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Rezervari</title> 

        <link href="table.css" rel="stylesheet" type="text/css" media="screen" /> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

       

        <br/> 

      

        <% 

            jb.connect(); 

            int aux = java.lang.Integer.parseInt(request.getParameter("idrezervare")); 

            String idhotel = request.getParameter("idhotel"); 

            String idcamera = request.getParameter("idcamera"); 

            String data_rezervare = request.getParameter("data_rezervare"); 

            String suma_rezervare = request.getParameter("suma_rezervare"); 

            String perioada_rezervata = request.getParameter("perioada_rezervata"); 

 

            String[] valori = {idhotel, idcamera, data_rezervare, suma_rezervare, perioada_rezervata}; 

            String[] campuri = {"idhotel", "idcamera", "data_rezervare", "suma_rezervare", "perioada_rezervata"}; 

            jb.modificaTabela("rezervari", "idrezervare", aux, campuri, valori); 

            jb.disconnect(); 

        %> 

        <h1 align="center">Modificarile au fost efectuate !</h1> 
         <p align="center">
		<a href="tabela_Rezervari.jsp"><b>Vizualizare rezervari</b></a>
	</p>

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

            <br/> 
            </p>

    </body> 

</html> 