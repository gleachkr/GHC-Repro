#!/bin/bash
echo "Building project..."
stack build
echo "These two results should be the same, since the only difference between the files is that one is an exported module"
echo "test" | stack repl src/Tests/Good.hs -- 2> /dev/null | grep checkFlag 
echo "test" | stack repl src/Tests/Bad.hs -- 2> /dev/null | grep checkFlag 
