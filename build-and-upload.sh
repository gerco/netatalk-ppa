#!/bin/bash

debuild -S
dput ppa:gercod/netatalk ../*.changes

