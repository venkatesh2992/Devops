#!/bin/bash

function1 ()
{
	echo "The function1calls"
	echo ""
}
function2 ()
{
	echo "The function2 calls"
	echo ""
}
function3 ()
{
	echo "The function3 calls"
	echo "Enter your name -"
	read name
	echo "Your name is $name"
}
 
. fun.sh

function1
function2
function3
function2

