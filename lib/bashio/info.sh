#!/usr/bin/env bash
# ==============================================================================
# Open Peer Power Community Add-ons: Bashio
# Bashio is an bash function library for use with Open Peer Power add-ons.
#
# It contains a set of commonly used operations and can be used
# to be included in add-on scripts to reduce code duplication across add-ons.
# ==============================================================================

# ------------------------------------------------------------------------------
# Returns a JSON object with generic version information about the system.
#
# Arguments:
#   $1 Cache key to store results in (optional)
#   $2 jq Filter to apply on the result (optional)
# ------------------------------------------------------------------------------
function bashio::info() {
    local cache_key=${1:-'supervisor.info'}
    local filter=${2:-}
    local info
    local response

    bashio::log.trace "${FUNCNAME[0]}" "$@"

    if bashio::cache.exists "${cache_key}"; then
        bashio::cache.get "${cache_key}"
        return "${__BASHIO_EXIT_OK}"
    fi

    if bashio::cache.exists 'supervisor.info'; then
        info=$(bashio::cache.get 'supervisor.info')
    else
        info=$(bashio::api.supervisor GET /info false)
        bashio::cache.set 'supervisor.info' "${info}"
    fi

    response="${info}"
    if bashio::var.has_value "${filter}"; then
        response=$(bashio::jq "${info}" "${filter}")
    fi

    bashio::cache.set "${cache_key}" "${response}"
    printf "%s" "${response}"

    return "${__BASHIO_EXIT_OK}"
}

# ------------------------------------------------------------------------------
# Returns the Open Peer Power Supervisor version used.
# ------------------------------------------------------------------------------
function bashio::info.supervisor() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.supervisor' '.supervisor'
}

# ------------------------------------------------------------------------------
# Returns the Open Peer Power version used.
# ------------------------------------------------------------------------------
function bashio::info.openpeerpower() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.openpeerpower' '.openpeerpower'
}

# ------------------------------------------------------------------------------
# Returns the oppos version running on the host system.
# ------------------------------------------------------------------------------
function bashio::info.oppos() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.oppos' '.oppos'
}

# ------------------------------------------------------------------------------
# Returns the hostname of the host system.
# ------------------------------------------------------------------------------
function bashio::info.hostname() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.hostname' '.hostname'
}

# ------------------------------------------------------------------------------
# Returns the machine type used.
# ------------------------------------------------------------------------------
function bashio::info.machine() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.machine' '.machine'
}

# ------------------------------------------------------------------------------
# Returns the architecture of the machine.
# ------------------------------------------------------------------------------
function bashio::info.arch() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.arch' '.arch'
}

# ------------------------------------------------------------------------------
# Returns the stability channel the system is enrolled in.
# ------------------------------------------------------------------------------
function bashio::info.channel() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.channel' '.channel'
}

# ------------------------------------------------------------------------------
# Returns a list of supported architectures by this system.
# ------------------------------------------------------------------------------
function bashio::info.supported_arch() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.supported_arch' '.supported_arch[]'
}

# ------------------------------------------------------------------------------
# Returns logging level of Supervisor universum.
# ------------------------------------------------------------------------------
function bashio::info.logging() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.logging' '.logging'
}

# ------------------------------------------------------------------------------
# Returns timezone of the system.
# ------------------------------------------------------------------------------
function bashio::info.timezone() {
    bashio::log.trace "${FUNCNAME[0]}"
    bashio::info 'supervisor.info.timezone' '.timezone'
}
