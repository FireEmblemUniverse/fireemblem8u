    .section .rodata

    .include "asm/macros/m4a.inc"
    .include "asm/macros/music_voice.inc"

    .align 4
    .incbin "baserom.gba", 0x207470, 0x1CCE0 @ voice_groups.inc

    .include "sound/keysplit_tables.inc" @ unused
    .include "sound/programmable_wave_data.inc"
    .include "sound/music_player_table.inc"
    .include "sound/song_table.inc"

    .incbin "baserom.gba", 0x2263B4, 0x31FED4 @ direct_sound_data.inc

@ TODO: Disassemble and link these songs in via linker script like other repositories.
song_000:
    .incbin "baserom.gba", 0x546288, 0x17EC
song_001:
    .incbin "baserom.gba", 0x547A74, 0x5CC
song_002:
    .incbin "baserom.gba", 0x548040, 0x8BC
song_003:
    .incbin "baserom.gba", 0x5488FC, 0xCEC
song_004:
    .incbin "baserom.gba", 0x5495E8, 0xED8
song_005:
    .incbin "baserom.gba", 0x54A4C0, 0xD18
song_006:
    .incbin "baserom.gba", 0x54B1D8, 0xCB8
song_007:
    .incbin "baserom.gba", 0x54BE90, 0x18A4
song_008:
    .incbin "baserom.gba", 0x54D734, 0x1C88
song_009:
    .incbin "baserom.gba", 0x54F3BC, 0x11EC
song_010:
    .incbin "baserom.gba", 0x5505A8, 0x1110
song_011:
    .incbin "baserom.gba", 0x5516B8, 0x13A4
song_012:
    .incbin "baserom.gba", 0x552A5C, 0x844
song_013:
    .incbin "baserom.gba", 0x5532A0, 0x9D4
song_014:
    .incbin "baserom.gba", 0x553C74, 0x72C
song_015:
    .incbin "baserom.gba", 0x5543A0, 0x1B38
song_016:
    .incbin "baserom.gba", 0x555ED8, 0xF2C
song_017:
    .incbin "baserom.gba", 0x556E04, 0x98C
song_018:
    .incbin "baserom.gba", 0x557790, 0x1084
song_019:
    .incbin "baserom.gba", 0x558814, 0x1454
song_020:
    .incbin "baserom.gba", 0x559C68, 0xA0C
song_021:
    .incbin "baserom.gba", 0x55A674, 0x1564
song_022:
    .incbin "baserom.gba", 0x55BBD8, 0x10C4
song_023:
    .incbin "baserom.gba", 0x55CC9C, 0xC10
song_024:
    .incbin "baserom.gba", 0x55D8AC, 0x7E0
song_025:
    .incbin "baserom.gba", 0x55E08C, 0x798
song_026:
    .incbin "baserom.gba", 0x55E824, 0x700
song_027:
    .incbin "baserom.gba", 0x55EF24, 0xA7C
song_028:
    .incbin "baserom.gba", 0x55F9A0, 0xB68
song_029:
    .incbin "baserom.gba", 0x560508, 0x438
song_030:
    .incbin "baserom.gba", 0x560940, 0x5F0
song_031:
    .incbin "baserom.gba", 0x560F30, 0x660
song_032:
    .incbin "baserom.gba", 0x561590, 0x890
song_033:
    .incbin "baserom.gba", 0x561E20, 0x868
song_034:
    .incbin "baserom.gba", 0x562688, 0x7E8
song_035:
    .incbin "baserom.gba", 0x562E70, 0x94C
song_036:
    .incbin "baserom.gba", 0x5637BC, 0x12F0
song_037:
    .incbin "baserom.gba", 0x564AAC, 0x764
song_038:
    .incbin "baserom.gba", 0x565210, 0x7B0
song_039:
    .incbin "baserom.gba", 0x5659C0, 0xAE4
song_040:
    .incbin "baserom.gba", 0x5664A4, 0x730
song_041:
    .incbin "baserom.gba", 0x566BD4, 0x1070
song_042:
    .incbin "baserom.gba", 0x567C44, 0xEE4
song_043:
    .incbin "baserom.gba", 0x568B28, 0xB7C
song_044:
    .incbin "baserom.gba", 0x5696A4, 0xC6C
song_045:
    .incbin "baserom.gba", 0x56A310, 0xB24
song_046:
    .incbin "baserom.gba", 0x56AE34, 0x678
song_047:
    .incbin "baserom.gba", 0x56B4AC, 0x8E8
song_048:
    .incbin "baserom.gba", 0x56BD94, 0x888
song_049:
    .incbin "baserom.gba", 0x56C61C, 0xA90
song_050:
    .incbin "baserom.gba", 0x56D0AC, 0x654
song_051:
    .incbin "baserom.gba", 0x56D700, 0x4B0
song_052:
    .incbin "baserom.gba", 0x56DBB0, 0x370
song_053:
    .incbin "baserom.gba", 0x56DF20, 0x2E8
song_054:
    .incbin "baserom.gba", 0x56E208, 0x794
song_055:
    .incbin "baserom.gba", 0x56E99C, 0x870
song_056:
    .incbin "baserom.gba", 0x56F20C, 0x120
song_057:
    .incbin "baserom.gba", 0x56F32C, 0x5D0
song_058:
    .incbin "baserom.gba", 0x56F8FC, 0x15C
song_059:
    .incbin "baserom.gba", 0x56FA58, 0x1B8
song_060:
    .incbin "baserom.gba", 0x56FC10, 0xB98
song_061:
    .incbin "baserom.gba", 0x5707A8, 0x76C
song_062:
    .incbin "baserom.gba", 0x570F14, 0x600
song_063:
    .incbin "baserom.gba", 0x571514, 0xD34
song_064:
    .incbin "baserom.gba", 0x572248, 0xD9C
song_065:
    .incbin "baserom.gba", 0x572FE4, 0x11E8
