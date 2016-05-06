#UAC_Avoider_Remover
#Created By Connor Unsworth
   [void][System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")
   $sh = New-Object -COM WScript.Shell

   $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
   $OpenFileDialog.filter = "Shortcut(*.lnk)| *.lnk"

   $OpenFileDialog.initialDirectory = [Environment]::GetFolderPath("Desktop")
    
   $OpenFileDialog.ShowDialog() | Out-Null
   $file = $OpenFileDialog.filename

   $shortcutID = (($sh.CreateShortcut($file).arguments).Split('"')[1]).trim()
        
   Unregister-ScheduledTask -TaskName $shortcutID -Confirm:$false -ErrorAction SilentlyContinue

   remove-item $file -Confirm:$false -Force -Recurse

   exit

