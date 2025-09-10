#!/bin/bash

draw_progress_bar() {
    percentage="$1"

    # Ensure percentage is an integer between 0 and 100
    percentage=$(printf "%.0f" "$percentage")
    if [ "$percentage" -gt 100 ]; then
        percentage=100
    elif [ "$percentage" -lt 0 ]; then
        percentage=0
    fi

    # Calculate number of filled blocks (each block ≈ 10%)
    filled_blocks=$(expr "$percentage" / 10)

    # Create the progress bar
    bar="["
    # if [ "$percentage" -ge 10 ]; then
    #     bar=""
    # else
    #     bar=""
    # fi
    i=0
    while [ "$i" -lt "$filled_blocks" ]; do
        bar="$bar■"
        # bar="$bar"
        i=$(expr "$i" + 1)
    done
    while [ "$i" -lt 10 ]; do
        bar="$bar-"
        # bar="$bar"
        i=$(expr "$i" + 1)
    done
    bar="$bar]"
    # if [ "$percentage" -eq 100 ]; then
    #     bar="$bar"
    # else
    #     bar="$bar"
    # fi
    echo "$bar"
}

# Read initial CPU stats from /proc/stat
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat

# Sum initial active and total CPU times
cpu_active_prev=$((user + nice + system + irq + softirq + steal))
cpu_total_prev=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Wait for a short interval to measure CPU usage
sleep 0.5

# Read new CPU stats
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat

# Sum new active and total CPU times
cpu_active=$((user + nice + system + irq + softirq + steal))
cpu_total=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Calculate differences
active_diff=$((cpu_active - cpu_active_prev))
total_diff=$((cpu_total - cpu_total_prev))

# Calculate CPU usage percentage
if [ "$total_diff" -eq 0 ]; then
    cpu_percent=0
else
    cpu_percent=$((100 * active_diff / total_diff))
fi

# Generate progress bar and output formatted result
progress_bar=$(draw_progress_bar "$cpu_percent")
printf "%s %d%%\n" "$progress_bar" "$cpu_percent"
