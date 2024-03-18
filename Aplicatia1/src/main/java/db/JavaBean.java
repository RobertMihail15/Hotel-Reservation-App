/* 

 * Curs5_Eclipse - Valentin Pupezescu 

 */ 

package db; 



import java.sql.*; 



/** 

 * 

 * @author vali 

 */ 

public class JavaBean { 



	String error; 

	Connection con; 



	public JavaBean() { 

	} 



	public void connect() throws ClassNotFoundException, SQLException, Exception { 

		try { 

			Class.forName("com.mysql.cj.jdbc.Driver"); 

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/robert?useSSL=false", "root", "1234"); 

		} catch (ClassNotFoundException cnfe) { 

			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date."; 

			throw new ClassNotFoundException(error); 

		} catch (SQLException cnfe) { 

			error = "SQLException: Nu se poate conecta la baza de date."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date."; 

			throw new Exception(error); 

		} 

	} // connect() 



	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception { 

		try { 

			Class.forName("com.mysql.cj.jdbc.Driver"); 

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "1234"); 

		} catch (ClassNotFoundException cnfe) { 

			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date."; 

			throw new ClassNotFoundException(error); 

		} catch (SQLException cnfe) { 

			error = "SQLException: Nu se poate conecta la baza de date."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date."; 

			throw new Exception(error); 

		} 

	} // connect(String bd) 



	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception { 

		try { 

			Class.forName("com.mysql.cj.jdbc.Driver"); 

			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "1234"); 

		} catch (ClassNotFoundException cnfe) { 

			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date."; 

			throw new ClassNotFoundException(error); 

		} catch (SQLException cnfe) { 

			error = "SQLException: Nu se poate conecta la baza de date."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date."; 

			throw new Exception(error); 

		} 

	} // connect(String bd, String ip) 



	public void disconnect() throws SQLException { 

		try { 

			if (con != null) { 

				con.close(); 

			} 

		} catch (SQLException sqle) { 

			error = ("SQLException: Nu se poate inchide conexiunea la baza de date."); 

			throw new SQLException(error); 

		} 

	} // disconnect() 



	public void adaugaCamera(String tip_camera, String dotari, String numar_camera) 

			throws SQLException, Exception { 

		if (con != null) { 

			try { 

				// creaza un "prepared SQL statement" 

				Statement stmt; 

				stmt = con.createStatement(); 

				stmt.executeUpdate("insert into camere(tip_camera, dotari, numar_camera) values('" + tip_camera + "'  , '" + dotari + "', '" + numar_camera + "');"); 



			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of adaugaPacient() 



	public void adaugaHotel(String nume_hotel, String adresa, String numar_stele, String spatii_cazare) 

			throws SQLException, Exception { 

		if (con != null) { 

			try { 

				// creaza un "prepared SQL statement" 

				Statement stmt; 

				stmt = con.createStatement(); 

				stmt.executeUpdate("insert into hoteluri(nume_hotel, adresa, numar_stele, spatii_cazare) values('" + nume_hotel + "'  , '" + adresa + "', '" + numar_stele + "', '" + spatii_cazare + "' );"); 



			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of adaugaMedic() 



	public void adaugaRezervare(int idhotel, int idcamera, String data_rezervare, String suma_rezervare, String perioada_rezervata) 

			throws SQLException, Exception { 

		if (con != null) { 

			try { 

				// creaza un "prepared SQL statement" 

				Statement stmt; 

				stmt = con.createStatement(); 

				stmt.executeUpdate("insert into rezervari(idhotel, idcamera, data_rezervare, suma_rezervare, perioada_rezervata) values('" + idhotel + "'  , '" + idcamera + "', '" + data_rezervare + "', '" + suma_rezervare + "', '" + perioada_rezervata + "');"); 

				// se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului: 

				// stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');"); 



			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of adaugaConsultatie() 



	public ResultSet vedeTabela(String tabel) throws SQLException, Exception { 

		ResultSet rs = null; 

		try { 

			String queryString = ("select * from `robert`.`" + tabel + "`;"); 

			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/); 

			rs = stmt.executeQuery(queryString); 

		} catch (SQLException sqle) { 

			error = "SQLException: Interogarea nu a fost posibila."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "A aparut o exceptie in timp ce se extrageau datele."; 

			throw new Exception(error); 

		} 

		return rs; 

	} // vedeTabela() 



	public ResultSet vedeRezervare() throws SQLException, Exception { 

		ResultSet rs = null; 

		try { 

			String queryString = ("select h.nume_hotel, h.adresa, h.numar_stele, h.spatii_cazare, c.tip_camera, c.dotari, c.numar_camera, r.idrezervare, r.idhotel idhotel_r, r.idcamera idcamera_r, r.data_rezervare, r.suma_rezervare, r.perioada_rezervata from hoteluri h, camere c, rezervari r where h.idhotel = r.idhotel and c.idcamera = r.idcamera;"); 

			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/); 

			rs = stmt.executeQuery(queryString); 

		} catch (SQLException sqle) { 

			error = "SQLException: Interogarea nu a fost posibila."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "A aparut o exceptie in timp ce se extrageau datele."; 

			throw new Exception(error); 

		} 

		return rs; 

	} // vedeConsultatie() 



	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception { 

		if (con != null) { 

			try { 

				// creaza un "prepared SQL statement" 

				long aux; 

				PreparedStatement delete; 

				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;"); 

				for (int i = 0; i < primaryKeys.length; i++) { 

					aux = java.lang.Long.parseLong(primaryKeys[i]); 

					delete.setLong(1, aux); 

					delete.execute(); 

				} 

			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} catch (Exception e) { 

				error = "A aparut o exceptie in timp ce erau sterse inregistrarile."; 

				throw new Exception(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of stergeDateTabela() 



	public void stergeTabela(String tabela) throws SQLException, Exception { 

		if (con != null) { 

			try { 

				// creaza un "prepared SQL statement" 

				Statement stmt; 

				stmt = con.createStatement(); 

				stmt.executeUpdate("delete from " + tabela + ";"); 

			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of stergeTabela() 



	public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception { 

		String update = "update " + tabela + " set "; 

		String temp = ""; 

		if (con != null) { 

			try { 

				for (int i = 0; i < campuri.length; i++) { 

					if (i != (campuri.length - 1)) { 

						temp = temp + campuri[i] + "='" + valori[i] + "', "; 

					} else { 

						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';"; 

					} 

				} 

				update = update + temp; 

				// creaza un "prepared SQL statement" 

				Statement stmt; 

				stmt = con.createStatement(); 

				stmt.executeUpdate(update); 

			} catch (SQLException sqle) { 

				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate."; 

				throw new SQLException(error); 

			} 

		} else { 

			error = "Exceptie: Conexiunea cu baza de date a fost pierduta."; 

			throw new Exception(error); 

		} 

	} // end of modificaTabela() 



	public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception { 

		ResultSet rs = null; 

		try { 

			// Executa interogarea 

			String queryString = ("SELECT * FROM " + tabela + " where idhotel=" + ID + ";"); 

			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 

			rs = stmt.executeQuery(queryString); //sql exception 

		} catch (SQLException sqle) { 

			error = "SQLException: Interogarea nu a fost posibila."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "A aparut o exceptie in timp ce se extrageau datele."; 

			throw new Exception(error); 

		} 

		return rs; 

	} // end of intoarceLinie() 



	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception { 

		ResultSet rs = null; 

		try { 

			// Executa interogarea 

			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";"); 

			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 

			rs = stmt.executeQuery(queryString); //sql exception 

		} catch (SQLException sqle) { 

			error = "SQLException: Interogarea nu a fost posibila."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "A aparut o exceptie in timp ce se extrageau datele."; 

			throw new Exception(error); 

		} 

		return rs; 

	} // end of intoarceLinieDupaId() 



	public ResultSet intoarceRezervareId(int ID) throws SQLException, Exception { 

		ResultSet rs = null; 

		try { 

			// Executa interogarea 

			String queryString = ("SELECT h.nume_hotel, h.adresa, h.numar_stele, h.spatii_cazare, c.tip_camera, c.dotari, c.numar_camera, r.idrezervare, r.idhotel idhotel_r, r.idcamera idcamera_r, r.data_rezervare, r.suma_rezervare, r.perioada_rezervata FROM hoteluri h, camere c, rezervari r WHERE h.idhotel = r.idhotel AND c.idcamera = r.idcamera and idrezervare = '" + ID + "';"); 

			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 

			rs = stmt.executeQuery(queryString); //sql exception 

		} catch (SQLException sqle) { 

			error = "SQLException: Interogarea nu a fost posibila."; 

			throw new SQLException(error); 

		} catch (Exception e) { 

			error = "A aparut o exceptie in timp ce se extrageau datele."; 

			throw new Exception(error); 

		} 

		return rs; 

	} // end of intoarceLinieDupaId() 

} 