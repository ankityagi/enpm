package elms.auth

class SecRole {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true, maxSize: 128
	}
}
