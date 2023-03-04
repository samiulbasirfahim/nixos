#!/usr/bin/env bash

# Toggle between two pulseaudio sinks

# Requires
# load-module module-stream-restore restore_device=false
# to be set in /etc/pulse/default.pa

# Current default sink
CURR_SINK_INDEX="$(pacmd list-sinks | grep \* | awk '{print $3}')"
CURR_SINK_NAME="$(pacmd list-sinks | grep \* -A 1 | awk 'FNR == 2 {print $2}' | sed 's/[<>]//g')"

echo "Current default sink: ${CURR_SINK_INDEX} ${CURR_SINK_NAME}"

CONFIG="$HOME/.config/toggle_sink.conf"

# Source config file if it exists
[ -f "${CONFIG}" -a -r "${CONFIG}" ] && . "${CONFIG}"

# Sinks to switch between
# Use index 0 and 1 unless config defined it
TOGGLE_SINKS="${TOGGLE_SINKS:-0 1}"

# Use arguments instead if they are provided
[ $# -ne 0 ] && [ "$*" != "" ] && TOGGLE_SINKS="${@}"

for toggle_sink in ${TOGGLE_SINKS}; do
    if [ "${toggle_sink}" != "${CURR_SINK_INDEX}" ] && [ "${toggle_sink}" != "${CURR_SINK_NAME}" ]; then
        # New default sink
        SINK="${toggle_sink}"
        echo "New default sink: ${SINK}"
        break
    fi
done

# Driver to identify sink inputs to move
SINK_INPUT_DRIVER="protocol-native.c"
# Sink inputs to move
SINK_INPUTS="$(pacmd list-sink-inputs | grep "$SINK_INPUT_DRIVER" -B 1 | awk '$1 == "index:" {print $2}')"

pacmd set-default-sink "${SINK}" && [ -n "$SINK_INPUTS" ] && for i in ${SINK_INPUTS}; do
    pacmd move-sink-input "${i}" "${SINK}"
done