song_066:
    .incbin "baserom.gba", 0x5741CC, 0x498
song_067:
    .incbin "baserom.gba", 0x574664, 0xABC
song_068:
    .incbin "baserom.gba", 0x575120, 0x177C
song_069:
    .incbin "baserom.gba", 0x57689C, 0x680
song_070:
    .incbin "baserom.gba", 0x576F1C, 0x6F8
song_071:
    .incbin "baserom.gba", 0x577614, 0x7A0
song_072:
    .incbin "baserom.gba", 0x577DB4, 0x550
song_073:
    .incbin "baserom.gba", 0x578304, 0x860
song_074:
    .incbin "baserom.gba", 0x578B64, 0x608
song_075:
    .incbin "baserom.gba", 0x57916C, 0xDA4
song_076:
    .incbin "baserom.gba", 0x579F10, 0x53C
song_077:
    .incbin "baserom.gba", 0x57A44C, 0xE8
song_078:
    .incbin "baserom.gba", 0x57A534, 0x18C
song_079:
    .incbin "baserom.gba", 0x57A6C0, 0x7DC
song_080:
    .incbin "baserom.gba", 0x57AE9C, 0x704
song_081:
    .incbin "baserom.gba", 0x57B5A0, 0x108
song_082:
    .incbin "baserom.gba", 0x57B6A8, 0xA20
song_083:
    .incbin "baserom.gba", 0x57C0C8, 0xD3C
song_084:
    .incbin "baserom.gba", 0x57CE04, 0x24
song_085:
    .incbin "baserom.gba", 0x57CE28, 0x68
song_086:
    .incbin "baserom.gba", 0x57CE90, 0x6C
song_087:
    .incbin "baserom.gba", 0x57CEFC, 0xF0
song_088:
    .incbin "baserom.gba", 0x57CFEC, 0x4C
song_089:
    .incbin "baserom.gba", 0x57D038, 0x54
song_090:
    .incbin "baserom.gba", 0x57D08C, 0x1C
song_091:
    .incbin "baserom.gba", 0x57D0A8, 0x1C
song_092:
    .incbin "baserom.gba", 0x57D0C4, 0x1C
song_093:
    .incbin "baserom.gba", 0x57D0E0, 0x2C
song_094:
    .incbin "baserom.gba", 0x57D10C, 0x38
song_095:
    .incbin "baserom.gba", 0x57D144, 0x38
song_096:
    .incbin "baserom.gba", 0x57D17C, 0x30
song_097:
    .incbin "baserom.gba", 0x57D1AC, 0x24
song_098:
    .incbin "baserom.gba", 0x57D1D0, 0xD4
song_099:
    .incbin "baserom.gba", 0x57D2A4, 0x24
song_100:
    .incbin "baserom.gba", 0x57D2C8, 0x58
song_101:
    .incbin "baserom.gba", 0x57D320, 0x34
song_102:
    .incbin "baserom.gba", 0x57D354, 0x38
song_103:
    .incbin "baserom.gba", 0x57D38C, 0x30
song_104:
    .incbin "baserom.gba", 0x57D3BC, 0x7C
song_105:
    .incbin "baserom.gba", 0x57D438, 0xA4
song_106:
    .incbin "baserom.gba", 0x57D4DC, 0x1C
song_107:
    .incbin "baserom.gba", 0x57D4F8, 0x4C
song_108:
    .incbin "baserom.gba", 0x57D544, 0x44
song_109:
    .incbin "baserom.gba", 0x57D588, 0x8C
song_110:
    .incbin "baserom.gba", 0x57D614, 0x8C
song_111:
    .incbin "baserom.gba", 0x57D6A0, 0x20
song_112:
    .incbin "baserom.gba", 0x57D6C0, 0x58
song_113:
    .incbin "baserom.gba", 0x57D718, 0x24
song_114:
    .incbin "baserom.gba", 0x57D73C, 0x2C
song_115:
    .incbin "baserom.gba", 0x57D768, 0x50
song_116:
    .incbin "baserom.gba", 0x57D7B8, 0x6C
song_117:
    .incbin "baserom.gba", 0x57D824, 0x38
song_118:
    .incbin "baserom.gba", 0x57D85C, 0x70
song_119:
    .incbin "baserom.gba", 0x57D8CC, 0x50
song_120:
    .incbin "baserom.gba", 0x57D91C, 0x30
song_121:
    .incbin "baserom.gba", 0x57D94C, 0x1C
song_122:
    .incbin "baserom.gba", 0x57D968, 0x1C
song_123:
    .incbin "baserom.gba", 0x57D984, 0x50
song_124:
    .incbin "baserom.gba", 0x57D9D4, 0x6C
song_125:
    .incbin "baserom.gba", 0x57DA40, 0x4C
song_126:
    .incbin "baserom.gba", 0x57DA8C, 0x6C
song_127:
    .incbin "baserom.gba", 0x57DAF8, 0x6C
song_128:
    .incbin "baserom.gba", 0x57DB64, 0x78
song_129:
    .incbin "baserom.gba", 0x57DBDC, 0xA0
song_130:
    .incbin "baserom.gba", 0x57DC7C, 0xA4
song_131:
    .incbin "baserom.gba", 0x57DD20, 0x80
song_132:
    .incbin "baserom.gba", 0x57DDA0, 0xA4
song_133:
    .incbin "baserom.gba", 0x57DE44, 0xCC
song_134:
    .incbin "baserom.gba", 0x57DF10, 0x118
song_135:
    .incbin "baserom.gba", 0x57E028, 0x24
song_136:
    .incbin "baserom.gba", 0x57E04C, 0x1C
song_137:
    .incbin "baserom.gba", 0x57E068, 0x1C
song_138:
    .incbin "baserom.gba", 0x57E084, 0x1C
song_139:
    .incbin "baserom.gba", 0x57E0A0, 0x1C
song_140:
    .incbin "baserom.gba", 0x57E0BC, 0x1C
