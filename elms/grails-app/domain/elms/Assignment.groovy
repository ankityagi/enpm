package elms

import elms.auth.SecUser
import elms.auth.SecRole
import java.util.Date

class Assignment {
    String name
    String description
    
    Date dateCreated
    Date lastUpdated
    Date deadLineDate
    double maxScore
    boolean isPublished
    SecUser creator
    SecUser instructor

    static hasMany = [grades:Gradebook]

    static constraints = {
        creator(blank:false, nullable: false)
        instructor(blank:true, nullable: true)
        name(blank: false, nullable: false)
        description(blank: true, nullable: true)

    }

    static mapping = {
        description type: 'text'
        isPublished defaultValue: '0'
    }

    String toString(){
        return name;
    }
}