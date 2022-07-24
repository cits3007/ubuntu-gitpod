#!/usr/bin/env bash

# should be run as root

set -x

# should already have: wget, curl

DEBIAN_FRONTEND=noninteractive \
  apt-get install --no-install-recommends -y \
    afl++-clang             \
    apt-transport-https     \
    aptitude                \
    bash                    \
    bash-completion         \
    binutils                \
    bsdmainutils            \
    build-essential         \
    bzip2                   \
    ca-certificates         \
    clang                   \
    clang-format            \
    clang-tidy              \
    clang-tools             \
    command-not-found       \
    coreutils               \
    diffutils               \
    expect                  \
    file                    \
    findutils               \
    fakeroot                \
    g++-multilib            \
    gdb                     \
    git                     \
    gpg                     \
    indent                  \
    jq                      \
    less                    \
    libtool                 \
    llvm-10-dev             \
    lsof                    \
    lynx                    \
    man-db                  \
    manpages                \
    manpages-dev            \
    manpages-posix          \
    manpages-posix-dev      \
    moreutils               \
    netcat-openbsd          \
    patchutils              \
    pkg-config              \
    procps                  \
    pv                      \
    openssh-client          \
    screen                  \
    sharutils               \
    splint                  \
    sudo                    \
    time                    \
    universal-ctags         \
    valgrind                \
    xxd                     \
    zzuf

