package elms

import elms.auth.SecUser
import elms.auth.SecRole
import java.util.Date

class Document {
    
    String filename
    String fullPath
    String description
    SecUser creator
    Date uploadDate = new Date()
    Course course
    String type // assignment or module
    int typeId
    
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
        description(blank:true,nullable:true)
    }

    // int orgId
    
    String toString(){
        return filename;
    }
}