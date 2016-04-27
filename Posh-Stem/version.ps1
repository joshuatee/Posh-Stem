<#
.SYNOPSIS 
    Tor versioning information and requirements for its features.
.DESCRIPTION
    Tor versioning information and requirements for its features.
.EXAMPLE
    print(my_version)
.NOTES
    Copyright 2011-2016, joshuatee
    See LICENSE for licensing information
    
    Based on Stem,a Python controller library for Tor.
    https://stem.torproject.org/
    
    Copyright 2011-2016, Damian Johnson and The Tor Project
    See LICENSE for licensing information
#>


#Requires -Version 5.1
Set-StrictMode -Version Latest


# cache for the Get-SystemTorVersion
[Version]$Version_Cache = $null

<#
.Synopsis
    Queries tor for its version.
.DESCRIPTION
    Queries tor for its version. This is os dependent, only working on linux,
    osx, and bsd.
.EXAMPLE
    Example of how to use this cmdlet
#> 
function Get-SystemTorVersion ()
{
    [CmdletBinding()]
    [OutputType([Version])]
    Param
        (
            # Command used to run tor
            [Parameter()]
            [string]$TorCmd
        )
    Process
    {
        Write-Error "Not implemented!"
    }
}





