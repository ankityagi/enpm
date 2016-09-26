package elms.auth


class SecUser {

	transient springSecurityService

	String username
	String password
	String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String timezone = "UTC"

	Date dateCreated
	Date lastUpdated
	
	String firstName
	String lastName
	
	
	
	
	static transients = ['springSecurityService']

	static constraints = {
		username email: true, blank: false, unique: true, maxSize: 128
		password blank: false
		email blank: false, nullable: false 
		timezone blank: true, nullable: true, maxsize: 32
		firstName(blank: true, nullable: true)
		lastName(blank: true, nullable: true)
	}

	static mapping = {
		//id generator: 'assigned'
		password column: '`password`'
		autoTimestamp true 
		
		timezone defaultValue: "'UTC'"
		
		dateCreated defaultValue: 'CURRENT_TIMESTAMP'
		lastUpdated defaultValue: 'CURRENT_TIMESTAMP'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole }
	}

	def beforeInsert() {
		email = username
		encodePassword()
	}

	def beforeUpdate() {
		email = username 
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
	String toString(){
		return username
	}
	
}