song_141:
    .incbin "baserom.gba", 0x57E0D8, 0x1C
song_142:
    .incbin "baserom.gba", 0x57E0F4, 0x1C
song_143:
    .incbin "baserom.gba", 0x57E110, 0x1C
song_144:
    .incbin "baserom.gba", 0x57E12C, 0x1C
song_145:
    .incbin "baserom.gba", 0x57E148, 0x1C
song_146:
    .incbin "baserom.gba", 0x57E164, 0x1C
song_147:
    .incbin "baserom.gba", 0x57E180, 0x1C
song_148:
    .incbin "baserom.gba", 0x57E19C, 0x1C
song_149:
    .incbin "baserom.gba", 0x57E1B8, 0x1C
song_150:
    .incbin "baserom.gba", 0x57E1D4, 0x1C
song_151:
    .incbin "baserom.gba", 0x57E1F0, 0x1C
song_152:
    .incbin "baserom.gba", 0x57E20C, 0x1C
song_153:
    .incbin "baserom.gba", 0x57E228, 0x68
song_154:
    .incbin "baserom.gba", 0x57E290, 0x1C
song_155:
    .incbin "baserom.gba", 0x57E2AC, 0x1C
song_156:
    .incbin "baserom.gba", 0x57E2C8, 0x1C
song_157:
    .incbin "baserom.gba", 0x57E2E4, 0x1C
song_158:
    .incbin "baserom.gba", 0x57E300, 0x1C
song_159:
    .incbin "baserom.gba", 0x57E31C, 0x8C
song_160:
    .incbin "baserom.gba", 0x57E3A8, 0x20
song_161:
    .incbin "baserom.gba", 0x57E3C8, 0x1C
song_162:
    .incbin "baserom.gba", 0x57E3E4, 0x1C
song_163:
    .incbin "baserom.gba", 0x57E400, 0x1C
song_164:
    .incbin "baserom.gba", 0x57E41C, 0xA8
song_165:
    .incbin "baserom.gba", 0x57E4C4, 0x20
song_166:
    .incbin "baserom.gba", 0x57E4E4, 0x20
song_167:
    .incbin "baserom.gba", 0x57E504, 0x1C
song_168:
    .incbin "baserom.gba", 0x57E520, 0x44
song_169:
    .incbin "baserom.gba", 0x57E564, 0x44
song_170:
    .incbin "baserom.gba", 0x57E5A8, 0x30
song_171:
    .incbin "baserom.gba", 0x57E5D8, 0x204
song_172:
    .incbin "baserom.gba", 0x57E7DC, 0x1C
song_173:
    .incbin "baserom.gba", 0x57E7F8, 0x1C
song_174:
    .incbin "baserom.gba", 0x57E814, 0x1C
song_175:
    .incbin "baserom.gba", 0x57E830, 0x1C
song_176:
    .incbin "baserom.gba", 0x57E84C, 0x1C
song_177:
    .incbin "baserom.gba", 0x57E868, 0x1C
song_178:
    .incbin "baserom.gba", 0x57E884, 0x1C
song_179:
    .incbin "baserom.gba", 0x57E8A0, 0x1C
song_180:
    .incbin "baserom.gba", 0x57E8BC, 0x1C
song_181:
    .incbin "baserom.gba", 0x57E8D8, 0x3C
song_183:
    .incbin "baserom.gba", 0x57E914, 0x1C
song_184:
    .incbin "baserom.gba", 0x57E930, 0x1C
song_185:
    .incbin "baserom.gba", 0x57E94C, 0x1C
song_186:
    .incbin "baserom.gba", 0x57E968, 0x1C
song_187:
    .incbin "baserom.gba", 0x57E984, 0x1C
song_188:
    .incbin "baserom.gba", 0x57E9A0, 0x1C
song_189:
    .incbin "baserom.gba", 0x57E9BC, 0xA0
song_190:
    .incbin "baserom.gba", 0x57EA5C, 0x5C
song_191:
    .incbin "baserom.gba", 0x57EAB8, 0x60
song_192:
    .incbin "baserom.gba", 0x57EB18, 0x7C
song_193:
    .incbin "baserom.gba", 0x57EB94, 0x1C
song_194:
    .incbin "baserom.gba", 0x57EBB0, 0x20
song_195:
    .incbin "baserom.gba", 0x57EBD0, 0x1C
song_196:
    .incbin "baserom.gba", 0x57EBEC, 0x1C
song_197:
    .incbin "baserom.gba", 0x57EC08, 0x1C
song_198:
    .incbin "baserom.gba", 0x57EC24, 0x1C
song_199:
    .incbin "baserom.gba", 0x57EC40, 0x1C
song_200:
    .incbin "baserom.gba", 0x57EC5C, 0x1C
song_201:
    .incbin "baserom.gba", 0x57EC78, 0x1C
song_202:
    .incbin "baserom.gba", 0x57EC94, 0x1C
song_203:
    .incbin "baserom.gba", 0x57ECB0, 0x1C
song_204:
    .incbin "baserom.gba", 0x57ECCC, 0x84
song_205:
    .incbin "baserom.gba", 0x57ED50, 0x6C
song_206:
    .incbin "baserom.gba", 0x57EDBC, 0x1C
song_207:
    .incbin "baserom.gba", 0x57EDD8, 0xA0
song_208:
    .incbin "baserom.gba", 0x57EE78, 0x60
song_209:
    .incbin "baserom.gba", 0x57EED8, 0x40
song_210:
    .incbin "baserom.gba", 0x57EF18, 0x1C
song_211:
    .incbin "baserom.gba", 0x57EF34, 0x68
song_212:
    .incbin "baserom.gba", 0x57EF9C, 0x74
song_213:
    .incbin "baserom.gba", 0x57F010, 0x74
song_214:
    .incbin "baserom.gba", 0x57F084, 0x8C
