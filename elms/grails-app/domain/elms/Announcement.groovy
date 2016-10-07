package elms

import elms.auth.SecUser
import elms.auth.SecRole
import java.util.Date

class Announcement {
    String name
    String description
    
    Date dateCreated
    Date lastUpdated
    SecUser creator
    SecUser instructor

    static constraints = {
        creator(blank:false, nullable: false)
        instructor(blank:true, nullable: true)
        description(blank: true, nullable: true)
    }
    static mapping = {
        description type: 'text'
    }

    String toString(){
        return name;
    }
}