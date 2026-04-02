#!/bin/bash
# PreToolUse Hook: 危険なBashコマンドを自動ブロック
INPUT=$(cat)
powershell -NoProfile -ExecutionPolicy Bypass -File .claude/hooks/pre-bash-guard.ps1 <<< "$INPUT"
