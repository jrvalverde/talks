open 1f5n.mol2
open 1f5n-L.mol2
# set window size
windowsize 640 480
# remove ribbons display
~ribbon
# remove remaining receptor atoms/bonds
~show #0
# select ligand
show :GNP
# center and resize
reset
# make ligand ball-and-stick
repr bs
# add surface
surface :GNP
# color by element
color byelement
# add transparency to surface
surftransparency 30 :GNP
# set background color
set bg_color black
movie record supersample 3 raytrace true
    wait 10
    rock y 3 60
    wait
    rock x 4 30
    wait
    turn y 3 120
    wait
    wait 10
movie stop
movie encode bitrate 10000 output 08-raytrace.mov
