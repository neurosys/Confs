
# uberzungpp
https://github.com/jstkdng/ueberzugpp

Dependencies:
`apt-get install libssl-dev libvips-dev libsixel-dev libchafa-dev libtbb-dev`

`sudo apt install libxcb-image0-dev libxcb-res0-dev`

```
git clone https://github.com/jstkdng/ueberzugpp.git
cd ueberzugpp
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_TURBOBASE64=ON ..
make -j 8
cmake --install . --prefix /opt/local/stow/ueberzugpp-2.9.8
```

