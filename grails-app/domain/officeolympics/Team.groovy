package officeolympics

class Team {
	
		String teamName
		Integer score
		static hasMany = [members: TeamMembers, medals: Medals]
		
   
   
}
