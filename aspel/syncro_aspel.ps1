
$XF = @(
    '*temp*',
    '*.ctl',
    '*.thumbs',
    '*.ffs_lock'
)

$XD = @(
    '$RECYCLE.BIN',
    'System Volume Information'
)
# Sync dacaspel --> D
$sys_path='C:\Program Files (x86)\Common Files\Aspel'
$sync='D:\ASPEL\dacaspel'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XF $XF XD/ $XD

# Sync invoice --> D
$sys_path="Q:\sysmti"
$sync="D:\comprobantes"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XF $XF XD/ $XD

# Sync ALL --> NAS
$sys_path="D:\ASPEL"
$sync="B:\ASPEL"
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XF $XF XD/ $XD


# filemon 5US*!qQcxunC8%5