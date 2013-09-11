# You'll need xorg-xrdb for this
xrdb -merge ~/.Xresources

# Replace the path with the path to your background image
feh --bg-scale /home/taylor/home/bg.png
exec i3
