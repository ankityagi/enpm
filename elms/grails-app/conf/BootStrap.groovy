import elms.auth.SecRole
import elms.auth.SecUser
import elms.auth.SecUserSecRole
import grails.util.Environment


class BootStrap {
    def dataSource
    def mailService
    def grailsApplication

    def init = { servletContext ->

        // create roles
        def roleAdmin = SecRole.findByAuthority('ROLE_ADMIN') ?:
                new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
        def roleStudent = SecRole.findByAuthority('ROLE_STUDENT') ?:
                new SecRole(authority: 'ROLE_STUDENT').save(failOnError: true)
        def roleInstructor = SecRole.findByAuthority('ROLE_INSTRUCTOR') ?:
                new SecRole(authority: 'ROLE_INSTRUCTOR').save(failOnError: true)

        // create default administrator user
        def userAdmin = SecUser.findByUsername('admin@umd.edu') ?: new SecUser(
                username: 'admin@umd.edu',
                email: 'admin@umd.edu',
                password: '#elms!admin#',
                enabled: true).save(failOnError: true)

        // make sure the 'admin' user is an administrator
        if (!userAdmin.authorities.contains(roleAdmin))
            SecUserSecRole.create userAdmin, roleAdmin

        // create a default regular user
        def userStudent = SecUser.findByUsername('student1@umd.edu') ?: new SecUser(
                username: 'student1@umd.edu',
                email: 'student1@umd.edu',
                password: '#elms123!',
                enabled: true).save(failOnError: true)

        // make sure the 'elms' user is a regular user
        if (!userStudent.authorities.contains(roleStudent))
            SecUserSecRole.create userStudent, roleStudent

        // create a default instructor user
        def userTeacher = SecUser.findByUsername('teacher1@umd.edu') ?: new SecUser(
                username: 'teacher1@umd.edu',
                email: 'teacher1@umd.edu',
                password: '#elms123!',
                enabled: true).save(failOnError: true)

        // make sure the 'elms' user is a regular user
        if (!userTeacher.authorities.contains(roleInstructor))
            SecUserSecRole.create userTeacher, roleInstructor

        


    }

    def destroy = {
    }
}
