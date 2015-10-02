#!/usr/bin/env bash
echo "    Start web console at http://127.0.0.1:9000    "
butterfly.server.py --port=9000 --host="0.0.0.0" --unsecure
