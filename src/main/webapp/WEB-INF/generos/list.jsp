<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>${genre.id == null ? 'Novo Gênero' : 'Editar Gênero'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>${genre.id == null ? 'Novo Gênero' : 'Editar Gênero'}</h1>
        
        <form:form modelAttribute="genre" method="post">
            <c:if test="${genre.id != null}">
                <form:hidden path="id"/>
            </c:if>
            
            <div class="form-group">
                <label for="nome">Nome do Gênero:</label>
                <form:input path="nome" id="nome"/>
                <form:errors path="nome" cssClass="error"/>
            </div>
            
            <div>
                <input type="submit" value="${genre.id == null ? 'Criar' : 'Atualizar'}" class="btn">
                <a href="/generos" class="btn">Cancelar</a>
            </div>
        </form:form>
    </div>
</body>
</html>