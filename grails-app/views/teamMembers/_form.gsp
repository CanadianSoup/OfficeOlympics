<%@ page import="officeolympics.TeamMembers" %>



<div class="fieldcontain ${hasErrors(bean: teamMembersInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="teamMembers.teams.label" default="Teams" />
		
	</label>
	<g:select id="teams" name="teams.id" from="${officeolympics.Team.list()}" optionKey="id" optionValue="teamName" value="${teamMembersInstance?.teams?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamMembersInstance, field: 'playerName', 'error')} required">
	<label for="playerName">
		<g:message code="teamMembers.playerName.label" default="Player Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="playerName" required="" value="${teamMembersInstance?.playerName}"/>

</div>

