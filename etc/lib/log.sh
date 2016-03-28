#!/bin/bash

COLOR_SUCCESS="\\033[32m[SUCCESS]"
COLOR_INFO="\\033[36m[INFO]"
COLOR_WARN="\\033[33m[WARN]"
COLOR_ERROR="\\033[31m[ERRO]"
COLOR_RESET="\\033[m"

log_info()
{
    echo -e $COLOR_INFO $@ $COLOR_RESET
}

log_warn()
{
    echo -e $COLOR_WARN $@ $COLOR_RESET
}

log_error()
{
    echo -e $COLOR_ERROR $@ $COLOR_RESET
}

log_success()
{
    echo -e $COLOR_SUCCESS $@ $COLOR_RESET
}
