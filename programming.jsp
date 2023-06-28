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
        String nombre_completo = request.getParameter("fullname");
		String cedula = request.getParameter("cip");
		String curso = request.getParameter("course");
		String fecha_de_ingreso = request.getParameter("course-start");	        
    %>
    
    <%@page import="java.sql.*" %>
    
    <%
	    String url = "jdbc:mysql://localhost:3306/solo_ciencia";
	    String username = "root";
	    String password = "";
	    
	    // Cadena, con las posiciones de los parámetros
	    String sqlquery = "INSERT INTO curso_programación (Nombre_Completo, Cédula, Curso, Fecha_de_Ingreso) VALUES (?,?,?,?)";

    	try {
	    	// Driver para conectarse a la base de Datos
	    	Class.forName("com.mysql.jdbc.Driver");
	    	
	    	// Declarar la conexion a la base de datos
	    	Connection dbconnect = DriverManager.getConnection(url, username, password);
	    	    	
	    	// Consulta Predefinida
	    	PreparedStatement consultaForm = dbconnect.prepareStatement(sqlquery);
	    	
	    	// Establecer los valores de los parámetros
	    	consultaForm.setString(1, nombre_completo);
	    	consultaForm.setString(2, cedula);
	    	consultaForm.setString(3, curso);
	    	consultaForm.setString(4, fecha_de_ingreso);
 	
	    	// Verificar si se actualizaron los datos (la llamada correcta es sin parámetro)
	    	int actualizacion = consultaForm.executeUpdate();
	    	
	    	if (actualizacion > 0) {
	    	    System.out.println("El registro se actualizó correctamente.");
	    	    response.sendRedirect("home.html");
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
