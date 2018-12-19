#include "Graphics.hpp"

#ifndef CustomDrawCardViewDemoTypesH
#define CustomDrawCardViewDemoTypesH

enum TCustomDrawingStyle { cdsBkImage, cdsGradient, cdsDependOnData, cdsDefaultDrawing };
enum TColorScheme { csGrey, csGold, csBlue, csGreen };

const TColor clBlueDark = 0x00C56A31;
const TColor clBlueLight = 0x00F7EAD9;
const TColor clBlueBright = 0x00FF953D;
const TColor clBlueSky = 0x00EBC4A4;

const TColor clGold = 0x0047D5FE;
const TColor clGoldDark = 0x0001BDF3;

const TColor clGreyLight = 0x00E2EFF1;
const TColor clGreyDark = 0x00B9D9DD;
const TColor clYellowLight = 0x00E1FFFF;

const TColor clGreenBright = 0x0082E887;
const TColor clGreenLight = 0x00C9F5CB;
const TColor clGreenObscured = 0x00ACF0AF;
const TColor clGreenDark = 0x0044DD4B;

const TColor clSilverDark = 0x00A6A6A6;

typedef TColor TColorSchemeArr[4][3];
extern const TColorSchemeArr ColorScheme;

void DrawGradient(TCanvas* ACanvas, TRect ARect, TColor FromColor, TColor ToColor,
  int AStepCount, bool IsVertical);

void LoadImageFromRes(Graphics::TBitmap* ABitmap, String AResName);

#endif
