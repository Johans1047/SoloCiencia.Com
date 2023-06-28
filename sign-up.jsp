<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro | SoloCiencia.com</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<% // Crear las variables para la entrada del formulario (con id o name)
        String nombre = request.getParameter("fname");
		String apellido = request.getParameter("lname");
		String edad = request.getParameter("birthdate");
		String contraseña = request.getParameter("pass");	        
    %>
    
    <%@page import="java.sql.*" %>
    
    <%
	    String url = "jdbc:mysql://localhost:3306/solo_ciencia";
	    String username = "root";
	    String password = "";
	    
	    // Cadena, con las posiciones de los parámetros
	    String sqlquery = "INSERT INTO registro (Nombre, Apellido, Edad, Contraseña) VALUES (?,?,?,?)";

    	try {
	    	// Driver para conectarse a la base de Datos
	    	Class.forName("com.mysql.jdbc.Driver");
	    	
	    	// Declarar la conexion a la base de datos
	    	Connection dbconnect = DriverManager.getConnection(url, username, password);
	    	    	
	    	// Consulta Predefinida
	    	PreparedStatement consultaForm = dbconnect.prepareStatement(sqlquery);
	    	
	    	// Establecer los valores de los parámetros
	    	consultaForm.setString(1, nombre);
	    	consultaForm.setString(2, apellido);
	    	consultaForm.setString(3, edad);
	    	consultaForm.setString(4, contraseña);
 	
	    	// Verificar si se actualizaron los datos (la llamada correcta es sin parámetro)
	    	int actualizacion = consultaForm.executeUpdate();
	    	
	    	if (actualizacion > 0) {
	    	    System.out.println("El registro se actualizó correctamente.");
	    	    response.sendRedirect("index.html");
	    	} else {
	    	    System.out.println("No se pudo actualizar el registro.");
	    	}
    	
    	} catch (Exception e)
    	{
    		out.println("--ERROR--");
    		out.println("--Consulta Inválida--");
    	
    	}
    	
    %>
</body>
</html>
