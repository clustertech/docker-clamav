#!/bin/bash

rsyslogd
freshclam
crond
exec /usr/sbin/clamd -F
