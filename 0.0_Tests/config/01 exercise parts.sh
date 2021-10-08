#!/bin/bash

echo "This is $0"
echo "It is part of ${EXERCISE_NAME}"

read -r -p "Enter the exit code (0 for success): " exit_code

exit $((exit_code))