#!/bin/bash
GHCI822="$HOME/.stack/programs/x86_64-linux/ghc-nopie-8.2.2/bin/ghci"
GHCI843="$HOME/.stack/programs/x86_64-linux/ghc-nopie-8.4.3/bin/ghci"

echo "Behavior in 8.2.2 with pkgdb"
echo "test" | $GHCI822 -package-db ./pkgdb-8.2.2 src/Tests/Good.hs 2> /dev/null | grep checkFlag
echo "Behavior in 8.2.2 without pkgdb"
echo "test" | $GHCI822 src/Tests/Good.hs src/Tests/Link.hs 2> /dev/null | grep checkFlag
echo "Behavior in 8.4.3 with pkgdb"
echo "test" | $GHCI843 -package-db ./pkgdb-8.4.3 src/Tests/Good.hs 2> /dev/null | grep checkFlag
echo "Behavior in 8.4.3 without pkgdb"
echo "test" | $GHCI843 src/Tests/Good.hs src/Tests/Link.hs 2> /dev/null | grep checkFlag
