# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
<#
    Create a custom configuration by passing in necessary values
#>
Configuration Sample_xVSTSAgent {
    param 
    (   
        [parameter(Mandatory = $true)] 
        [System.String]
        $Account,

        [System.String]
        $Name = "$env:COMPUTERNAME",

        [System.String]
        $Pool = 'Default',
        
        [parameter(Mandatory = $true)] 
        [pscredential]
        $AccountCredential,

        [pscredential]
        $LogonCredential,
    
        [System.String]
        $AgentDirectory = 'C:\VSTSAgents',

        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [System.Boolean]
        $PrefixComputerName = $false
    )

    Import-DscResource -ModuleName VSTSAgent

    Node 'localhost' {

        xVSTSAgent VSTSAgent {
            Name               = $Name
            Pool               = $Pool
            Account            = $Account
            AccountCredential  = $AccountCredential
            LogonCredential    = $LogonCredential
            AgentDirectory     = $AgentDirectory
            Ensure             = $Ensure
            PrefixComputerName = $PrefixComputerName
        }
    }
}
