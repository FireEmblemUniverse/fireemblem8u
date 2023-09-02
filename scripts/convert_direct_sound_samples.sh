#!/bin/bash
for file in `ls ../sound/direct_sound_samples`
	do
		../tools/aif2pcm/aif2pcm ../sound/direct_sound_samples/$file
	done
