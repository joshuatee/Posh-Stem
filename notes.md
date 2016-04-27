    
###TODO!:

1. Check license requirements 

----------------------------------

----------------------------------

TOR C# application
https://lists.torproject.org/pipermail/tor-dev/2014-December/007983.html

1. Compile tor.exe from source, or copy it from the latest Tor Browser
Bundle (your app won't need to execute the Tor Browser).

2. Launch tor.exe from within your app, using command-line arguments
to pass the location of the config file and the PID of the controlling
process (i.e. your app). The complete command will look something like
this:

/path/to/tor.exe -f /path/to/config __OwningControllerProcess <pid>

3. Control tor.exe via the local control port using the Tor control
protocol. There's a Java library that implements this protocol, but I
don't know of a C# library, so you may need to write your own using
the Java library as guidance. You can set the control port in the
config file so it doesn't conflict with the Tor Browser.

You should use the AUTHENTICATE command to prevent other apps from
accessing the control port, and the TAKEOWNERSHIP command to ensure
tor.exe exits when your app exits.

https://gitweb.torproject.org/torspec.git/plain/control-spec.txt
https://github.com/guardianproject/jtorctl

4. Communicate over Tor by connecting to the local SOCKS port. You can
set this port in the config file so it doesn't conflict with the Tor
Browser.