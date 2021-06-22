#!/bin/sh
set -e

xctool -project AbstractTableView.xcodeproj -scheme AbstractTableView build test -sdk iphonesimulator
