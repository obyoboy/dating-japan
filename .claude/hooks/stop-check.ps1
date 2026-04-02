param()

$repoRoot = git rev-parse --show-toplevel 2>$null
if (-not $repoRoot) { exit 0 }

Set-Location $repoRoot

$uncommitted = git status --porcelain 2>$null | Where-Object {
    $_ -match '(en|tl|vi)/.+\.html'
} | ForEach-Object { ($_ -split '\s+', 2)[1] }

if (-not $uncommitted) { exit 0 }

$count = @($uncommitted).Count
$preview = ($uncommitted | Select-Object -First 5 | ForEach-Object { "    $_" }) -join "`n"
$extra = $count - 5

$msg = "⚠️ 停止前確認: 未コミットの記事ファイルが $count 件あります`n"
$msg += $preview.Trim()
if ($extra -gt 0) { $msg += "`n    ... 他 $extra 件" }
$msg += "`n`n  git add & git push を実行してから終了してください。"
$msg += "`n  （問題なければそのまま終了してもかまいません）"

@{ systemMessage = $msg } | ConvertTo-Json -Compress
exit 0
