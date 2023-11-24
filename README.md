# obs-responsive-browser

this is a script for OBS that allows you to create responsive browser sources (i.e. resizing the source in OBS resizes the window of the browser)

![resizer](https://github.com/cgsdev0/obs-responsive-browser/assets/4583705/3b907025-378e-4f06-82b5-73b9ef371fe8)


## tutorial

1. add a browser source
2. select it and press ctrl+E to edit transform
3. change the bounding box type to "Maximum size only"

![image](https://github.com/cgsdev0/obs-responsive-browser/assets/4583705/b2f0f3d7-7abe-4e80-89ad-01f673c36487)

that's it!

## notes

transitioning directly between scenes with differently sized bounding boxes causes a bit of jank ¯\\\_(ツ)\_/¯

if using studio mode, this will not work unless you disable "Duplicate Scene"
![image](https://github.com/cgsdev0/obs-responsive-browser/assets/4583705/ea2fdd93-0de7-4c1a-b5b4-fae149b49316)
