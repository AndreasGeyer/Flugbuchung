<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="flughaefen" items="${airports}" varStatus="status">{
	
		"id":${flughaefen.id},
		"ort":"${flughaefen.ort}",
		"land":"${flughaefen.land}",
		"kuerzel":"${flughaefen.kuerzel}"

}<c:if test="${not status.last}">,</c:if>
</c:forEach>
]
