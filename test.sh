#!/bin/bash
echo "Building project..."
stack build
echo "These two results should be the same, since the only difference between the files is that one is an exported module"
echo "test" | stack repl src/Tests/Good.hs -- 2> /dev/null | grep checkFlag 
echo "test" | stack repl src/Tests/Bad.hs -- 2> /dev/null | grep checkFlag 
echo "Here it is again with 8.4.3:"
echo "Building project..."
stack --stack-yaml stack-8.4.3.yaml build
echo "test" | stack --stack-yaml stack-8.4.3.yaml repl src/Tests/Bad.hs -- 2> /dev/null | grep checkFlag 
echo "test" | stack --stack-yaml stack-8.4.3.yaml repl src/Tests/Good.hs -- 2> /dev/null | grep checkFlag 
