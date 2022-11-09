#RemoteBackup


#LocalDirectories

$sys_path="C:\sysmti\"
$sync="D:\systemas\sysmti\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path="C:\sysmerc\"
$sync="D:\systemas\sysmerc\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path="C:\sysmti\"
$sync="D:\systemas\sysmti\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "*temp*"

$sys_path="D:"
$sync="B:\RDS\"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"


$sys_path='C:\sysmti\comprobantes'
$sync='Q:\'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "System Volume Information" "$RECYCLE.BIN"


#iiA^NSiu*M8^0Sw
