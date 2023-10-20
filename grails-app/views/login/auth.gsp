<%--
  Created by IntelliJ IDEA.
  User: volkram
  Date: 13.01.21
  Time: 22:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card">
            <div class="card-body">
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform"
                      autocomplete="off">
                    <div class="d-flex justify-content-between"><h1 class="mb-1">montega CONNECT</h1><div class="dlex align-self-center"><asset:image src="favicon.ico"/></div></div>
                    <h3 class="mb-5">Backend Login</h3>
                    <g:if test='${flash.message}'>
                        <p class="text-danger">${flash.message}</p>
                    </g:if>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="cil-user"></i>
                            </span>
                        </div>
                        <input class="form-control" type="text" placeholder='Benutzername' name="username"
                               autofocus autocomplete="off">
                    </div>

                    <div class="input-group mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="cil-lock-locked"></i>
                            </span>
                        </div>
                        <input class="form-control" type="password" placeholder="Passwort" name="password">
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <button class="btn btn-primary btn-ladda" data-style="expand-right" type="submit">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
