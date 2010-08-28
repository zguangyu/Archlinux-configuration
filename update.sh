#!/bin/sh
find . -regex '\./[^/]*/src/[^/]*/.svn' -execdir svn up \;
find -name '.git' -execdir git pull \; 
find -name '.hg' -execdir hg pull \;  
find -name '.hg' -execdir hg up \;  
