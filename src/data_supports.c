#include "global.h"
#include "bmreliance.h"
#include "constants/characters.h"

CONST_DATA struct SupportData SupportData_Eirika = {
    .characters = {
        CHARACTER_EPHRAIM,
        CHARACTER_SETH,
        CHARACTER_SALEH,
        CHARACTER_LARACHEL,
        CHARACTER_TANA,
        CHARACTER_INNES,
        CHARACTER_FORDE,
    },
    .supportExpBase = {
        30,
        25,
        5,
        10,
        20,
        10,
        20,
    },
    .supportExpGrowth = {
        4,
        3,
        2,
        2,
        2,
        2,
        2,
    },
    .supportCount = 7,
};

CONST_DATA struct SupportData SupportData_Ephraim = {
    .characters = {
        CHARACTER_EIRIKA,
        CHARACTER_KYLE,
        CHARACTER_FORDE,
        CHARACTER_MYRRH,
        CHARACTER_LARACHEL,
        CHARACTER_DUESSEL,
        CHARACTER_TANA,
    },
    .supportExpBase = {
        30,
        20,
        20,
        10,
        5,
        30,
        25,
    },
    .supportExpGrowth = {
        4,
        3,
        3,
        4,
        3,
        3,
        3,
    },
    .supportCount = 7,
};

