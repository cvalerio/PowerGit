function Clear-Local-Git-Branches {
    $command = "git --no-pager branch -l --merged"
    $branches = Invoke-Expression $command | where { !($_ -match "master") } 
    if($branches.Count -eq 0)
    {
        echo "No local merged branches found"
        return
    }
    echo "This will delete all these local merged branches:"
    echo $branches
    $confirm = Read-Host -Prompt "Do you wish to continue? [Y/n]"
    if ($confirm.ToUpperInvariant() -eq "Y") {
        Invoke-Expression $command | where { !($_ -match "master") } | foreach { git branch -D "$($_.Trim())" }
    }
}

function Clear-Remote-Git-Branches {
    $command = "git --no-pager branch -r --merged"
    $branches = Invoke-Expression $command | where { !($_ -match "master") } 
    if($branches.Count -eq 0)
    {
        echo "No remote merged branches found"
        return
    }
    echo "This will delete all these local merged branches:"
    echo $branches
    $confirm = Read-Host -Prompt "Do you wish to continue? [Y/n]"
    if ($confirm.ToUpperInvariant() -eq "Y") {
        Invoke-Expression $command | where { !($_ -match "master") } | foreach { git push --delete origin "$($_.Split('/')[1])" }
    }
}