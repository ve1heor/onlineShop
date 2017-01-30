<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Online Shop</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="data:text/css;charset=utf-8," rel="stylesheet" data-href="/resources/css/bootstrap-theme.min.css" id="bs-theme-stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/slides.css" rel="stylesheet">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/myscript.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="">GoodShop</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#ex1">Bird</a></li>
                <li><a href="#second">Man in forrest</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input id="input-search" type="text" class="form-control" placeholder="Search">
                </div>
            </form>
            <sec:authorize access="!isAuthenticated()">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/registration">Sign up</a></li>
                    <li><a data-toggle="modal" data-target="#modalSingIn">Sign in</a></li>
                </ul>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <ul class="nav navbar-nav navbar-right">
                    <li><a><sec:authentication property="principal.username" /></a></li>
                    <li><a href="<c:url value="/logout" />" role="button">Exit</a></li>
                </ul>
            </sec:authorize>
        </div>
    </div>
</nav>

<!-- Modal  -->
<div class="modal fade" id="modalSingIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Заголовок модального окна -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title" id="modalSingInLabel">Sing in</h4>
            </div>
            <!-- Основная часть модального окна, содержащая форму для авторизации -->
            <c:url value="/j_spring_security_check" var="loginUrl" />
            <form action="${loginUrl}" method="post">
                <div class="modal-body">
                        <input type="text" class="form-control" name="j_username" placeholder="Username" autofocus>
                        <input type="password" class="form-control" name="j_password" placeholder="Password">
                </div>
                <!-- Нижняя часть модального окна -->
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">Вход</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="ex1">
    <img class="img" src="/resources/img/parque_tagua_puelo.jpg">
</div>
<div id="second">
    <div class="container">
        <ul id="slides">
            <li class="slide showing"><img class="slide-img" src="/resources/img/parque_tagua_puelo.jpg"></li>
            <li class="slide"><img class="slide-img" src="/resources/img/respira-profundo.jpg"></li>
        </ul>
    </div>
    <div class="buttons">
        <button class="controls" id="previous">&lt;</button>
        <button class="controls" id="next">&gt;</button>
    </div>
</div>
</body>
</html>