song_215:
    .incbin "baserom.gba", 0x57F110, 0x64
song_216:
    .incbin "baserom.gba", 0x57F174, 0x68
song_217:
    .incbin "baserom.gba", 0x57F1DC, 0xF4
song_218:
    .incbin "baserom.gba", 0x57F2D0, 0x50
song_219:
    .incbin "baserom.gba", 0x57F320, 0x80
song_220:
    .incbin "baserom.gba", 0x57F3A0, 0x80
song_221:
    .incbin "baserom.gba", 0x57F420, 0x6C
song_222:
    .incbin "baserom.gba", 0x57F48C, 0x6C
song_223:
    .incbin "baserom.gba", 0x57F4F8, 0x74
song_224:
    .incbin "baserom.gba", 0x57F56C, 0x74
song_225:
    .incbin "baserom.gba", 0x57F5E0, 0xE4
song_226:
    .incbin "baserom.gba", 0x57F6C4, 0x34
song_227:
    .incbin "baserom.gba", 0x57F6F8, 0x1C
song_228:
    .incbin "baserom.gba", 0x57F714, 0x1C
song_229:
    .incbin "baserom.gba", 0x57F730, 0x1C
song_230:
    .incbin "baserom.gba", 0x57F74C, 0x1C
song_231:
    .incbin "baserom.gba", 0x57F768, 0x34
song_232:
    .incbin "baserom.gba", 0x57F79C, 0x28
song_233:
    .incbin "baserom.gba", 0x57F7C4, 0x28
song_234:
    .incbin "baserom.gba", 0x57F7EC, 0x188
song_235:
    .incbin "baserom.gba", 0x57F974, 0x20
song_236:
    .incbin "baserom.gba", 0x57F994, 0x20
song_237:
    .incbin "baserom.gba", 0x57F9B4, 0x1C
song_238:
    .incbin "baserom.gba", 0x57F9D0, 0x3C
song_239:
    .incbin "baserom.gba", 0x57FA0C, 0x1C
song_240:
    .incbin "baserom.gba", 0x57FA28, 0x4C
song_241:
    .incbin "baserom.gba", 0x57FA74, 0x5C
song_242:
    .incbin "baserom.gba", 0x57FAD0, 0x5C
song_243:
    .incbin "baserom.gba", 0x57FB2C, 0x20
song_244:
    .incbin "baserom.gba", 0x57FB4C, 0x1C
song_245:
    .incbin "baserom.gba", 0x57FB68, 0x34
song_246:
    .incbin "baserom.gba", 0x57FB9C, 0x40
song_247:
    .incbin "baserom.gba", 0x57FBDC, 0x38
song_248:
    .incbin "baserom.gba", 0x57FC14, 0x1C
song_249:
    .incbin "baserom.gba", 0x57FC30, 0x70
song_250:
    .incbin "baserom.gba", 0x57FCA0, 0xE8
song_251:
    .incbin "baserom.gba", 0x57FD88, 0x20
song_252:
    .incbin "baserom.gba", 0x57FDA8, 0x20
song_253:
    .incbin "baserom.gba", 0x57FDC8, 0x1C
song_254:
    .incbin "baserom.gba", 0x57FDE4, 0x8C
song_255:
    .incbin "baserom.gba", 0x57FE70, 0x1C
song_256:
    .incbin "baserom.gba", 0x57FE8C, 0x140
song_257:
    .incbin "baserom.gba", 0x57FFCC, 0x4A4
song_258:
    .incbin "baserom.gba", 0x580470, 0x5A8
song_259:
    .incbin "baserom.gba", 0x580A18, 0x800
song_260:
    .incbin "baserom.gba", 0x581218, 0x48
song_261:
    .incbin "baserom.gba", 0x581260, 0x1C
song_262:
    .incbin "baserom.gba", 0x58127C, 0x1C
song_263:
    .incbin "baserom.gba", 0x581298, 0x1C
song_264:
    .incbin "baserom.gba", 0x5812B4, 0x1C
song_265:
    .incbin "baserom.gba", 0x5812D0, 0x1C
song_266:
    .incbin "baserom.gba", 0x5812EC, 0x1C
song_267:
    .incbin "baserom.gba", 0x581308, 0x1C
song_268:
    .incbin "baserom.gba", 0x581324, 0x1C
song_269:
    .incbin "baserom.gba", 0x581340, 0x1C
song_270:
    .incbin "baserom.gba", 0x58135C, 0x1C
song_271:
    .incbin "baserom.gba", 0x581378, 0x1C
song_272:
    .incbin "baserom.gba", 0x581394, 0x1C
song_273:
    .incbin "baserom.gba", 0x5813B0, 0x1C
song_274:
    .incbin "baserom.gba", 0x5813CC, 0x1C
song_275:
    .incbin "baserom.gba", 0x5813E8, 0x1C
song_276:
    .incbin "baserom.gba", 0x581404, 0x1C
song_277:
    .incbin "baserom.gba", 0x581420, 0x1C
song_278:
    .incbin "baserom.gba", 0x58143C, 0x1C
song_279:
    .incbin "baserom.gba", 0x581458, 0x1C
song_280:
    .incbin "baserom.gba", 0x581474, 0x1C
song_281:
    .incbin "baserom.gba", 0x581490, 0x1C
song_282:
    .incbin "baserom.gba", 0x5814AC, 0x1C
song_283:
    .incbin "baserom.gba", 0x5814C8, 0x1C
song_284:
    .incbin "baserom.gba", 0x5814E4, 0x1C
song_285:
    .incbin "baserom.gba", 0x581500, 0x1C
song_286:
    .incbin "baserom.gba", 0x58151C, 0x1C
song_287:
    .incbin "baserom.gba", 0x581538, 0x1C
song_288:
    .incbin "baserom.gba", 0x581554, 0x1C
song_289:
    .incbin "baserom.gba", 0x581570, 0x1C
