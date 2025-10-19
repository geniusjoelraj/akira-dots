#!/usr/bin/env bash

if [[ "$PWD" == "$HOME" ]]; then
  echo true
else
  echo false
fi
