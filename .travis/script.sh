#!/bin/bash
set -e

case "$PLATFORM" in
"osx")
    qmake -v
    packthing -h

    packthing -j4 --version $TRAVIS_TAG dmg
    mv build/staging/propelleride-*.dmg .
    ;;
"linux")
    qmake -v
    packthing -h

    packthing -j4 run
    mv build/staging/propelleride-*.run .

    fakeroot packthing -j4 --version $TRAVIS_TAG deb
    mv build/staging/propelleride-*.deb .
    ;;
"rpi")
    sudo chroot $MNT uname -a
    sudo chroot $MNT qmake -v
    sudo chroot $MNT packthing -h

    sudo packthing --checkout

    sudo chroot $MNT bash -c "cd /home/travis/build/parallaxinc/PropellerIDE/ && \
                                        packthing -j4 deb --version $TRAVIS_TAG --arch armhf && \
                                        mv build/staging/propelleride-*.deb ."

    sudo chown `whoami`:`groups | sed -r 's/ .*//g'` propelleride-*.deb
    ;;
*)
    echo "Invalid PLATFORM"
    exit 1
    ;;
esac