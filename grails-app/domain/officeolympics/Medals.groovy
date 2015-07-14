package officeolympics

class Medals {
	String level
	String sportName
	static belongsTo = [teams: Team]
	static constraints = { teams nullable: true }
}
