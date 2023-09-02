import os

Song2VoiceGroupFromMk={}
Song2VoiceGroupFromIni={}
VoiceGroup2SampleFromS={}
VoiceGroup2SampleFromIni={}
VoiceGroupMatches = {}
SampleMatches = {}
SampleMatchedByHash = {}

def checkDuplicatedMatches(d):
    rev = {}
    for k, v in d.items():
        if v in rev:
            print('duplicated matches: {} -> {} and {}'.format(v, rev[v], k))
        rev[v] = k

def readSong2VoiceGroupFromMk():
    with open('../../songs.mk', 'r') as f:
        songId = 0
        while True:
            l = f.readline()
            if not l:
                break
            if 'song' in l:
                songId = int(l.split('song')[1][:3])
            if 'MID2AGB'in l:
                Song2VoiceGroupFromMk[songId] = int(l.split('-G')[1][:3])
    #print(Song2VoiceGroupFromMk)

def readVoiceGroup2SampleFromS():
    path = '../../sound/voicegroups'
    ss = os.listdir(path)
    for s in ss:
        with open(os.path.join(path, s), 'r') as f:
            voiceGroupId = int(s.split('voicegroup')[1][:3])
            VoiceGroup2SampleFromS[voiceGroupId] = {}
            index = 0
            while True:
                l = f.readline()
                if not l:
                    break
                if 'voice_directsound' in l:
                    VoiceGroup2SampleFromS[voiceGroupId][index] = l.split(',')[2].strip()[16:]
                if 'voice_' in l:
                    index += 1
    #print(VoiceGroup2SampleFromS)

def readSong2VoiceGroupFromIni():
    with open('songs.ini', 'r') as f:
        while True:
            l = f.readline()
            if not l:
                break
            if len(l) > 4:
                Song2VoiceGroupFromIni[int(l[1:4])] = int(l.split(',')[2].strip())
    #print(Song2VoiceGroupFromIni)

def readVoiceGroup2SampleFromIni():
    with open('mks4agb.ini', 'r') as f:
        voiceGroupId = 0
        while True:
            l = f.readline()
            if not l:
                break
            if l.startswith('vgroup = ') and not l[9] == '?':
                #print(l)
                voiceGroupId = int(l[9:])
                VoiceGroup2SampleFromIni[voiceGroupId] = {}
            if l.startswith('p') and l[1:4].isdigit():
                VoiceGroup2SampleFromIni[voiceGroupId][int(l[1:4])] = l.split(',')[1].split('\\')[-1].split('.')[0].strip()
    #print(VoiceGroup2SampleFromIni)

def matchVoiceGroups():
    for songId, voiceGroupId in Song2VoiceGroupFromMk.items():
        otherVoiceGroupId = Song2VoiceGroupFromIni[songId]
        if voiceGroupId in VoiceGroupMatches:
            if VoiceGroupMatches[voiceGroupId] != otherVoiceGroupId:
                print('Conflict in voice group macthing: {} -> {} or {}'.format(voiceGroupId, VoiceGroupMatches[voiceGroupId], otherVoiceGroupId))
        else:
            VoiceGroupMatches[voiceGroupId] = otherVoiceGroupId
    checkDuplicatedMatches(VoiceGroupMatches)
    #print(VoiceGroupMatches)

def matchSamples():
    for voiceGroupId, sampleIds in VoiceGroup2SampleFromS.items():
        if voiceGroupId not in VoiceGroupMatches:
            continue
        otherSampleIds = VoiceGroup2SampleFromIni[VoiceGroupMatches[voiceGroupId]]
        #print(sampleIds, otherSampleIds)
        for index, sampleId in sampleIds.items():
            if index not in otherSampleIds:
                continue
            otherSampleId = otherSampleIds[index]
            if sampleId in SampleMatches:
                if SampleMatches[sampleId] != otherSampleId:
                    print('Conflict in sample macthing: {} -> {} or {}'.format(sampleId, SampleMatches[sampleId], otherSampleId))
            else:
                SampleMatches[sampleId] = otherSampleId
    checkDuplicatedMatches(SampleMatches)
    #print(SampleMatches)

def readSampleMatchedByHash():
    with open('matched_by_hash.txt', 'r') as f:
        while True:
            l = f.readline()
            if not l:
                break
            l = l[:-1]
            s1, s2 = l.split()
            SampleMatchedByHash[s1] = s2

def mergeMatches():
    for s1, s2 in SampleMatchedByHash.items():
        if s1 in SampleMatches and SampleMatches[s1] != s2:
            print('conflict with matching by hash: {} -> {} but {} (by hash)'.format(s1, SampleMatches[s1], s2))
    SampleMatches.update(SampleMatchedByHash)
    #SampleMatches = {**SampleMatches, **SampleMatchedByHash}

def printMatches():
    #print('{} samples matched!'.format(len(SampleMatches)))
    for s1, s2 in SampleMatches.items():
        print(s1, s2)

readSong2VoiceGroupFromMk()
readVoiceGroup2SampleFromS()
readSong2VoiceGroupFromIni()
readVoiceGroup2SampleFromIni()
matchVoiceGroups()
matchSamples()
readSampleMatchedByHash()
mergeMatches()
printMatches()

