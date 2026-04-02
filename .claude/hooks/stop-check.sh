#!/bin/bash
# Stop Hook: 未コミット記事ファイルの確認
powershell -NoProfile -ExecutionPolicy Bypass -File .claude/hooks/stop-check.ps1
exit 0
