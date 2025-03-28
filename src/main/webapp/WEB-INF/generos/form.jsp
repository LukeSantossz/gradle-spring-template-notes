<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>${genre.id == null ? 'Novo Gênero' : 'Editar Gênero'}</title>
</head>
<body>
    <h1>${genre.id == null ? 'Novo Gênero' : 'Editar Gênero'}</h1>
    
    <form:form modelAttribute="genre" method="post">
        <c:if test="${genre.id != null}">
            <form:hidden path="id"/>
        </c:if>
        
        <div>
            <label for="nome">Nome do Gênero:</label>
            <form:input path="nome" id="nome"/>
            <form:errors path="nome" cssStyle="color: red;"/>
        </div>
        
        <div>
            <input type="submit" value="${genre.id == null ? 'Criar' : 'Atualizar'}">
            <a href="/generos">Cancelar</a>
        </div>
    </form:form>
</body>
</html>