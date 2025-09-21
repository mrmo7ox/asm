
if [ $1 ]; then
    gdb -ex "layout asm" -ex "b _start" -ex "run" --args $1
else 
    echo "Usage ./mygdb <filename>"
fi
