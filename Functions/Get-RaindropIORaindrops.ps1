function Get-RaindropIORaindrops {
    <#
        .SYNOPSIS
            Gathers Raindrop.io Raindrops from the specified Collection
        .DESCRIPTION
            Uses your Token to gather Raindrop.io Raindrops from the specified Collection
        .PARAMETER Token
            Token generated to access Raindrop.io
        .PARAMETER Token
            Collection ID to list Raindrops for
        .EXAMPLE
            Get-RaindropIORaindrops -Token 'XXXXXXX-XXXXXXXXXX-XXXXXXXXXXXX' -CollectionID 'XXXXXXX'
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$Token,
        [Parameter(Mandatory = $true)]$CollectionID
    ) 
    BEGIN { 
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "Bearer $Token" )
    } #BEGIN

    PROCESS {
        $response = Invoke-RestMethod "https://api.raindrop.io/rest/v1/raindrops/$CollectionID" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response.items
    } #END

} #FUNCTION