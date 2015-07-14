
<%@ page import="officeolympics.Medals" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medals.label', default: 'Medals')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medals" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medals" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="medals.teams.label" default="Teams" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'medals.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="sportName" title="${message(code: 'medals.sportName.label', default: 'Sport Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medalsInstanceList}" status="i" var="medalsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medalsInstance.id}">${fieldValue(bean: medalsInstance, field: "teams.teamName")}</g:link></td>
					
						<td>${fieldValue(bean: medalsInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: medalsInstance, field: "sportName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medalsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
