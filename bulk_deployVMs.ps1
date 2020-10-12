#This script can be used to bulk deploy VMs in vmware vSphere using PowerCLI. Running the script as is creates 70 VM's from the Windows 10 template in lab. Remove the -whatif in line 30 to run.

# Specify vCenter Server, vCenter Server username and vCenter Server user password
$vCenter="Enter vCenter server"
#
# Specify number of VMs
$vm_count = "70"
#
# Specify the template
$template = "Windows 10 - Lab"
#
# Specify the datastore
$ds = "Enter Datastore"
#
$VM_host = "Enter VM Host"
# Specify Virtual Machine & Templates folder
$Folder = "Windows 10"
#
# Specify the VM name
$VM_prefix = "LabVM"
#
# End of user input parameters
#
write-host "Connecting to vCenter Server $vCenter" -foreground green
Connect-viserver $vCenter -WarningAction 0
1..$vm_count | foreach {
$y="{0:D2}" -f + $_
$VM_name= $VM_prefix + $y
write-host "Creation of VM $VM_name initiated" -foreground green
New-VM -Name $VM_Name -Template $template -ResourcePool $VM_host -Datastore $ds -Location $Folder -RunAsync -WhatIf
}

