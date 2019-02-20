
#
# Utils for checking Jenkins job status when running from
# the terminal.
#
# author: @alexvanacker
#
JENKINS_POLLING_TIME_SECONDS=30

jenkinsWaitTillJobFinished() {
    local queue_url="${1}api/json"
    local user=${2}
    local pwd=${3}
    echo "Queue URL: ${queue_url}"
    local curl_res=$(curl -s -u "${user}":"${pwd}" "${queue_url}")
    local job_url=$(echo -E "${curl_res}" | jq ".executable.url")
    local cancelled=false

    while ([ -z "${job_url}" ] || [ "${job_url}" = "null" ]) && [ -z ${cancelled} ] ; do
        echo "Waiting for job to start, sleeping ${JENKINS_POLLING_TIME_SECONDS} seconds..."
        sleep ${JENKINS_POLLING_TIME_SECONDS}s
        curl_res=$(curl -s -u "${user}":"${pwd}" "${queue_url}" | tr -d  "\n\r")
        job_url=$(echo -E "${curl_res}" | jq ".executable.url" | sed 's/"//g')
        cancelled=$(echo -E "${curl_res}" | jq ".cancelled")
        # TODO HANDLE CANCELLED
        echo "Cancelled = ${cancelled}"
    done

    if [[ ${cancelled} = true ]]; then
        notify-send "Jenkins job cancelled!"
        exit 0
    fi
    echo "Job started"
    local job=${job_url}
    local job_url="${job_url}api/json"
    local job_curl=$(curl -s -u "${user}":"${pwd}" "${job_url}" | tr -d  "\n\r")
    local result=$(echo -E "${job_curl}" | jq ".result")
    while [ -z "${result}" ] || [ "${result}" = "null" ]; do
        echo "Waiting for job to finish..."
        sleep ${JENKINS_POLLING_TIME_SECONDS}s
        job_curl=$(curl -s -u "${user}":"${pwd}" "${job_url}" | tr -d  "\n\r")
        result=$(echo -E "${job_curl}" | jq ".result")
    done
    echo "DONE! Result= ${result}"

    notify-send "Jenkins job with ${result}" "${job}console"
    exit 0
}

jenkinsWaitTillJobFinishedInBackground() {
    local date_time=$(date '+%Y-%m-%d_%H_%M_%S')
    jenkinsWaitTillJobFinished "${1}" "${2}" "${3}">"$HOME/debug_jenkins_${date_time}.log" 2>&1 &
}

#
# Expected input: job build URL, user, password
# Example: jenkinsRunJobAndWaitTillFinished https://your.jenkins.com/job/UTs/build alexvanacker password
#
jenkinsRunJobAndWaitTillFinished() {
    local job_build_url=${1}
    local user=${2}
    local pwd=${3}
    local c=$(curl -si -X POST -u "${user}":"${pwd}" "${job_build_url}")
    local loc_header=$(echo "${c}" | grep -F Location)
    local loc=$(echo "${loc_header}" | sed 's/Location: //g' | tr -d "\n\r")
    jenkinsWaitTillJobFinishedInBackground "${loc}" "${user}" "${pwd}"
}