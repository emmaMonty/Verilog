#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu Feb 11 02:55:24 MST 2021
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim SevenSegmentTest_behav -key {Behavioral:sim_1:Functional:SevenSegmentTest} -tclbatch SevenSegmentTest.tcl -log simulate.log"
xsim SevenSegmentTest_behav -key {Behavioral:sim_1:Functional:SevenSegmentTest} -tclbatch SevenSegmentTest.tcl -log simulate.log

