<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Adauga camera</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <% 

            String tip_camera = request.getParameter("tip_camera"); 

            String dotari = request.getParameter("dotari"); 

            String numar_camera = request.getParameter("numar_camera"); 

            if (tip_camera != null) { 

                jb.connect(); 

                jb.adaugaCamera(tip_camera, dotari, numar_camera); 

                jb.disconnect(); 

        %>  
    

        <p>Datele au fost adaugate.</p>
        
        
        <p align="center">
		<a href="tabela_Camere.jsp"><b>Vizualizare camere</b></a>
	</p>
        
        <% 
        

        } else { 

        %> 

        <h1> Adauga o noua camera</h1> 

        <form action="nou_Camera.jsp" method="post"> 
        <table align="center"> 

          

                <tr> 

                    <td align="right">Tip Camera:</td> 

                    <td> <input type="text" name="tip_camera" size="40" /></td> 

                </tr> 

                <tr> 

                    <td align="right">Dotari:</td> 

                    <td> <input type="text" name="dotari" size="30" /></td> 

                </tr> 

                <tr> 

                    <td align="right">Numar Camera:</td> 

                    <td> <input type="text" name="numar_camera" size="30" /></td> 

                </tr> 

            </table> 

          <p align="center"> 
            <input type="submit" value="Adauga camera"/> 
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