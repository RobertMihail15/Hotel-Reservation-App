<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Adauga rezervare</title> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <% 

            int idhotel, idcamera; 

            String id1, id2, nume_hotel, adresa, numar_stele, spatii_cazare, tip_camera, dotari, numar_camera, data_rezervare, suma_rezervare, perioada_rezervata; 

            id1 = request.getParameter("idhotel"); 

            id2 = request.getParameter("idcamera"); 

            data_rezervare = request.getParameter("data_rezervare"); 

            suma_rezervare = request.getParameter("suma_rezervare"); 

            perioada_rezervata = request.getParameter("perioada_rezervata"); 

            if (id1 != null) { 

                jb.connect(); 

                jb.adaugaRezervare(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), data_rezervare, suma_rezervare, perioada_rezervata); 

                jb.disconnect(); 

        %> 

        <p>Datele au fost adaugate.</p>
        
          <p align="center">
		<a href="tabela_Rezervari.jsp"><b>Vizualizare rezervari</b></a>
	</p>
        
        
        <% 

        } else { 

        jb.connect(); 

        ResultSet rs1 = jb.vedeTabela("hoteluri"); 

        ResultSet rs2 = jb.vedeTabela("camere"); 

        %> 

        <h1> Adauga o noua rezervare</h1> 

        <form action="nou_Rezervare.jsp" method="post"> 

            <table align="center"> 

                <tr> 

                    <td align="right">IdHotel:</td> 

                    <td>  

                        Selectati hotelul: 

<SELECT NAME="idhotel"> 

                                <% 

                                    while(rs1.next()){ 

                                        idhotel = rs1.getInt("idhotel"); 

                                        nume_hotel = rs1.getString("nume_hotel"); 

                                        adresa = rs1.getString("adresa"); 

                                        numar_stele = rs1.getString("numar_stele"); 
                                        
                                        spatii_cazare = rs1.getString("spatii_cazare");

                                %> 

                                    <OPTION VALUE="<%= idhotel%>"><%= idhotel%>,<%= nume_hotel%>,<%= adresa%>,<%= numar_stele%>,<%= spatii_cazare%></OPTION> 

                                <% 

                                    } 

                                %> 

</SELECT> 

                     

                    </td> 

                </tr> 

                <tr> 

                    <td align="right">IdCamera:</td> 

                    <td>  

                        Selectati camera: 

<SELECT NAME="idcamera"> 

<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION --> 

                                <% 

                                    while(rs2.next()){ 

                                        idcamera = rs2.getInt("idcamera"); 

                                        tip_camera = rs2.getString("tip_camera"); 

                                        dotari = rs2.getString("dotari"); 

                                        numar_camera = rs2.getString("numar_camera"); 

                                %> 

                                    <OPTION VALUE="<%= idcamera%>"><%= idcamera%>,<%= tip_camera%>,<%= dotari%>,<%= numar_camera%></OPTION> 

                                <% 

                                    } 

                                %> 

</SELECT> 

                     </td> 

                </tr> 

                <tr> 

                    <td align="right">Data rezervare:</td> 

                    <td> <input type="text" name="data_rezervare" size="30" /></td> 

                </tr> 

                <tr> 

                    <td align="right">Suma rezervare:</td> 

                    <td> <input type="text" name="suma_rezervare" size="30" /></td> 

                </tr> 

                <tr> 

                    <td align="right">Perioada rezervata:</td> 

                    <td> <input type="text" name="perioada_rezervata" size="30" /></td> 

                </tr> 

            </table> 

            <p align="center"> 
            <input type="submit" value="Adauga rezervarea"/> 
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