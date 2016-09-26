package elms

import elms.auth.SecUser
import elms.auth.SecRole
import java.util.Date

class Message {
    
    Date dateCreated
    Date lastUpdated
    String body
    String subject

    SecUser creator
    SecUser from
    SecUser to


    static constraints = {
        creator(blank:false, nullable: false)
        from(blank:false, nullable: false)
        to(blank:false, nullable: false)
        body(blank:true, nullable:true)
        subject(blank:true, nullable:true)
    }
    static mapping = {
        body type: 'text'
        subject type: 'text'
    }

    String toString() {
        return subject;
    }
}