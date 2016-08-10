#!/usr/bin/env bash
TOP=$(cd $(dirname $0) && pwd -L)
VIRTUALENV_ROOT=${VIRTUALENV_ROOT:-"${HOME}/.virtualenvs/mycroft"}

case $1 in
	"service") SCRIPT=${TOP}/mycroft/messagebus/service/main.py echo "eyes.fill=5" >/dev/ttyAMA0 ;;
	"skills") SCRIPT=${TOP}/mycroft/skills/main.py echo "eyes.fill=11:" >/dev/ttyAMA0 ;;
	"skill_container") SCRIPT=${TOP}/mycroft/skills/container.py ;;
	"voice") SCRIPT=${TOP}/mycroft/client/speech/main.py echo "eyes.fill=17" >/dev/ttyAMA0 ;;
	"cli") SCRIPT=${TOP}/mycroft/client/text/cli.py ;;
	"audiotest") SCRIPT=${TOP}/mycroft/util/audio_test.py ;;
	"collector") SCRIPT=${TOP}/mycroft_data_collection/cli.py ;;
	"unittest") SCRIPT=${TOP}/test/test_runner.py ;;
	"audioaccuracytest") SCRIPT=${TOP}/audio-accuracy-test/audio_accuracy_test.py ;;
	"sdkdoc") SCRIPT=${TOP}/doc/generate_sdk_docs.py ;;
        "enclosure") SCRIPT=${TOP}/mycroft/client/enclosure/enclosure.py echo "eyes.fill=23" >/dev/ttyAMA0 ;;
        "pairing") SCRIPT=${TOP}/mycroft/pairing/client.py ;;
	*) echo "Usage: start.sh [service | skills | skill_container | voice | cli | audiotest | collector | unittest | enclosure | pairing | sdkdoc ]"; exit ;;
esac

echo "Starting $@"

shift

source ${VIRTUALENV_ROOT}/bin/activate
PYTHONPATH=${TOP} python ${SCRIPT} $@
