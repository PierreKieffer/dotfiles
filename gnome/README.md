


### login screen 
To edit login screen : 

Edit `/usr/share/gnome-shell/theme/gdm3.css` : 
```
#lockDialogGroup {
  background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
  background-repeat: repeat; }
```

with : 
```
#lockDialogGroup {
  background: url(file:///usr/share/gnome-shell/theme/picture.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;}
```


### Map rows to ALT + hjkl
Create `Xmodmap` file : 
```
keycode 64 = Mode_switch
keysym j = j J Down 
keysym l = l L Right
keysym h = h H Left
keysym k = k K Up
```

```
xmodmap Xmodmap
```

