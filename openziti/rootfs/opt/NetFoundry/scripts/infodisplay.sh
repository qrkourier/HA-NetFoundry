#!/usr/bin/with-contenv bashio
####################################################################################################
# 20230428 - Written by Nic Fragale @ NetFoundry.
MyName="infodisplay.sh"
MyPurpose="NetFoundry ZITI Edge Tunnel Host Information Display."
####################################################################################################
#set -e -u -o pipefail
[[ ${ZITI_ENV_LOG:-INFO} == "DEBUG" ]] &&
    bashio::log.info "MyName: ${MyName}" &&
    bashio::log.info "MyPurpose: ${MyPurpose}"

NFZTLogo=(
    '                                                                                       '
    '███    ██ ███████ ████████ ███████  ██████  ██    ██ ███    ██ ██████  ██████  ██    ██'
    '████   ██ ██         ██    ██      ██    ██ ██    ██ ████   ██ ██   ██ ██   ██  ██  ██ '
    '██ ██  ██ █████      ██    █████   ██    ██ ██    ██ ██ ██  ██ ██   ██ ██████    ████  '
    '██  ██ ██ ██         ██    ██      ██    ██ ██    ██ ██  ██ ██ ██   ██ ██   ██    ██   '
    '██   ████ ███████    ██    ██       ██████   ██████  ██   ████ ██████  ██   ██    ██   '
    '                                                                                       '
    '             ██████  ██████  ███████ ███    ██ ███████ ██ ████████ ██                  '
    '            ██    ██ ██   ██ ██      ████   ██    ███  ██    ██    ██                  '
    '            ██    ██ ██████  █████   ██ ██  ██   ███   ██    ██    ██                  '
    '            ██    ██ ██      ██      ██  ██ ██  ███    ██    ██    ██                  '
    '             ██████  ██      ███████ ██   ████ ███████ ██    ██    ██                  '
    '                                                                                       ')
for ((i = 0; i < ${#NFZTLogo[*]}; i++)); do
    printf '%s\n' "${NFZTLogo[${i}]}"
done

ZETVersion="$(/opt/NetFoundry/ziti-edge-tunnel version 2>/dev/null || echo UNKNOWN)"

if [[ -n ${1} ]] && [[ ${1} == "FULLDETAIL" ]]; then
    printf "\n%-30s: %s\n" "ZITI EDGE TUNNEL Version" "${ZETVersion}"
    echo

    HACLIInfo="$(ha cli info | awk '/version:/{print $2}' || echo UNKNOWN)"
    printf "%-30s: %s\n" "Home Assistant CLI Version" "${HACLIInfo}"
    echo

    readarray -t HADNSInfo < <(/usr/bin/ha dns info 2>/dev/null || echo UNKNOWN)
    for ((i = 0; i < ${#HADNSInfo[*]}; i++)); do
        printf "%-30s: %s\n" "Home Assistant DNS Info [${i}]" "${HADNSInfo[${i}]}"
    done
    echo
else
    printf "%s: %s\n" "ZITI EDGE TUNNEL Version" "${ZETVersion}"
fi