#!/usr/bin/env bash

###################### COPYRIGHT/COPYLEFT ######################

# (C) 2020..2022 Michael Soegtrop

# Released to the public under the
# Creative Commons CC0 1.0 Universal License
# See https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt

###################### CONTROL VARIABLES #####################

# The two lines below are used by the package selection script
COQ_PLATFORM_VERSION_TITLE="Rocq 9.0 with waterproof package pick"
COQ_PLATFORM_VERSION_SORTORDER=1

# The package list name is the final part of the opam switch name.
# It is usually either empty ot starts with ~.
# It might also be used for installer package names, but with ~ replaced by _
# It is also used for version specific file selections in the smoke test kit.
COQ_PLATFORM_PACKAGE_PICK_POSTFIX='~9.0~wp'

# The corresponding Coq development branch and tag
COQ_PLATFORM_COQ_BRANCH='v9.0'
COQ_PLATFORM_COQ_TAG='9.0.0'

# This controls if opam repositories for development packages are selected
COQ_PLATFORM_USE_DEV_REPOSITORY='N'

# This extended descriptions is used for readme files
COQ_PLATFORM_VERSION_DESCRIPTION='This version of Coq Platform includes Rocq 9.0 and dependencies for Waterproof. '
COQ_PLATFORM_VERSION_DESCRIPTION+='This is a custom version of the Coq Platform. '

# The OCaml version to use for this pick (just the version number - options are elaborated in a platform dependent way)
COQ_PLATFORM_OCAML_VERSION='4.14.2'

###################### PACKAGE SELECTION #####################

PACKAGES=""

# - Comment out packages you do not want.
# - Packages which take a long time to build should be given last.
#   There is some evidence that they are built early then.
# - Versions ending with ~flex are identical to the opam package without the
#   ~flex extension, except that version restrictions have been relaxed.

########## BASE PACKAGES ##########

# Coq needs a patched ocamlfind to be relocatable by installers
PACKAGES="${PACKAGES} PIN.ocamlfind.1.9.5~relocatable"  # TODO port patch to 1.9.6
# Since dune does support Coq, it is explicitly selected
#PACKAGES="${PACKAGES} PIN.dune.3.16.1" # 3.17.2 has issues on Windows: cairo doesn't find cairo.h
PACKAGES="${PACKAGES} PIN.dune-configurator.3.19.1"
# The Coq compiler coqc and the Coq standard library
PACKAGES="${PACKAGES} PIN.rocq-prover.9.0.0"
PACKAGES="${PACKAGES} coq-lsp.0.2.3+9.0"