song_290:
    .incbin "baserom.gba", 0x58158C, 0x1C
song_291:
    .incbin "baserom.gba", 0x5815A8, 0x1C
song_292:
    .incbin "baserom.gba", 0x5815C4, 0x1C
song_293:
    .incbin "baserom.gba", 0x5815E0, 0x1C
song_294:
    .incbin "baserom.gba", 0x5815FC, 0x1C
song_295:
    .incbin "baserom.gba", 0x581618, 0x1C
song_296:
    .incbin "baserom.gba", 0x581634, 0x1C
song_297:
    .incbin "baserom.gba", 0x581650, 0x1C
song_298:
    .incbin "baserom.gba", 0x58166C, 0x1C
song_299:
    .incbin "baserom.gba", 0x581688, 0x1C
song_300:
    .incbin "baserom.gba", 0x5816A4, 0x1C
song_301:
    .incbin "baserom.gba", 0x5816C0, 0x1C
song_302:
    .incbin "baserom.gba", 0x5816DC, 0x1C
song_303:
    .incbin "baserom.gba", 0x5816F8, 0x1C
song_304:
    .incbin "baserom.gba", 0x581714, 0x1C
song_305:
    .incbin "baserom.gba", 0x581730, 0x1C
song_306:
    .incbin "baserom.gba", 0x58174C, 0x1C
song_307:
    .incbin "baserom.gba", 0x581768, 0x1C
song_308:
    .incbin "baserom.gba", 0x581784, 0x1C
song_309:
    .incbin "baserom.gba", 0x5817A0, 0x1C
song_310:
    .incbin "baserom.gba", 0x5817BC, 0x1C
song_311:
    .incbin "baserom.gba", 0x5817D8, 0x1C
song_312:
    .incbin "baserom.gba", 0x5817F4, 0x1C
song_313:
    .incbin "baserom.gba", 0x581810, 0x1C
song_314:
    .incbin "baserom.gba", 0x58182C, 0x1C
song_315:
    .incbin "baserom.gba", 0x581848, 0x1C
song_316:
    .incbin "baserom.gba", 0x581864, 0x1C
song_317:
    .incbin "baserom.gba", 0x581880, 0x1C
song_318:
    .incbin "baserom.gba", 0x58189C, 0x1C
song_319:
    .incbin "baserom.gba", 0x5818B8, 0x1C
song_320:
    .incbin "baserom.gba", 0x5818D4, 0x1C
song_321:
    .incbin "baserom.gba", 0x5818F0, 0x1C
song_322:
    .incbin "baserom.gba", 0x58190C, 0x1C
song_323:
    .incbin "baserom.gba", 0x581928, 0x1C
song_324:
    .incbin "baserom.gba", 0x581944, 0x1C
song_325:
    .incbin "baserom.gba", 0x581960, 0x1C
song_326:
    .incbin "baserom.gba", 0x58197C, 0x1C
song_327:
    .incbin "baserom.gba", 0x581998, 0x1C
song_328:
    .incbin "baserom.gba", 0x5819B4, 0x1C
song_329:
    .incbin "baserom.gba", 0x5819D0, 0x1C
song_330:
    .incbin "baserom.gba", 0x5819EC, 0x1C
song_331:
    .incbin "baserom.gba", 0x581A08, 0x1C
song_332:
    .incbin "baserom.gba", 0x581A24, 0x1C
song_333:
    .incbin "baserom.gba", 0x581A40, 0x1C
song_334:
    .incbin "baserom.gba", 0x581A5C, 0x1C
song_335:
    .incbin "baserom.gba", 0x581A78, 0x1C
song_336:
    .incbin "baserom.gba", 0x581A94, 0x1C
song_337:
    .incbin "baserom.gba", 0x581AB0, 0x1C
song_338:
    .incbin "baserom.gba", 0x581ACC, 0x1C
song_339:
    .incbin "baserom.gba", 0x581AE8, 0x1C
song_340:
    .incbin "baserom.gba", 0x581B04, 0x1C
song_341:
    .incbin "baserom.gba", 0x581B20, 0x1C
song_342:
    .incbin "baserom.gba", 0x581B3C, 0x1C
song_343:
    .incbin "baserom.gba", 0x581B58, 0x1C
song_344:
    .incbin "baserom.gba", 0x581B74, 0x1C
song_345:
    .incbin "baserom.gba", 0x581B90, 0x1C
song_346:
    .incbin "baserom.gba", 0x581BAC, 0x1C
song_347:
    .incbin "baserom.gba", 0x581BC8, 0x1C
song_348:
    .incbin "baserom.gba", 0x581BE4, 0x1C
song_349:
    .incbin "baserom.gba", 0x581C00, 0x1C
song_350:
    .incbin "baserom.gba", 0x581C1C, 0x1C
song_351:
    .incbin "baserom.gba", 0x581C38, 0x1C
song_352:
    .incbin "baserom.gba", 0x581C54, 0x1C
song_353:
    .incbin "baserom.gba", 0x581C70, 0x1C
song_354:
    .incbin "baserom.gba", 0x581C8C, 0x1C
song_355:
    .incbin "baserom.gba", 0x581CA8, 0x1C
song_356:
    .incbin "baserom.gba", 0x581CC4, 0x1C
song_357:
    .incbin "baserom.gba", 0x581CE0, 0x1C
song_358:
    .incbin "baserom.gba", 0x581CFC, 0x1C
song_359:
    .incbin "baserom.gba", 0x581D18, 0x1C
song_360:
    .incbin "baserom.gba", 0x581D34, 0x1C
song_361:
    .incbin "baserom.gba", 0x581D50, 0x1C
song_362:
    .incbin "baserom.gba", 0x581D6C, 0x1C
song_363:
    .incbin "baserom.gba", 0x581D88, 0x1C
song_364:
    .incbin "baserom.gba", 0x581DA4, 0x1C
song_365:
    .incbin "baserom.gba", 0x581DC0, 0x1C
