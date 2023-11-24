# obs-responsive-browser

this is a script for OBS that allows you to create responsive browser sources (i.e. resizing the source in OBS resizes the window of the browser)

![just_too_easy](https://github.com/cgsdev0/obs-responsive-browser/assets/4583705/04e0d041-c405-4237-9d0d-8eb05c60d788)

## tutorial

1. add a browser source
2. select it and press ctrl+E to edit transform
3. change the bounding box type to "Maximum size only"

![image](https://github.com/cgsdev0/obs-responsive-browser/assets/4583705/b2f0f3d7-7abe-4e80-89ad-01f673c36487)

that's it!

## notes

the script attempts to resize all instances of the browser source, across all scenes.

_**caveat**_: this is currently evaluated _lazily_. the scenes will not update until you switch to them. i tried my best ¯\_(ツ)_/¯
