#UAC-Avioder
#Compiled on 6th May 2016
#Created by Connor Unsworth


    [void][System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")
    $name = get-random
        
        #Open dialog for selecting file    
        $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $OpenFileDialog.filter = "All Files(*.*)| *.*"

        $OpenFileDialog.initialDirectory = [Environment]::GetFolderPath("Desktop")
    
        $OpenFileDialog.ShowDialog() | Out-Null
        $file = $OpenFileDialog.filename

        #Save dialog for choosing where to put .lnk
        $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
        $SaveFileDialog.Filter = "Shortcut (*.lnk)|*.lnk"
   
        $SaveFileDialog.initialDirectory = [Environment]::GetFolderPath("Desktop")
    
        if ($SaveFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK)
            {
                $filename = $SaveFileDialog.FileName 
            }

        #if we are all good then schedule the task and create the lnk
        if($file -ne $null -and $filename -ne $null)
            {
                $action = New-ScheduledTaskAction -Execute $file
    
                Register-ScheduledTask -Action $action -TaskName $name -Description ("Running of " + $filename + " Without UAC") -RunLevel Highest

                $AppLocation = "schtasks"
                $WshShell = New-Object -ComObject WScript.Shell
                $Shortcut = $WshShell.CreateShortcut($filename)
                $Shortcut.TargetPath = $AppLocation
                $Shortcut.Arguments = "/run /tn $('"'+$name+'"')"
                $Shortcut.Description ="Device Removal"
                $Shortcut.IconLocation = "$file,0"
                $Shortcut.Save()
            }

    exit