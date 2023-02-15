# set window size
windowsize 640 480

# open receptor (#0) and ligand (#1)
open 1f5n.mol2
open 1f5n-L.mol2

# set receptor to look nice
preset apply interactive 1

# set ligand in ball and stick
repr bs :GNP

# increase subdivision quality for smoother ribbons
set subdivision 5

# name this position
savepos closer

center :GNP
savepos centered

reset closer

# zoom out, move molecule to corner, name position
scale 0.7
move x -20
move y -10
savepos corner

# unselect receptor, move and rotate ligand, reselect
~select 0
move x 30
move y 40
turn z 90
turn x 90
select 0
savepos unbound

# write label
#set bg_color gray
2dlabel create title text "1F5N bound to GTP" xpos 0.3 ypos 0.92 color white

# start recording
movie record

# move from unbound to corner position along 50 frames using linear interpolation
reset corner 50
wait

# get closer over 25 frames with interpolation
reset closer 25
wait

# center around GNP
reset centered 25
wait

# hide label using 25 frames
2dlabel change title visibility hide frames 25


# show hydrogen bonds
scale 1.03 25
wait
hbond intermodel true intramodel false color yellow linewidth 5
roll y 0.5 50
wait
roll y -0.5 50
wait
roll x 0.5 50
wait
roll x -0.5 50
wait

# show receptor surface highlighting aromatic rings

surface #0 ; color white #0; surftransparency 100 #0

# reorient
turn z 3 30
wait

# Fade in surface (make it visible)
surftransparency 0 #0 20

# now that the surface is visible we can color the aromatic rings
color blue aromatic ring

# return and zoom out
rock y 3 150
wait
rock x 3 150
wait
scale 0.98 50
wait

# wait an extra second
wait 25

# done
movie stop
movie encode mformat mp4 output 10-binding.mp4 bitrate 6000


