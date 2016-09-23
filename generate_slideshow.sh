#!/usr/bin/env bash

# Generate Slideshow using revealjs-redhat template
hyla generate -c slideshow/conference.yaml

#compass compile --fonts-dir 'fonts' --css-dir 'slideshow/generated/revealjs-redhat/lib/css' --sass-dir 'slideshow/sass' -e development --output-style=expanded --force

# Generate Slideshow using revealjs template (template & css should be reviewed - NOT USED)
# compass compile --fonts-dir 'fonts' --css-dir 'slideshow/generated/revealjs/css/theme' --sass-dir 'slideshow/sass' -e development --output-style=expanded --force

