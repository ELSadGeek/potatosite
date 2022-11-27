# #RemoteBackup


# # #LocalDirectories

$sys_path="C:\sysmti\"
$sync="D:\systemas\sysmti\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path="C:\sysmerc\"
$sync="D:\systemas\sysmerc\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path="C:\sysamaya\"
$sync="D:\systemas\sysamaya\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path='C:\sysmti\comprobantes'
$sync='D:\comprobantes\sysmti'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"

$sys_path='C:\sysmerc\comprobantes'
$sync='D:\comprobantes\sysmerc'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"

$sys_path='C:\sysamaya\comprobantes'
$sync='D:\comprobantes\sysamaya'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"

robocopy "D:\systemas" "\\172.16.3.250\Tlalnepantla\RDS\systemas" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"

robocopy "D:\images" "\\172.16.3.250\Tlalnepantla\RDS\images" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"