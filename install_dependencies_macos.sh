#!/bin/sh

# Make sure that make is installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install make
brew install gcc
brew install unzip
if [[ $(uname -m) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# Set switch name in package
git clone https://github.com/coq/platform.git
cd platform/package_picks
echo COQ_PLATFORM_SWITCH_NAME=coq_for_waterproof >> coq_platform_switch_name.sh
cd ..

# Make coq_platform
chmod +x coq_platform_make.sh
./coq_platform_make.sh -extent=b -parallel=p -jobs=2 -vst=n -compcert=n -pick="8.14~2022.01" -set-switch=y

# Clean up coq/platfrom git
cd ..
rm -rf platform

#Install Serapi
opam install -y coq-serapi
opam install -y coq-coquelicot

#Install Waterproof tacticst clone
git clone https://github.com/impermeable/coq-waterproof
cd coq-waterproof
make
make install
cd ..
rm -rf coq-waterproof