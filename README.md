# enpm
ENPM 613 class project
Author: Ankit Tyagi
Last Update: November 06, 2016

### Procedure to initialize the appliation

## Application Requirements
1. GRAILS 2.3.7
2. MySQL Server and some way to manipulate data on it (MySQL Workbench, php admin etc.)
3. An IDE to code (GGTS, Eclipse, Submile Text, Notepad++ etc.)
4. Git to clone this repo to your system
   a. on linux and Mac $git clone https://github.com/ankityagi/enpm.git

## Procedure
1. Clone the repo to your system
2. Copy ~/enmp/elms/config/elms-config.groovy to ~/.grails/
3. Edit the above file - lines 24 and 25 to use your own MySQL username and password. Mine are aces and aces
4. Open command window / terminal at ~/enmp/elms/grails-app 
   a. enter command: $grails run-app -reloading
   b. Grails downloads all dependencies on your systema and the last output should say:  system running on localhost:8080
5. Open browser and go to the address and you should see the login screen
6. For username and passwords go to ~/enmp/elms/grails-app/conf/BootStrap.groovy
   a. There are three account types admin, instructor and student
   b. I have created three fake accounts, one for each.
