#!/bin/sh
# File: ~/scripts/intel_gpu_status.sh

# Check for dependencies
if ! command -v jq >/dev/null || ! command -v intel_gpu_top >/dev/null || ! command -v sensors >/dev/null; then
    echo "GPU: ERR"
    exit 1
fi

# Function to generate progress bar
# draw_progress_bar() {
#     percentage="$1"
#
#     # Ensure percentage is an integer between 0 and 100
#     percentage=$(printf "%.0f" "$percentage")
#     if [ "$percentage" -gt 100 ]; then
#         percentage=100
#     elif [ "$percentage" -lt 0 ]; then
#         percentage=0
#     fi
#
#     # Calculate number of filled blocks (each block ≈ 10%)
#     filled_blocks=$(expr "$percentage" / 10)
#
#     # Create the progress bar
#     bar="["
#     i=0
#     while [ "$i" -lt "$filled_blocks" ]; do
#         bar="$bar■"
#         i=$(expr "$i" + 1)
#     done
#     while [ "$i" -lt 10 ]; do
#         bar="$bar-"
#         i=$(expr "$i" + 1)
#     done
#     bar="$bar]"
#     echo "$bar"
# }

# Get GPU usage (Render/3D busy) from intel_gpu_top, run for 1 second
usage=$(timeout 1s intel_gpu_top -s -1 -J 2>/dev/null | grep -v '^\[' | jq '.engines["Render/3D"].busy')

# Format output for dwmblocks (e.g., "GPU: 16%")
if [ -n "$usage" ] && [ "$usage" != "N/A" ]; then
    # Convert usage to integer
    usage_int=$(printf "%.0f" "$usage")
    # progress_bar=$(draw_progress_bar "$usage_int")
    # printf "%s %d%%\n" "$progress_bar" "$usage_int"
    printf "%d%%\n" "$usage_int"
else
    echo "GPU: N/A"
fi
