<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Registration</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/signin.css" rel="stylesheet">
    <link href="data:text/css;charset=utf-8," rel="stylesheet"
          data-href="/resources/css/bootstrap-theme.min.css" id="bs-theme-stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/myscript.js"></script>
</head>
<body>

<div class="container">
    <form:form class="form-signin" method="post" modelAttribute="userForm">
        <spring:bind path="login">
            <div class="form-group ${status.error ? 'has-error':''}">
                <form:errors path="login"></form:errors>
                <form:input type="text" path="login" class="form-control"
                            placeholder="Login" autofocus="true"></form:input>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error':''}">
                <form:errors path="password"></form:errors>
                <form:input type="text" path="password" class="form-control" placeholder="Password"></form:input>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block">Sumbit</button>

    </form:form>
</div>

</body>
</html>
