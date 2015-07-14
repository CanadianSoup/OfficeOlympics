<%@ page import="officeolympics.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<g:set var="entityName" value="${message(code: 'medals.label', default: 'Medals')}" />
<title>Office Olympics</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <style>
 


 table{
width:75%
}
table,th, td {
border: 1px solid black;
border-collapse: collapse;
}
th, td {
padding: 5px
}
td {
text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color: black;
    color: white;
}

</style>
  
  </head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Office Olympics</a>
    </div>
    <div>
		<ul class="nav navbar-nav">
			<li class ="active"><a href="${createLink(uri: '/')}">Home</a></li>

			<li><g:link controller="medals" class="create" action="create">New Game Result</g:link></li>

		</ul>
	</div>
   </div>
</nav>


<br>
<br>

<div class="container" height="500">
            
  <table class="table table-striped">
    <thead>
      <tr>
						<g:sortableColumn property="score" title="${message(code: 'team.score.label', default: 'Score')}" />
						
						<th>Team Name</th>
						
						<th>Team Members</th>
						
      </tr>
    </thead>
    <tbody>
	<g:each in="${teamInstanceList}" status="i" var="team">
	
					<tr>
					
						<td><h2><g:link action="show" id="${team.id}">${fieldValue(bean: team, field: "score")}</g:link></h2></td>
					
						<td><h3>${team.teamName}</h3></td>
					<td>
					<ul>
						<g:each var="player" in="${team.members}">
						 <li>${player.playerName}</li>
						</g:each>
						<ul>
						</td>
						
					

					
					</tr>
					</g:each>
					

    </tbody>
  </table>
</div>



			
			<br >
			<br >
			
			
			
<div class="container" height="500">
            
  <table class="table table-striped">
    <thead>
      <tr>
						
						<th>Team Name</th>
						
						<th>Medals</th>
						
      </tr>
    </thead>
    <tbody>
	<g:each in="${teamInstanceList}" status="i" var="team">
	
					<tr>
					
						<td><h3>${team.teamName}</h3></td>
					<td>
					<ul>
						<g:each var="medal" in="${team.medals}">
						 <li>${medal.level} in ${medal.sportName}</li>
						</g:each>
						<ul>
						</td>
						
					

					
					</tr>
					</g:each>
					

    </tbody>
  </table>
</div>


<br>
<br>

<g:form controller="medals" action="save">
<div>
	<label for="teams">
		<g:message code="medals.teams.label" default="Teams" />
		
	</label>
	<g:select id="teams" name="teams.id" from="${officeolympics.Team.list()}" optionKey="id" optionValue="teamName" value="${medalsInstance?.teams?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div>
	<label for="level">
		<g:message code="medals.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="level" required="" value="${medalsInstance?.level}"/>

</div>

<div>
	<label for="sportName">
		<g:message code="medals.sportName.label" default="Sport Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sportName" required="" value="${medalsInstance?.sportName}"/>

</div>
<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
</g:form>



			
			
						
<!--Write Comments here-->



<h2>Week 1 Events</h2>
<h3>
<ul>
<li>Tuesday: Tic Tac Toe Tournament</li>
<li>Wednesday: Hangman </li>
<li>Thursday: Paper Football Distance Competition </li>
<li>Friday: Pictionary</li>
</ul></h3>

<br>
<h2>Week 2 Events</h2>
<h3>
<ul>
<li>Monday: Heads Up</li>
</ul>


<br>
<br>


	

		
		
		

<!--
<div class="cities">
<table id="t01">
  <caption>Team Information</caption>
  <tr>
	<th>Team Name</th>
	<th>Score</th>
	<th colspan="3">Members</th>
	</tr>
	<tr>
    <td>Cayman Island</td>
    <td>2</td>
		<td>Shelby</td>
		<td>Jim</td>
		<td>Eddie</td>
  </tr>
  <tr>
    <td>North America</td>
    <td>4</td> 
	<td>Devin</td>
	<td>Ian</td>
	<td>Jae</td>
  </tr>
  <tr>
    <td>Swiss</td>
    <td>2</td> 
	<td>Haley</td>
	<td>Mike</td>
	<td>Ant</td>
  </tr>
  <tr>
    <td>Antarctica</td>
    <td>4</td> 
	<td>Reagan</td>
	<td>Tina</td>
	<td>Sory</td>
  </tr>
  
</table>
</div>
-->
<hr>
<br>


</body>
</html>
