
$ignores = @(
    '$RECYCLE.BIN',
    '*temp*',
    '*.ctl',
    '.thumbs'
)

$sys_path='C:\Program Files (x86)\Common Files\Aspel'
$sync='D:\ASPEL\dacaspel'
robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD $ignores

# $sys_path = "Z:\comprobantes"
# $sync ="G:\Unidades compartidas\COMPROBANTES"
# robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "$RECYCLE.BIN".

# $sys_path="D:\ASPEL"
# $sync="B:\ASPEL"
# robocopy "$sys_path" "$sync" /R:5 /W:5 /MT:16 /MIR /Z /XD "$RECYCLE.BIN".
