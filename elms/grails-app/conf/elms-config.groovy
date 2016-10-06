println "Using elms-config.groovy file at empn/grails-app/conf/"

dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "com.mysql.jdbc.Driver"
}

// default context 
grails.app.context = "/"

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

environments {
    development {

        dataSource {
            url = "jdbc:mysql://localhost/elms?useUnicode=yes&autoReconnect=true&zeroDateTimeBehavior=convertToNull"
            username = "aces"
            password = "aces"
            dbCreate = "update"
        }
    }
    production {
        
        dataSource {
            url = "jdbc:mysql://127.0.0.1/elms?useUnicode=yes&autoReconnect=true&zeroDateTimeBehavior=convertToNull"
            username = "root"
            password = "aces"
            dbCreate = "update"

            properties {
              maxActive = 50
              maxIdle = 25
              minIdle = 1
              initialSize = 1
         
              numTestsPerEvictionRun = 3
              maxWait = 10000
         
              testOnBorrow = true
              testWhileIdle = true
              testOnReturn = true
         
              validationQuery = "select now()"
         
              minEvictableIdleTimeMillis = 1000 * 60 * 5
              timeBetweenEvictionRunsMillis = 1000 * 60 * 5
           }
        }
    }

}

minerva {
    appName = 'elms'
    confirmationEmail = 'ankityagi@gmail.com'
}

