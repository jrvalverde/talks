# set chimera window size
windowsize 640 480
# select preset colored ribbons display
preset apply interactive 1
# set GNP as center of frame rotation
cofr :GNP
# do movie
movie record supersample 3
    # start with 10 fill frames
    wait 10
    rock y 3 68
    wait
    rock x 3 68
    wait
    # end with 10 fill frames
    wait 10
movie stop
#movie encode bitrate 10000 output 07-quality.mov