song_366:
    .incbin "baserom.gba", 0x581DDC, 0x1C
song_367:
    .incbin "baserom.gba", 0x581DF8, 0x1C
song_368:
    .incbin "baserom.gba", 0x581E14, 0x1C
song_369:
    .incbin "baserom.gba", 0x581E30, 0x1C
song_370:
    .incbin "baserom.gba", 0x581E4C, 0x1C
song_371:
    .incbin "baserom.gba", 0x581E68, 0x1C
song_372:
    .incbin "baserom.gba", 0x581E84, 0x1C
song_373:
    .incbin "baserom.gba", 0x581EA0, 0x1C
song_374:
    .incbin "baserom.gba", 0x581EBC, 0x1C
song_375:
    .incbin "baserom.gba", 0x581ED8, 0x1C
song_376:
    .incbin "baserom.gba", 0x581EF4, 0x1C
song_377:
    .incbin "baserom.gba", 0x581F10, 0x1C
song_378:
    .incbin "baserom.gba", 0x581F2C, 0x1C
song_379:
    .incbin "baserom.gba", 0x581F48, 0x1C
song_380:
    .incbin "baserom.gba", 0x581F64, 0x1C
song_381:
    .incbin "baserom.gba", 0x581F80, 0x1C
song_382:
    .incbin "baserom.gba", 0x581F9C, 0x1C
song_383:
    .incbin "baserom.gba", 0x581FB8, 0x1C
song_384:
    .incbin "baserom.gba", 0x581FD4, 0x1C
song_385:
    .incbin "baserom.gba", 0x581FF0, 0x1C
song_386:
    .incbin "baserom.gba", 0x58200C, 0x1C
song_387:
    .incbin "baserom.gba", 0x582028, 0x1C
song_388:
    .incbin "baserom.gba", 0x582044, 0x1C
song_389:
    .incbin "baserom.gba", 0x582060, 0x1C
song_390:
    .incbin "baserom.gba", 0x58207C, 0x1C
song_391:
    .incbin "baserom.gba", 0x582098, 0x1C
song_392:
    .incbin "baserom.gba", 0x5820B4, 0x1C
song_393:
    .incbin "baserom.gba", 0x5820D0, 0x1C
song_394:
    .incbin "baserom.gba", 0x5820EC, 0x1C
song_395:
    .incbin "baserom.gba", 0x582108, 0x1C
song_396:
    .incbin "baserom.gba", 0x582124, 0x1C
song_397:
    .incbin "baserom.gba", 0x582140, 0x1C
song_398:
    .incbin "baserom.gba", 0x58215C, 0x1C
song_399:
    .incbin "baserom.gba", 0x582178, 0x1C
song_400:
    .incbin "baserom.gba", 0x582194, 0x1C
song_401:
    .incbin "baserom.gba", 0x5821B0, 0x1C
song_402:
    .incbin "baserom.gba", 0x5821CC, 0x1C
song_403:
    .incbin "baserom.gba", 0x5821E8, 0x1C
song_404:
    .incbin "baserom.gba", 0x582204, 0x1C
song_405:
    .incbin "baserom.gba", 0x582220, 0x1C
song_406:
    .incbin "baserom.gba", 0x58223C, 0x1C
song_407:
    .incbin "baserom.gba", 0x582258, 0x1C
song_408:
    .incbin "baserom.gba", 0x582274, 0x1C
song_409:
    .incbin "baserom.gba", 0x582290, 0x1C
song_410:
    .incbin "baserom.gba", 0x5822AC, 0x1C
song_411:
    .incbin "baserom.gba", 0x5822C8, 0x1C
song_412:
    .incbin "baserom.gba", 0x5822E4, 0x1C
song_413:
    .incbin "baserom.gba", 0x582300, 0x1C
song_414:
    .incbin "baserom.gba", 0x58231C, 0x1C
song_415:
    .incbin "baserom.gba", 0x582338, 0x1C
song_416:
    .incbin "baserom.gba", 0x582354, 0x1C
song_417:
    .incbin "baserom.gba", 0x582370, 0x1C
song_418:
    .incbin "baserom.gba", 0x58238C, 0x1C
song_419:
    .incbin "baserom.gba", 0x5823A8, 0x1C
song_420:
    .incbin "baserom.gba", 0x5823C4, 0x1C
song_421:
    .incbin "baserom.gba", 0x5823E0, 0x1C
song_422:
    .incbin "baserom.gba", 0x5823FC, 0x1C
song_423:
    .incbin "baserom.gba", 0x582418, 0x1C
song_424:
    .incbin "baserom.gba", 0x582434, 0x1C
song_425:
    .incbin "baserom.gba", 0x582450, 0x1C
song_426:
    .incbin "baserom.gba", 0x58246C, 0x1C
song_427:
    .incbin "baserom.gba", 0x582488, 0x1C
song_428:
    .incbin "baserom.gba", 0x5824A4, 0x1C
song_429:
    .incbin "baserom.gba", 0x5824C0, 0x1C
song_430:
    .incbin "baserom.gba", 0x5824DC, 0x1C
song_431:
    .incbin "baserom.gba", 0x5824F8, 0x1C
song_432:
    .incbin "baserom.gba", 0x582514, 0x1C
song_433:
    .incbin "baserom.gba", 0x582530, 0x1C
song_434:
    .incbin "baserom.gba", 0x58254C, 0x1C
song_435:
    .incbin "baserom.gba", 0x582568, 0x1C
song_436:
    .incbin "baserom.gba", 0x582584, 0x1C
song_437:
    .incbin "baserom.gba", 0x5825A0, 0x1C
song_438:
    .incbin "baserom.gba", 0x5825BC, 0x1C
song_439:
    .incbin "baserom.gba", 0x5825D8, 0x1C
song_440:
    .incbin "baserom.gba", 0x5825F4, 0x1C
song_441:
    .incbin "baserom.gba", 0x582610, 0x1C
