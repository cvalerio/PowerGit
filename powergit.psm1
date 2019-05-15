function Clear-Local-Git-Branches {
    git branch -l | where { !($_ -match "master") } | foreach { git branch -D "$($_.Trim())" }
}