CONST_DATA struct SupportData SupportData_Seth = {
    .characters = {
        CHARACTER_FRANZ,
        CHARACTER_EIRIKA,
        CHARACTER_GARCIA,
        CHARACTER_NATASHA,
        CHARACTER_CORMAG,
    },
    .supportExpBase = {
        15,
        25,
        10,
        5,
        0,
    },
    .supportExpGrowth = {
        2,
        3,
        2,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Franz = {
    .characters = {
        CHARACTER_SETH,
        CHARACTER_GILLIAM,
        CHARACTER_FORDE,
        CHARACTER_AMELIA,
        CHARACTER_NATASHA,
    },
    .supportExpBase = {
        15,
        10,
        25,
        5,
        10,
    },
    .supportExpGrowth = {
        2,
        2,
        3,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Gilliam = {
    .characters = {
        CHARACTER_GARCIA,
        CHARACTER_FRANZ,
        CHARACTER_SYRENE,
        CHARACTER_MOULDER,
        CHARACTER_NEIMI,
    },
    .supportExpBase = {
        0,
        10,
        20,
        10,
        0,
    },
    .supportExpGrowth = {
        2,
        2,
        3,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Moulder = {
    .characters = {
        CHARACTER_VANESSA,
        CHARACTER_COLM,
        CHARACTER_GILLIAM,
        CHARACTER_SYRENE,
    },
    .supportExpBase = {
        15,
        0,
        10,
        10,
    },
    .supportExpGrowth = {
        2,
        2,
        2,
        2,
    },
    .supportCount = 4,
};

CONST_DATA struct SupportData SupportData_Vanessa = {
    .characters = {
        CHARACTER_MOULDER,
        CHARACTER_SYRENE,
        CHARACTER_LUTE,
        CHARACTER_FORDE,
        CHARACTER_INNES,
    },
    .supportExpBase = {
        15,
        20,
        10,
        5,
        10,
    },
    .supportExpGrowth = {
        2,
        3,
        2,
        2,
        3,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Garcia = {
    .characters = {
        CHARACTER_ROSS,
        CHARACTER_DOZLA,
        CHARACTER_SETH,
        CHARACTER_NEIMI,
        CHARACTER_GILLIAM,
    },
    .supportExpBase = {
        35,
        10,
        10,
        10,
        0,
    },
    .supportExpGrowth = {
        4,
        2,
        2,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Ross = {
    .characters = {
        CHARACTER_GARCIA,
        CHARACTER_LUTE,
        CHARACTER_AMELIA,
        CHARACTER_EWAN,
        CHARACTER_GERIK,
    },
    .supportExpBase = {
        35,
        5,
        5,
        5,
        0,
    },
    .supportExpGrowth = {
        4,
        2,
        2,
        3,
        3,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Colm = {
    .characters = {
        CHARACTER_NEIMI,
        CHARACTER_MARISA,
        CHARACTER_RENNAC,
        CHARACTER_MOULDER,
        CHARACTER_KYLE,
    },
    .supportExpBase = {
        80,
        0,
        5,
        0,
        5,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Neimi = {
    .characters = {
        CHARACTER_COLM,
        CHARACTER_GARCIA,
        CHARACTER_AMELIA,
        CHARACTER_ARTUR,
        CHARACTER_GILLIAM,
    },
    .supportExpBase = {
        80,
        10,
        15,
        5,
        0,
    },
    .supportExpGrowth = {
        3,
        2,
        3,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Artur = {
    .characters = {
        CHARACTER_LUTE,
        CHARACTER_TETHYS,
        CHARACTER_CORMAG,
        CHARACTER_NEIMI,
        CHARACTER_JOSHUA,
    },
    .supportExpBase = {
        15,
        10,
        5,
        5,
        5,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Lute = {
    .characters = {
        CHARACTER_ARTUR,
        CHARACTER_ROSS,
        CHARACTER_KNOLL,
        CHARACTER_KYLE,
        CHARACTER_VANESSA,
    },
    .supportExpBase = {
        15,
        5,
        5,
        5,
        10,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Natasha = {
    .characters = {
        CHARACTER_JOSHUA,
        CHARACTER_KNOLL,
        CHARACTER_CORMAG,
        CHARACTER_SETH,
        CHARACTER_FRANZ,
    },
    .supportExpBase = {
        20,
        10,
        5,
        5,
        10,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Joshua = {
    .characters = {
        CHARACTER_NATASHA,
        CHARACTER_INNES,
        CHARACTER_ARTUR,
        CHARACTER_LARACHEL,
        CHARACTER_MARISA,
        CHARACTER_GERIK,
    },
    .supportExpBase = {
        20,
        0,
        5,
        5,
        10,
        15,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        2,
        3,
        3,
    },
    .supportCount = 6,
};

CONST_DATA struct SupportData SupportData_Kyle = {
    .characters = {
        CHARACTER_FORDE,
        CHARACTER_EPHRAIM,
        CHARACTER_SYRENE,
        CHARACTER_COLM,
        CHARACTER_LUTE,
    },
    .supportExpBase = {
        30,
        20,
        5,
        5,
        5,
    },
    .supportExpGrowth = {
        3,
        3,
        3,
        2,
        3,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Forde = {
    .characters = {
        CHARACTER_KYLE,
        CHARACTER_VANESSA,
        CHARACTER_EPHRAIM,
        CHARACTER_FRANZ,
        CHARACTER_EIRIKA,
    },
    .supportExpBase = {
        30,
        5,
        20,
        25,
        20,
    },
    .supportExpGrowth = {
        3,
        2,
        3,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Tana = {
    .characters = {
        CHARACTER_EPHRAIM,
        CHARACTER_SYRENE,
        CHARACTER_CORMAG,
        CHARACTER_INNES,
        CHARACTER_EIRIKA,
        CHARACTER_MARISA,
    },
    .supportExpBase = {
        25,
        20,
        0,
        25,
        20,
        10,
    },
    .supportExpGrowth = {
        3,
        3,
        2,
        3,
        2,
        2,
    },
    .supportCount = 6,
};

CONST_DATA struct SupportData SupportData_Innes = {
    .characters = {
        CHARACTER_GERIK,
        CHARACTER_VANESSA,
        CHARACTER_TANA,
        CHARACTER_JOSHUA,
        CHARACTER_LARACHEL,
        CHARACTER_EIRIKA,
    },
    .supportExpBase = {
        15,
        10,
        25,
        0,
        5,
        10,
    },
    .supportExpGrowth = {
        3,
        3,
        3,
        2,
        2,
        2,
    },
    .supportCount = 6,
};

CONST_DATA struct SupportData SupportData_Gerik = {
    .characters = {
        CHARACTER_INNES,
        CHARACTER_TETHYS,
        CHARACTER_MARISA,
        CHARACTER_SALEH,
        CHARACTER_JOSHUA,
        CHARACTER_ROSS,
    },
    .supportExpBase = {
        15,
        30,
        20,
        25,
        15,
        0,
    },
    .supportExpGrowth = {
        3,
        4,
        3,
        3,
        3,
        3,
    },
    .supportCount = 6,
};

CONST_DATA struct SupportData SupportData_Tethys = {
    .characters = {
        CHARACTER_EWAN,
        CHARACTER_GERIK,
        CHARACTER_MARISA,
        CHARACTER_RENNAC,
        CHARACTER_ARTUR,
    },
    .supportExpBase = {
        25,
        30,
        10,
        5,
        10,
    },
    .supportExpGrowth = {
        3,
        4,
        2,
        1,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Marisa = {
    .characters = {
        CHARACTER_TANA,
        CHARACTER_TETHYS,
        CHARACTER_GERIK,
        CHARACTER_JOSHUA,
        CHARACTER_COLM,
    },
    .supportExpBase = {
        10,
        10,
        20,
        10,
        0,
    },
    .supportExpGrowth = {
        2,
        2,
        3,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Saleh = {
    .characters = {
        CHARACTER_MYRRH,
        CHARACTER_EWAN,
        CHARACTER_GERIK,
        CHARACTER_EIRIKA,
    },
    .supportExpBase = {
        30,
        15,
        25,
        5,
    },
    .supportExpGrowth = {
        3,
        3,
        3,
        2,
    },
    .supportCount = 4,
};

CONST_DATA struct SupportData SupportData_Ewan = {
    .characters = {
        CHARACTER_TETHYS,
        CHARACTER_SALEH,
        CHARACTER_DOZLA,
        CHARACTER_AMELIA,
        CHARACTER_ROSS,
    },
    .supportExpBase = {
        25,
        15,
        0,
        5,
        5,
    },
    .supportExpGrowth = {
        3,
        3,
        3,
        3,
        3,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_LArachel = {
    .characters = {
        CHARACTER_DOZLA,
        CHARACTER_RENNAC,
        CHARACTER_JOSHUA,
        CHARACTER_EIRIKA,
        CHARACTER_EPHRAIM,
        CHARACTER_INNES,
    },
    .supportExpBase = {
        25,
        10,
        5,
        10,
        5,
        5,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        2,
        3,
        2,
    },
    .supportCount = 6,
};

CONST_DATA struct SupportData SupportData_Dozla = {
    .characters = {
        CHARACTER_LARACHEL,
        CHARACTER_MYRRH,
        CHARACTER_RENNAC,
        CHARACTER_EWAN,
        CHARACTER_GARCIA,
    },
    .supportExpBase = {
        25,
        0,
        10,
        0,
        10,
    },
    .supportExpGrowth = {
        3,
        2,
        2,
        3,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Cormag = {
    .characters = {
        CHARACTER_DUESSEL,
        CHARACTER_TANA,
        CHARACTER_NATASHA,
        CHARACTER_ARTUR,
        CHARACTER_SETH,
    },
    .supportExpBase = {
        10,
        0,
        5,
        5,
        0,
    },
    .supportExpGrowth = {
        2,
        2,
        2,
        2,
        2,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Amelia = {
    .characters = {
        CHARACTER_NEIMI,
        CHARACTER_DUESSEL,
        CHARACTER_EWAN,
        CHARACTER_ROSS,
        CHARACTER_FRANZ,
    },
    .supportExpBase = {
        15,
        10,
        5,
        5,
        5,
    },
    .supportExpGrowth = {
        3,
        3,
        3,
        2,
        3,
    },
    .supportCount = 5,
};

CONST_DATA struct SupportData SupportData_Rennac = {
    .characters = {
        CHARACTER_TETHYS,
        CHARACTER_LARACHEL,
        CHARACTER_DOZLA,
        CHARACTER_COLM,
    },
    .supportExpBase = {
        5,
        10,
        10,
        5,
    },
    .supportExpGrowth = {
        1,
        2,
        2,
        2,
    },
    .supportCount = 4,
};

CONST_DATA struct SupportData SupportData_Duessel = {
    .characters = {
        CHARACTER_CORMAG,
        CHARACTER_AMELIA,
        CHARACTER_KNOLL,
        CHARACTER_EPHRAIM,
    },
    .supportExpBase = {
        10,
        10,
        0,
        30,
    },
    .supportExpGrowth = {
        2,
        3,
        2,
        3,
    },
    .supportCount = 4,
};

CONST_DATA struct SupportData SupportData_Myrrh = {
    .characters = {
        CHARACTER_SALEH,
        CHARACTER_DOZLA,
        CHARACTER_EPHRAIM,
    },
    .supportExpBase = {
        30,
        0,
        10,
    },
    .supportExpGrowth = {
        3,
        2,
        4,
    },
    .supportCount = 3,
};

CONST_DATA struct SupportData SupportData_Knoll = {
    .characters = {
        CHARACTER_NATASHA,
        CHARACTER_DUESSEL,
        CHARACTER_LUTE,
    },
    .supportExpBase = {
        10,
        0,
        5,
    },
    .supportExpGrowth = {
        2,
        2,
        2,
    },
    .supportCount = 3,
};

CONST_DATA struct SupportData SupportData_Syrene = {
    .characters = {
        CHARACTER_KYLE,
        CHARACTER_VANESSA,
        CHARACTER_MOULDER,
        CHARACTER_GILLIAM,
        CHARACTER_TANA,
    },
    .supportExpBase = {
        5,
        20,
        10,
        20,
        20,
    },
    .supportExpGrowth = {
        3,
        3,
        2,
        3,
        3,
    },
    .supportCount = 5,
};
