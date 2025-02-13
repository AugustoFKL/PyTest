#!/bin/bash

# Capture exit statuses directly from commands
echo "Running ruff check..."
ruff check . --output-format=concise >ruff_report.txt 2>&1
check_status=$?

echo -e "\nRunning ruff format check..." >>ruff_report.txt
ruff format . --check >>ruff_report.txt 2>&1
format_status=$?

# Determine final status based on command exits
if [ $check_status -ne 0 ] || [ $format_status -ne 0 ]; then
  echo "Ruff issues detected (check_status:$check_status, format_status:$format_status)"
  exit 1
fi
