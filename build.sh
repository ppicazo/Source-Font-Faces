#!/bin/sh

fonts=('SourceSansPro' 'SourceCodePro')

# clean existing build artifacts
rm -rf target/
mkdir -p target/

thisDir=`pwd`

for f in ${fonts[@]};
do
  cd $thisDir/$f
  ./build.sh
  cp target/TTF/*.ttf $thisDir/target
done

cd $thisDir/target
$thisDir/css3FontConverter/convertFonts.sh *.ttf
rm old
mv stylesheet.css fonts.css
