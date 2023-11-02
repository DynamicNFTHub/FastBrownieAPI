#!/usr/bin/env bash
set -e

echo '=== Install dependencies for app'
python3.9 -m venv --clear --copies env
source env/bin/activate
pip install --upgrade pip
pip install pipdeptree==2.3.3 setuptools==57.5.0 venv-pack==0.2.0
pip install -r requirements.txt