song_442:
    .incbin "baserom.gba", 0x58262C, 0x1C
song_443:
    .incbin "baserom.gba", 0x582648, 0x1C
song_444:
    .incbin "baserom.gba", 0x582664, 0x1C
song_445:
    .incbin "baserom.gba", 0x582680, 0x1C
song_446:
    .incbin "baserom.gba", 0x58269C, 0x1C
song_447:
    .incbin "baserom.gba", 0x5826B8, 0x1C
song_448:
    .incbin "baserom.gba", 0x5826D4, 0x1C
song_449:
    .incbin "baserom.gba", 0x5826F0, 0x1C
song_450:
    .incbin "baserom.gba", 0x58270C, 0x1C8
song_451:
    .incbin "baserom.gba", 0x5828D4, 0xA8
song_452:
    .incbin "baserom.gba", 0x58297C, 0x48
song_453:
    .incbin "baserom.gba", 0x5829C4, 0x1C
song_454:
    .incbin "baserom.gba", 0x5829E0, 0x1C
song_455:
    .incbin "baserom.gba", 0x5829FC, 0x1C
song_456:
    .incbin "baserom.gba", 0x582A18, 0x1C
song_457:
    .incbin "baserom.gba", 0x582A34, 0x1C
song_458:
    .incbin "baserom.gba", 0x582A50, 0x1C
song_459:
    .incbin "baserom.gba", 0x582A6C, 0x1C
song_460:
    .incbin "baserom.gba", 0x582A88, 0x1C
song_461:
    .incbin "baserom.gba", 0x582AA4, 0x1C
song_462:
    .incbin "baserom.gba", 0x582AC0, 0x1C
song_463:
    .incbin "baserom.gba", 0x582ADC, 0x1C
song_464:
    .incbin "baserom.gba", 0x582AF8, 0x1C
song_465:
    .incbin "baserom.gba", 0x582B14, 0x1C
song_466:
    .incbin "baserom.gba", 0x582B30, 0x1C
song_467:
    .incbin "baserom.gba", 0x582B4C, 0x30
song_468:
    .incbin "baserom.gba", 0x582B7C, 0x20
song_469:
    .incbin "baserom.gba", 0x582B9C, 0x2C
song_470:
    .incbin "baserom.gba", 0x582BC8, 0x34
song_471:
    .incbin "baserom.gba", 0x582BFC, 0x3A8
song_472:
    .incbin "baserom.gba", 0x582FA4, 0x1C0
song_473:
    .incbin "baserom.gba", 0x583164, 0x20
song_474:
    .incbin "baserom.gba", 0x583184, 0x34
song_475:
    .incbin "baserom.gba", 0x5831B8, 0x20
song_476:
    .incbin "baserom.gba", 0x5831D8, 0x30
song_477:
    .incbin "baserom.gba", 0x583208, 0x20
song_478:
    .incbin "baserom.gba", 0x583228, 0x1C
song_479:
    .incbin "baserom.gba", 0x583244, 0x38
song_480:
    .incbin "baserom.gba", 0x58327C, 0x9C
song_481:
    .incbin "baserom.gba", 0x583318, 0x68
song_482:
    .incbin "baserom.gba", 0x583380, 0x104
song_483:
    .incbin "baserom.gba", 0x583484, 0x20
song_484:
    .incbin "baserom.gba", 0x5834A4, 0x34
song_485:
    .incbin "baserom.gba", 0x5834D8, 0x34
song_486:
    .incbin "baserom.gba", 0x58350C, 0x20
song_487:
    .incbin "baserom.gba", 0x58352C, 0x38
song_488:
    .incbin "baserom.gba", 0x583564, 0x6C
song_489:
    .incbin "baserom.gba", 0x5835D0, 0x68
song_490:
    .incbin "baserom.gba", 0x583638, 0x6C
song_491:
    .incbin "baserom.gba", 0x5836A4, 0x194
song_492:
    .incbin "baserom.gba", 0x583838, 0x190
song_493:
    .incbin "baserom.gba", 0x5839C8, 0x19C
song_494:
    .incbin "baserom.gba", 0x583B64, 0x1A8
song_495:
    .incbin "baserom.gba", 0x583D0C, 0x30
song_496:
    .incbin "baserom.gba", 0x583D3C, 0x1C
song_497:
    .incbin "baserom.gba", 0x583D58, 0x4C
song_498:
    .incbin "baserom.gba", 0x583DA4, 0x40
song_499:
    .incbin "baserom.gba", 0x583DE4, 0x1C
song_500:
    .incbin "baserom.gba", 0x583E00, 0x2C
song_501:
    .incbin "baserom.gba", 0x583E2C, 0x20
song_502:
    .incbin "baserom.gba", 0x583E4C, 0x1C
song_503:
    .incbin "baserom.gba", 0x583E68, 0x1C
song_504:
    .incbin "baserom.gba", 0x583E84, 0x1C
song_505:
    .incbin "baserom.gba", 0x583EA0, 0x1C
song_506:
    .incbin "baserom.gba", 0x583EBC, 0x1C
song_507:
    .incbin "baserom.gba", 0x583ED8, 0x1C
song_508:
    .incbin "baserom.gba", 0x583EF4, 0x1C
song_509:
    .incbin "baserom.gba", 0x583F10, 0x28
song_510:
    .incbin "baserom.gba", 0x583F38, 0x20
song_511:
    .incbin "baserom.gba", 0x583F58, 0x1C
song_512:
    .incbin "baserom.gba", 0x583F74, 0x1C
song_513:
    .incbin "baserom.gba", 0x583F90, 0x52C
song_514:
    .incbin "baserom.gba", 0x5844BC, 0x28
song_515:
    .incbin "baserom.gba", 0x5844E4, 0x1C
song_516:
    .incbin "baserom.gba", 0x584500, 0x1C
song_517:
    .incbin "baserom.gba", 0x58451C, 0x1C
