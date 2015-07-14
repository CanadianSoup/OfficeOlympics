
<%@ page import="officeolympics.TeamMembers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamMembers.label', default: 'TeamMembers')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-teamMembers" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-teamMembers" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teamMembers">
			
				<g:if test="${teamMembersInstance?.teams}">
				<li class="fieldcontain">
					<span id="teams-label" class="property-label"><g:message code="teamMembers.teams.label" default="Teams" /></span>
					
						<span class="property-value" aria-labelledby="teams-label"><g:link controller="team" action="show" id="${teamMembersInstance?.teams?.id}">${teamMembersInstance?.teams?.teamName.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamMembersInstance?.playerName}">
				<li class="fieldcontain">
					<span id="playerName-label" class="property-label"><g:message code="teamMembers.playerName.label" default="Player Name" /></span>
					
						<span class="property-value" aria-labelledby="playerName-label"><g:fieldValue bean="${teamMembersInstance}" field="playerName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:teamMembersInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${teamMembersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
