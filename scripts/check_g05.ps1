param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('A', 'B', 'Final', 'Review', 'V2')]
    [string]$Stage,
    [string]$PeerExport
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$submission = Join-Path $repoRoot 'K5-L2-DAY12-DaoBinhAn-2A202603264-DMSOMS'
$checker = Join-Path $PSScriptRoot 'cabin_check.py'
$manifest = Join-Path $repoRoot 'G05\oms\manifest.csv'

if ($Stage -eq 'Review') {
    if (-not $PeerExport -or -not (Test-Path -LiteralPath $PeerExport -PathType Leaf)) {
        throw 'Provide -PeerExport with the path to your peer export ZIP.'
    }
    $mine = Join-Path $submission 'export_final.zip'
    if (-not (Test-Path -LiteralPath $mine -PathType Leaf)) { throw "Missing export: $mine" }
    $log = Join-Path $submission 'disagreement_log.csv'
    if ((Test-Path -LiteralPath $log) -and @(Import-Csv -LiteralPath $log).Count -gt 0) {
        throw 'Review log contains rows. Preserve your review decisions before running diff again.'
    }
    & python $checker diff $mine $PeerExport --csv $log
} else {
    $settings = switch ($Stage) {
        'A' { @{ Zip = 'part_A.zip'; Log = 'check_cpA.txt'; Expect = 4; Only = 'S01,S02' } }
        'B' { @{ Zip = 'part_B.zip'; Log = 'check_cpB.txt'; Expect = 2; Only = 'D01,D02' } }
        'Final' { @{ Zip = 'export_final.zip'; Log = 'check_final.txt'; Expect = 22 } }
        'V2' { @{ Zip = 'export_final_v2.zip'; Log = 'check_final_v2.txt'; Expect = 22 } }
    }
    $export = Join-Path $submission $settings.Zip
    if (-not (Test-Path -LiteralPath $export -PathType Leaf)) { throw "Missing export: $export" }
    if (-not (Test-Path -LiteralPath $manifest -PathType Leaf)) { throw "Missing manifest: $manifest" }
    $checkArgs = @($checker, 'check', $export, '--expect', $settings.Expect, '--manifest', $manifest, '--out', (Join-Path $submission $settings.Log))
    if ($settings.Only) { $checkArgs += @('--only', $settings.Only) }
    & python @checkArgs
}
exit $LASTEXITCODE
