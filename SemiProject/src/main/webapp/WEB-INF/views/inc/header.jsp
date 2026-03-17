<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
		
		<c:if test="${empty auth}">
		<h1>Semi Project</h1>
		</c:if>
		<c:if test="${not empty auth and authDto.lv == '1' }">
		<h1 style="color:blue;">Semi Project <small style="font-size: 1rem">${auth}</small></h1>
		</c:if>
		<c:if test="${not empty auth and authDto.lv == '2' }">
		<h1 style="color:tomato;">Semi Project <small style="font-size: 1rem">${auth}</small></h1>
		</c:if>
		
		<ul>
			<li><a href="/semi/index.do">Home</a></li>
			
			<c:if test="${empty auth}">
			<li><a href="/semi/user/register.do">Register</a></li>
			<li><a href="/semi/user/login.do">Login</a></li>
			</c:if>
			
			<c:if test="${not empty auth}">
			<li><a href="/semi/user/unregister.do">Unregister</a></li>
			<li><a href="/semi/user/logout.do">Logout</a></li>
			<li><a href="/semi/user/info.do">Info</a></li>
			</c:if>
			
			<li><a href="/semi/board/list.do">Board</a></li>
			
		</ul>
	</header>