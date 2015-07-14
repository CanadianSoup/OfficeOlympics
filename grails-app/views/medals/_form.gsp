<%@ page import="officeolympics.Medals" %>



<div class="fieldcontain ${hasErrors(bean: medalsInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="medals.teams.label" default="Teams" />
		
	</label>
	<g:select id="teams" name="teams.id" from="${officeolympics.Team.list()}" optionKey="id" optionValue="teamName" value="${medalsInstance?.teams?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medalsInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="medals.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="level" required="" value="${medalsInstance?.level}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medalsInstance, field: 'sportName', 'error')} required">
	<label for="sportName">
		<g:message code="medals.sportName.label" default="Sport Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sportName" required="" value="${medalsInstance?.sportName}"/>

</div>

