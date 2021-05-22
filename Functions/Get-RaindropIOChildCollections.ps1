function Get-RaindropIOChildCollections {
    <#
        .SYNOPSIS
            Gathers Raindrop.io Child Collections
        .DESCRIPTION
            Uses your Token to gather Raindrop.io Child Collections
        .PARAMETER Token
            Token generated to access Raindrop.io
        .EXAMPLE
            Get-RaindropIOChildCollections -Token 'XXXXXXX-XXXXXXXXXX-XXXXXXXXXXXX'
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
        $response = Invoke-RestMethod "https://api.raindrop.io/rest/v1/collections/childrens" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response.items
    } #END

} #FUNCTION