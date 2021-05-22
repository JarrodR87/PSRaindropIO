function Get-RaindropIOUser {
    <#
        .SYNOPSIS
            Gathers Raindrop.io User Information
        .DESCRIPTION
            Uses your Token to gather Raindrop.io User Information
        .PARAMETER Token
            Token generated to access Raindrop.io
        .EXAMPLE
            Get-RaindropIOUser -Token 'XXXXXXX-XXXXXXXXXX-XXXXXXXXXXXX'
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$Token
    ) 
    BEGIN { 
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "Bearer $Token" )
    } #BEGIN

    PROCESS {
        $response = Invoke-RestMethod "https://api.raindrop.io/rest/v1/user" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response.user
    } #END

} #FUNCTION