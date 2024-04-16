<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

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

     

        <br/> 

        

        <%
jb.connect();
        System.out.println("Connected to the database."); // Add this line

String idCameraParameter = request.getParameter("idcamera");
int aux = 0; // Default value or any other suitable default value

if (idCameraParameter != null && !idCameraParameter.isEmpty()) {
    try {
        aux = Integer.parseInt(idCameraParameter);
    } catch (NumberFormatException e) {
        // Handle the exception, e.g., log it or provide a default value
        e.printStackTrace();
    }
}

String tip_camera = request.getParameter("tip_camera");
String dotari = request.getParameter("dotari");
String numar_camera = request.getParameter("numar_camera");

String[] valori = {tip_camera, dotari, numar_camera};
String[] campuri = {"tip_camera", "dotari", "numar_camera"};

try {
    jb.modificaTabela("camere", "idcamera", aux, campuri, valori);
    System.out.println("Update successful.");
} catch (Exception e) {
    e.printStackTrace();
}

jb.disconnect();
%>

        <h1 align="center">Modificarile au fost efectuate !</h1> 
        <p align="center">
		<a href="tabela_Camere.jsp"><b>Vizualizare camere</b></a>
	</p>

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 

            <br/> 
            </p>

    </body> 

</html> 