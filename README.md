# My TeXMF

If you want custom latex cls and sty files to be available outside of the directory they're stored in (so if you want to be able to use the package without copying it into every directory of every TeX project, possibly creating different versions), you need to create a texmf directory somewhere on your computer and point you distribution to it.

This is my texmf directory that can be cloned onto any computer I need it on, typically in the home directory (~).

## Set-Up

- Clone the repository onto any local machine you want to use the custom packages on, typically into the home directory (~).
- After cloning, for MikTeX, go to the MikTeX console and add the root mytexmf directory in the settings/directories section.