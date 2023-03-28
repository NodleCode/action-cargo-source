#!/bin/sh
cd $1
shift
cargo contract $*
