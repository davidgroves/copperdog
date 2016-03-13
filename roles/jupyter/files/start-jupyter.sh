#!/usr/bin/env bash

cd /opt/jupyter
. venv/bin/activate
nohup jupyter notebook --port-retries=0 --no-browser --config /opt/jupyter/jupyter_notebook_config.py >/dev/null 2>&1 &