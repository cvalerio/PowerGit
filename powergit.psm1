function Clear-Local-Git-Branches {
    echo "This will delete all these local branches:"
    git --no-pager branch -l | where { !($_ -match "master") } 
    $confirm = Read-Host -Prompt "Do you wish to continue? [Y/n]"
    if ($confirm.ToUpperInvariant() -eq "Y") {
        git branch -l | where { !($_ -match "master") } | foreach { git branch -D "$($_.Trim())" }
    }
}