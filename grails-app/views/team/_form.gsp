<%@ page import="officeolympics.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="team.members.label" default="Members" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.members?}" var="m">
    <li><g:link controller="teamMembers" action="show" id="${m.id}">${m?.playerName.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="teamMembers" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamMembers.label', default: 'TeamMembers')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="team.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${teamInstance.score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamName', 'error')} required">
	<label for="teamName">
		<g:message code="team.teamName.label" default="Team Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="teamName" required="" value="${teamInstance?.teamName}"/>

</div>

