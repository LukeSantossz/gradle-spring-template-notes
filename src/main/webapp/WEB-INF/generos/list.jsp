<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Gêneros</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <h1>Gêneros</h1>
    
    <c:if test="${not empty message}">
        <div style="color: green;">${message}</div>
    </c:if>
    
    <a href="/generos/novo">Novo Gênero</a>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="genero" items="${generos}">
                <tr>
                    <td>${genero.id}</td>
                    <td>${genero.nome}</td>
                    <td>
                        <a href="/generos/editar/${genero.id}">Editar</a>
                        <a href="/generos/excluir/${genero.id}" 
                           onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>