#!/usr/bin/env bash

#hyla generate -c slideshow/conference-redhat.yaml
hyla generate -c slideshow/snowcamp.yaml
compass compile --fonts-dir 'fonts' --css-dir 'slideshow/generated/revealjs-redhat/lib/css' --sass-dir 'slideshow/sass' -e development --output-style=expanded --force
