
$TorExe = "$($PSScriptRoot)\..\tor\Tor\tor.exe"

# torrc is not used, passing all tor's options on the command line
$TorConfig = @{
    AvoidDiskWrites = 1
    ControlPort = 'localhost:10551'
    CookieAuthentication = 1
    DataDirectory = "$($PSScriptRoot)\..\tor\Data\Tor"
    GeoIPFile = "$($PSScriptRoot)\..\tor\Data\Tor\geoip"
    GeoIPv6File = "$($PSScriptRoot)\..\tor\Data\Tor\geoip6"
    #HashedControlPassword 16:872860B76453A77D60CA2BB8C1A7042072093276A3D701AD684053EC4C
    Log = "notice file $($PSScriptRoot)\..\tor\Data\Tor\notice.log"
    #SocksPort = '9550 IPv6Traffic PreferIPv6'
    SOCKSPort = 'localhost:10550'
    TruncateLogFile = 1
}

# a string to hold tor's options
$tor_opts = ''
$tor_opts += $TorConfig.GetEnumerator() |ForEach-Object {
    "--$($PSItem.Key) `"$($PSItem.Value)`""
}

$tor = Start-Process $TorExe -ArgumentList "$tor_opts" -PassThru -NoNewWindow