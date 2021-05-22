function Get-RaindropIOUserStats {
    <#
        .SYNOPSIS
            Gathers Raindrop.io User Stats
        .DESCRIPTION
            Uses your Token to gather Raindrop.io User Information and Bookmark statistics
        .PARAMETER Token
            Token generated to access Raindrop.io
        .EXAMPLE
            Get-RaindropIOUserStats -Token 'XXXXXXX-XXXXXXXXXX-XXXXXXXXXXXX'
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$Token
    ) 
    BEGIN { 
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "Bearer $Token" )

        $RaindropIOUserStats = @()
    } #BEGIN

    PROCESS {
        $response = Invoke-RestMethod "https://api.raindrop.io/rest/v1/user/stats" -Method 'GET' -Headers $headers -Body $body

        $Row = New-Object PSObject
        $Row | Add-Member -MemberType noteproperty -Name "ProAccount" -Value $response.meta.pro
        $Row | Add-Member -MemberType noteproperty -Name "ID" -Value $response.meta._id
        $Row | Add-Member -MemberType noteproperty -Name "ChangedBookmarksDate" -Value $response.meta.changedBookmarksDate
        $Row | Add-Member -MemberType noteproperty -Name "BrokenBookmarks" -Value $response.meta.broken.count
        $Row | Add-Member -MemberType noteproperty -Name "DuplicateBookmarks" -Value $response.meta.duplicates.count

        $RaindropIOUserStats += $Row
    } #PROCESS

    END { 
        $RaindropIOUserStats
    } #END

} #FUNCTION