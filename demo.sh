#!/bin/bash
set -e

# Demo size
SIZE_GB=1

bash build.sh

rm -r demo/ || true

mkdir -p demo
cd demo

echo "Writing demo..."
echo "Demo file start" >> demo.txt
dd if=/dev/random bs=1k iflag=fullblock count=${SIZE_GB}M >> demo.txt
echo "Demo end" >> demo.txt
echo "Done!"

mkdir -p demo_dir/ store
mv demo.txt demo_dir/

echo "Creating desync-go store..."
../desync-go/desync tar --store store --index demo.caidx demo_dir/
echo "Done!"
ls -a .

echo "Extracting store with desync-rs..."
cd ../bin # fix log4rs.yml
../bin/desync-rs extract --file ../demo/output.catar --index ../demo/demo.caidx --store ../demo/store
cd ../demo/
head -c 400 output.catar | xxd > head.txt
tail -c 400 output.catar | xxd > tail.txt

echo "Done! You can view .catar file head.txt and tail.txt in demo/"
