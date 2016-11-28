package elms

import elms.auth.SecUser
import elms.auth.SecRole
import java.util.Date

class Gradebook {
    
    Date dateCreated
    Date lastUpdated
    SecUser creator
    int score

    static belongsTo = [students:SecUser, courses:Course, assignments:Assignment]

    static constraints = {
        creator(blank:false, nullable: false)
    }

    // static mappings = {
    //     score defaultValue: '0'
    // }

    
}