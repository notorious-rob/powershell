[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

# VARIABLES
$DropRange = @("Item 1","Item 2","Item 3","etc..")


# FUNCTIONS

Function quit{
	$form.Close()
}

# FORM CODE

$form = new-object System.Windows.Forms.form 
$form.Text = "PLACE TITLE HERE"
$form.size = new-object System.Drawing.Size(575,450)
$form.StartPosition = "CenterScreen" 

# Add Text Box
$TextBox = new-object System.Windows.Forms.TextBox 
$TextBox.Location = new-object System.Drawing.Size(110,30) 
$TextBox.size = new-object System.Drawing.Size(130,20) 
$form.Controls.Add($TextBox) 

# Add Label
$LabelBox = new-object System.Windows.Forms.Label
$LabelBox.Location = new-object System.Drawing.Size(10,30) 
$LabelBox.size = new-object System.Drawing.Size(60,20) 
$LabelBox.Text = "TEXT HERE"
$form.Controls.Add($LabelBox)

# Add Drop Down
$Drop = new-object System.Windows.Forms.ComboBox
$Drop.Location = new-object System.Drawing.Size(400,120)
$Drop.Size = new-object System.Drawing.Size(130,30)
$Drop.Items.AddRange($DropRange)
$form.Controls.Add($Drop)

# Add Label
$LabelBox = new-object System.Windows.Forms.Label
$LabelBox.Location = new-object System.Drawing.Size(300,120)
$LabelBox.size = new-object System.Drawing.Size(100,20)
$LabelBox.Text = "TEXT HERE"
$form.Controls.Add($LabelBox)

# Add Exit Button
$btnExit = new-object System.Windows.Forms.Button
$btnExit.Location = new-object System.Drawing.Size(430,370)
$btnExit.Size = new-object System.Drawing.Size(100,30)
$btnExit.Text = "Exit"
# Calls the quit function
$btnExit.Add_Click({quit})
$form.Controls.Add($btnExit)

$form.topmost = $true
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()