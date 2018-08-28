<%--
  Created by IntelliJ IDEA.
  User: hp dv4
  Date: 8/27/2018
  Time: 3:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link controller="user" action="home"><g:message code="default.home.label"/></a></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li><g:link controller='user' action='logout'>Logout</g:link></li>
    </ul>
</div>
<h1> Welcome to The Homepage!! </h1>
</body>
</html>