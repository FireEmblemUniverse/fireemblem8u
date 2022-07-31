#ifndef GUARD_BB_H
#define GUARD_BB_H

// ??? PutSubtitleHelpText(???);
// ??? InitSubtitleHelpText(???);
// ??? SubtitleHelpDarkenerOnHBlank(???);
// ??? SubtitleHelpDarkener_Init(???);
// ??? SubtitleHelpDarkener_FadeIn(???);
// ??? SubtitleHelpDarkener_FadeOut(???);
// ??? SubtitleHelp_Init(???);
// ??? SubtitleHelp_OnEnd(???);
// ??? SubtitleHelp_Loop(???);
void StartSubtitleHelp(ProcPtr parent, const char* string);
void EndSubtitleHelp(void);
s8 IsSubtitleHelpActive(void);
// ??? sub_8035770(???);

extern struct ProcCmd gProcScr_SubtitleHelpDarkener[];
extern struct ProcCmd gProcScr_SubtitleHelp[];

#endif  // GUARD_BB_H
