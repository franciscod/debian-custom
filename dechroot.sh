#!/bin/bash
set -ex

ROOT=out/debian

sudo umount $ROOT/{dev,sys,proc}
