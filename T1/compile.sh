#!/bin/bash
# no parameters
# add your Flex code to scr/bminus.l
# add the token definitions used by src/bminus.l in "src/bminus.y
# do not change main.c

cd src
bison -d bminus.y
mv bminus.tab.h token.h
flex bminus.l           
cc -o bminus lex.yy.c bminus.tab.c main.c
rm lex.yy.c
rm token.h
rm bminus.tab.c
chmod +x bminus
mv bminus ..
cd ..

