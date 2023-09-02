import py_midicsv as pm
import sys

for song in sys.argv[1:]:
    data = pm.midi_to_csv(f'sound/songs/midi/{song}.mid')
    
    for i in range(len(data)):
        line = data[i]
    
        start_track = False
        if 'Start_track' in line:
            start_track = True
        if 'Control_c' in line and line[-4:] == '127\n':
            data[i] = ''
            start_track = False
    
    midi_object = pm.csv_to_midi(data)
    
    with open(f'sound/songs/midi/{song}.mid', "wb") as output_file:
        midi_writer = pm.FileWriter(output_file)
        midi_writer.write(midi_object)
