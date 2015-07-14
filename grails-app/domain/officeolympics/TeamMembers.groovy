package officeolympics

class TeamMembers {
	String playerName
	static belongsTo = [teams: Team]
	static constraints = { teams nullable: true }
	String toString() {return playerName}
	
}
