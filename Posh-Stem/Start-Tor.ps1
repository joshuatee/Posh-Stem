
[string]$tor_root = "$(([System.IO.DirectoryInfo]$PSScriptRoot).Parent.FullName)\tor"

$TorExe = "$($tor_root)\Tor\tor.exe"

# torrc is not used, passing all tor's options on the command line
$TorConfig = @{
    AvoidDiskWrites = 1
    ControlPort = 'localhost:10551'
    CookieAuthentication = 1
    DataDirectory = "$($tor_root)\Data\Tor"
    GeoIPFile = "$($tor_root)\Data\Tor\geoip"
    GeoIPv6File = "$($tor_root)\Data\Tor\geoip6"
    #HashedControlPassword 
    Log = "notice file $($tor_root)\Data\Tor\notice.log"
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

