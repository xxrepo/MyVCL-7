#include "Windows.hpp"
#include "Graphics.hpp"

#ifndef CustomDrawTableViewDemoTypesH
#define CustomDrawTableViewDemoTypesH

enum TCustomDrawingStyle {cdsBkImage, cdsGradient, cdsDependsOnData, cdsDefaultDrawing};
typedef Set<TCustomDrawingStyle, cdsBkImage, cdsDefaultDrawing> TCustomDrawingStyles;
enum TCustomDrawArea {cdaCell, cdaColumnHeader, cdaFooterCell, cdaGroupCell, cdaIndicatorCell, cdaPartBackGround};
enum TViewType {vtMaster, vtDetail};
enum TColorScheme {csGrey, csGold, csBlue, csGreen};

enum  TBkImage {bkiTile, bkiSky, bkiEgypt, bkiMyFace, bkiUserDefined};
typedef TBkImage TBkImages[2][6];

typedef CustomDrawTableViewDemoTypesH::TColorScheme TColorSchemes[2][6];
typedef TColor SchemeArr[4][3];
typedef TCustomDrawingStyle TCustomDrawingStyleArr[2][6];
typedef Graphics::TBitmap TUserDefinedBitMaps[2][6];
typedef TFont* TFonts[2][6];

struct TCustomDrawItem;
typedef TCustomDrawItem *PCustomDrawItem;

struct TCustomDrawItem {
   TViewType ViewType;
   TCustomDrawArea CustomDrawArea;
};

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
extern const SchemeArr ColorScheme;

void DrawGradient(TCanvas* ACanvas, TRect ARect, TColor FromColor, TColor ToColor,
  int AStepCount, bool IsVertical);

void LoadImageFromRes(Graphics::TBitmap* ABitmap, String AResName);

#endif