song_518:
    .incbin "baserom.gba", 0x584538, 0x3C
song_519:
    .incbin "baserom.gba", 0x584574, 0x3C
song_520:
    .incbin "baserom.gba", 0x5845B0, 0x40
song_521:
    .incbin "baserom.gba", 0x5845F0, 0x20
song_522:
    .incbin "baserom.gba", 0x584610, 0x1C
song_523:
    .incbin "baserom.gba", 0x58462C, 0x3C
song_524:
    .incbin "baserom.gba", 0x584668, 0x20
song_525:
    .incbin "baserom.gba", 0x584688, 0x38
song_526:
    .incbin "baserom.gba", 0x5846C0, 0x3C
song_527:
    .incbin "baserom.gba", 0x5846FC, 0x3C
song_528:
    .incbin "baserom.gba", 0x584738, 0x20
song_529:
    .incbin "baserom.gba", 0x584758, 0x20
song_530:
    .incbin "baserom.gba", 0x584778, 0x1C
song_531:
    .incbin "baserom.gba", 0x584794, 0x1C
song_532:
    .incbin "baserom.gba", 0x5847B0, 0x1C
song_533:
    .incbin "baserom.gba", 0x5847CC, 0x1C
song_534:
    .incbin "baserom.gba", 0x5847E8, 0x1C
song_535:
    .incbin "baserom.gba", 0x584804, 0x1C
song_536:
    .incbin "baserom.gba", 0x584820, 0x1C
song_537:
    .incbin "baserom.gba", 0x58483C, 0x1C
song_538:
    .incbin "baserom.gba", 0x584858, 0x1C
song_539:
    .incbin "baserom.gba", 0x584874, 0x1C
song_540:
    .incbin "baserom.gba", 0x584890, 0x1C
song_541:
    .incbin "baserom.gba", 0x5848AC, 0x1C
song_542:
    .incbin "baserom.gba", 0x5848C8, 0x1C
song_543:
    .incbin "baserom.gba", 0x5848E4, 0x1C
song_544:
    .incbin "baserom.gba", 0x584900, 0x1C
song_545:
    .incbin "baserom.gba", 0x58491C, 0x1C
song_546:
    .incbin "baserom.gba", 0x584938, 0x1C
song_547:
    .incbin "baserom.gba", 0x584954, 0x1C
song_548:
    .incbin "baserom.gba", 0x584970, 0x1C
song_549:
    .incbin "baserom.gba", 0x58498C, 0x1C
song_550:
    .incbin "baserom.gba", 0x5849A8, 0x1C
song_551:
    .incbin "baserom.gba", 0x5849C4, 0x1C
song_552:
    .incbin "baserom.gba", 0x5849E0, 0xB8
song_553:
    .incbin "baserom.gba", 0x584A98, 0x20
song_554:
    .incbin "baserom.gba", 0x584AB8, 0x1C
song_555:
    .incbin "baserom.gba", 0x584AD4, 0x1C
song_556:
    .incbin "baserom.gba", 0x584AF0, 0xF8
song_557:
    .incbin "baserom.gba", 0x584BE8, 0x6C
song_558:
    .incbin "baserom.gba", 0x584C54, 0x11C
song_559:
    .incbin "baserom.gba", 0x584D70, 0x2B8
song_560:
    .incbin "baserom.gba", 0x585028, 0x350
song_561:
    .incbin "baserom.gba", 0x585378, 0xB8
song_562:
    .incbin "baserom.gba", 0x585430, 0x27C
song_563:
    .incbin "baserom.gba", 0x5856AC, 0x224
song_564:
    .incbin "baserom.gba", 0x5858D0, 0x24C
song_565:
    .incbin "baserom.gba", 0x585B1C, 0x300
song_566:
    .incbin "baserom.gba", 0x585E1C, 0x28
song_567:
    .incbin "baserom.gba", 0x585E44, 0x158
song_568:
    .incbin "baserom.gba", 0x585F9C, 0x180
song_569:
    .incbin "baserom.gba", 0x58611C, 0x5C
song_570:
    .incbin "baserom.gba", 0x586178, 0xA8
song_571:
    .incbin "baserom.gba", 0x586220, 0xA0
song_572:
    .incbin "baserom.gba", 0x5862C0, 0x20
song_573:
    .incbin "baserom.gba", 0x5862E0, 0x1C
song_574:
    .incbin "baserom.gba", 0x5862FC, 0x178
song_575:
    .incbin "baserom.gba", 0x586474, 0x20
song_576:
    .incbin "baserom.gba", 0x586494, 0x38
song_577:
    .incbin "baserom.gba", 0x5864CC, 0xE8
song_578:
    .incbin "baserom.gba", 0x5865B4, 0x10C
song_579:
    .incbin "baserom.gba", 0x5866C0, 0x24
song_580:
    .incbin "baserom.gba", 0x5866E4, 0x1D8
song_581:
    .incbin "baserom.gba", 0x5868BC, 0x74
song_582:
    .incbin "baserom.gba", 0x586930, 0x48
song_583:
    .incbin "baserom.gba", 0x586978, 0x24
song_584:
    .incbin "baserom.gba", 0x58699C, 0x108
song_585:
    .incbin "baserom.gba", 0x586AA4, 0x5C
song_586:
    .incbin "baserom.gba", 0x586B00, 0x20
song_587:
    .incbin "baserom.gba", 0x586B20, 0xA4
song_588:
    .incbin "baserom.gba", 0x586BC4, 0x2CC
song_589:
    .incbin "baserom.gba", 0x586E90, 0x774
song_590:
    .incbin "baserom.gba", 0x587604, 0x78
song_591:
    .incbin "baserom.gba", 0x58767C, 0x24
song_592:
    .incbin "baserom.gba", 0x5876A0, 0x1C
song_593:
    .incbin "baserom.gba", 0x5876BC, 0x44

    .align 4
