<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="flughaefen" items="$airports" varStatus="status">{
	
		"id":${flughaefen.kuerzel},
		"ort":${flughaefen.ort}
<c:if test="${not status.last}">,</c:if>
</c:forEach>
]
