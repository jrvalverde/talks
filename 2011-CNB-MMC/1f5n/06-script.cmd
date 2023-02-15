# set window size
windowsize 640 480
preset apply interactive 1
cofr :GLN
movie record
    rock y 3 68
    wait
    rock x 3 68
    wait
movie stop
movie encode mformat mp4 output 06-script.mp4
