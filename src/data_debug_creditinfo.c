#include "global.h"

struct DebugCreditInfo {
    const char * work;
    const char * name;
    int pos_maybe;
};

CONST_DATA struct DebugCreditInfo gDebugCreditInfo[] = {
    {
        .work = "EXECUTIVE PRODUCER\n",
        .name = "Hiroshi Yamauchi",
        .pos_maybe = 0x803,
    },
    {
        .work = "PRODUCER\n",
        .name = "Takehiro Izushi",
        .pos_maybe = 0x804,
    },
    {
        .work = "DIRECTOR\n",
        .name = "Tohru Narihiro",
        .pos_maybe = 0x804,
    },
    {
        .work = "SUPER VISOR\n",
        .name = "Kentaro Nishimura",
        .pos_maybe = 0x803,
    },
    {
        .work = (void *)0x1,
        .pos_maybe = 0x0,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "GAME DIRECTOR\nSCENARIO",
        .name = "\nMasayuki Horikawa",
        .pos_maybe = 0x603,
    },
    {
        .work = "SYSTEM DIRECTOR\nMAIN PROGRAM",
        .name = "\nTakafumi Kaneko",
        .pos_maybe = 0x603,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "ART DIRECTOR\n",
        .name = "Taeko Kaneda",
        .pos_maybe = 0x804,
    },
    {
        .work = "MAIN DESIGN\nFACE DESIGN",
        .name = "\nSachiko Wada",
        .pos_maybe = 0x604,
    },
    {
        .work = "GRAPHIC CHIEF\n",
        .name = "Masahiro Higuchi",
        .pos_maybe = 0x803,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "EVENT PROGRAM\n",
        .name = "Takanori Hino",
        .pos_maybe = 0x804,
    },
    {
        .work = "EVENT & SUPPORT\n",
        .name = "Makoto Katayama",
        .pos_maybe = 0x803,
    },
    {
        .work = "A.I. PROGRAM\n",
        .name = "Chikara Yamamoto",
        .pos_maybe = 0x803,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "BATTLE DESIGN\n",
        .name = "Naotaka Ohnishi",
        .pos_maybe = 0x804,
    },
    {
        .work = "BATTLE PROGRAM\n",
        .name = "Motomu Chikaraishi",
        .pos_maybe = 0x803,
    },
    {
        .work = "BATTLE ANIMATION\n",
        .name = "Maki Takemori\nYoko Nakai",
        .pos_maybe = 0x704,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "MAP DESIGN\n",
        .name = "Sumiko Miki",
        .pos_maybe = 0x804,
    },
    {
        .work = "LAYOUT\n",
        .name = "Makoto Shimojo",
        .pos_maybe = 0x804,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "SOUND COMPOSITION\n",
        .name = "Yuka Tsujiyoko",
        .pos_maybe = 0x804,
    },
    {
        .work = "SOUND EFFECT \n",
        .name = "Kenichi Nishimaki\nNoritaka Misawa",
        .pos_maybe = 0x703,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "GRAPHIC SUPPORT\n",
        .name = "Minoru Noda\nRyo Hirata\nTuyoshi Nakatuka\nMasaru Nishimura",
        .pos_maybe = 0x503,
    },
    {
        .work = "SCENARIO SUPPORT\n",
        .name = "Kouhei Maeda",
        .pos_maybe = 0x804,
    },
    {
        .work = "PROGRAM SUPPORT\n",
        .name = "Susumu Ishihara\nYusuke Murakami",
        .pos_maybe = 0x703,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "IMAGE ILLUSTRATION\n",
        .name = " Eiji Kaneda",
        .pos_maybe = 0x804,
    },
    {
        .work = "ART WORK\n",
        .name = "Yasuo Inoue\nTakashi Itou",
        .pos_maybe = 0x704,
    },
    {
        .work = "PUBLISHMENT\n",
        .name = "Yusuke Kitanishi\nTetsuro Oe",
        .pos_maybe = 0x703,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "TECHNICAL SUPPORT\n",
        .name = "Kenji Nakajima",
        .pos_maybe = 0x803,
    },
    {
        .work = "PROCESS MANAGER\n",
        .name = " Kenji Imai",
        .pos_maybe = 0x804,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .work = "SPECIAL THANKS\n",
        .name = "Ryoichi Kitanishi\nKozo Ikuno\nToshiyuki Nakamura\nMasahiro Nakamori\nToshio Sengoku",
        .pos_maybe = 0x403,
    },
    {
        .name = "Masanobu Matsunaga\nRyuichiro Koguchi\nYuka Hongou\nKatsuyoshi Koya",
        .pos_maybe = 0x403,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .name = "Masao Yamamoto\nKyoko Watanabe\nYutaka Takehisa\nToshihiro Toza",
        .pos_maybe = 0x403,
    },
    {
        .name = "Masahiro Sakurai\n         &\nSmash Brothers DX\n       Team         ",
        .pos_maybe = 0x403,
    },
    {
        .name = "Tomonori Sumiya\nHiroshi Izawa\nKotaro Yamada",
        .pos_maybe = 0x503,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
    {
        .name = "SUPER MARIO CLUB",
        .pos_maybe = 0x701,
    },
    {
        .name = "Masaru Ikeshita\nHaruka Kato\nMasami Kato\nJunko Komaki\nNobuaki Maeda\nKatsunori Masutani\nAkiko Matsumoto\nNaotaka Matsumoto",
        .pos_maybe = 0x3,
    },
    {
        .name = "Hiroyuki Murata\nKei Nadabe\nTomohiro Nishigaki\nKeiichiro Nishimoto\nRyuichiro Sakima\nMasaharu Shima\nSyogo Tachibana\nShigeo Takada",
        .pos_maybe = 0x3,
    },
    {
        .name = "Atsushi Takeda\nHiroya Takeda\nHisashi Takizaki\nYoshikazu Tanaka\nMari Ueda\nSatoru Uno\nYuichiro Ushijima\nHiroyuki Yamaoka",
        .pos_maybe = 0x3,
    },
    {
        .work = (void *)0x2,
        .pos_maybe = 0x0,
    },
};
