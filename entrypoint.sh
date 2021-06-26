#!/bin/bash

if [[ -z "${HIGHCHARTS_WORKERS}" ]]; then
  HIGHCHARTS_WORKERS=2
fi

if [[ -z "${HIGHCHARTS_LOGLEVEL}" ]]; then
  HIGHCHARTS_LOGLEVEL=4
fi

highcharts --enableServer 1 --workers $HIGHCHARTS_WORKERS --port 80 --logLevel $HIGHCHARTS_LOGLEVEL
