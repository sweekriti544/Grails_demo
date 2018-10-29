<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/21/2018
  Time: 8:50 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
    .login-page {
        width: 360px;
        padding: 8% 0 0;
        margin: auto;
    }
    .form {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 360px;
        margin: 0 auto 100px;
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }
    .form input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }
    .form button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #e7d6ff;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        -webkit-transition: all 0.3 ease;
        transition: all 0.3 ease;
        cursor: pointer;
    }
    .form button:hover,.form button:active,.form button:focus {
        background: #9491a3;
    }
    .form .message {
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
    }
    .form .message a {
        color: #4CAF50;
        text-decoration: none;
    }
    .form .register-form {
        display: none;
    }
    .container {
        position: relative;
        z-index: 1;
        max-width: 300px;
        margin: 0 auto;
    }
    .container:before, .container:after {
        content: "";
        display: block;
        clear: both;
    }
    .container .info {
        margin: 50px auto;
        text-align: center;
    }
    .container .info h1 {
        margin: 0 0 15px;
        padding: 0;
        font-size: 36px;
        font-weight: 300;
        color: #1a1a1a;
    }
    .container .info span {
        color: #4d4d4d;
        font-size: 12px;
    }
    .container .info span a {
        color: #000000;
        text-decoration: none;
    }
    .container .info span .fa {
        color: #EF3B3A;
    }
    body {
        background: #e7d6ff; /* fallback for old browsers */
        background: -webkit-linear-gradient(right, #e7d6ff, #e7d6ff);
        background: -moz-linear-gradient(right, #e7d6ff, #e7d6ff);
        background: -o-linear-gradient(right, #e7d6ff, #e7d6ff);
        background: linear-gradient(to left, #e7d6ff, #e7d6ff);
        font-family: "Roboto", sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    </style>

</head>

<body>

<div class="login-page">
    <h1 style="color: #c58c74"> Login Page </h1>
    <div class="form">
        <form class="register-form">
            Username  <input type="text" placeholder="userame"/>
            Password  <input type="password" placeholder="password"/>

            <button>Login</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form>
        <g:form class="login-form" controller="user" action="home">

            <input type="text" placeholder="name" name="name" required/>
            <input type="password" placeholder="password" name="password" required/>
            <button type="submit">login</button>

        </g:form>
    </div>
</div>

</body>
</html>