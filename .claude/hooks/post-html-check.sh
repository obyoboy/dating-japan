#!/bin/bash
# PostToolUse Hook: HTMLファイルの構文チェック + style.cssパス確認
INPUT=$(cat)
powershell -NoProfile -ExecutionPolicy Bypass -File .claude/hooks/post-html-check.ps1 <<< "$INPUT"
