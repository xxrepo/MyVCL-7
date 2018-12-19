{**************************************************************************}
{ TAdvSmoothTimeLine component                                             }
{ for Delphi & C++Builder                                                  }
{                                                                          }
{ written                                                                  }
{   TMS Software                                                           }
{   copyright © 2010                                                       }
{   Email : info@tmssoftware.com                                           }
{   Web : http://www.tmssoftware.com                                       }
{                                                                          }
{ The source code is given as is. The author is not responsible            }
{ for any possible damage done due to the use of this code.                }
{ The component can be freely used in any application. The complete        }
{ source code remains property of the author and may not be distributed,   }
{ published, given or sold in any form as such. No parts of the source     }
{ code can be included in any other component or application without       }
{ written authorization of the author.                                     }
{**************************************************************************}

unit AdvSmoothTimeLine;

{$I TMSDEFS.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, StdCtrls, forms,
  Math, AdvStyleIF, ImgList, DateUtils, ExtCtrls,
  GDIPFill, Menus,
  {$IFDEF TMSPACKGDIP}
  AdvGDIP
  {$ELSE}
  AdvSmoothGDIP
  {$ENDIF}
  {$IFDEF TMSDOTNET}
  , Types
  {$ENDIF}
  ;

const
  MAJ_VER = 2; // Major version nr.
  MIN_VER = 0; // Minor version nr.
  REL_VER = 1; // Release nr.
  BLD_VER = 0; // Build nr.

  // version history
  // v1.0.0.0 : first release
  // v1.0.1.0 : New : Property Fixed to set indicators to a fixed position
  // v1.0.2.0 : New : Support for Windows Vista and Windows Seven Style
  // v1.0.3.0 : New : Zooming and scrolling in timeline.
  //          : New : Draggable and Sizeable Sections
  //          : New : Caption on section
  //          : New : Customizable Annotations.
  //          : New : Built-in support for reduced color set for use with terminal servers
  // v1.1.0.0 : New : Support for Mouse wheel scrolling
  //          : New : ItemObject and Tag property on Indicators and Sections
  //          : Fixed : Issue with automatically calculation of section hints
  //          : Fixed : Issue with section handle animation in Mouse leave situation
  //          : Fixed : issue with invalid argument to date encode
  //          : Improved : issue with section caption in small sections
  //          : Improved : OnIndicatorClick when indicator is fixed
  // v1.1.1.0 : New : ScrollStep to define amount of mouse wheel scrolling
  //          : Fixed : Issue with readonly blocking hints
  //          : Fixed : Mousescrolling occurs when allowscrolling = false
  //          : Fixed : Issue with OnSectionClick, OnIndicatorClick
  //          : Fixed : Issue with focusing control
  //          : Improved : Calculating division and subdivisions
  // v1.1.1.1 : Fixed : Issue with fixed indicators on the same position
  //          : Fixed : Invalid floating point operation when changing divisiontype when divisions / subdivisions are 0
  // v1.1.1.2 : Fixed : Issue with Onindicator click
  //          : Improved : Indicator click at equal positions
  // v1.1.1.3 : Fixed : Issue with TimeLine , Indicator and Section Interaction
  // v1.1.2.0 : New : Delphi 2010 Touch Support
  //          : Fixed : Issue with TimeLine Multiple Section sizing
  // v1.1.2.1 : Fixed : Issue with C++ Builder array declaration
  //          : Fixed : Issue with indicator on top of fixed section
  // v1.1.3.0 : New : event OnDrawTimeLine
  // v2.0.0.0 : New : Database aware version of TAdvSmoothTimeLine
  //          : New : Property AnnotationTextColor
  //          : Fixed : Issue with Division By Zero
  // v2.0.1.0 : New : OnScrollTimeLine event
  //          : Fixed : Issue with while loop


type
  TWinCtrl = class(TWinControl)
  public
    procedure PaintCtrls(DC: HDC; First: TControl);
  end;

  TAdvSmoothTimeLine = class;

  TAdvSmoothTimeLineCaptionLocation = (cpTopLeft, cpTopCenter, cpTopRight, cpCenterLeft, cpCenterCenter, cpCenterRight, cpBottomLeft, cpBottomCenter, cpBottomRight, cpCustom);

  TAdvSmoothSectionHint = class(THintWindow)
  private
    FMainBuffer: TGPBitmap;
    FTimeLine: TAdvsmoothTimeLine;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    Procedure CMDialogKey(Var Msg: TWMKey); message CM_DIALOGKEY;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;  
  protected
    procedure CreateWnd; override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;

    // ---- Calc proc
    procedure UpdateButtons;

    // ---- Paint proc
    procedure Draw(graphics: TGPGraphics);

    // ---- Paint buffer
    procedure CreateMainBuffer;
    procedure DestroyMainBuffer;
    procedure ClearBuffer(graphics: TGPGraphics);
    function CreateGraphics: TGPGraphics;

    //---- Layered window
    procedure SetLayeredWindow;
    procedure UpdateLayered;
    procedure UpdateMainWindow;
    procedure UpdateWindow;
  public
    procedure Init;
    property TimeLine: TAdvsmoothTimeLine read FTimeLine write FTimeLine;
  end;

  TAdvSmoothTimeLineRangeAppearance = class(TPersistent)
  private
  FOwner: TAdvSmoothTimeLine;
    FSubDivisionTickMarkColor: TColor;
    FDivisionTickMarkColor: TColor;
    FSubDivisionFont: TFont;
    FDivisionFont: TFont;
    FSubDivisionTickMarkSize: integer;
    FDivisionTickMarkSize: integer;
    FOnChange: TNotifyEvent;
    FSubDivisionTickMarkWidth: integer;
    FDivisionTickMarkWidth: integer;
    FDivisionFormat: String;
    FSubDivisionFormat: String;
    FIndentSpacing: integer;
    FShowSubDivisionValue: Boolean;
    FShowDivisionValue: Boolean;
    procedure SetDivisionTickMarkColor(const Value: TColor);
    procedure SetDivisionFont(const Value: TFont);
    procedure SetSubDivisionFont(const Value: TFont);
    procedure SetSubDivisionTickMarkColor(const Value: TColor);
    procedure SetDivisionTickMarkSize(const Value: integer);
    procedure SetSubDivisionTickMarkSize(const Value: integer);
    procedure SetDivisionTickMarkWidth(const Value: integer);
    procedure SetSubDivisionTickMarkWidth(const Value: integer);
    procedure SetDivisionFormat(const Value: String);
    procedure SetSubDivisionFormat(const Value: String);
    procedure SetIndentSpacing(const Value: integer);
    procedure SetShowDivisionValue(const Value: Boolean);
    procedure SetShowSubDivisionValue(const Value: Boolean);
  protected
    procedure Changed;
    procedure FontChanged(Sender: TObject);
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property DivisionFont: TFont read FDivisionFont write SetDivisionFont;
    property SubDivisionFont: TFont read FSubDivisionFont write SetSubDivisionFont;
    property DivisionTickMarkColor: TColor read FDivisionTickMarkColor write SetDivisionTickMarkColor default clBlack;
    property SubDivisionTickMarkColor: TColor read FSubDivisionTickMarkColor write SetSubDivisionTickMarkColor default clBlack;
    property DivisionTickMarkSize: integer read FDivisionTickMarkSize write SetDivisionTickMarkSize default 10;
    property SubDivisionTickMarkSize: integer read FSubDivisionTickMarkSize write SetSubDivisionTickMarkSize default 8;
    property DivisionTickMarkWidth: integer read FDivisionTickMarkWidth write SetDivisionTickMarkWidth default 2;
    property SubDivisionTickMarkWidth: integer read FSubDivisionTickMarkWidth write SetSubDivisionTickMarkWidth default 1;
    property DivisionFormat: String read FDivisionFormat write SetDivisionFormat;
    property SubDivisionFormat: String read FSubDivisionFormat write SetSubDivisionFormat;
    property IndentSpacing: integer read FIndentSpacing write SetIndentSpacing default 20;
    property ShowDivisionValue: Boolean read FShowDivisionValue write SetShowDivisionValue default true;
    property ShowSubDivisionValue: Boolean read FShowSubDivisionValue write SetShowSubDivisionValue default true;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TAdvsmoothTimelineDivisionType = (dtFixedNumber, dtMilliSecond, dtSecond, dtMinute, dtHour, dtDay, dtMonth, dtYear);

  TAdvSmoothTimeLineRange = class(TPersistent)
  private
    FDoAnimateRange, FAnimateRangeFrom, FAnimateRangeTo: Boolean;
    FRangeFromAnim, FRangeToAnim: TDateTime;
    FOwner: TAdvSmoothTimeLine;
    FRangeFrom: TDateTime;
    FRangeTo: TDateTime;
    FSubDivisions: integer;
    FDivisions: integer;
    FOnChange: TNotifyEvent;
    FAllowScrolling: Boolean;
    FMaximumRange: TDateTime;
    FMinimumRange: TDateTime;
    FAllowZooming: Boolean;
    FDivisionType: TAdvsmoothTimelineDivisionType;
    FAutomaticScrolling: Boolean;
    FAllowPartialZooming: Boolean;
    FScrollStep: integer;
    procedure SetRangeFrom(const Value: TDateTime);
    procedure SetRangeTo(const Value: TDateTime);
    procedure SetDivisions(const Value: integer);
    procedure SetSubDivisions(const Value: integer);
    procedure SetAllowScrolling(const Value: Boolean);
    procedure SetMaximumRange(const Value: TDateTime);
    procedure SetMinimumRange(const Value: TDateTime);
    procedure SetAllowZooming(const Value: Boolean);
    procedure SetDivisionType(const Value: TAdvsmoothTimelineDivisionType);
    procedure SetAutomaticScrolling(const Value: Boolean);
    procedure SetAllowPartialZooming(const Value: Boolean);
    procedure SetScrollStep(const Value: integer);
  protected
    procedure Changed;
    procedure ResetScrollStatus;
    procedure FixDivisions(dv: integer);
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property MinimumRange: TDateTime read FMinimumRange write SetMinimumRange;
    property MaximumRange: TDateTime read FMaximumRange write SetMaximumRange;
    property RangeTo: TDateTime read FRangeTo write SetRangeTo;
    property RangeFrom: TDateTime read FRangeFrom write SetRangeFrom;
    property AllowPartialZooming: Boolean read FAllowPartialZooming write SetAllowPartialZooming default true;
    property AllowScrolling: Boolean read FAllowScrolling write SetAllowScrolling default true;
    property ScrollStep: integer read FScrollStep write SetScrollStep default 5;
    property AllowZooming: Boolean read FAllowZooming write SetAllowZooming default true;
    property AutomaticScrolling: Boolean read FAutomaticScrolling write SetAutomaticScrolling default true;
    property Divisions: integer read FDivisions write SetDivisions default 2;
    property SubDivisions: integer read FSubDivisions write SetSubDivisions default 5;
    property DivisionType: TAdvsmoothTimelineDivisionType read FDivisionType write SetDivisionType default dtFixedNumber;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TAdvSmoothTimeLineBarIndicatorShape = (isTriangleUp, isTriangleDown, isSquare, isDiamond, isCircle, isNone, isPicture);

  TAdvSmoothTimeLineBarAnnotationPosition = (apOnTop, apAtBottom);

  TAdvSmoothTimeLineBarIndicator = class(TCollectionItem)
  private
    FOwner: TAdvSmoothTimeLine;
    FPosition: TDateTime;
    FShape: TAdvSmoothTimeLineBarIndicatorShape;
    FBorderColor: TColor;
    FGradientType: TAdvGradientType;
    FOpacity: Byte;
    FOpacityTo: Byte;
    FAngle: integer;
    FColor: TColor;
    FColorTo: TColor;
    FBorderOpacity: Byte;
    FBorderWidth: integer;
    FPicture: TAdvGDIPPicture;
    FSize: integer;
    FHint: String;
    FTickMarkSize: integer;
    FShowTickMark: Boolean;
    FTickMarkWidth: integer;
    FTickMarkColor: TColor;
    FPopupMenu: TPopupMenu;
    FFixed: Boolean;
    FAnnotation: String;
    FAnnotationColor: TColor;
    FAnnotationPosition: TAdvSmoothTimeLineBarAnnotationPosition;
    FAnnotationLineColor: TColor;
    FAnnotationOpacity: Byte;
    FAnnotationLineOpacity: Byte;
    FAnnotationImageIndex: integer;
    FAnnotationRounded: Boolean;
    FItemObject: TObject;
    FTag: integer;
    FAnnotationTextColor: TColor;
    procedure SetPosition(const Value: TDateTime);
    procedure SetShape(const Value: TAdvSmoothTimeLineBarIndicatorShape);
    procedure SetAngle(const Value: integer);
    procedure SetBorderColor(const Value: TColor);
    procedure SetBorderOpacity(const Value: Byte);
    procedure SetBorderWidth(const Value: integer);
    procedure SetColor(const Value: TColor);
    procedure SetColorTo(const Value: TColor);
    procedure SetGradientType(const Value: TAdvGradientType);
    procedure SetOpacity(const Value: Byte);
    procedure SetOpacityTo(const Value: Byte);
    procedure SetPicture(const Value: TAdvGDIPPicture);
    procedure SetSize(const Value: integer);
    procedure SetHint(const Value: String);
    procedure SetShowTickMark(const Value: Boolean);
    procedure SetTickMarkColor(const Value: TColor);
    procedure SetTickMarkSize(const Value: integer);
    procedure SetTickMarkWidth(const Value: integer);
    procedure SetFixed(const Value: Boolean);
    procedure SetAnnotation(const Value: String);
    procedure SetAnnotationColor(const Value: TColor);
    procedure SetAnnotationPostion(
      const Value: TAdvSmoothTimeLineBarAnnotationPosition);
    procedure SetAnnotationLineColor(const Value: TColor);
    procedure SetAnnotationLineOpacity(const Value: Byte);
    procedure SetAnnotationOpacity(const Value: Byte);
    procedure SetAnnotationImageIndex(const Value: integer);
    function GetPosition: TDateTime;
    procedure SetAnnotationRounded(const Value: Boolean);
    procedure SetAnnotationTextColor(const Value: TColor);
  protected
    FDBKeyValue: String;
    procedure Changed;
    procedure PictureChanged(Sender: TObject);
    function CalculateAnnotation(g: TGPGraphics; f: TGPFont; sf: TGPStringFormat; I: integer): TGPRectF;
    procedure DrawAnnotation(g: TGPGraphics; f: TGPFont; sf: TGPStringFormat; bText: TGPSolidBrush; r: TGPRectF);
    procedure DrawAnnotationLine(g: TGPGraphics; r: TGPRectF; AnnotationPosition: TAdvSmoothTimeLineBarAnnotationPosition);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignVisuals(Source: TPersistent);
    function GetIndicatorRect: TGPRectF;
    property DBKeyValue: String read FDBKeyValue;
  published
    property Annotation: String read FAnnotation write SetAnnotation;
    property AnnotationColor: TColor read FAnnotationColor write SetAnnotationColor default clsilver;
    property AnnotationTextColor: TColor read FAnnotationTextColor write SetAnnotationTextColor default clNone;
    property AnnotationOpacity: Byte read FAnnotationOpacity write SetAnnotationOpacity default 255;
    property AnnotationLineColor: TColor read FAnnotationLineColor write SetAnnotationLineColor default clBlack;
    property AnnotationLineOpacity: Byte read FAnnotationLineOpacity write SetAnnotationLineOpacity default 255;
    property AnnotationPosition: TAdvSmoothTimeLineBarAnnotationPosition read FAnnotationPosition write SetAnnotationPostion default apOnTop;
    property AnnotationImageIndex: integer read FAnnotationImageIndex write SetAnnotationImageIndex default -1;
    property AnnotationRounded: Boolean read FAnnotationRounded write SetAnnotationRounded default false;
    property Position: TDateTime read GetPosition write SetPosition;
    property Shape: TAdvSmoothTimeLineBarIndicatorShape read FShape write SetShape default isDiamond;
    property Fixed: Boolean read FFixed write SetFixed default false;
    property Color: TColor read FColor write SetColor default clGray;
    property ColorTo: TColor read FColorTo write SetColorTo default clSilver;
    property Opacity: Byte read FOpacity write SetOpacity default 255;
    property OpacityTo: Byte read FOpacityTo write SetOpacityTo default 255;
    property Angle: integer read FAngle write SetAngle default 0;
    property GradientType: TAdvGradientType read FGradientType write SetGradientType default gtForwardDiagonal;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clBlack;
    property BorderOpacity: Byte read FBorderOpacity write SetBorderOpacity default 255;
    property BorderWidth: integer read FBorderWidth write SetBorderWidth default 1;
    property Picture: TAdvGDIPPicture read FPicture write SetPicture;
    property Size: integer read FSize write SetSize default 15;
    property Hint: String read FHint write SetHint;
    property ShowTickMark: Boolean read FShowTickMark write SetShowTickMark default true;
    property TickMarkSize: integer read FTickMarkSize write SetTickMarkSize default 10;
    property TickMarkWidth: integer read FTickMarkWidth write SetTickMarkWidth default 1;
    property TickMarkColor: TColor read FTickMarkColor write SetTickMarkColor default clBlack;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property ItemObject: TObject read FItemObject write FItemObject;
    property Tag: integer read FTag write FTag;
  end;

  TAdvSmoothTimeLineBarIndicators = class(TCollection)
  private
    FOwner: TAdvSmoothTimeLine;
    FOnChange: TNotifyEvent;
    function GetItem(Index: Integer): TAdvSmoothTimeLineBarIndicator;
    procedure SetItem(Index: Integer; const Value: TAdvSmoothTimeLineBarIndicator);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    function Add: TAdvSmoothTimeLineBarIndicator;
    function Insert(Index: Integer): TAdvSmoothTimeLineBarIndicator;
    property Items[Index: Integer]: TAdvSmoothTimeLineBarIndicator read GetItem write SetItem; default;
    procedure Delete(Index: Integer);
  published
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TAdvSmoothTimeLineBarSection = class(TCollectionItem)
  private
    FSizeHandleAnimationStarted, FSizeHandleAnimation, FDoSizeHandleAnimation: Boolean;
    FSizeHandleOpacity, FSizeHandleOpacityTo: Byte;
    FOwner: TAdvSmoothTimeLine;
    FStartTime: TDateTime;
    FEndTime: TDateTime;
    FFill: TGDIPFill;
    FHint: String;
    FHintFill: TGDIPFill;
    FHintFont: TFont;
    FHintAutoSize: Boolean;
    FHintWidth: integer;
    FHintHeight: integer;
    FHandleSize: integer;
    FHandleColor: TColor;
    FCaptionTop: integer;
    FCaptionLeft: integer;
    FCaption: String;
    FCaptionLocation: TAdvSmoothTimeLineCaptionLocation;
    FFixedSize: Boolean;
    FFixedPosition: Boolean;
    FItemObject: TObject;
    FTag: integer;
    procedure SetEndTime(const Value: TDateTime);
    procedure SetFill(const Value: TGDIPFill);
    procedure SetStartTime(const Value: TDateTime);
    procedure SetHint(const Value: String);
    procedure SetHintFill(const Value: TGDIPFill);
    procedure SetHintFont(const Value: TFont);
    procedure SetHintAutoSize(const Value: Boolean);
    procedure SetHintHeight(const Value: integer);
    procedure SetHintWidth(const Value: integer);
    procedure SetHandleColor(const Value: TColor);
    procedure SetHandleSize(const Value: integer);
    procedure SetCaption(const Value: String);
    procedure SetCaptionLeft(const Value: integer);
    procedure SetCaptionLocation(
      const Value: TAdvSmoothTimeLineCaptionLocation);
    procedure SetCaptionTop(const Value: integer);
    procedure SetFixedPosition(const Value: Boolean);
    procedure SetFixedSize(const Value: Boolean);
  protected
    FDBKeyvalue: String;
    procedure Changed;
    procedure FillChanged(Sender: TObject);
    procedure FontChanged(Sender: TObject);
    function GetSectionRect: TGPRectF;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property DBKeyValue: String read FDBKeyValue;
  published
    property Caption: String read FCaption write SetCaption;
    property CaptionLocation: TAdvSmoothTimeLineCaptionLocation read FCaptionLocation write SetCaptionLocation default cpCenterLeft;
    property CaptionLeft: integer read FCaptionLeft write SetCaptionLeft default 0;
    property CaptionTop: integer read FCaptionTop write SetCaptionTop default 0;
    property HandleSize: integer read FHandleSize write SetHandleSize default 6;
    property HandleColor: TColor read FHandleColor write SetHandleColor default clHighlight;
    property FixedSize: Boolean read FFixedSize write SetFixedSize default false;
    property FixedPosition: Boolean read FFixedPosition write SetFixedPosition default false;
    property Fill: TGDIPFill read FFill write SetFill;
    property StartTime: TDateTime read FStartTime write SetStartTime;
    property EndTime: TDateTime read FEndTime write SetEndTime;
    property Hint: String read FHint write SetHint;
    property HintFill: TGDIPFill read FHintFill write SetHintFill;
    property HintFont: TFont read FHintFont write SetHintFont;
    property HintAutoSize: Boolean read FHintAutoSize write SetHintAutoSize default true;
    property HintWidth: integer read FHintWidth write SetHintWidth default 50;
    property HintHeight: integer read FHintHeight write SetHintHeight default 20;
    property ItemObject: TObject read FItemObject write FItemObject;
    property Tag: integer read FTag write FTag;    
  end;

  TAdvSmoothTimeLineBarSections = class(TCollection)
  private
    FOwner: TAdvSmoothTimeLine;
    FOnChange: TNotifyEvent;
    function GetItem(Index: Integer): TAdvSmoothTimeLineBarSection;
    procedure SetItem(Index: Integer; const Value: TAdvSmoothTimeLineBarSection);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    function Add: TAdvSmoothTimeLineBarSection;
    function Insert(Index: Integer): TAdvSmoothTimeLineBarSection;
    property Items[Index: Integer]: TAdvSmoothTimeLineBarSection read GetItem write SetItem; default;
    procedure Delete(Index: Integer);
  published
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;


  TAnnotationAutoPosition = (apNone, apLeft, apRight);

  TAdvSmoothTimeLineBar = class(TPersistent)
  private
    FOwner: TAdvSmoothTimeLine;
    FSections: TAdvSmoothTimeLineBarSections;
    FFill: TGDIPFill;
    FHeight: integer;
    FOnChange: TNotifyEvent;
    FAnnotationFont: TFont;
    FSectionCaptionFont: TFont;
    FAnnotationAutoPosition: TAnnotationAutoPosition;
    procedure SetFill(const Value: TGDIPFill);
    procedure SetHeight(const Value: integer);
    procedure SetAnnotationFont(const Value: TFont);
    procedure SetSectionCaptionFont(const Value: TFont);
    procedure SetAnnotationAutoPosition(const Value: TAnnotationAutoPosition);
  protected
    procedure Changed;
    procedure FontChanged(Sender: TObject);
    procedure FillChanged(Sender: TOBject);
    procedure SectionsChanged(Sender: TOBject);
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Fill: TGDIPFill read FFill write SetFill;
    property Height: integer read FHeight write SetHeight default 10;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property AnnotationFont: TFont read FAnnotationFont write SetAnnotationFont;
    property AnnotationAutoPosition: TAnnotationAutoPosition read FAnnotationAutoPosition write SetAnnotationAutoPosition default apNone;
    property SectionCaptionFont: TFont read FSectionCaptionFont write SetSectionCaptionFont;
  end;

  TAdvSmoothTimeLineDivisionText = procedure(Sender: TObject; DivisionValue: TDateTime; var DivisionValueString: String) of object;

  TAdvSmoothTimeLineIndicatorClick = procedure(Sender: TObject; indicator: TAdvSmoothTimeLineBarIndicator) of object;

  TAdvSmoothTimeLineSectionClick = procedure(Sender: TObject; section: TAdvSmoothTimeLineBarSection) of object;

  TAdvSmoothTimeLineIndicatorPosition = procedure(Sender: TObject; indicator: TAdvSmoothTimeLineBarIndicator; Position: TDateTime) of object;

  TAdvSmoothTimeLineSectionPosition = procedure(Sender: TObject; section: TAdvSmoothTimeLineBarSection; StartTime, EndTime: TDateTime) of object;

  TAdvSmoothTimeLineIndicatorHint = procedure(Sender: TObject; indicator: TAdvSmoothTimeLineBarIndicator; var hint: String) of object;

  TAdvSmoothTimeLineAnnotationItem = class(TCollectionItem)
  private
    FRectangle: TGPRectF;
    FIndicator: TAdvSmoothTimeLineBarIndicator;
  public
    property AnnotationRect: TGPRectF read FRectangle write FRectangle;
    property Indicator: TAdvSmoothTimeLineBarIndicator read FIndicator write FIndicator;
  end;

  TAdvSmoothTimeLineAnnotationList = class(TCollection)
  private
    FOwner: TAdvSmoothTimeLine;
    procedure SetItem(Index: Integer;
      const Value: TAdvSmoothTimeLineAnnotationItem);
  protected
    function Compare(Item1, Item2 : TAdvSmoothTimeLineAnnotationItem) : integer; virtual;
    procedure QuickSort(L, R: Integer);
  public
    constructor Create(AOwner: TAdvSmoothTimeLine);
    procedure Clear;
    function Add: TAdvSmoothTimeLineAnnotationItem;
    function Insert(Index: Integer): TAdvSmoothTimeLineAnnotationItem;
    procedure Delete(Index: Integer);
    function GetItem(index: integer): TAdvSmoothTimeLineAnnotationItem;
    property Items[Index: Integer]: TAdvSmoothTimeLineAnnotationItem read GetItem write SetItem; default;
  end;

  TTimeLineValueType = (vtDivision, vtSubDivision);

  TTimeLineValue = record
    d: TDateTime;
    str: String;
    postext: TGPPointF;
    recttext: TGPRectF;
    tp: TTimeLineValueType;
  end;

  TTimeLineValueArray = array of TTimeLineValue;

  TAdvSmoothTimeLineDrawEvent = procedure(Sender: TObject; ACanvas: TCanvas; ARect: TRect) of object;

  TAdvSmoothTimeLineScrollEvent = procedure(Sender: TObject; CurrentRangeFrom, CurrentRangeTo, NextRangeFrom, NextRangeTo: TDateTime) of object;

  TAdvSmoothTimeLine = class(TCustomControl, ITMSStyle)
  private
    FLoaded: Boolean;
    FTotalIndent: integer;
    FTimeLineValues: TTimeLineValueArray;
    FAllowAnimation: Boolean;
    FSp: Double;
    FStartTime, FStopTime: integer;
    FScrollTimeLine: Boolean;
    FScrollDif: Double;
    FUpdateCount: integer;
    FReBuildLists: Boolean;
    FAnnotationListTop: TAdvSmoothTimeLineAnnotationList;
    FAnnotationListBottom: TAdvSmoothTimeLineAnnotationList;
    FTimer: TTimer;
    FDesignTime, FMbRight: Boolean;
    FMx, FMy, FCx, FCy, FPx, FPy: integer;
    FSecStartX, FSecEndX: Double;
    FMouseMovedOnIndicator, FMouseMovedOnSection, FMouseMovedOnTimeLine: Boolean;
    FMouseDownOnIndicator, FMouseDownOnSection,
    FMouseDownOnStartSection, FMouseDownOnEndSection, FMouseDownOnTimeLine: Boolean;
    FhintSizeCalculated: Boolean;
    Fh: TAdvSmoothSectionHint;
    FHoveredSection, FHoveredIndicator, FSelectedIndicator, FSelectedSection: integer;
    FRange: TAdvSmoothTimeLineRange;
    FRangeAppearance: TAdvSmoothTimeLineRangeAppearance;
    FFill: TGDIPFill;
    FTimeLineBar: TAdvSmoothTimeLineBar;
    FTimeLineBarSections: TAdvSmoothTimeLineBarSections;
    FDefaultHintFill: TGDIPFill;
    FDefaultSectionFill: TGDIPFill;
    FVerticalMargin: integer;
    FHorizontalMargin: integer;
    FOnSubDivisionText: TAdvSmoothTimeLineDivisionText;
    FOnDivisionText: TAdvSmoothTimeLineDivisionText;
    FTimeLineIndicators: TAdvSmoothTimeLineBarIndicators;
    FOnIndicatorClick: TAdvSmoothTimeLineIndicatorClick;
    FOnIndicatorPositionChanged: TAdvSmoothTimeLineIndicatorPosition;
    FOnIndicatorHint: TAdvSmoothTimeLineIndicatorHint;
    FDefaultIndicators: TAdvSmoothTimeLineBarIndicators;
    FDefaultIndicator: TAdvSmoothTimeLineBarIndicator;
    FOnIndicatorPositionChanging: TAdvSmoothTimeLineIndicatorPosition;
    FOnSectionPositionChanging: TAdvSmoothTimeLineSectionPosition;
    FOnSectionPositionChanged: TAdvSmoothTimeLineSectionPosition;
    FOnSectionClick: TAdvSmoothTimeLineSectionClick;
    FImageList: TCustomImageList;
    FReadOnly: Boolean;
    FOnChange: TNotifyEvent;
    FOnDrawTimeLine: TAdvSmoothTimeLineDrawEvent;
    FOnScrollTimeLine: TAdvSmoothTimeLineScrollEvent;
    procedure CMHintShow(var Message: TMessage); message CM_HINTSHOW;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure SetRange(const Value: TAdvSmoothTimeLineRange);
    procedure SetRangeAppearance(
      const Value: TAdvSmoothTimeLineRangeAppearance);
    procedure SetFill(const Value: TGDIPFill);
    procedure SetTimeLineBar(const Value: TAdvSmoothTimeLineBar);
    procedure SetTimeLineBarSections(
      const Value: TAdvSmoothTimeLineBarSections);
    procedure SetDefaultHintFill(const Value: TGDIPFill);
    procedure SetDefaultSectionFill(const Value: TGDIPFill);
    procedure SetHorizontalMargin(const Value: integer);
    procedure SetVerticalMargin(const Value: integer);
    procedure SetTimeLineIndicators(
      const Value: TAdvSmoothTimeLineBarIndicators);
    procedure SetDefaultIndicator(const Value: TAdvSmoothTimeLineBarIndicator);
    procedure SetImageList(const Value: TCustomImageList);
    procedure SetReadOnly(const Value: Boolean);
  protected
    procedure AnimateTimeLine(Sender: TObject);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Changed;
    procedure RangeChanged(Sender: TObject);
    procedure RangeAppearanceChanged(Sender: TObject);
    procedure TimeLineBarChanged(Sender: TObject);
    procedure TimeLineBarSectionsChanged(Sender: TObject);
    procedure TimeLineBarIndicatorsChanged(Sender: TOBject);
    procedure FillChanged(Sender: TObject);
    procedure DrawBackground(g: TGPGraphics);
    procedure DrawTimeLineValues(g: TGPGraphics);
    procedure DrawTimeLineTickMarks(g: TGPGraphics);
    procedure DrawTimeBarIndicators(g: TGPGraphics);
    procedure DrawTimeBar(g: TGPGraphics);
    procedure DrawTimeBarSections(g: TGPGraphics);
    procedure DrawSectionHint(g: TGPGraphics);
    procedure CalculateHintSize(h: TAdvSmoothSectionHint);
    function InsideRect: TRect;
    function GetTimeLineBarRect: TGPRectF;
    function GetTimeLineRect: TGPRectF;
    function GetRange: Double;
    function SectionAtXY(X, Y: integer): integer;
    function SectionMoveAtXY(X, Y: integer): integer;
    function SectionSizeStartAtXY(X, Y: integer): integer;
    function SectionSizeEndAtXY(X, Y: integer): integer;
    function SectionAnimateHandles(X, Y: integer): integer;
    function IndicatorAtXY(X, Y: integer; var OnAnnotation: Boolean; StartIndex: integer = 0): integer;
    function GetTotalCountIndicatorsAtXY(X, Y: Integer): Integer;
    function PtInGPRect(r: TGPRectF; pt: TPoint): Boolean;
    function GetXPosition(Value: TDateTime): Double;
    function GetValuePosition(X: Double): TDateTime;
    function GetAnimatedMargin(DivisionType: TAdvSmoothTimeLineDivisionType): Double;
    function GetDivisionValue(DivisionType: TAdvsmoothTimelineDivisionType): Double;
    function GetDeltaDatetime(DivisionType: TAdvsmoothTimelineDivisionType; Divisions: integer; DivisionCount: integer = 0): TDateTime;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure BuildAnnotations;
    procedure BuildTimeLineValues;
    function IsPartialZoomingAllowed(Dif: Double): Boolean;
    function IsPartialZoomingAllowedAnimated(Dif: Double): Boolean;    
    function GetTotalIndent: integer;
    function GetDivisions: integer;
    function GetSubDivisions: integer;
    procedure DoSectionPositionChanged(Sender: TObject; section: TAdvSmoothTimeLineBarSection; StartTime, EndTime: TDateTime); virtual;
    procedure DoIndicatorPositionChanged(Sender: TObject; indicator: TAdvSmoothTimeLineBarIndicator; Position: TDateTime); virtual;
    procedure DoIndicatorDown(Sender: TObject; indicator: TAdvSmoothTimeLineBarIndicator); virtual;
    procedure DoSectionDown(Sender: TObject; section: TAdvSmoothTimeLineBarSection); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Paint; override;
    procedure Resize; override;
    procedure Loaded; override;
    procedure CreateWnd; override;
    procedure SetComponentStyle(AStyle: TTMSStyle);
    procedure SaveToTheme(FileName: String);
    procedure LoadFromTheme(FileName: String);
    function GetThemeID: String;
    function XToDateTime(X: Double): TDateTime;
    function DateTimeToX(Value: TDateTime): Double;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure MouseWheelHandler(var Message: TMessage); override;
    procedure SetTimeLineRange(ARangeFrom, ARangeTo: TDateTime); overload;
    procedure SetTimeLineRange(ARangeFrom, ARangeTo, AMinimumRange, AMaximumRange: TDateTime); overload;
    procedure DrawTimeLine(ACanvas: TCanvas);
    procedure SaveToImage(Filename: String; ImageWidth, ImageHeight: integer; ImageType: TImageType = itBMP; ImageQualityPercentage: integer = 100);
  published
    property DefaultHintFill: TGDIPFill read FDefaultHintFill write SetDefaultHintFill;
    property DefaultSectionFill: TGDIPFill read FDefaultSectionFill write SetDefaultSectionFill;
    property DefaultIndicator: TAdvSmoothTimeLineBarIndicator read FDefaultIndicator write SetDefaultIndicator;
    property Range: TAdvSmoothTimeLineRange read FRange write SetRange;
    property RangeAppearance: TAdvSmoothTimeLineRangeAppearance read FRangeAppearance write SetRangeAppearance;
    property Fill: TGDIPFill read FFill write SetFill;
    property VerticalMargin: integer read FVerticalMargin write SetVerticalMargin default 10;
    property HorizontalMargin: integer read FHorizontalMargin write SetHorizontalMargin default 25;
    property TimeLineBar: TAdvSmoothTimeLineBar read FTimeLineBar write SetTimeLineBar;
    property TimeLineSections: TAdvSmoothTimeLineBarSections read FTimeLineBarSections write SetTimeLineBarSections;
    property TimeLineIndicators: TAdvSmoothTimeLineBarIndicators read FTimeLineIndicators write SetTimeLineIndicators;
    property ImageList: TCustomImageList read FImageList write SetImageList;
    property OnIndicatorHint: TAdvSmoothTimeLineIndicatorHint read FOnIndicatorHint write FOnIndicatorHint;
    property OnIndicatorPositionChanged: TAdvSmoothTimeLineIndicatorPosition read FOnIndicatorPositionChanged write FOnIndicatorPositionChanged;
    property OnSectionPositionChanged: TAdvSmoothTimeLineSectionPosition read FOnSectionPositionChanged write FOnSectionPositionChanged;
    property OnIndicatorPositionChanging: TAdvSmoothTimeLineIndicatorPosition read FOnIndicatorPositionChanging write FOnIndicatorPositionChanging;
    property OnSectionPositionChanging: TAdvSmoothTimeLineSectionPosition read FOnSectionPositionChanging write FOnSectionPositionChanging;
    property OnIndicatorClick: TAdvSmoothTimeLineIndicatorClick read FOnIndicatorClick write FOnIndicatorClick;
    property OnSectionClick: TAdvSmoothTimeLineSectionClick read FOnSectionClick write FOnSectionClick;
    property OnDivisionText: TAdvSmoothTimeLineDivisionText read FOnDivisionText write FOnDivisionText;
    property OnSubDivisionText: TAdvSmoothTimeLineDivisionText read FOnSubDivisionText write FOnSubDivisionText;
    property OnDrawTimeLine: TAdvSmoothTimeLineDrawEvent read FOnDrawTimeLine write FOnDrawTimeLine;
    property OnScrollTimeLine: TAdvSmoothTimeLineScrollEvent read FOnScrollTimeLine write FOnScrollTimeLine;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default false;

    property Visible;
    property ShowHint;

    property Align;
    property Anchors;
    property Constraints;
    property DragMode;
    property DragCursor;
    property DragKind;

    {$IFDEF DELPHI2006_LVL}
    property OnCanResize;
    property OnConstrainedResize;
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    {$IFDEF DELPHI2006_LVL}
    property OnMouseActivate;
    property OnMouseEnter;
    property OnMouseLeave;
    {$ENDIF}
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseDown;
    property OnClick;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    property Enabled;
    property TabStop default true;
    {$IFDEF DELPHI_TOUCH}
    property OnGesture;
    property Touch;
    {$ENDIF}
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

type
  {$HINTS OFF}
  TShadowedCollection = class(TPersistent)
  private
    FItemClass: TCollectionItemClass;
    FItems: TList;
  end;
  {$HINTS ON}

function RectanglesInterSect(r1, r2: TGPRectF): Boolean;
var
  x, y, w, h: Double;
begin
  x := max(r1.X, r2.X);
  y := max(r1.Y, r2.Y);
  w := min(r1.X + r1.Width, r2.X + r2.Width);
  h := min(r1.Y + r1.Height, r2.Y + r2.Height);

  result := ((w > x) and (h > y));
end;

procedure GetObjectLocation(var x, y: Double; rectangle: TGPRectF; objectwidth, objectheight: Double; location: TAdvSmoothTimeLineCaptionLocation);
var
  w, h, tw, th: Double;
begin
  tw := objectwidth;
  th := objectheight;
  w := Round(rectangle.Width);
  h := Round(rectangle.Height);
  case location of
    cpTopLeft:
    begin
      x := 0;
      y := 0;
    end;
    cpTopRight:
    begin
      x := w - tw;
      y := 0;
    end;
    cpBottomLeft:
    begin
      x := 0;
      y := h - th;
    end;
    cpBottomRight:
    begin
      x := w - tw;
      y := h - th;
    end;
    cpTopCenter:
    begin
      x := (w - tw) / 2;
      y := 0;
    end;
    cpBottomCenter:
    begin
      x := (w - tw) / 2;
      y := h - th;
    end;
    cpCenterCenter:
    begin
      x := (w - tw) / 2;
      y := (h - th) / 2;
    end;
    cpCenterLeft:
    begin
      x := 0;
      y := (h - th) / 2;
    end;
    cpCenterRight:
    begin
      x := w - tw;
      y := (h - th) / 2;
    end;
  end;

  x := x + rectangle.X;
  y := y + rectangle.Y;
end;

{ TAdvSmoothTimeLine }

function AnimateDouble(var Start: Single; Stop, Delta, Margin: Single): Boolean;
begin
  Result := true;
  if (Start > Stop - Margin) and (Start < Stop + Margin) then
  begin
    Start := Stop;
    Result := false;
  end
  else
  begin
    Delta := Max(1, Delta);
    if Start < Stop then
      Start := Round(Start + Delta)
    else
      Start := Round(Start - Delta);
  end;
end;

procedure TAdvSmoothTimeLine.AnimateTimeLine(Sender: TObject);
var
  d: Double;
  start: single;
  I: Integer;
  rs, rt: single;
  fr: integer;
begin
  if ReadOnly then
    Exit;
    
  if FScrollTimeLine then
  begin
    BeginUpdate;
    if Assigned(OnScrollTimeLine) then
      OnScrollTimeLine(Self, Range.RangeFrom, Range.RangeTo, Range.RangeFrom + FScrollDif, Range.RangeTo + FScrollDif);

    Range.RangeFrom := Range.RangeFrom + FScrollDif;
    Range.RangeTo := Range.RangeTo + FScrollDif;
    EndUpdate;
  end;

  with Range do
  begin
    if FAnimateRangeFrom then
    begin
      rs := RangeFrom;

      fr := 0;
      while Frac(rs) > 0 do
      begin
        rs := rs * 10;
        FRangeFromAnim := FRangeFromAnim * 10;
        Inc(fr);
      end;

      d := Abs(rs - FRangeFromAnim) / Max(1, FSP);

      FDoAnimateRange := AnimateDouble(rs, FRangeFromAnim, d, 1);
      if FDoAnimateRange then
      begin
        while fr > 0 do
        begin
          rs := rs / 10;
          FRangeFromAnim := FRangeFromAnim / 10;
          dec(fr);
        end;

        BeginUpdate;
        FRangeFrom := rs;
        EndUpdate;
      end
      else
      begin
        FAnimateRangeFrom := false;
        while fr > 0 do
        begin
          FRangeFromAnim := FRangeFromAnim / 10;
          dec(fr);
        end;
        BeginUpdate;
        FRangeFrom := FRangeFromAnim;
        EndUpdate;
      end;
    end;

    if FAnimateRangeTo then
    begin
      rt := RangeTo;
      fr := 0;
      while Frac(rt) > 0 do
      begin
        rt := rt * 10;
        FRangeToAnim := FRangeToAnim * 10;
        Inc(fr);
      end;

      d := Abs(rt - FRangeToAnim) / Max(1, FSP);
      FDoAnimateRange := AnimateDouble(rt, FRangeToAnim, d, 1);
      if FDoAnimateRange then
      begin
        while fr > 0 do
        begin
          rt := rt / 10;
          FRangeToAnim := FRangeToAnim / 10;
          dec(fr);
        end;

        BeginUpdate;
        FRangeTo := rt;
        EndUpdate;
      end
      else
      begin
        FAnimateRangeTo := false;
        while fr > 0 do
        begin
          FRangeToAnim := FRangeToAnim / 10;
          dec(fr);
        end;
        BeginUpdate;
        FRangeTo := FRangeToAnim;
        EndUpdate;
      end;
    end;
  end;

  for I := 0 to TimeLineSections.Count - 1 do
  begin
    with TimeLineSections[I] do
    begin
      if FSizeHandleAnimation then
      begin
        d := Abs(FSizeHandleOpacity - FSizeHandleOpacityTo) / 5;
        start := FSizeHandleOpacity;
        FDoSizeHandleAnimation := AnimateDouble(start, FSizeHandleOpacityTo, d, 1);
        if FDoSizeHandleAnimation then
        begin
          FSizeHandleOpacity := Round(start);
          Changed;
        end
        else
        begin
          FSizeHandleOpacity := FSizeHandleOpacityTo;
          FSizeHandleAnimation := false;
        end;
      end;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLine) then
  begin
    Frange.Assign((Source as TAdvSmoothTimeLine).Range);
    FRangeAppearance.Assign((Source as TAdvSmoothTimeLine).RangeAppearance);
    FFill.Assign((Source as TAdvSmoothTimeLine).Fill);
    FVerticalMargin := (Source as TAdvSmoothTimeLine).VerticalMargin;
    FHorizontalMargin := (Source as TAdvSmoothTimeLine).HorizontalMargin;
    FTimeLineBar.Assign((Source as TAdvSmoothTimeLine).TimeLineBar);
    FTimeLineBarSections.Assign((Source as TAdvSmoothTimeLine).TimeLineSections);
    FDefaultHintFill.Assign((Source as TAdvSmoothTimeLine).FDefaultHintFill);
    FDefaultSectionFill.Assign((Source as TAdvSmoothTimeLine).FDefaultSectionFill);
    FTimeLineIndicators.Assign((Source as TAdvSmoothTimeLine).TimeLineIndicators);
    FDefaultIndicator.Assign((source as TAdvSmoothTimeLine).DefaultIndicator);
    FReadOnly := (Source as TAdvSmoothTimeLine).ReadOnly;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TAdvSmoothTimeLine.BuildAnnotations;
var
  ff: TGPFontFamily;
  f: TGPFont;
  fs: integer;
  sf: TGPStringFormat;
  bmp: TBitmap;
  g: TGPGraphics;
  i: integer;
begin
  if (csDestroying in ComponentState) or (csLoading in ComponentState) or (FUpdateCount > 0) then
    Exit;

  if FReBuildLists then
  begin
    FReBuildLists := false;
    FAnnotationListTop.Clear;
    FAnnotationListBottom.Clear;

    for I := 0 to TimeLineIndicators.Count - 1 do
    begin
      if ((TimeLineIndicators[I].Annotation <> '') or (TimeLineIndicators[I].AnnotationImageIndex <> -1)) and
        (TimeLineIndicators[I].AnnotationPosition = apOnTop) then
        begin
          FAnnotationListTop.Add.Indicator := TimeLineIndicators[I];
        end;
    end;

    for I := 0 to TimeLineIndicators.Count - 1 do
    begin
      if ((TimeLineIndicators[I].Annotation <> '') or (TimeLineIndicators[I].AnnotationImageIndex <> -1)) and
        (TimeLineIndicators[I].AnnotationPosition = apAtBottom) then
        begin
          FAnnotationListBottom.Add.Indicator := TimeLineIndicators[I];
        end;
    end;

    //Sort indicators on position
    if FAnnotationListTop.Count > 1 then
      FAnnotationListTop.QuickSort(0, pred(FAnnotationListTop.Count));

    //Sort indicators on position
    if FAnnotationListBottom.Count > 1 then
      FAnnotationListBottom.QuickSort(0, pred(FAnnotationListBottom.Count));
  end;


  bmp := TBitmap.Create;
  g := TGPGraphics.Create(bmp.Canvas.Handle);

  with TimeLineBar do
  begin
    ff := TGPFontFamily.Create(AnnotationFont.Name);
    if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
    begin
      ff.Free;
      ff := TGPFontFamily.Create('Arial');
    end;

    fs := 0;
    if (fsBold in AnnotationFont.Style) then
      fs := fs + 1;
    if (fsItalic in AnnotationFont.Style) then
      fs := fs + 2;
    if (fsUnderline in AnnotationFont.Style) then
      fs := fs + 4;

    sf := TGPStringFormat.Create;
    f := TGPFont.Create(ff, AnnotationFont.Size, fs, UnitPoint);
  end;

  for I := 0 to FAnnotationListTop.Count - 1 do
    with FAnnotationListTop.GetItem(i) do
      AnnotationRect := Indicator.CalculateAnnotation(g, f, sf, I);

  for I := 0 to FAnnotationListBottom.Count - 1 do
    with FAnnotationListBottom.GetItem(i) do
      AnnotationRect := Indicator.CalculateAnnotation(g, f, sf, I);

  ff.Free;
  f.Free;
  sf.Free;
  g.Free;
  bmp.Free;
end;

procedure TAdvSmoothTimeLine.BuildTimeLineValues;
var
  x, xsub, w, y, ysub: double;
  I, J, K, ind: Integer;
  wdiv: Double;
  wsubdiv: Double;
  ff, ffsub: TGPFontFamily;
  fs: integer;
  sf, sfsub: TGPStringFormat;
  f, fsub: TGPFont;
  v: TDateTime;
  s: String;
  Layr, sizer: TGPRectF;
  overlap: Boolean;
  totalw: Double;
  timeliner: TGPRectF;
  d, ddiv: TDateTime;
  AllowDraw: Boolean;
  g: TGPGraphics;
  bmp: TBitmap;
  dv, dvsub: integer;

  procedure DoSwap(a, b: integer);
  var
    H: TTimeLineValue;
  begin
    H := FTimeLineValues[a];
    FTimeLineValues[a] := FTimeLineValues[b];
    FTimeLineValues[b] := H;
  end;

  function DoCompare(a,b: integer): integer;
  begin
    Result := 0;
    if FTimeLineValues[a].d < FTimeLineValues[b].d then
      Result := -1
    else if FTimeLineValues[a].d > FTimeLineValues[b].d then
      Result := 1;
  end;

  procedure Sort(b,e: integer);
  var
    i: integer;
    s: boolean;
  begin
    s := false;
    while not s do
    begin
     s:=true;
     for i := b to e - 1 do
      if DoCompare(i, i + 1) > 0 then
      begin
         DoSwap(i, i + 1);
         s := false;
      end;
    end;
  end;
begin
  if not Assigned(Range) or not Assigned(RangeAppearance) then
    Exit;

  timeliner := gettimelinerect;
  w := timeliner.Width;

  if not (w > 10) or not (Range.RangeTo - Range.RangeFrom > 0) then
    Exit;

  SetLength(FTimeLineValues, 0);
  bmp := TBitmap.Create;
  g := TGPGraphics.Create(bmp.Canvas.Handle);

  //Division font
  ff := TGPFontFamily.Create(FRangeAppearance.DivisionFont.Name);
  if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
  begin
    ff.Free;
    ff := TGPFontFamily.Create('Arial');
  end;

  fs := 0;
  if (fsBold in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 1;
  if (fsItalic in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 2;
  if (fsUnderline in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 4;

  sf := TGPStringFormat.Create;
  f := TGPFont.Create(ff, FRangeAppearance.DivisionFont.Size, fs, UnitPoint);
  //

  //Sub division font
  ffsub := TGPFontFamily.Create(FRangeAppearance.SubDivisionFont.Name);
  if (ffsub.Status in [FontFamilyNotFound, FontStyleNotFound]) then
  begin
    ffsub.Free;
    ffsub := TGPFontFamily.Create('Arial');
  end;

  fs := 0;
  if (fsBold in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 1;
  if (fsItalic in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 2;
  if (fsUnderline in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 4;

  sfsub := TGPStringFormat.Create;
  fsub := TGPFont.Create(ffsub, FRangeAppearance.SubDivisionFont.Size, fs, UnitPoint);
  //
  Layr := MakeRect(0, 0, 10000, 10000);

  x := timeliner.X;
  y := timeliner.Y + 2 + RangeAppearance.DivisionTickMarkSize;
  ysub := timeliner.Y + 2 + RangeAppearance.SubDivisionTickMarkSize;


  if (Range.DivisionType = dtFixedNumber) then
  begin
    if (Range.Divisions > 0) then
    begin
      wdiv := w / Range.Divisions;
      wsubdiv := 0;
      if Range.SubDivisions > 0 then
        wsubdiv := wdiv / Range.SubDivisions;

      K := 1;
      for I := 0 to Range.Divisions do
      begin
        if RangeAppearance.ShowDivisionValue then
        begin
          if Range.Divisions * I = 0 then
            v := Range.RangeFrom
          else
            v := Range.RangeFrom + (GetRange / Range.Divisions * I);

          s := formatDatetime(FRangeAppearance.DivisionFormat, v);
          if Assigned(FOnDivisionText) then
            FOnDivisionText(Self, v, s);
          g.MeasureString(s, Length(s), f, Layr, sf, sizer);
          SetLength(FTimeLineValues, Length(FTimeLineValues) + 1);
          FTimeLineValues[Length(FTimeLineValues) -1].d := v;
          FTimeLineValues[Length(FTimeLineValues) -1].str := s;
          FTimeLineValues[Length(FTimeLineValues) -1].postext := MakePoint(x - sizer.Width / 2, y);
          FTimeLineValues[Length(FTimeLineValues) -1].recttext := sizer;
          FTimeLineValues[Length(FTimeLineValues) -1].tp := vtDivision;
        end;

        if (I < Range.Divisions) and (Range.SubDivisions > 0) then
        begin
          for J := 1 to Range.SubDivisions - 1 do
          begin
            if RangeAppearance.ShowSubDivisionValue then
            begin
              if (Range.SubDivisions * Range.Divisions) = 0 then
                v := Range.RangeFrom
              else
                v := Range.RangeFrom + (GetRange / (Range.SubDivisions * Range.Divisions)) * K;

              s := formatDatetime(FRangeAppearance.SubDivisionFormat, v);
              if Assigned(FOnSubDivisionText) then
                FOnSubDivisionText(Self, v, s);

              g.MeasureString(s, Length(s), fsub, Layr, sf, sizer);
              SetLength(FTimeLineValues, Length(FTimeLineValues) + 1);
              FTimeLineValues[Length(FTimeLineValues) -1].d := v;
              FTimeLineValues[Length(FTimeLineValues) -1].str := s;
              FTimeLineValues[Length(FTimeLineValues) -1].postext := MakePoint(x + (wsubdiv * J) - sizer.Width / 2, ysub);
              FTimeLineValues[Length(FTimeLineValues) -1].recttext := sizer;
              FTimeLineValues[Length(FTimeLineValues) -1].tp := vtSubDivision;

              Inc(K);
            end;
          end;
          Inc(K);
        end;
        x := x + wdiv;
      end;
    end;
  end
  else
  begin
    dv := GetDivisions;
    dvsub := GetSubDivisions;
    if (dv > 0) and (RangeAppearance.ShowDivisionValue) then
    begin
      //first value
      d := GetDeltaDatetime(Range.DivisionType, dv);
      x := DateTimeToX(d);

      //next values
      I := 0;
      while (d <= Range.RangeTo) and (d > 0) do
      begin
        if d >= Range.RangeFrom then
        begin
          s := formatDatetime(FRangeAppearance.DivisionFormat, d);
          if Assigned(FOnDivisionText) then
            FOnDivisionText(Self, d, s);
          g.MeasureString(s, Length(s), f, Layr, sf, sizer);
          SetLength(FTimeLineValues, Length(FTimeLineValues) + 1);
          FTimeLineValues[Length(FTimeLineValues) -1].d := d;
          FTimeLineValues[Length(FTimeLineValues) -1].str := s;
          FTimeLineValues[Length(FTimeLineValues) -1].postext := MakePoint(x - sizer.Width / 2, y);
          FTimeLineValues[Length(FTimeLineValues) -1].recttext := sizer;
          FTimeLineValues[Length(FTimeLineValues) -1].tp := vtDivision;
        end;

        Inc(I);
        d := GetDeltaDatetime(Range.DivisionType, dv, I);
        x := DatetimeToX(d);
        if d > Range.RangeTo then
          Break;
      end;
    end;
    if (dvsub > 0) and RangeAppearance.ShowSubDivisionValue then
    begin
      //first value
      d := GetDeltaDatetime(Range.DivisionType, dvsub);
      x := DateTimeToX(d);

      //next values
      I := 0;
      while (d <= Range.RangeTo) and (d > 0) do
      begin
        AllowDraw := true;
        K := 0;
        ddiv := GetDeltaDateTime(Range.DivisionType, dv);
        while (ddiv <= Range.RangeTo) and (ddiv > 0) do
        begin
          if CompareDateTime(d, ddiv) = 0 then
          begin
            AllowDraw := false;
            Break;
          end;
          Inc(K);
          ddiv := GetDeltaDateTime(Range.DivisionType, dv, K);
        end;

        if AllowDraw then
        begin
          if d >= Range.RangeFrom then
          begin
            s := formatDatetime(FRangeAppearance.SubDivisionFormat, d);
            if Assigned(FOnDivisionText) then
              FOnDivisionText(Self, d, s);
            g.MeasureString(s, Length(s), fsub, Layr, sf, sizer);
            SetLength(FTimeLineValues, Length(FTimeLineValues) + 1);
            FTimeLineValues[Length(FTimeLineValues) -1].d := d;
            FTimeLineValues[Length(FTimeLineValues) -1].str := s;
            FTimeLineValues[Length(FTimeLineValues) -1].postext := MakePoint(x - sizer.Width / 2, ysub);
            FTimeLineValues[Length(FTimeLineValues) -1].recttext := sizer;
            FTimeLineValues[Length(FTimeLineValues) -1].tp := vtSubDivision;
          end;
        end;

        Inc(I);
        d := GetDeltaDatetime(Range.DivisionType, dvsub, I);
        x := DatetimeToX(d);
        if d > Range.RangeTo then
          Break;
      end;
    end;
  end;


  FTotalIndent := 0;
  ind := 0;
  totalw := 0;
  overlap := true;
  while overlap do
  begin
    for I := 0 to Length(FTimeLineValues) - 1 do
    begin
      with FTimeLineValues[I] do
      begin
        if ind = 0 then
          totalw := totalw + recttext.Width + 5;

        if ind < FTotalIndent then
          Inc(ind)
        else
          ind := 0;
      end;
    end;

    if totalw > w then
    begin
      Inc(FTotalIndent);
      totalw := 0;
    end
    else
      overlap := false;
  end;

  Sort(0, Length(FTimeLineValues) - 1);

  ff.Free;
  ffsub.Free;
  f.Free;
  fsub.Free;
  sf.Free;
  sfsub.Free;
  g.Free;
  bmp.Free;
end;

procedure TAdvSmoothTimeLine.CalculateHintSize(h: TAdvSmoothSectionHint);
var
  ff: TGPFontFamily;
  f: TGPFont;
  fs: integer;
  sf: TGPStringFormat;
  fillr, layr, sizer: TGPRectF;
  b: TGPSolidBrush;
  x, y: integer;
  g: TGPGraphics;
begin
  if (FHoveredSection >= 0) and (FHoveredSection <= TimeLineSections.Count - 1) then
  begin
    with TimeLineSections[FHoveredSection] do
    begin
      g := TGPGraphics.Create(Canvas.Handle);

      ff := TGPFontFamily.Create(HintFont.Name);
      if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
      begin
        ff.Free;
        ff := TGPFontFamily.Create('Arial');
      end;

      fs := 0;
      if (fsBold in HintFont.Style) then
        fs := fs + 1;
      if (fsItalic in HintFont.Style) then
        fs := fs + 2;
      if (fsUnderline in HintFont.Style) then
        fs := fs + 4;

      sf := TGPStringFormat.Create;        
      if HintAutoSize then      
        Layr := MakeRect(0, 0, 10000, 10000)        
      else
        Layr := MakeRect(0, 0, HintWidth, HintHeight);      

      f := TGPFont.Create(ff, HintFont.Size, fs, UnitPoint);
      b := TGPSolidBrush.Create(MakeColor(255, Hintfont.Color));
      g.MeasureString(Hint, length(Hint), f, layr, sf, sizer);

      x := 0;
      y := 0;

      if HintAutoSize then      
        fillr := MakeRect(x, y, sizer.Width + 5, sizer.Height + 5)
      else
        fillr := MakeRect(x, y, layr.Width + 5, layr.Height + 5);

      Fh.Width := Round(fillr.Width);
      Fh.Height := Round(fillr.Height);

      if not HintFill.Picture.Empty then
      begin
        HintFill.Picture.GetImageSizes;
        fh.Width := Max(fh.Width, hintfill.Picture.Width);
        fh.Height := Max(fh.Height, hintfill.Picture.Height);
      end;

      fh.Width := fh.Width + 1;
      fh.Height := fh.Height + 1;
              
      b.Free;
      f.Free;
      ff.Free;      
      sf.Free;
      g.Free;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.Changed;
begin
  if FUpdateCount = 0 then
    invalidate;

  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TAdvSmoothTimeLine.CMHintShow(var Message: TMessage);
var
  hint: String;
  id: integer;
  pt: TPoint;
  a: Boolean;
begin
  with TCMHintShow(Message).HintInfo^ do
  begin
    pt := CursorPos;
    id := IndicatorAtXY(pt.X, pt.Y, a);
    if id <> -1 then
    begin
      hint := TimeLineIndicators[id].Hint;
      if Assigned(OnIndicatorHint) then
        OnIndicatorHint(Self, TimeLineIndicators[id], hint);
      HintStr := hint;
      ReshowTimeout := 0;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.CMMouseLeave(var Message: TMessage);
var
  i: integer;
begin
  inherited;
  FHoveredSection := -1;
  FMouseMovedOnIndicator := false;
  FMouseDownOnIndicator := false;
  FMouseDownOnSection := false;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    with TimeLineSections[I] do
    begin
      if FSizeHandleAnimationStarted then
      begin
        FSizeHandleOpacityTo := 0;
        FSizeHandleAnimationStarted := false;
        FSizeHandleAnimation := true;
      end;
    end;
  end;

  if Fh.Visible then
  begin
    FhintSizeCalculated := false;
    FH.Hide;
  end;

  Application.CancelHint;
  Changed;
end;

constructor TAdvSmoothTimeLine.Create(AOwner: TComponent);
begin
  inherited;
  DoubleBuffered := true;
  FAnnotationListTop := TAdvSmoothTimeLineAnnotationList.Create(Self);
  FAnnotationListBottom := TAdvSmoothTimeLineAnnotationList.Create(Self);
  FRange := TAdvSmoothTimeLineRange.Create(Self);
  FRange.OnChange := RangeChanged;
  FRangeAppearance := TAdvSmoothTimeLineRangeAppearance.Create(Self);
  FRangeAppearance.OnChange := RangeAppearanceChanged;
  FFill := TGDIPFill.Create;
  FFill.OnChange := FillChanged;
  FVerticalMargin := 10;
  FHorizontalMargin := 25;
  Width := 500;
  Height := 80;
  FTimeLineBar := TAdvSmoothTimeLineBar.Create(Self);
  FTimeLineBar.OnChange := TimeLineBarChanged;
  FTimeLineBarSections := TAdvSmoothTimeLineBarSections.Create(Self);
  FTimeLinebarSections.OnChange := TimeLineBarSectionsChanged;
  FDefaultHintFill := TGDIPFill.Create;
  FDefaultSectionFill := TGDIPFill.Create;
  FTimeLineIndicators := TAdvSmoothTimeLineBarIndicators.Create(Self);
  FTimeLineIndicators.OnChange := TimeLineBarIndicatorsChanged;
  FHoveredSection := -1;
  FHoveredIndicator := -1;
  FSelectedIndicator := -1;
  FSelectedSection := -1;
  FDefaultIndicators := TAdvSmoothTimeLineBarIndicators.Create(Self);
  FDefaultIndicator := FDefaultIndicators.Add;
  Fh := TAdvSmoothSectionHint.Create(Application);
  fh.Visible := False;
  Fh.Parent := Self;
  fh.TimeLine := Self;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := true;
  FTimer.Interval := 50;
  FTimer.OnTimer := AnimateTimeLine;
  FReadOnly := false;

  TabStop := true;

  FDesignTime := (csDesigning in ComponentState) and not
    ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState));

  if FDesignTime then
    SetComponentStyle(tsOffice2007Luna);
end;

procedure TAdvSmoothTimeLine.CreateWnd;
begin
  inherited;
  FLoaded := true;
end;

function TAdvSmoothTimeLine.DateTimeToX(Value: TDateTime): Double;
begin
  Result := GetXPosition(Value);
end;

destructor TAdvSmoothTimeLine.Destroy;
begin
  FAnnotationListTop.Free;
  FAnnotationListBottom.Free;
  FDefaultIndicator.Free;
  FDefaultIndicator := nil;
  FDefaultIndicators.Free;
  FRange.Free;
  FRangeAppearance.Free;
  FFill.Free;
  FTimeLineBar.Free;
  FTimeLineBarSections.Free;
  FDefaultHintFill.Free;
  FDefaultSectionFill.Free;
  FTimeLineIndicators.Free;
  inherited;
end;

procedure TAdvSmoothTimeLine.DoIndicatorDown(Sender: TObject;
  indicator: TAdvSmoothTimeLineBarIndicator);
begin
//
end;

procedure TAdvSmoothTimeLine.DoIndicatorPositionChanged(Sender: TObject;
  indicator: TAdvSmoothTimeLineBarIndicator; Position: TDateTime);
begin
  if Assigned(FOnIndicatorPositionChanged) then
    FOnIndicatorPositionChanged(Sender, indicator, Position);
end;

procedure TAdvSmoothTimeLine.DoSectionDown(Sender: TObject;
  section: TAdvSmoothTimeLineBarSection);
begin
//
end;

procedure TAdvSmoothTimeLine.DoSectionPositionChanged(Sender: TObject;
  section: TAdvSmoothTimeLineBarSection; StartTime, EndTime: TDateTime);
begin
  if Assigned(FOnSectionPositionChanged) then
    FOnSectionPositionChanged(Sender, section, StartTime, EndTime);
end;

procedure TAdvSmoothTimeLine.DrawBackground(g: TGPGraphics);
begin
  FFill.Fill(g, MakeRect(0,0, Width - 1, Height - 1));
end;

procedure TAdvSmoothTimeLine.DrawSectionHint(g: TGPGraphics);
var
  ff: TGPFontFamily;
  f: TGPFont;
  fs: integer;
  sf: TGPStringFormat;
  fillr, layr, sizer: TGPRectF;
  b: TGPSolidBrush;
  x, y: integer;
  bmp: TGPBitmap;
  bmpg: TGPGraphics;
begin
  if (FHoveredSection >= 0) and (FHoveredSection <= TimeLineSections.Count - 1) then
  begin
    with TimeLineSections[FHoveredSection] do
    begin
      if (Hint = '') and HintFill.Picture.Empty then
        Exit;

      ff := TGPFontFamily.Create(HintFont.Name);
      if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
      begin
        ff.Free;
        ff := TGPFontFamily.Create('Arial');
      end;

      fs := 0;
      if (fsBold in HintFont.Style) then
        fs := fs + 1;
      if (fsItalic in HintFont.Style) then
        fs := fs + 2;
      if (fsUnderline in HintFont.Style) then
        fs := fs + 4;

      sf := TGPStringFormat.Create;        
      if HintAutoSize then      
        Layr := MakeRect(0, 0, 10000, 10000)        
      else
        Layr := MakeRect(0, 0, HintWidth, HintHeight);      

      f := TGPFont.Create(ff, HintFont.Size, fs, UnitPoint);
      b := TGPSolidBrush.Create(MakeColor(255, Hintfont.Color));
      g.MeasureString(Hint, length(Hint), f, layr, sf, sizer);

      x := 0;
      y := 0;

      if HintAutoSize then      
        fillr := MakeRect(x, y, sizer.Width + 5, sizer.Height + 5)
      else
        fillr := MakeRect(x, y, layr.Width + 5, layr.Height + 5);


      if not HintFill.Picture.Empty then
      begin
        HintFill.Picture.GetImageSizes;
        fillr.Width := Max(fillr.Width, hintfill.Picture.Width);
        fillr.Height := Max(fillr.Height, hintfill.Picture.Height);
      end;

      bmp := TGPBitmap.Create(Width, Height);
      bmpg := g.FromImage(bmp);
      bmpg.SetTextRenderingHint(TextRenderingHintAntiAlias);

      FHintFill.Fill(bmpg, fillr);

      bmpg.DrawString(Hint, Length(Hint), f, MakeRect(fillr.X + (fillr.Width - sizer.Width) / 2, fillr.Y + (fillr.Height - sizer.Height) / 2, sizer.Width, sizer.Height), sf, b);

      bmpg.Free;
      g.DrawImage(bmp, 0, 0);
      bmp.Free;

      b.Free;
      f.Free;
      ff.Free;
      sf.Free;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.DrawTimeBar(g: TGPGraphics);
begin
  TimeLineBar.Fill.Fill(g, GetTimeLineBarRect);
end;

procedure TAdvSmoothTimeLine.DrawTimeBarIndicators(g: TGPGraphics);
type
  TPointArray = array of TGPPointF;
var
  I: Integer;
  fp: TGDIPFillParameters;
  path: TGPGraphicsPath;
  pa: TPointArray;
  s: integer;
  p: TGPPen;
  ff: TGPFontFamily;
  f: TGPFont;
  fs: integer;
  sf: TGPStringFormat;
  btext: TGPSolidBrush;
  bdifftext: TGPSolidBrush;
begin
  with TimeLineBar do
  begin
    ff := TGPFontFamily.Create(AnnotationFont.Name);
    if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
    begin
      ff.Free;
      ff := TGPFontFamily.Create('Arial');
    end;

    fs := 0;
    if (fsBold in AnnotationFont.Style) then
      fs := fs + 1;
    if (fsItalic in AnnotationFont.Style) then
      fs := fs + 2;
    if (fsUnderline in AnnotationFont.Style) then
      fs := fs + 4;

    sf := TGPStringFormat.Create;
    sf.SetLineAlignment(StringAlignmentCenter);
    f := TGPFont.Create(ff, AnnotationFont.Size, fs, UnitPoint);
    btext := TGPSolidBrush.Create(ColorToARGB(AnnotationFont.Color));
  end;

  for I := 0 to FAnnotationListTop.Count - 1 do
    with FAnnotationListTop.GetItem(I) do
      Indicator.DrawAnnotationLine(g, AnnotationRect, Indicator.AnnotationPosition);

  for I := 0 to FAnnotationListBottom.Count - 1 do
    with FAnnotationListBottom.GetItem(I) do
      Indicator.DrawAnnotationLine(g, AnnotationRect, Indicator.AnnotationPosition);

  for I := 0 to FAnnotationListTop.Count - 1 do
  begin
    with FAnnotationListTop.GetItem(I) do
    begin
      if Indicator.AnnotationTextColor <> clNone then
      begin
        bdifftext := TGPSolidBrush.Create(ColorToARGB(Indicator.AnnotationTextColor));
        Indicator.DrawAnnotation(g, f, sf, bdifftext,AnnotationRect);
        bdifftext.Free;
      end
      else
        Indicator.DrawAnnotation(g, f, sf, btext,AnnotationRect);
    end;
  end;

  for I := 0 to FAnnotationListBottom.Count - 1 do
  begin
    with FAnnotationListBottom.GetItem(I) do
    begin
      if Indicator.AnnotationTextColor <> clNone then
      begin
        bdifftext := TGPSolidBrush.Create(ColorToARGB(Indicator.AnnotationTextColor));
        Indicator.DrawAnnotation(g, f, sf, bdifftext,AnnotationRect);
        bdifftext.Free;
      end
      else
        Indicator.DrawAnnotation(g, f, sf, btext,AnnotationRect);
    end;
  end;

  for I := 0 to TimeLineIndicators.Count - 1 do
  begin
    with TimeLineIndicators[I] do
    begin
      if (Position >= Range.RangeFrom) and (Position <= Range.RangeTo) then
      begin
        fp.R := GetIndicatorRect;
        s := Size;
        fp.Graphics := g;
        fp.ColorFrom := Color;
        fp.ColorTo := Colorto;
        fp.GT := GradientType;
        fp.OpacityFrom := Opacity;
        fp.OpacityTo := OpacityTo;
        fp.Angle := Angle;
        fp.BorderColor := clNone;
        fp.BorderWidth := 0;
        fp.Path := nil;
        fp.Mirror := false;

        case Shape of
          isNone: ; // draw nothing
          isCircle:
            begin
              path := TGPGraphicsPath.Create;
              path.AddEllipse(fp.R);
              path.CloseFigure;

              fp.Path := path;
              fp.Fillpath := true;
              FillGDIP(fp);

              if (BorderColor <> clNone) and (Borderwidth > 0) then
              begin
                p := TGPPen.Create(MakeColor(BorderOpacity, BorderColor), BorderWidth);
                g.DrawPath(p, path);
                p.Free;
              end;

              path.Free;
            end;
          isSquare:
            begin
              fp.Fillpath := false;
              FillGDIP(fp);
              if (BorderColor <> clNone) and (Borderwidth > 0) then
              begin
                p := TGPPen.Create(MakeColor(BorderOpacity, BorderColor), BorderWidth);
                g.DrawRectangle(p, fp.R);
                p.Free;
              end;
            end;
          isDiamond:
            begin
              SetLength(pa, 4); //DIAMOND 4 POINTS
              pa[0] := MakePoint(fp.R.x, fp.R.y + s / 2);
              pa[1] := MakePoint(fp.R.x + s / 2, fp.R.y);
              pa[2] := MakePoint(fp.R.x + s, fp.R.y + s / 2);
              pa[3] := MakePoint(fp.R.x + s / 2, fp.R.y + s);

              path := TGPGraphicsPath.Create;
              path.AddPolygon(PGPPointF(pa),4);
              path.CloseFigure;

              fp.Path := path;
              fp.Fillpath := true;
              FillGDIP(fp);
              if (BorderColor <> clNone) and (Borderwidth > 0) then
              begin
                p := TGPPen.Create(MakeColor(BorderOpacity, BorderColor), BorderWidth);
                g.DrawPath(p, path);
                p.Free;
              end;

              path.Free;
            end;
          isTriangleDown:
            begin
              SetLength(pa, 3); //TRIANGLE 3 POINTS
              pa[0] := MakePoint(fp.R.x + s / 2, fp.R.y + s);
              pa[1] := MakePoint(fp.R.x, fp.R.y);
              pa[2] := MakePoint(fp.R.x + s, fp.R.y);

              path := TGPGraphicsPath.Create;
              path.AddPolygon(PGPPointF(pa), 3);
              path.CloseFigure;

              fp.Path := path;
              fp.Fillpath := true;
              FillGDIP(fp);
              if (BorderColor <> clNone) and (Borderwidth > 0) then
              begin
                p := TGPPen.Create(MakeColor(BorderOpacity, BorderColor), BorderWidth);
                g.DrawPath(p, path);
                p.Free;
              end;
              path.Free;
            end;
          isTriangleUp:
            begin
              SetLength(pa, 3); //TRIANGLE 3 POINTS
              pa[0] := MakePoint(fp.R.x + s / 2, fp.R.y);
              pa[1] := MakePoint(fp.R.x, fp.R.y + s);
              pa[2] := MakePoint(fp.R.x + s, fp.R.y + s);

              path := TGPGraphicsPath.Create;
              path.AddPolygon(PGPPointF(pa), 3);
              path.CloseFigure;

              fp.Path := path;
              fp.Fillpath := true;
              FillGDIP(fp);
              if (BorderColor <> clNone) and (Borderwidth > 0) then
              begin
                p := TGPPen.Create(MakeColor(BorderOpacity, BorderColor), BorderWidth);
                g.DrawPath(p, path);
                p.Free;
              end;
              path.Free;
            end;
          isPicture:
          begin
            if not Picture.Empty then
              Picture.GDIPDraw(g, Bounds(Round(fp.R.x), Round(fp.R.y), s, s));
          end;
        end;

        if ShowTickMark and (TickMarkColor <> clNone) then
        begin
          p := TGPPen.Create(MakeColor(255, TickMarkColor), TickMarkWidth);
          g.DrawLine(p, fp.R.X + fp.R.Width / 2, fp.R.Y + fp.R.Height, fp.R.X + fp.R.Width / 2, fp.R.Y + fp.R.Height + TickMarkSize);
          p.Free;
        end;
      end;
    end;
  end;

  btext.Free;
  f.Free;
  sf.Free;
  ff.Free;
end;

procedure TAdvSmoothTimeLine.DrawTimeBarSections(g: TGPGraphics);
var
  i: integer;
  rl, rr, r: TGPRectF;
  p: TGPPen;
  bl: TGPLinearGradientBrush;
  bs: TGPSolidBrush;
  opc: Byte;
  s: Double;
  ff: TGPFontFamily;
  fs: integer;
  f: TGPFont;
  sf: TGPStringFormat;
  b: TGPSolidBrush;
  sri: TGPRectF;
  fillr: TGPRectF;
  x, y: Double;
  timeliner: TGPRectF;
begin
  timeliner := GetTimeLineBarRect;
  with TimeLineBar do
  begin
    ff := TGPFontFamily.Create(SectionCaptionFont.Name);
    if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
    begin
      ff.Free;
      ff := TGPFontFamily.Create('Arial');
    end;

    fs := 0;
    if (fsBold in SectionCaptionFont.Style) then
      fs := fs + 1;
    if (fsItalic in SectionCaptionFont.Style) then
      fs := fs + 2;
    if (fsUnderline in SectionCaptionFont.Style) then
      fs := fs + 4;

    sf := TGPStringFormat.Create;
    sf.SetLineAlignment(StringAlignmentCenter);
    f := TGPFont.Create(ff, SectionCaptionFont.Size, fs, UnitPoint);
    b := TGPSolidBrush.Create(ColorToARGB(SectionCaptionFont.Color));

  end;

  for I := 0 to TimeLineSections.Count - 1 do
  begin
    with TimeLineSections[I] do
    begin
      r := GetSectionRect;

      if (r.Width > 0) and (r.X + r.Width >= timeliner.X) and (r.X + r.Width <= timeliner.X + timeliner.Width+0.1) then
      begin
        FFill.Fill(g, r);

        if Caption <> '' then
        begin
          fillr := MakeRect(r.X + 2, r.Y + 2, r.Width - 4, r.Height - 4);
          g.MeasureString(Caption, length(Caption), f, fillr, sf, sri);

          if CaptionLocation <> cpCustom then
            GetObjectLocation(x, y, fillr, sri.Width, sri.Height, CaptionLocation)
          else
          begin
            x := CaptionLeft;
            y := CaptionTop;
          end;

          g.DrawString(Caption, Length(Caption), f, Makerect(x, y, sri.Width, sri.Height), sf, b);
        end;

        //Draw handles
        opc := FSizeHandleOpacity;
        if opc <> 0 then
        begin
          s := FHandleSize;
          rl := MakeRect(r.X - (s / 2), r.Y + (r.Height - s) / 2, s, s);
          rr := MakeRect(r.X + r.Width - (s / 2), r.Y + (r.Height - s) / 2, s, s);
          bs := TGPSolidBrush.Create(MakeColor(opc, FHandleColor));
          g.FillEllipse(bs, rl);
          g.FillEllipse(bs, rr);
          bs.Free;
          bl := TGPLinearGradientBrush.Create(Makerect(rl.X - 1, rl.Y - 1, rl.Width + 2, rl.Height + 2),
            Makecolor(Min(150,opc), clWhite), Makecolor(Min(10,opc), clWhite), LinearGradientModeVertical);

          g.FillEllipse(bl, rl);
          g.FillEllipse(bl, rr);
          p := TGPPen.Create(MakeColor(opc, clBlack));
          g.DrawEllipse(p, rl);
          g.DrawEllipse(p, rr);
          p.Free;
        end;
      end;
    end;
  end;

  b.Free;
  f.Free;
  sf.Free;
  ff.Free;
end;

procedure TAdvSmoothTimeLine.DrawTimeLine(ACanvas: TCanvas);
var
  g: TGPGraphics;
begin
  g := TGPGraphics.Create(ACanvas.Handle);
  g.SetSmoothingMode(SmoothingModeAntiAlias);
  g.SetTextRenderingHint(TextRenderingHintClearTypeGridFit);
  DrawBackground(g);
  DrawTimeBar(g);
  DrawTimeLineTickMarks(g);
  DrawTimeLineValues(g);
  DrawTimeBarSections(g);
  DrawTimeBarIndicators(g);
  g.Free;
end;

procedure TAdvSmoothTimeLine.DrawTimeLineTickMarks(g: TGPGraphics);
var
  x, w, y: double;
  pdiv, psubdiv: TGPPen;
  I, J, K: Integer;
  wdiv: Double;
  wsubdiv: Double;
  timeliner: TGPRectF;
  d, ddiv: TDateTime;
  AllowDraw: Boolean;
  dv, dvsub: Integer;
begin
  timeliner := gettimelinerect;
  w := timeliner.Width;
  if (Range.Divisions = 0) or not (w > 10) or not (Range.RangeTo - Range.RangeFrom > 0) then
    Exit;

  y := GetTimeLineRect.Y + 2;

  pdiv := TGPPen.Create(MakeColor(255, RangeAppearance.DivisionTickMarkColor), RangeAppearance.DivisionTickMarkWidth);
  psubdiv := TGPPen.Create(MakeColor(255, RangeAppearance.SubDivisionTickMarkColor), RangeAppearance.SubDivisionTickMarkWidth);

  if (Range.DivisionType = dtFixedNumber) then
  begin
    if Range.Divisions > 0 then
    begin
      wdiv := w / Range.Divisions;
      wsubdiv := 0;
      if Range.SubDivisions > 0 then
        wsubdiv := wdiv / Range.SubDivisions;

      x := timeliner.X;

      for I := 0 to Range.Divisions do
      begin
        g.DrawLine(pdiv, x, y, x, y + RangeAppearance.DivisionTickMarkSize);
        if (I < Range.Divisions) and (Range.SubDivisions > 0) then
        begin
          for J := 1 to Range.SubDivisions - 1 do
          begin
            g.DrawLine(psubdiv, x + (wsubdiv * J), y, x + (wsubdiv * J), y + RangeAppearance.SubDivisionTickMarkSize);
          end;
        end;
        x := x + wdiv;
      end;
    end;
  end
  else
  begin
    dv := GetDivisions;
    dvsub := GetSubDivisions;
    if (dv > 0) then
    begin
      //first value
      d := GetDeltaDatetime(Range.DivisionType, dv);
      x := DateTimeToX(d);

      //next values
      I := 0;
      while (d <= Range.RangeTo) and (d > 0) do
      begin
        if d >= Range.RangeFrom then
          g.DrawLine(pdiv, x, y, x, y + RangeAppearance.DivisionTickMarkSize);

        Inc(I);
        d := GetDeltaDatetime(Range.DivisionType, dv, I);
        x := DatetimeToX(d);
        if d > Range.RangeTo then
          Break;
      end;
    end;

    if (dvsub > 0) then
    begin
      //first value
      d := GetDeltaDatetime(Range.DivisionType, dvsub);
      x := DateTimeToX(d);

      //next values
      I := 0;
      while (d <= Range.RangeTo) and (d > 0) do
      begin
        AllowDraw := true;
        K := 0;
        ddiv := GetDeltaDateTime(Range.DivisionType, dv);
        while (ddiv <= Range.RangeTo) and (ddiv > 0) do
        begin
          if CompareDateTime(d, ddiv) = 0 then
          begin
            AllowDraw := false;
            Break;
          end;
          Inc(K);
          ddiv := GetDeltaDateTime(Range.DivisionType, dv, K);
          if ddiv > Range.RangeTo then
            Break;
        end;

        if AllowDraw then
        begin
          if d >= Range.RangeFrom then
            g.DrawLine(psubdiv, x, y, x, y + RangeAppearance.SubDivisionTickMarkSize);
        end;

        Inc(I);
        d := GetDeltaDatetime(Range.DivisionType, dvsub, I);
        x := DatetimeToX(d);
        if d > Range.RangeTo then
          Break;
      end;
    end;
  end;

  pdiv.Free;
  psubdiv.Free;
end;



procedure TAdvSmoothTimeLine.DrawTimeLineValues(g: TGPGraphics);
var
  I, ind: Integer;
  ff, ffsub: TGPFontFamily;
  fs: integer;
  sf, sfsub: TGPStringFormat;
  f, fsub: TGPFont;
  b, bsub: TGPSolidBrush;
  indent: integer;
  pt: TGPPointF;
begin
  //Division font
  ff := TGPFontFamily.Create(FRangeAppearance.DivisionFont.Name);
  if (ff.Status in [FontFamilyNotFound, FontStyleNotFound]) then
  begin
    ff.Free;
    ff := TGPFontFamily.Create('Arial');
  end;

  fs := 0;
  if (fsBold in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 1;
  if (fsItalic in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 2;
  if (fsUnderline in FRangeAppearance.DivisionFont.Style) then
    fs := fs + 4;

  sf := TGPStringFormat.Create;
  f := TGPFont.Create(ff, FRangeAppearance.DivisionFont.Size, fs, UnitPoint);
  b := TGPSolidBrush.Create(MakeColor(255, FRangeAppearance.DivisionFont.Color));
  //

  //Sub division font
  ffsub := TGPFontFamily.Create(FRangeAppearance.SubDivisionFont.Name);
  if (ffsub.Status in [FontFamilyNotFound, FontStyleNotFound]) then
  begin
    ffsub.Free;
    ffsub := TGPFontFamily.Create('Arial');
  end;

  fs := 0;
  if (fsBold in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 1;
  if (fsItalic in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 2;
  if (fsUnderline in FRangeAppearance.SubDivisionFont.Style) then
    fs := fs + 4;

  sfsub := TGPStringFormat.Create;
  fsub := TGPFont.Create(ffsub, FRangeAppearance.SubDivisionFont.Size, fs, UnitPoint);
  bsub := TGPSolidBrush.Create(MakeColor(255, FRangeAppearance.SubDivisionFont.Color));

  ind := 0;
  indent := GetTotalIndent;
  for I := 0 to Length(FTimeLineValues) - 1 do
  begin
    with FTimeLineValues[I] do
    begin
      pt := postext;
      pt.Y := pt.Y + (RangeAppearance.IndentSpacing * ind);
      case tp of
        vtDivision:
        begin
          if Assigned(FOnDivisionText) then
            FOnDivisionText(Self, d, str);
          g.DrawString(str, Length(str), f, pt, sf, b);
        end;
        vtSubDivision:
        begin
          if Assigned(FOnSubDivisionText) then
            FOnSubDivisionText(Self, d, str);
          g.DrawString(str, Length(str), fsub, pt, sfsub, bsub);
        end;
      end;
      if ind < indent then
        Inc(ind)
      else
        ind := 0;
    end;
  end;

  ff.Free;
  ffsub.Free;
  f.Free;
  fsub.Free;
  sf.Free;
  sfsub.Free;
  b.Free;
  bsub.Free;
end;

procedure TAdvSmoothTimeLine.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
  begin
    FReBuildLists := true;
    BuildTimeLineValues;
    BuildAnnotations;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.FillChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineRange.FixDivisions(dv: integer);
var
  r: Double;
  rt: TGPRectF;
begin
  if (DivisionType <> dtFixedNumber) then
  begin
    if dv > 0 then
    begin
      rt := FOwner.GetTimeLineBarRect;
      r := FOwner.GetRange;
      while ((r / (dv * FOwner.GetDivisionValue(DivisionType))) > rt.Width) do
      begin
        Inc(FDivisionType);
        if FDivisionType = dtFixedNumber then
          Inc(FDivisionType)
      end;
    end;
  end;
end;

function TAdvSmoothTimeLine.GetXPosition(Value: TDateTime): Double;
var
  r: TGPRectF;
  w: Double;
  rf: TDateTime;
begin
  rf := Range.RangeFrom;
  r := GetTimeLineBarRect;
  w := r.Width;
  if GetRange > 0 then
    Result := r.X + (w / GetRange) * (Value - rf)
  else
    Result := 0;
end;

function TAdvSmoothTimeLine.GetAnimatedMargin(
  DivisionType: TAdvSmoothTimeLineDivisionType): Double;
begin
  Result := 0;
  case DivisionType of
    dtMilliSecond: Result := 1 / 24 / 60 / 60 / 1000;
    dtSecond: Result := 1 / 24 / 60 / 60;
    dtMinute: Result := 1 / 24 / 60;
    dtHour: Result := 1 / 24;
    dtDay: Result := 1;
    dtMonth: Result := 1;
    dtYear: Result := 1;
  end;
end;

function TAdvSmoothTimeLine.GetDeltaDateTime(DivisionType: TAdvsmoothTimelineDivisionType; Divisions: integer; DivisionCount: integer = 0): TDateTime;
var
  y, m, d, h, n, s, z: Word;
  rf: integer;
begin
  Result := Range.RangeFrom;
  rf := Trunc(Range.RangeFrom);
  DecodeDateTime(range.RangeFrom, y, m, d, h, n, s, z);
  case DivisionType of
    dtMilliSecond:
    begin
      z := Abs((z - ((z mod Divisions) + Divisions))) mod 1000;
      z := Max(0, Min(z, 1000));
      Result := EncodeDateTime(y, m, d, h, n, s, z);
    end;
    dtSecond:
    begin
      s := Abs((s - ((s mod Divisions) + Divisions))) mod 60;
      s := Max(0, Min(s, 59));
      Result := EncodeDateTime(y, m, d, h, n, s, 0);
    end;
    dtMinute:
    begin
      n := Abs((n - ((n mod Divisions) + Divisions))) mod 60;
      n := Max(0, Min(s, 59));
      Result := EncodeDateTime(y, m, d, h, n, 0, 0);
    end;
    dtHour:
    begin
      h := Abs((h - ((h mod Divisions) + Divisions))) mod 24;
      h := Max(0, Min(h, 23));
      Result := EncodeDateTime(y, m, d, h, 0, 0, 0);
    end;
    dtDay: Result := Range.RangeFrom - (rf mod Divisions) + Divisions;
    dtMonth:
    begin
      m := 1 + Abs((m - ((m mod Divisions) + Divisions))) mod 12;
      Result := EncodeDate(y, m, 1)
    end;
    dtYear:
    begin
      y := Abs(y - ((y mod Divisions) + Divisions));
      Result := EncodeDate(y, 1, 1)
    end;
  end;
  if DivisionCount > 0 then
  begin
    case DivisionType of
      dtMilliSecond: Result := IncMilliSecond(result, Divisions * DivisionCount);
      dtSecond: Result := IncSecond(result, Divisions * DivisionCount);
      dtMinute: Result := IncMinute(result, Divisions * DivisionCount);
      dtHour: Result := IncHour(result, Divisions * DivisionCount);
      dtDay: Result := IncDay(result, Divisions * DivisionCount);
      dtMonth: Result := IncMonth(result, Divisions * DivisionCount);
      dtYear: Result := IncYear(result, Divisions * DivisionCount);
    end;
  end;
end;

function TAdvSmoothTimeLine.GetDivisions: integer;
//var
//  dvval, r: Double;
//  timeliner: TGPRectF;
begin
  result := Range.Divisions;
//  timeliner := GetTimeLineBarRect;
//  result := Range.Divisions;
//  dvval := GetDivisionValue(Range.DivisionType);
//  r := Getrange;
//  if r / (dvval * result) > timeliner.Width then
//    result := Round(r / (dvval * timeliner.Width)) * 5;
end;

function TAdvSmoothTimeLine.GetDivisionValue(
  DivisionType: TAdvsmoothTimelineDivisionType): Double;
begin
  Result := 0;
  case DivisionType of
    dtMilliSecond: Result := 1 / 24 / 60 / 60 / 1000;
    dtSecond: Result := 1 / 24 / 60 / 60;
    dtMinute: Result := 1 / 24 / 60;
    dtHour: Result := 1 / 24;
    dtDay: Result := 1;
    dtMonth: Result := 30;
    dtYear: Result := 365;
  end;
end;

function TAdvSmoothTimeLine.GetRange: Double;
begin
  Result := FRange.RangeTo - FRange.RangeFrom;
end;

function TAdvSmoothTimeLine.GetSubDivisions: integer;
//var
//  dvval, r: Double;
//  timeliner: TGPRectF;
begin
//  timeliner := GetTimeLineBarRect;
//  result := Range.SubDivisions;
//  dvval := GetDivisionValue(Range.DivisionType);
//  r := Getrange;
//  if r / (dvval * result) > timeliner.Width then
//    result := Round(r / (dvval * timeliner.Width)) * 5;
  result := Range.SubDivisions;
end;

function TAdvSmoothTimeLine.GetThemeID: String;
begin
  Result := ClassName;
end;

function TAdvSmoothTimeLine.GetTimeLineBarRect: TGPRectF;
var
  r: TRect;
begin
  r := InsideRect;
  Result := MakeRect(r.Left + HorizontalMargin, r.Top + VerticalMargin, r.Right - r.Left - (HorizontalMargin * 2), TimeLineBar.Height);
end;

function TAdvSmoothTimeLine.GetTimeLineRect: TGPRectF;
var
  r: TRect;
begin
  r := InsideRect;
  Result := MakeRect(r.Left + HorizontalMargin, r.Top + VerticalMargin + TimeLineBar.Height, r.Right - r.Left - (HorizontalMargin * 2), r.Bottom - r.Top - TimeLineBar.Height - (VerticalMargin * 2));
end;

function TAdvSmoothTimeLine.GetTotalCountIndicatorsAtXY(X, Y: Integer): Integer;
var
  i: integer;
begin
  Result := 0;
  for I := 0 to TimeLineIndicators.Count - 1 do
  begin
    if PtInGPRect(TimeLineIndicators[I].GetIndicatorRect, Point(X, Y)) and not TimeLineIndicators[i].Fixed then
    begin
      Inc(Result);
    end;
  end;
end;

function TAdvSmoothTimeLine.GetTotalIndent: integer;
begin
  result := FTotalIndent;
end;

function TAdvSmoothTimeLine.GetValuePosition(X: Double): TDateTime;
var
  r: TGPRectF;
  w: Double;
begin
  r := GetTimeLineBarRect;
  w := r.Width;
  Result := Range.RangeFrom;
  if GetRange > 0 then
  begin
    if w / GetRange > 0 then
    begin
      result := (X - r.X) / (w / Getrange) + Range.RangeFrom;
      result := Min(Max(Range.RangeFrom, Result), Range.RangeTo);
    end
  end
end;

function TAdvSmoothTimeLine.IndicatorAtXY(X, Y: integer; var OnAnnotation: Boolean; StartIndex: integer = 0): integer;
var
  I: Integer;
begin
  Result := -1;
  OnAnnotation := false;
  for I := StartIndex to TimeLineIndicators.Count - 1 do
  begin
    if PtInGPRect(TimeLineIndicators[I].GetIndicatorRect, Point(X, Y)) then
    begin
      result := I;
      break;
    end;
  end;

  if Result = -1 then
  begin
    for I := 0 to FAnnotationListTop.Count - 1 do
    begin
      if PtInGPRect(FAnnotationListTop[I].AnnotationRect, Point(X, Y)) then
      begin
        if Assigned(FAnnotationlisttop[I].Indicator) then
          Result := FAnnotationlisttop[I].Indicator.Index;

        OnAnnotation := true;
        break;
      end;
    end;
  end;

  if Result = -1 then
  begin
    for I := 0 to FAnnotationListBottom.Count - 1 do
    begin
      if PtInGPRect(FAnnotationListBottom[I].AnnotationRect, Point(X, Y)) then
      begin
        if Assigned(FAnnotationListBottom[I].Indicator) then
          Result := FAnnotationListBottom[I].Indicator.Index;

        OnAnnotation := true;
        break;
      end;
    end;
  end;
end;

function TAdvSmoothTimeLine.InsideRect: TRect;
var
  bw: integer;
begin
  Result := Bounds(0, 0, Width, Height);
  // adapt width & height for GDI+ drawing rect
  Result.Right := Result.Right - 1;
  Result.Bottom := Result.Bottom - 1;

  if (Fill.BorderColor <> clNone) then
  begin
    if Fill.BorderWidth = 1 then
      bw := 1
    else
      bw := (Fill.BorderWidth + 1) div 2;

    InflateRect(Result, -bw, -bw);
  end;

  if (Fill.ShadowOffset <> 0) and (Fill.ShadowColor <> clNone) then
  begin
    Result.Right := Result.Right -Fill.ShadowOffset;
    Result.Bottom := Result.Bottom -Fill.ShadowOffset;
  end;

  Result.Left := Result.Left + 2;
  Result.Right := Result.Right - 2;
  Result.Top := Result.Top + 2;
  Result.Bottom := Result.Bottom - 2;
end;

function TAdvSmoothTimeLine.IsPartialZoomingAllowed(Dif: Double): Boolean ;
begin
  Result := true;
  if not Range.AllowPartialZooming then
  begin
    if Range.RangeFrom = Range.MinimumRange then
      result := Range.RangeFrom - dif > Range.MinimumRange;           

    if Range.RangeTo = Range.MaximumRange then
      result := Range.RangeTo - dif < Range.MaximumRange;
  end;
end;

function TAdvSmoothTimeLine.IsPartialZoomingAllowedAnimated(
  Dif: Double): Boolean;
begin
  Result := true;
  if not Range.AllowPartialZooming then
  begin
    if Range.FRangeFromAnim = Range.MinimumRange then
      result := Range.FRangeFromAnim - dif > Range.MinimumRange;           

    if Range.FRangeToAnim = Range.MaximumRange then
      result := Range.FRangeToAnim - dif < Range.MaximumRange;
  end;
end;

procedure TAdvSmoothTimeLine.Loaded;
begin
  inherited;
  FReBuildLists := true;
  BuildTimeLineValues;
  BuildAnnotations;
end;

procedure TAdvSmoothTimeLine.LoadFromTheme(FileName: String);
begin

end;

procedure TAdvSmoothTimeLine.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  ssize, s, i, ss, se: integer;
  startx, endx: Double;
  a: Boolean;
begin
  inherited;

  if ReadOnly then
    Exit;

  if TabStop then
    SetFocus;

  Range.ResetScrollStatus;
  FAllowAnimation := not (ssCtrl in Shift);
  FMbRight := (Button = mbRight);
  FCx := X;
  FCy := Y;
  FMx := X;
  FMy := Y;
  ss := SectionSizeStartAtXY(X, Y);
  se := SectionSizeEndAtXY(X, Y);
  ssize := SectionAnimateHandles(X, Y);
  FStartTime := GetTickCount;
  if ((ss <> -1) or (se <> -1)) and (ssize <> -1) then
  begin
    FMouseDownOnStartSection := ss <> -1;
    FMouseDownOnEndSection := se <> -1;
    FSelectedSection := ssize;
    startx := DateTimeToX(TimeLineSections[FSelectedSection].StartTime);
    FSecStartX := startx;
    endx := DateTimeToX(TimeLineSections[FSelectedSection].EndTime);
    FSecEndX := endx;
  end
  else
  begin
    s := SectionMoveAtXY(X, Y);
    if s <> -1 then
    begin
      FMouseDownOnSection := true;
      FSelectedSection := s;
    end;

    i := IndicatorAtXY(X, Y, a);
    if (i <> -1) then
    begin
      FMouseDownOnIndicator := true;
      FSelectedIndicator := i;
      if TimeLineIndicators[i].Fixed and not a then
      begin
        if GetTotalCountIndicatorsAtXY(X, Y) > 0 then
        begin
          //get next moveable indicator
          Inc(i);
          while (i <> -1) and not a and (i >= 0) and (i <= TimeLineIndicators.Count - 1) and (TimeLineindicators[i].fixed) do
          begin
            Inc(i);
          end;
          FSelectedIndicator := i;
        end
      end;
    end;


    if FMouseDownOnSection and FMouseDownOnIndicator then
    begin
      //Indicator on same position as Section
      FMouseDownOnSection := false;
    end;

    if (not FMouseDownOnIndicator) and (not FMouseDownOnSection) then
      FMouseDownOnTimeLine := PtInGPRect(MakeRect(0, 0, width, Height), Point(X, Y));


    if FMouseDownOnSection then
    begin
      if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count -1) then
        DoSectionDown(Self, TimeLineSections[FSelectedSection]);
    end;

    if FMouseDownOnIndicator then
    begin
      if (FSelectedIndicator >= 0) and (FSelectedIndicator <= TimeLineIndicators.Count -1) then
        DoIndicatorDown(Self, TimeLineIndicators[FSelectedIndicator]);
    end;

  end;
end;

procedure TAdvSmoothTimeLine.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  sc, id: integer;
  pt: TPoint;
  r: TGPRectF;
  xs: Double;
  v, vstart, vend: TDateTime;
  startx, stopx: double;
  s: integer;
  I: Integer;
  MovedPixels: integer;
  dif: Double;
  a: Boolean;
begin
  inherited;

  if not ReadOnly then
  begin
    if (SectionSizeStartAtXY(X, Y) <> -1) or (SectionsizeEndAtXY(X, Y) <> -1) then
      Cursor := crSizeWE
    else
      Cursor := crDefault;
  end;

  if FMouseDownOnStartSection and not ReadOnly then
  begin
    if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
    begin
      startx := DateTimeToX(TimeLineSections[FSelectedSection].StartTime);
      FSecStartX := startx + X - FCx;
      vstart := XToDateTime(FSecStartX);
      if Assigned(FOnSectionPositionChanging) then
        FOnSectionPositionChanging(Self, TimeLineSections[FSelectedSection], vstart, TimeLineSections[FSelectedSection].EndTime);
      Changed;
    end;
  end
  else if FMouseDownOnEndSection and not ReadOnly then
  begin
    if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
    begin
      stopx := DateTimeToX(TimeLineSections[FSelectedSection].EndTime);
      FSecEndX := stopx + X - FCx;
      vend := XToDateTime(FSecEndX);
      if Assigned(FOnSectionPositionChanging) then
        FOnSectionPositionChanging(Self, TimeLineSections[FSelectedSection], TimeLineSections[FSelectedSection].StartTime, vend);
      Changed;
    end;
  end
  else
  begin
    if not ReadOnly then
    begin
      s := SectionAnimateHandles(x, y);
      if (s <> -1) then
      begin
        with TimeLineSections[s] do
        begin
          FSizeHandleOpacityTo := 255;
          FSizeHandleAnimation := true;
          FSizeHandleAnimationStarted := true;
        end;
      end
      else
      begin
        for I := 0 to TimeLineSections.Count - 1 do
        begin
          with TimeLineSections[I] do
          begin
            if FSizeHandleAnimationStarted then
            begin
              FSizeHandleOpacityTo := 0;
              FSizeHandleAnimationStarted := false;
              FSizeHandleAnimation := true;
            end;
          end;
        end;
      end;
    end;

    id := IndicatorAtXY(X, Y, a);
    if (id = -1) or (id <> FHoveredIndicator) then
    begin
      FHoveredIndicator := id;
      Application.CancelHint;
    end;

    if FMbRight then
      Exit;

    if FMouseMovedOnIndicator and FMouseDownOnIndicator and not ReadOnly then
    begin
      if(FSelectedIndicator >= 0) and (FSelectedIndicator <= TimeLineIndicators.Count - 1) then
      begin
        if not TimeLineIndicators[FSelectedIndicator].Fixed then
        begin
          FPx := X;
          FPy := Y;
          r := TimeLineIndicators[FSelectedIndicator].GetIndicatorRect;
          xs := r.X + r.Width / 2;
          v := XToDateTime(xs);
          if (Range.AllowScrolling and Range.AutomaticScrolling) and ((FPX > xs) or (FPX < xs)) then
          begin
            if GetTimeLineBarRect.Width > 0 then
            begin
              FScrollTimeLine := true;
              FScrollDif := (Range.RangeTo - Range.RangeFrom) / GetTimeLineBarRect.Width;
              FScrollDif := FScrollDif * (X - xs);
            end;
          end
          else
          begin
            FScrollTimeLine := false;
            FScrollDif := 0;
            FReBuildLists := true;
            BuildTimeLineValues;
            BuildAnnotations;
          end;
          if Assigned(FOnIndicatorPositionChanging) then
            FOnIndicatorPositionChanging(Self, TimeLineIndicators[FSelectedIndicator], v);
        end;
      end;
      Changed;
    end
    else if FMouseDownOnSection and FMouseMovedOnSection and not ReadOnly then
    begin
      if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
      begin
        startx := DateTimeToX(TimeLineSections[FSelectedSection].StartTime);
        stopx := DateTimeToX(TimeLineSections[FSelectedSection].EndTime);
        FSecStartX := startx + X - FCx;
        FSecEndX := stopx + X - FCx;
        vstart := XToDateTime(FSecStartX);
        vend := XToDateTime(FSecEndX);
        if Assigned(FOnSectionPositionChanging) then
          FOnSectionPositionChanging(Self, TimeLineSections[FSelectedSection], vstart, vend);
        Changed;
      end;
    end
    else if FMouseDownOnTimeLine and FMouseMovedOnTimeLine and not ReadOnly then
    begin
      if GetTimeLineBarRect.Width > 0 then
      begin
        MovedPixels := (X - FMx);
        FMx := X;
        dif := (Range.RangeTo - Range.RangeFrom) / GetTimeLineBarRect.Width;
        dif := dif * MovedPixels;
        if IsPartialZoomingAllowed(dif) then
        begin
          if (ssCtrl in Shift) and Range.AllowZooming then
          begin
            BeginUpdate;
            if Assigned(OnScrollTimeLine) then
              OnScrollTimeLine(Self, Range.RangeFrom, Range.RangeTo, Range.RangeFrom - dif, Range.RangeTo + dif);
            Range.RangeFrom := Range.RangeFrom - dif;
            Range.RangeTo := Range.RangeTo + dif;
            EndUpdate;
          end
          else if Range.AllowScrolling then
          begin
            BeginUpdate;
            if Assigned(OnScrollTimeLine) then
              OnScrollTimeLine(Self, Range.RangeFrom, Range.RangeTo, Range.RangeFrom - dif, Range.RangeTo - dif);
            Range.RangeFrom := Range.RangeFrom - dif;
            Range.RangeTo := Range.RangeTo - dif;
            EndUpdate;
          end;
        end;
      end;
    end
    else
    begin
      if FMouseDownOnIndicator or FMouseDownOnSection or FMouseDownOnTimeLine then
      begin
        if not ((X < FCx + 2) and (X > FCx - 2) and (Y < FCy + 2) and (Y > FCY - 2)) and not ReadOnly  then
        begin
          if FMouseDownOnTimeLine then
            FMouseMovedOnTimeLine := true;

          if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) and FMouseDownOnSection then
            FMouseMovedOnSection := not TimeLineSections[FSelectedSection].FixedPosition;

          if (FSelectedIndicator >= 0) and (FSelectedIndicator <= TimeLineIndicators.Count - 1) and FMouseDownOnIndicator then
            FMouseMovedOnIndicator := not TimeLineIndicators[FSelectedIndicator].Fixed;
        end;
      end
      else
      begin
        sc := SectionAtXY(X, Y);
        if not ((sc = -1) and (FHoveredSection = -1)) then
        begin
          FHoveredSection := sc;
          if not FhintSizeCalculated then
          begin
            CalculateHintSize(FH);
            FhintSizeCalculated := true;
          end;
          pt := Point(X, Y);
          fh.Left := ClientToScreen(pt).X;
          fh.Top := ClientToScreen(pt).Y + 20;
          if not fh.Visible then
          begin
            fh.Show;
            fh.Init;
          end;
        end
        else
        begin
          if fh.Visible then
          begin
            FhintSizeCalculated := false;
            fh.Hide;
          end;
        end;
      end;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  v, vstart, vend: TDateTime;
  indr, r: TGPRectF;
  xs: Double;
  ptpopup: TPoint;
  MovedPixels: integer;
  dif: Double;
begin
  inherited;

  if FMouseDownOnIndicator then
  begin
    if FMouseMovedOnIndicator then
    begin
      if(FSelectedIndicator >= 0) and (FSelectedIndicator <= TimeLineIndicators.Count - 1) then
      begin
        if not TimeLineIndicators[FSelectedIndicator].Fixed then
        begin
          r := TimeLineIndicators[FSelectedIndicator].GetIndicatorRect;
          xs := r.X + r.Width / 2;
          v := XToDateTime(Round(xs));
          FMouseMovedOnIndicator := false;
          TimeLineIndicators[FSelectedIndicator].Position := v;
          FReBuildLists := true;
          BuildTimeLineValues;
          BuildAnnotations;
          DoIndicatorPositionChanged(Self, TimeLineIndicators[FSelectedIndicator], TimeLineIndicators[FSelectedIndicator].Position);
        end;
      end;
    end
    else
    begin
      if (FSelectedIndicator >= 0) and (FSelectedIndicator <= TimeLineIndicators.Count - 1) then
      begin
        if FMbRight then
        begin
          with TimeLineIndicators[FSelectedIndicator] do
          begin
            if Assigned(PopupMenu) then
            begin
              indr := GetIndicatorRect;
              ptpopup := ClientToScreen(Point(Round(indr.X + indr.Width / 2), Round(indr.Y)));
              PopupMenu.Popup(ptpopup.X, ptpopup.Y);
            end;
          end
        end
        else
        begin
          if Assigned(FOnIndicatorClick) and not FMouseMovedOnTimeLine then
            FOnIndicatorClick(Self, TimeLineIndicators[FSelectedIndicator]);
        end;
      end;
    end
  end
  else if FMouseDownOnStartSection then
  begin
    if(FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
    begin
      vstart := XToDateTime(FSecStartX);
      TimeLineSections[FSelectedSection].StartTime := vstart;
      DoSectionPositionChanged(Self, TimeLineSections[FSelectedSection], TimeLineSections[FSelectedSection].StartTime, TimeLineSections[FSelectedSection].EndTime);
    end;
  end
  else if FMouseDownOnEndSection then
  begin
    if(FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
    begin
      vend := XToDateTime(FSecEndX);
      TimeLineSections[FSelectedSection].EndTime := vend;
      DoSectionPositionChanged(Self, TimeLineSections[FSelectedSection], TimeLineSections[FSelectedSection].StartTime, TimeLineSections[FSelectedSection].EndTime);
    end;
  end
  else if FMouseDownOnSection then
  begin
    if FMouseMovedOnSection then
    begin
      if(FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) then
      begin
        vstart := XToDateTime(FSecStartX);
        vend := XToDateTime(FSecEndX);
        TimeLineSections[FSelectedSection].StartTime := vstart;
        TimeLineSections[FSelectedSection].EndTime := vend;
        FMouseMovedOnSection := false;
        DoSectionPositionChanged(Self, TimeLineSections[FSelectedSection], TimeLineSections[FSelectedSection].StartTime, TimeLineSections[FSelectedSection].EndTime);
      end;
    end
    else
    begin
      if (FSelectedSection >= 0) and (FSelectedSection <= TimeLineSections.Count - 1) and not FMouseMovedOnTimeLine then
      begin
        if Assigned(FOnSectionClick) then
          FOnSectionClick(Self, TimeLineSections[FSelectedSection]);
      end;
    end;
  end
  else if FMouseDownOnTimeLine and FAllowAnimation then
  begin
    if FMouseMovedOnTimeLine then
    begin
      FStopTime := GetTickCount;
      MovedPixels := (X - FCx);
      FSp := 0;
      if (FStopTime - FStartTime < 200) and (FStopTime - FStartTime > 0) then
        FSp := Abs(MovedPixels) / (FStopTime - FStartTime);

      if FSp > 1 then
      begin
        if GetTimeLineBarRect.Width > 0 then
        begin
          dif := (Range.RangeTo - Range.RangeFrom) / GetTimeLineBarRect.Width;
          dif := dif * MovedPixels;
          if IsPartialZoomingAllowed(dif * 10) then
          begin
            Range.FRangeFromAnim := Max(Min(Range.RangeFrom - (dif * 10), Range.MaximumRange), Range.MinimumRange);
            Range.FRangeToAnim := Max(Min(Range.RangeTo - (dif * 10), Range.MaximumRange), Range.MinimumRange);
            if not ((Range.FRangeToAnim = Range.MaximumRange) or (Range.FRangeFromAnim = Range.MinimumRange)) then
            begin
              Range.FRangeFromAnim := Range.FRangeFromAnim - GetDivisionValue(dtMilliSecond);
              Range.FRangeToAnim := Range.FRangeToAnim + GetDivisionValue(dtMilliSecond);
              Range.FAnimateRangeFrom := true;
              Range.FAnimateRangeTo := true;
            end;
          end;
        end;
      end;
    end;
  end;

  FMouseDownOnIndicator := false;
  FMouseDownOnSection := false;
  FMouseDownOnStartSection := false;
  FMouseDownOnEndSection := false;
  FMouseDownOnTimeLine := false;
  FMouseMovedOnTimeLine := false;
  FSelectedIndicator := -1;
  FSelectedSection := -1;
  FScrollTimeLine := false;
  FScrollDif := 0;
  Changed;
end;

procedure TAdvSmoothTimeLine.MouseWheelHandler(var Message: TMessage);
var
  d: Double;
begin
  inherited;
  if ReadOnly then
    Exit;

  if TabStop and Focused and Range.AllowScrolling then
  begin
    case Message.Msg of
      WM_MOUSEWHEEL:
      begin
        if GetTimeLineBarRect.Width > 0 then
        begin
          d := ((Range.RangeTo - Range.RangeFrom) / GetTimeLineBarRect.Width) * range.ScrollStep;
          if IsPartialZoomingAllowed(d) then
          begin
            if Message.WParam < 0 then
            begin
              if Assigned(OnScrollTimeLine) then
                OnScrollTimeLine(Self, Range.RangeFrom, Range.RangeTo, Range.RangeFrom + d, Range.RangeTo + d);
              Range.RangeFrom := Range.RangeFrom + d;
              Range.RangeTo := Range.RangeTo + d;
            end
            else
            begin
              if Assigned(OnScrollTimeLine) then
                OnScrollTimeLine(Self, Range.RangeFrom, Range.RangeTo, Range.RangeFrom - d, Range.RangeTo - d);
              Range.RangeFrom := Range.RangeFrom - d;
              Range.RangeTo := Range.RangeTo - d;
            end;
            FReBuildLists := true;
            BuildTimeLineValues;
            BuildAnnotations;
          end;
        end;
      end;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.Notification(AComponent: TComponent;
  AOperation: TOperation);
var
  I: Integer;
begin
  inherited;

  if (csDestroying in ComponentState) then
    Exit;

  if (AOperation = opRemove) then
  begin
    for I := 0 to TimeLineIndicators.Count - 1 do
    begin
      with TimeLineIndicators[i] do
      begin
        if (AComponent = FPopupMenu) then
          FPopupMenu := nil;
      end;
    end;

    if (AComponent = FImageList) then
      FImageList := nil;
  end;
end;

procedure TAdvSmoothTimeLine.Paint;
begin
  DrawTimeLine(Canvas);
  if Assigned(OnDrawTimeLine) then
    OnDrawTimeLine(Self, Canvas, ClientRect);
end;

function TAdvSmoothTimeLine.PtInGPRect(r: TGPRectF; pt: TPoint): Boolean;
begin
  result := ((pt.X >= r.X) and (pt.X <= r.X + r.Width)) and
     ((pt.Y >= r.Y) and (pt.Y <= r.Y + r.Height));
end;

procedure TAdvSmoothTimeLine.RangeAppearanceChanged(Sender: TObject);
begin
  BuildTimeLineValues;
  Changed;
end;

procedure TAdvSmoothTimeLine.RangeChanged(Sender: TObject);
begin
  BuildTimeLineValues;
  Changed;
end;

procedure TAdvSmoothTimeLine.Resize;
begin
  inherited;
  FReBuildLists := true;
  BuildTimeLineValues;
  BuildAnnotations;
  Changed;
end;

procedure TAdvSmoothTimeLine.SaveToImage(Filename: String; ImageWidth,
  ImageHeight: integer; ImageType: TImageType; ImageQualityPercentage: integer);
var
  img, finalimg: graphics.TBitmap;
  gpimg: TGPImage;
  g: TGPGraphics;
  enc: TEncoderParameters;
begin
  img := nil;
  gpimg := nil;
  g := nil;
  finalimg := nil;
  try
    img := graphics.TBitmap.Create;
    img.Width := Width;
    img.Height := Height;

    DrawTimeLine(img.Canvas);

    finalimg := graphics.TBitmap.Create;
    finalimg.Width := ImageWidth;
    finalimg.Height := ImageHeight;
    finalimg.Canvas.StretchDraw(Bounds(0, 0, ImageWidth, ImageHeight), img);

    gpimg := TGPImage.Create(CreateStream(finalimg));

    enc := GetEncoderQualityParameters(ImageQualityPercentage);

    gpimg.Save(filename, GetCLSID(ImageType), @enc);

  finally
    gpimg.Free;
    finalimg.Free;
    g.Free;
    img.Free;
  end;
end;

procedure TAdvSmoothTimeLine.SaveToTheme(FileName: String);
begin

end;

function TAdvSmoothTimeLine.SectionAnimateHandles(X, Y: integer): integer;
var
  I: Integer;
  r: TGPRectF;
begin
  Result := -1;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    if not TimeLineSections[I].FixedSize then
    begin
      r := TimeLineSections[I].GetSectionRect;
      if PtInGPRect(MakeRect(r.X - 5, r.Y, r.Width + 10, r.Height), Point(X, Y)) then
      begin
        result := I;
        break;
      end;
    end;
  end;
end;

function TAdvSmoothTimeLine.SectionAtXY(X, Y: integer): integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    if PtInGPRect(TimeLineSections[I].GetSectionRect, Point(X, Y)) and ((TimeLineSections[I].Hint <> '') or not TimeLineSections[I].HintFill.Picture.Empty) then
    begin
      result := I;
      break;
    end;
  end;
end;

function TAdvSmoothTimeLine.SectionMoveAtXY(X, Y: integer): integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    if PtInGPRect(TimeLineSections[I].GetSectionRect, Point(X, Y)) then
    begin
      result := I;
      break;
    end;
  end;
end;

function TAdvSmoothTimeLine.SectionSizeEndAtXY(X, Y: integer): integer;
var
  I: Integer;
  r: TGPRectF;
begin
  Result := -1;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    if not TimeLineSections[I].FixedSize then
    begin
      r := TimeLineSections[I].GetSectionRect;
      r.X := r.X + r.Width - 3;
      r.Width := 6;
      if PtInGPRect(r, Point(X, Y)) then
      begin
        result := I;
        break;
      end;
    end;
  end;
end;

function TAdvSmoothTimeLine.SectionSizeStartAtXY(X, Y: integer): integer;
var
  I: Integer;
  r: TGPRectF;
begin
  Result := -1;
  for I := 0 to TimeLineSections.Count - 1 do
  begin
    if not TimeLineSections[I].FixedSize then
    begin
      r := TimeLineSections[I].GetSectionRect;
      r.X := r.X - 3;
      r.Width := 6;
      if PtInGPRect(r, Point(X, Y)) then
      begin
        result := I;
        break;
      end;
    end;
  end;
end;

procedure TAdvSmoothTimeLine.SetComponentStyle(AStyle: TTMSStyle);
var
  I: Integer;
begin
  RangeAppearance.DivisionFont.Color := clBlack;
  RangeAppearance.subDivisionFont.Color := clBlack;
  RangeAppearance.DivisionTickMarkColor := clBlack;
  RangeAppearance.SubDivisionTickMarkColor := clBlack;

 case AStyle of
    tsOffice2003Blue:
      begin
        Fill.Color := $00FFD2AF;
        Fill.ColorTo := $00FFD2AF;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $D68759;
        TimeLineBar.Fill.ColorTo := $933803;
        TimeLineBar.Fill.Color := clWhite;
        TimeLineBar.Fill.BorderColor := $962D00;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsOffice2003Silver:
      begin
        Fill.Color := $00E6D8D8;
        Fill.ColorTo := $00E6D8D8;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $BDA4A5;
        TimeLineBar.Fill.ColorTo := $957475;
        TimeLineBar.Fill.BorderColor := $947C7C;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;

      end;
    tsOffice2003Olive:
      begin
        Fill.Color := RGB(225, 234, 185);
        Fill.ColorTo := RGB(225, 234, 185);
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $82C0AF;
        TimeLineBar.Fill.ColorTo := $447A63;
        TimeLineBar.Fill.BorderColor := $588060;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsOffice2003Classic:
      begin
        Fill.Color := $00F2F2F2;
        Fill.ColorTo := $00F2F2F2;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $808080;
        TimeLineBar.Fill.ColorTo := $808080;
        TimeLineBar.Fill.BorderColor := $808080;

        DefaultSectionFill.Color := $B59285;
        DefaultSectionFill.ColorTo := $B59285;
        DefaultSectionFill.ColorMirror := clNone;
        DefaultSectionFill.ColorMirrorTo := clNone;
        DefaultSectionFill.BorderColor := $808080;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsOffice2007Luna:
      begin
        Fill.Color := $00F3E5DA;
        Fill.ColorTo := $00F0DED0;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $FFEFE3;
        TimeLineBar.Fill.ColorTo := $FFD2AF;
        TimeLineBar.Fill.BorderColor := $00FFD2AF;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsOffice2007Obsidian:
      begin
        Fill.Color := $5C534C;
        Fill.ColorTo := $5C534C;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $F2F1F0;
        TimeLineBar.Fill.ColorTo := $C9C2BD;
        TimeLineBar.Fill.BorderColor := $5C534C;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;

        RangeAppearance.DivisionFont.Color := clWhite;
        RangeAppearance.subDivisionFont.Color := clWhite;
        RangeAppearance.DivisionTickMarkColor := clWhite;
        RangeAppearance.SubDivisionTickMarkColor := clWhite;
      end;
    tsWindowsXP:
      begin
        Fill.Color := $00B6B6B6;
        Fill.ColorTo := $00B6B6B6;

        TimeLineBar.Fill.Color := clBtnFace;
        TimeLineBar.Fill.ColorTo := clBtnFace;
        TimeLineBar.Fill.BorderColor := clBlack;

        DefaultSectionFill.Color := clInactiveCaption;
        DefaultSectionFill.ColorTo := clInactiveCaption;
        DefaultSectionFill.ColorMirror := clNone;
        DefaultSectionFill.ColorMirrorTo := clNone;
        DefaultSectionFill.BorderColor := clHighLight;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsWhidbey:
      begin
        Fill.Color := $F5F9FA;
        Fill.ColorTo := $F5F9FA;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $EBEEEF;
        TimeLineBar.Fill.ColorTo := $7E9898;
        TimeLineBar.Fill.BorderColor := $962D00;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
    tsCustom: ;
    tsOffice2007Silver:
      begin
        Fill.Color := RGB(241, 244, 248);
        Fill.ColorTo := RGB(227, 232, 240);
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := $F8F7F6;
        TimeLineBar.Fill.ColorTo := $E8E0DB;
        TimeLineBar.Fill.BorderColor := $74706F;

        DefaultSectionFill.Color := $AAD9FF;
        DefaultSectionFill.ColorTo := $6EBBFF;
        DefaultSectionFill.ColorMirror := $42AEFE;
        DefaultSectionFill.ColorMirrorTo := $7AE1FE;
        DefaultSectionFill.BorderColor := $42AEFE;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
      tsWindowsVista:
      begin
        Fill.Color := $FFFDF9;
        Fill.ColorTo := $FFFAF0;
        Fill.BorderColor := $FCF2DA;

        TimeLineBar.Fill.Color := $FEF9F0;
        TimeLineBar.Fill.ColorTo := $FDF0D7;
        TimeLineBar.Fill.BorderColor := $FEDF9A;

        DefaultSectionFill.Color := $FCEBDC;
        DefaultSectionFill.ColorTo := $FCDBC1;
        DefaultSectionFill.ColorMirror := clNone;
        DefaultSectionFill.ColorMirrorTo := clNone;
        DefaultSectionFill.BorderColor := $CEA27D;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
      tsWindows7:
      begin
        Fill.Color := $FCEBDC;
        Fill.ColorTo := $FCDBC1;
        Fill.BorderColor := $CEA27D;

        TimeLineBar.Fill.Color := $FEF9F0;
        TimeLineBar.Fill.ColorTo := $FDF0D7;
        TimeLineBar.Fill.BorderColor := $FEDF9A;

        DefaultSectionFill.Color := $FCEBDC;
        DefaultSectionFill.ColorTo := $FCDBC1;
        DefaultSectionFill.ColorMirror := clNone;
        DefaultSectionFill.ColorMirrorTo := clNone;
        DefaultSectionFill.BorderColor := $CEA27D;
        DefaultSectionFill.GradientMirrorType := gtVertical;
      end;
      tsTerminal:
      begin
        Fill.Color := clBtnFace;
        Fill.ColorTo := clBtnFace;
        Fill.BorderColor := clNone;

        TimeLineBar.Fill.Color := clSilver;
        TimeLineBar.Fill.ColorTo := clSilver;
        TimeLineBar.Fill.BorderColor := clGray;

        DefaultSectionFill.Color := clHighLight;
        DefaultSectionFill.ColorTo := clHighLight;
        DefaultSectionFill.ColorMirror := clNone;
        DefaultSectionFill.ColorMirrorTo := clNone;
        DefaultSectionFill.BorderColor := clGray;

      end;
  end;

  DefaultIndicator.Color := DefaultSectionFill.Color;
  DefaultIndicator.ColorTo := DefaultSectionFill.ColorTo;
  DefaultIndicator.OpacityTo := 150;
  DefaultIndicator.Opacity := 200;
  DefaultIndicator.AnnotationColor := DefaultSectionFill.ColorTo;

  DefaultHintFill.Color := clWhite;
  DefaultHintFill.ColorTo := clWhite;
  DefaultHintFill.Opacity := 225;
  DefaultHintFill.OpacityTo := 175;

  Fill.BorderColor := clSilver;

  DefaultHintFill.BorderColor := clBlack;


  for I := 0 to TimeLineSections.Count - 1 do
  begin
    TimeLineSections[I].HintFill.Assign(DefaultHintFill);
    TimeLineSections[I].Fill.Assign(DefaultSectionFill);
  end;

  for I := 0 to TimeLineIndicators.Count - 1 do
    TimeLineIndicators[I].AssignVisuals(DefaultIndicator);
end;

procedure TAdvSmoothTimeLine.SetDefaultHintFill(const Value: TGDIPFill);
begin
  if FDefaultHintFill <> value then
  begin
    FDefaultHintFill.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetDefaultIndicator(
  const Value: TAdvSmoothTimeLineBarIndicator);
begin
  if FDefaultIndicator <> value then
  begin
    FDefaultIndicator.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetDefaultSectionFill(const Value: TGDIPFill);
begin
  if FDefaultSectionFill <> value then
  begin
    FDefaultSectionFill.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetFill(const Value: TGDIPFill);
begin
  if FFill <> value then
  begin
    FFill.Assign(value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetHorizontalMargin(const Value: integer);
begin
  if FHorizontalMargin <> value then
  begin
    FHorizontalMargin := Value;
    BuildTimeLineValues;
    FReBuildLists := true;
    BuildAnnotations;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetImageList(const Value: TCustomImageList);
begin
  FImageList := Value;
  BuildAnnotations;
  Changed;
end;

procedure TAdvSmoothTimeLine.SetRange(const Value: TAdvSmoothTimeLineRange);
begin
  if FRange <> value then
  begin
    FRange.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetTimeLineRange(ARangeFrom, ARangeTo, AMinimumRange,
  AMaximumRange: TDateTime);
begin
  with FRange do
  begin
    FRangeFrom := ARangeFrom;
    FRangeTo := ARangeTo;
    FMinimumRange := AMinimumRange;
    FMaximumRange := AMaximumRange;
  end;
  Changed;
end;

procedure TAdvSmoothTimeLine.SetTimeLineRange(ARangeFrom, ARangeTo: TDateTime);
begin
  with FRange do
  begin
    FMinimumRange := ARangeFrom;
    FMaximumRange := ARangeTo;
    FRangeFrom := ARangeFrom;
    FRangeTo := ARangeTo;
  end;
  Changed;
end;

procedure TAdvSmoothTimeLine.SetRangeAppearance(
  const Value: TAdvSmoothTimeLineRangeAppearance);
begin
  if FRangeAppearance <> value then
  begin
    FRangeAppearance.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly <> value then
  begin
    FReadOnly := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetTimeLineBar(const Value: TAdvSmoothTimeLineBar);
begin
  if FTimeLineBar <> value then
  begin
    FTimeLineBar.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetTimeLineBarSections(
  const Value: TAdvSmoothTimeLineBarSections);
begin
  if FTimeLineBarSections <> value then
  begin
    FTimeLineBarSections.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetTimeLineIndicators(
  const Value: TAdvSmoothTimeLineBarIndicators);
begin
  if FTimeLineIndicators <> Value then
  begin
    FTimeLineIndicators.Assign(value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.SetVerticalMargin(const Value: integer);
begin
  if FVerticalMargin <> value then
  begin
    FVerticalMargin := Value;
    BuildTimeLineValues;
    FReBuildLists := true;
    BuildAnnotations;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLine.TimeLineBarChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLine.TimeLineBarIndicatorsChanged(Sender: TOBject);
begin
  FReBuildLists := true;
  BuildAnnotations;
  Changed;
end;

procedure TAdvSmoothTimeLine.TimeLineBarSectionsChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLine.WMPaint(var Message: TWMPaint);
var
  DC, MemDC: HDC;
  MemBitmap, OldBitmap: HBITMAP;
  PS: TPaintStruct;
  {$IFNDEF DELPHI_UNICODE}
  dbl: boolean;
  {$ENDIF}
  p: TPoint;
  i: integer;
begin
  if Assigned(Parent) {and (Fill.ShadowOffset > 0) ?} then
  begin
    {$IFNDEF DELPHI_UNICODE}
    dbl := Parent.DoubleBuffered;
    Parent.DoubleBuffered := false;
    {$ENDIF}
    DC := Message.DC;
    i := SaveDC(DC);
    p := ClientOrigin;
    Windows.ScreenToClient(Parent.Handle, p);
    p.x := -p.x;
    p.y := -p.y;
    MoveWindowOrg(DC, p.x, p.y);
    SendMessage(Parent.Handle, WM_ERASEBKGND, DC, 0);
    SendMessage(Parent.Handle, WM_PAINT, DC, 0);
    if (Parent is TWinCtrl) then
      (Parent as TWinCtrl).PaintCtrls(DC, nil);
    RestoreDC(DC, i);
    {$IFNDEF DELPHI_UNICODE}
    Parent.DoubleBuffered := dbl;
    {$ENDIF}
  end;

  if not FDoubleBuffered or (Message.DC <> 0) then
  begin
    if not (csCustomPaint in ControlState) and (ControlCount = 0) then
      inherited
    else
      PaintHandler(Message);
  end
  else
  begin
    DC := GetDC(0);
    MemBitmap := CreateCompatibleBitmap(DC, ClientRect.Right, ClientRect.Bottom);
    ReleaseDC(0, DC);
    MemDC := CreateCompatibleDC(0);
    OldBitmap := SelectObject(MemDC, MemBitmap);
    try
      DC := BeginPaint(Handle, PS);
      Perform(WM_ERASEBKGND, MemDC, MemDC);
      Message.DC := MemDC;
      WMPaint(Message);
      Message.DC := 0;
      BitBlt(DC, 0, 0, ClientRect.Right, ClientRect.Bottom, MemDC, 0, 0, SRCCOPY);
      EndPaint(Handle, PS);
    finally
      SelectObject(MemDC, OldBitmap);
      DeleteDC(MemDC);
      DeleteObject(MemBitmap);
    end;
  end;
end;

function TAdvSmoothTimeLine.XToDateTime(X: Double): TDateTime;
begin
  Result := GetValuePosition(X);
end;

{ TAdvSmoothTimeLineRange }

procedure TAdvSmoothTimeLineRange.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLineRange) then
  begin
    FRangeFrom := (Source as TAdvSmoothTimeLineRange).RangeFrom;
    FRangeTo := (Source as TAdvSmoothTimeLineRange).RangeTo;
    FSubDivisions := (Source as TAdvSmoothTimeLineRange).SubDivisions;
    FDivisions := (Source as TAdvSmoothTimeLineRange).Divisions;
    FMinimumRange := (Source as TAdvSmoothTimeLineRange).MinimumRange;
    FMaximumRange := (Source as TAdvSmoothTimeLineRange).MaximumRange;
    FAllowScrolling := (Source as TAdvSmoothTimeLineRange).AllowScrolling;
    FAllowZooming := (Source as TAdvSmoothTimeLineRange).AllowZooming;
    FDivisionType := (Source as TAdvSmoothTimeLineRange).DivisionType;
    FAutomaticScrolling := (Source as TAdvSmoothTimeLineRange).AutomaticScrolling;
    FAllowPartialZooming := (Source as TAdvSmoothTimeLineRange).AllowPartialZooming;
    FScrollStep := (Source as TAdvSmoothTimeLineRange).ScrollStep;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

constructor TAdvSmoothTimeLineRange.Create(AOwner: TAdvSmoothTimeLine);
var
  y, m, d, h, n, s, mi: Word;
begin
  FOwner := AOwner;
  if (csDesigning in FOwner.ComponentState) then
  begin
    DecodeDateTime(Now, y, m, d, h, n, s, mi);
    FRangeFrom := EncodeDateTime(y, m, d, h, n, s, 0);
    FRangeTo := IncSecond(FRangeFrom, 10);
    FMinimumRange := IncHour(FrangeFrom, -1);
    FMaximumRange := IncHour(FrangeTo, 1);
  end;
  FDivisions := 2;
  FSubDivisions := 5;
  FAllowScrolling := true;
  FAllowZooming := true;
  FDivisionType := dtFixedNumber;
  FAutomaticScrolling := true;
  FAllowPartialZooming := true;
  FScrollStep := 5;
end;

destructor TAdvSmoothTimeLineRange.Destroy;
begin
  inherited;
end;

procedure TAdvSmoothTimeLineRange.ResetScrollStatus;
begin
  FAnimateRangeFrom := false;
  FAnimateRangeTo := false;
  FDoAnimateRange := false;
  FOwner.FMouseDownOnTimeLine := false;
  FOwner.FMouseMovedOnTimeLine := false;
end;

procedure TAdvSmoothTimeLineRange.SetAllowPartialZooming(const Value: Boolean);
begin
  if FAllowPartialZooming <> value then
  begin
    FAllowPartialZooming := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetAllowScrolling(const Value: Boolean);
begin
  if FAllowScrolling <> Value then
  begin
    FAllowScrolling := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetAllowZooming(const Value: Boolean);
begin
  if FAllowZooming <> value then
  begin
    FAllowZooming := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetAutomaticScrolling(const Value: Boolean);
begin
  if FAutomaticScrolling <> value then
  begin
    FAutomaticScrolling := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetDivisions(const Value: integer);
begin
  if (FDivisions <> value) and (Value >= 0) then
  begin
    FDivisions := Value;
    FixDivisions(Divisions);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetDivisionType(
  const Value: TAdvsmoothTimelineDivisionType);
begin
  if FDivisionType <> Value then
  begin
    FDivisionType := Value;
    FixDivisions(Divisions);
    FixDivisions(SubDivisions);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetMaximumRange(const Value: TDateTime);
begin
  if FMaximumRange <> value then
  begin
    FMaximumRange := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetMinimumRange(const Value: TDateTime);
begin
  if FMinimumRange <> value then
  begin
    FMinimumRange := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetRangeFrom(const Value: TDateTime);
var
  fr: TDateTime;
begin
  if (FRangeFrom <> value) then
  begin
    fr := Min(Max(Value, MinimumRange), MaximumRange);
    if not (csLoading in FOwner.ComponentState) then
    begin
      if (fr < IncMilliSecond(FRangeTo, -1)) then
        FRangeFrom := fr
    end
    else
      FRangeFrom := fr;

    FixDivisions(Divisions);
    FixDivisions(SubDivisions);

    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetRangeTo(const Value: TDateTime);
var
  fr: TDateTime;
begin
  if (FRangeTo <> value) then
  begin
    fr := Min(Max(Value, MinimumRange), MaximumRange);
    if FOwner.FLoaded then
    begin
      if (fr > IncMilliSecond(FRangeFrom, 1)) then
        FRangeTo := fr
    end
    else
      FRangeTo := fr;

    FixDivisions(Divisions);
    FixDivisions(SubDivisions);

    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetScrollStep(const Value: integer);
begin
  if FScrollStep <> Value then
  begin
    FScrollStep := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRange.SetSubDivisions(const Value: integer);
begin
  if (FSubDivisions <> value) and (Value >= 0) then
  begin
    FSubDivisions := Value;
    FixDivisions(SubDivisions);
    Changed;
  end;
end;

{ TAdvSmoothTimeLineRangeAppearance }

procedure TAdvSmoothTimeLineRangeAppearance.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLineRangeAppearance) then
  begin
    FDivisionTickMarkColor := (Source as TAdvSmoothTimeLineRangeAppearance).DivisionTickMarkColor;
    FDivisionTickMarkSize := (Source as TAdvSmoothTimeLineRangeAppearance).DivisionTickMarkSize;
    DivisionFont.Assign((Source as TAdvSmoothTimeLineRangeAppearance).DivisionFont);
    FSubDivisionTickMarkColor := (Source as TAdvSmoothTimeLineRangeAppearance).SubDivisionTickMarkColor;
    FSubDivisionTickMarkSize := (Source as TAdvSmoothTimeLineRangeAppearance).SubDivisionTickMarkSize;
    FSubDivisionFont.Assign((Source as TAdvSmoothTimeLineRangeAppearance).SubDivisionFont);
    FDivisionTickMarkWidth := (Source as TAdvSmoothTimeLineRangeAppearance).DivisionTickMarkWidth;
    FSubDivisionTickMarkWidth := (Source as TAdvSmoothTimeLineRangeAppearance).SubDivisionTickMarkWidth;
    FDivisionFormat := (Source as TAdvSmoothTimeLineRangeAppearance).DivisionFormat;
    FSubDivisionFormat := (Source as TAdvSmoothTimeLineRangeAppearance).SubDivisionFormat;
    FIndentSpacing := (Source as TAdvSmoothTimeLineRangeAppearance).IndentSpacing;
    FShowSubDivisionValue := (Source as TAdvSmoothTimeLineRangeAppearance).ShowSubDivisionValue;
    FShowDivisionValue := (Source as TAdvSmoothTimeLineRangeAppearance).ShowDivisionValue;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

constructor TAdvSmoothTimeLineRangeAppearance.Create(
  AOwner: TAdvSmoothTimeLine);
begin
  FOwner := AOwner;
  FDivisionTickMarkColor := clBlack;
  FSubDivisionTickMarkColor := clBlack;
  FDivisionTickMarkSize := 10;
  FSubDivisionTickMarkSize := 8;
  FSubDivisionFont := TFont.Create;
  FSubDivisionFont.OnChange := fontChanged;
  FDivisionFont := TFont.Create;
  {$IFNDEF DELPHI9_LVL}
  FDivisionFont.Name := 'Tahoma';
  FSubDivisionFont.Name := 'Tahoma';
  {$ENDIF}
  FDivisionFont.OnChange := fontChanged;
  FDivisionTickMarkWidth := 2;
  FSubDivisionTickMarkWidth := 1;
  FDivisionFormat := 'hh:nn:ss';
  FSubDivisionFormat := 'hh:nn:ss';
  FIndentSpacing := 20;
  FShowSubDivisionValue := true;
  FShowDivisionValue := true;
end;

destructor TAdvSmoothTimeLineRangeAppearance.Destroy;
begin
  FDivisionFont.Free;
  FSubDivisionFont.Free;
  inherited;
end;

procedure TAdvSmoothTimeLineRangeAppearance.FontChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetDivisionTickMarkColor(
  const Value: TColor);
begin
  if FDivisionTickMarkColor <> value then
  begin
    FDivisionTickMarkColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetDivisionTickMarkSize(
  const Value: integer);
begin
  if FDivisionTickMarkSize <> value then
  begin
    FDivisionTickMarkSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetDivisionTickMarkWidth(
  const Value: integer);
begin
  if FDivisionTickMarkWidth <> value then
  begin
    FDivisionTickMarkWidth := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetIndentSpacing(
  const Value: integer);
begin
  if FIndentSpacing <> value then
  begin
    FIndentSpacing := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetDivisionFont(const Value: TFont);
begin
  if FDivisionFont <> Value then
  begin
    FDivisionFont.Assign(value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetDivisionFormat(
  const Value: String);
begin
  if FDivisionFormat <> value then
  begin
    FDivisionFormat := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetShowDivisionValue(
  const Value: Boolean);
begin
  if FShowDivisionValue <> value then
  begin
    FShowDivisionValue := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetShowSubDivisionValue(
  const Value: Boolean);
begin
  if FShowSubDivisionValue <> value then
  begin
    FShowSubDivisionValue := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetSubDivisionFont(
  const Value: TFont);
begin
  if FSubDivisionFont <> value then
  begin
    FSubDivisionFont.Assign(value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetSubDivisionFormat(
  const Value: String);
begin
  if FSubDivisionFormat <> value then
  begin
    FSubDivisionFormat := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetSubDivisionTickMarkColor(
  const Value: TColor);
begin
  if FSubDivisionTickMarkColor <> Value then
  begin
    FSubDivisionTickMarkColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetSubDivisionTickMarkSize(
  const Value: integer);
begin
  if FSubDivisionTickMarkSize <> value then
  begin
    FSubDivisionTickMarkSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineRangeAppearance.SetSubDivisionTickMarkWidth(
  const Value: integer);
begin
  if FSubDivisionTickMarkWidth <> value then
  begin
    FSubDivisionTickMarkWidth := Value;
    Changed;
  end;
end;

{ TAdvSmoothTimeLineBarSection }

procedure TAdvSmoothTimeLineBarSection.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLineBarSection) then
  begin
    FEndTime := (Source as  TAdvSmoothTimeLineBarSection).EndTime;
    FStartTime := (Source as TAdvSmoothTimeLineBarSection).StartTime;
    FFill.Assign((Source as TAdvSmoothTimeLineBarSection).Fill);
    FHintFill.Assign((Source as TAdvSmoothTimeLineBarSection).HintFill);
    FHintFont.Assign((Source as TAdvSmoothTimeLineBarSection).HintFont);
    FHintHeight := (Source as TAdvSmoothTimeLineBarSection).HintHeight;
    FHintWidth := (Source as TAdvSmoothTimeLineBarSection).HintWidth;
    FHintAutoSize := (Source as TAdvSmoothTimeLineBarSection).HintAutoSize;
    FFixedSize := (Source as TAdvSmoothTimeLineBarSection).FixedSize;
    FFixedPosition := (Source as TAdvSmoothTimeLineBarSection).FixedPosition;
    FHandleSize := (Source as TAdvSmoothTimeLineBarSection).HandleSize;
    FHandleColor := (Source as TAdvSmoothTimeLineBarSection).HandleColor;
    FCaptionTop := (Source as TAdvSmoothTimeLineBarSection).CaptionTop;
    FCaptionLeft := (Source as TAdvSmoothTimeLineBarSection).CaptionLeft;
    FCaption := (Source as TAdvSmoothTimeLineBarSection).Caption;
    FCaptionLocation := (Source as TAdvSmoothTimeLineBarSection).CaptionLocation;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.Changed;
begin
  FOwner.Changed;
end;

constructor TAdvSmoothTimeLineBarSection.Create(Collection: TCollection);
begin
  inherited;
  FOwner := (Collection as TAdvSmoothTimeLineBarSections).FOwner;
  FStartTime := IncSecond(FOwner.Range.RangeFrom, 3);
  FEndTime := IncSecond(FOwner.Range.RangeFrom, 5);
  FFill := TGDIPFill.Create;
  FFill.OnChange := FillChanged;
  FHintFill := TGDIPFill.Create;
  FHintFill.OnChange := FillChanged;
  FHintFont := TFont.Create;
  FHintFont.OnChange := fontChanged;
  FHintWidth := 50;
  FHintHeight := 20;
  FHintAutoSize := true;
  FHandleSize := 6;
  FHandleColor := clHighlight;
  FFixedSize := false;
  FFixedPosition := false;
  FCaptionTop := 0;
  FCaptionLeft := 0;
  FCaptionLocation := cpCenterLeft;

  if not (csLoading in FOwner.ComponentState) then
  begin
    FHintFill.Assign(FOwner.FDefaultHintFill);
    FFill.Assign(FOwner.FDefaultSectionFill);
  end;
  FOwner.Changed;
end;

destructor TAdvSmoothTimeLineBarSection.Destroy;
begin
  FFill.Free;
  FHintFill.Free;
  FOwner.Changed;
  FHintFont.Free;
  inherited;
end;

procedure TAdvSmoothTimeLineBarSection.FillChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineBarSection.FontChanged(Sender: TObject);
begin
  Changed;
end;

function TAdvSmoothTimeLineBarSection.GetSectionRect: TGPRectF;
var
  xs, xe: Double;
  r: TGPRectF;
begin
  r := FOwner.GetTimeLineBarRect;
  if FOwner.FMouseDownOnStartSection and (Index = FOwner.FSelectedSection) then
  begin
    xs := Min(Max(FOwner.FSecStartX, r.X), r.X + r.Width);
    xe := Min(Max(FOwner.DateTimeToX(EndTime), r.X), r.X + r.Width);
  end
  else if FOwner.FMouseDownOnEndSection and (Index = FOwner.FSelectedSection) then
  begin
    xe := Min(Max(FOwner.FSecEndX, r.X), r.X + r.Width);
    xs := Min(Max(FOwner.DateTimeToX(StartTime), r.X), r.X + r.Width);
  end
  else if FOwner.FMouseMovedOnSection and FOwner.FMouseMovedOnSection and (Index = FOwner.FSelectedSection) then
  begin
    xs := Min(Max(FOwner.FSecStartX, r.X), r.X + r.Width);
    xe := Min(Max(FOwner.FSecEndX, r.X), r.X + r.Width);
  end
  else
  begin
    xs := Min(Max(FOwner.DateTimeToX(StartTime), r.X), r.X + r.Width);
    xe := Min(Max(FOwner.DateTimeToX(EndTime), r.X), r.X + r.Width);
  end;

  Result := MakeRect(xs, r.Y, xe - xs, r.Height);
end;

procedure TAdvSmoothTimeLineBarSection.SetCaption(const Value: String);
begin
  if FCaption <> value then
  begin
    FCaption := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetCaptionLeft(const Value: integer);
begin
  if FCaptionLeft <> value then
  begin
    FCaptionLeft := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetCaptionLocation(
  const Value: TAdvSmoothTimeLineCaptionLocation);
begin
  if FCaptionLocation <> value then
  begin
    FCaptionLocation := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetCaptionTop(const Value: integer);
begin
  if FCaptionTop <> value then
  begin
    FCaptionTop := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetEndTime(const Value: TDateTime);
begin
  if FEndTime <> value then
  begin
    FEndTime := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetFill(const Value: TGDIPFill);
begin
  if FFill <> value then
  begin
    FFill.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetFixedPosition(const Value: Boolean);
begin
  if FFixedPosition <> Value then
  begin
    FFixedPosition := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetFixedSize(const Value: Boolean);
begin
  if FFixedSize <> value then
  begin
    FFixedSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHandleColor(const Value: TColor);
begin
  if FHandleColor <> Value then
  begin
    FHandleColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHandleSize(const Value: integer);
begin
  if FHandleSize <> value then
  begin
    FHandleSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHint(const Value: String);
begin
  if FHint <> value then
  begin
    FHint := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHintAutoSize(const Value: Boolean);
begin
  if FHintAutoSize <> value then
  begin
    FHintAutoSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHintFill(const Value: TGDIPFill);
begin
  if FHintFill <> value then
  begin
    FHintFill.Assign(value);
    FillChanged(Self);
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHintFont(const Value: TFont);
begin
  if FHintFont <> value then
  begin
    FHintFont.Assign(Value);
    FontChanged(Self);
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHintHeight(const Value: integer);
begin
  if FHintHeight <> value then
  begin
    FHintHeight := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetHintWidth(const Value: integer);
begin
  if FHintWidth <> value then
  begin
    FHintWidth := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarSection.SetStartTime(const Value: TDateTime);
begin
  if FStartTime <> value then
  begin
    FStartTime := Value;
    Changed;
  end;
end;

{ TAdvSmoothTimeLineBarSections }

function TAdvSmoothTimeLineBarSections.Add: TAdvSmoothTimeLineBarSection;
begin
  result := TAdvSmoothTimeLineBarSection(inherited Add);
end;

constructor TAdvSmoothTimeLineBarSections.Create(
  AOwner: TAdvSmoothTimeLine);
begin
  inherited Create(TAdvSmoothTimeLineBarSection);
  FOwner := AOwner;
end;

procedure TAdvSmoothTimeLineBarSections.Delete(Index: Integer);
begin
  inherited Items[Index].Free;
end;

function TAdvSmoothTimeLineBarSections.GetItem(
  Index: Integer): TAdvSmoothTimeLineBarSection;
begin
  Result := TAdvSmoothTimeLineBarSection(inherited Items[Index]);
end;

function TAdvSmoothTimeLineBarSections.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TAdvSmoothTimeLineBarSections.Insert(
  Index: Integer): TAdvSmoothTimeLineBarSection;
begin
  Result := TAdvSmoothTimeLineBarSection(inherited Insert(Index));
end;

procedure TAdvSmoothTimeLineBarSections.SetItem(Index: Integer;
  const Value: TAdvSmoothTimeLineBarSection);
begin
  inherited Items[Index] := Value;
end;

{ TAdvSmoothTimeLineBar }

procedure TAdvSmoothTimeLineBar.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLineBar) then
  begin
    FFill.Assign((Source as TAdvSmoothTimeLineBar).Fill);
    FHeight := (Source as TAdvSmoothTimeLineBar).Height;
    FAnnotationFont.Assign((Source as TAdvSmoothTimeLineBar).AnnotationFont);
    FSectionCaptionFont.Assign((Source as TAdvSmoothTimeLineBar).SectionCaptionFont);
    FAnnotationAutoPosition := (Source as TAdvSmoothTimeLineBar).AnnotationAutoPosition;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBar.Changed;
begin
  FOwner.Changed;
end;

constructor TAdvSmoothTimeLineBar.Create(AOwner: TAdvSmoothTimeLine);
begin
  FOwner := AOwner;
  FFill := TGDIPFill.Create;
  FFill.OnChange := FillChanged;
  FSections := TAdvSmoothTimeLineBarSections.Create(FOwner);
  FSections.OnChange := SectionsChanged;
  FHeight := 10;
  FSectionCaptionFont := TFont.Create;
  FSectionCaptionFont.OnChange := FontChanged;
  FAnnotationFont := TFont.Create;
  FAnnotationFont.OnChange := FontChanged;

  FAnnotationAutoPosition := apNone;

  {$IFNDEF DELPHI9_LVL}
  FSectionCaptionFont.Name := 'Tahoma';
  FAnnotationFont.Name := 'Tahoma';
  {$ENDIF}
end;

destructor TAdvSmoothTimeLineBar.Destroy;
begin
  FFill.Free;
  FSections.Free;
  FAnnotationFont.Free;
  FSectionCaptionFont.Free;
  inherited;
end;

procedure TAdvSmoothTimeLineBar.FillChanged(Sender: TOBject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineBar.FontChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineBar.SectionsChanged(Sender: TOBject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineBar.SetAnnotationAutoPosition(
  const Value: TAnnotationAutoPosition);
begin
  if FAnnotationAutoPosition <> Value then
  begin
    FAnnotationAutoPosition := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBar.SetAnnotationFont(const Value: TFont);
begin
  if FAnnotationFont <> Value then
  begin
    FAnnotationFont.Assign(value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBar.SetFill(const Value: TGDIPFill);
begin
  if FFill <> value then
  begin
    FFill.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBar.SetHeight(const Value: integer);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBar.SetSectionCaptionFont(const Value: TFont);
begin
  if FSectionCaptionFont <> value then
  begin
    FSectionCaptionFont.Assign(Value);
    Changed;
  end;
end;

{ TAdvSmoothSectionHint }

procedure TAdvSmoothSectionHint.ClearBuffer(graphics: TGPGraphics);
var
  g: TGPGraphics;
begin
  g := graphics;
  if not Assigned(g) then
    g := CreateGraphics;
  g.Clear($00000000);
  if not Assigned(graphics) then
    g.Free;
end;

procedure TAdvSmoothSectionHint.CMDialogKey(var Msg: TWMKey);
begin

end;

procedure TAdvSmoothSectionHint.CMMouseLeave(var Message: TMessage);
begin
  Invalidate;
end;

constructor TAdvSmoothSectionHint.Create(AOwner: TComponent);
begin
  inherited;
  FMainBuffer := nil;

end;

function TAdvSmoothSectionHint.CreateGraphics: TGPGraphics;
begin
  Result := nil;
  if Assigned(FMainBuffer) then
    Result := TGPGraphics.Create(FMainBuffer);
end;

procedure TAdvSmoothSectionHint.CreateMainBuffer;
begin
//  if not Assigned(FMainBuffer) then
  if Assigned(FMainBuffer) then
    FMainBuffer.Free;

  FMainBuffer := TGPBitmap.Create(Width, Height, PixelFormat32bppARGB);
end;

procedure TAdvSmoothSectionHint.CreateWnd;
begin
  inherited;
  UpdateWindow;
end;

destructor TAdvSmoothSectionHint.Destroy;
begin
  inherited;
  DestroyMainBuffer;  
end;

procedure TAdvSmoothSectionHint.DestroyMainBuffer;
begin
  if Assigned(FMainBuffer) then
    FMainBuffer.Free;
end;

procedure TAdvSmoothSectionHint.Draw(graphics: TGPGraphics);
var
  g: TGPGraphics;
begin
  g := graphics;
  if not Assigned(g) then
    g := CreateGraphics;

  g.SetSmoothingMode(SmoothingModeAntiAlias);

  if Assigned(TimeLine) then  
    TimeLine.DrawSectionHint(g);

  if not Assigned(graphics) then
    g.Free;  
end;

procedure TAdvSmoothSectionHint.Init;
begin
  CreateMainBuffer;
  SetLayeredWindow;
  UpdateLayered;
end;

procedure TAdvSmoothSectionHint.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.Paint;
begin
  inherited;

end;

procedure TAdvSmoothSectionHint.SetLayeredWindow;
begin
  if GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_LAYERED = 0 then
    SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED);

  UpdateLayered;
end;

procedure TAdvSmoothSectionHint.UpdateButtons;
begin

end;

procedure TAdvSmoothSectionHint.UpdateLayered;
begin
  ClearBuffer(nil);

  SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_FRAMECHANGED or SWP_NOACTIVATE);

  Draw(nil);

  UpdateMainWindow;
end;

procedure TAdvSmoothSectionHint.UpdateMainWindow;
var
  ScrDC, MemDC: HDC;
  BitmapHandle, PrevBitmap: HBITMAP;
  BlendFunc: _BLENDFUNCTION;
  Size: TSize;
  P, S: TPoint;
begin
//  while BlendFunc.SourceConstantAlpha < 255 do  
//  begin
    ScrDC := CreateCompatibleDC(0);
    MemDC := CreateCompatibleDC(ScrDC);

    FMainBuffer.GetHBITMAP(0, BitmapHandle);
    PrevBitmap := SelectObject(MemDC, BitmapHandle);
    Size.cx := Width;
    Size.cy := Height;
    P := Point(Left, Top);
    S := Point(0, 0);

    with BlendFunc do
    begin
      BlendOp := AC_SRC_OVER;
      BlendFlags := 0;
      SourceConstantAlpha := 255;      
      AlphaFormat := AC_SRC_ALPHA;
    end;

    UpdateLayeredWindow(Handle, ScrDC, @P, @Size, MemDC, @S, 0, @BlendFunc, ULW_ALPHA);    

    SelectObject(MemDC, PrevBitmap);
    DeleteObject(BitmapHandle);

    DeleteDC(MemDC);
    DeleteDC(ScrDC);
//  end;
end;

procedure TAdvSmoothSectionHint.UpdateWindow;
begin
  CreateMainBuffer;
  UpdateLayered;
end;

procedure TAdvSmoothSectionHint.WMEraseBkGnd(var Message: TWMEraseBkGnd);
begin
  inherited;
end;

procedure TAdvSmoothSectionHint.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
end;

procedure TAdvSmoothSectionHint.WMPaint(var Message: TWMPaint);
begin
  inherited;
end;

{ TWinCtrl }

procedure TWinCtrl.PaintCtrls(DC: HDC; First: TControl);
begin
  inherited PaintControls(DC, First);
end;

{ TAdvSmoothTimeLineBarIndicators }

function TAdvSmoothTimeLineBarIndicators.Add: TAdvSmoothTimeLineBarIndicator;
begin
  Result := TAdvSmoothTimeLineBarIndicator(inherited Add);
end;

constructor TAdvSmoothTimeLineBarIndicators.Create(AOwner: TAdvSmoothTimeLine);
begin
  inherited Create(TAdvSmoothTimeLineBarIndicator);
  FOwner := AOwner;
end;

procedure TAdvSmoothTimeLineBarIndicators.Delete(Index: Integer);
begin
  inherited Items[Index].Free;
end;

function TAdvSmoothTimeLineBarIndicators.GetItem(
  Index: Integer): TAdvSmoothTimeLineBarIndicator;
begin
  Result := TAdvSmoothTimeLineBarIndicator(inherited Items[Index]);
end;

function TAdvSmoothTimeLineBarIndicators.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TAdvSmoothTimeLineBarIndicators.Insert(
  Index: Integer): TAdvSmoothTimeLineBarIndicator;
begin
  Result := TAdvSmoothTimeLineBarIndicator(inherited Insert(Index));
end;

procedure TAdvSmoothTimeLineBarIndicators.SetItem(Index: Integer;
  const Value: TAdvSmoothTimeLineBarIndicator);
begin
  Items[Index] := Value;
end;

{ TAdvSmoothTimeLineBarIndicator }

procedure TAdvSmoothTimeLineBarIndicator.Assign(Source: TPersistent);
begin
  if (Source is TAdvSmoothTimeLineBarIndicator) then
  begin
//    FPosition := (Source as TAdvSmoothTimeLineBarIndicator).Position;
    FAnnotationTextColor := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationTextColor;
    FShape := (Source as TAdvSmoothTimeLineBarIndicator).Shape;
    FColor := (Source as TAdvSmoothTimeLineBarIndicator).Color;
    FColorTo := (Source as TAdvSmoothTimeLineBarIndicator).ColorTo;
    FOpacity := (Source as TAdvSmoothTimeLineBarIndicator).Opacity;
    FOpacityTo := (Source as TAdvSmoothTimeLineBarIndicator).OpacityTo;
    FAngle := (Source as TAdvSmoothTimeLineBarIndicator).Angle;
    FGradientType := (Source as TAdvSmoothTimeLineBarIndicator).GradientType;
    FBorderColor := (Source as TAdvSmoothTimeLineBarIndicator).BorderColor;
    FBorderOpacity := (Source as TAdvSmoothTimeLineBarIndicator).Opacity;
    FBorderWidth := (Source as TAdvSmoothTimeLineBarIndicator).BorderWidth;
    FPicture.Assign((Source as TAdvSmoothTimeLineBarIndicator).Picture);
    FSize := (Source as TAdvSmoothTimeLineBarIndicator).Size;
    FHint := (Source as TAdvSmoothTimeLineBarIndicator).Hint;
    FShowTickMark := (Source as TAdvSmoothTimeLineBarIndicator).ShowTickMark;
    FTickMarkSize := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkSize;
    FTickMarkWidth := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkWidth;
    FTickMarkColor := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkColor;
    FFixed := (Source as TAdvSmoothTimeLineBarIndicator).Fixed;
    FAnnotation := (Source as TAdvSmoothTimeLineBarIndicator).Annotation;
    FAnnotationColor := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationColor;
    FAnnotationPosition := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationPosition;
    FAnnotationImageIndex := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationImageIndex;
    FAnnotationRounded := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationRounded;
    FAnnotationLineColor := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationLineColor;
    FAnnotationOpacity := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationOpacity;
    FAnnotationLineOpacity := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationLineOpacity;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.AssignVisuals(Source: TPersistent);
begin
 if (Source is TAdvSmoothTimeLineBarIndicator) then
  begin
    FShape := (Source as TAdvSmoothTimeLineBarIndicator).Shape;
    FColor := (Source as TAdvSmoothTimeLineBarIndicator).Color;
    FColorTo := (Source as TAdvSmoothTimeLineBarIndicator).ColorTo;
    FOpacity := (Source as TAdvSmoothTimeLineBarIndicator).Opacity;
    FOpacityTo := (Source as TAdvSmoothTimeLineBarIndicator).OpacityTo;
    FAngle := (Source as TAdvSmoothTimeLineBarIndicator).Angle;
    FGradientType := (Source as TAdvSmoothTimeLineBarIndicator).GradientType;
    FBorderColor := (Source as TAdvSmoothTimeLineBarIndicator).BorderColor;
    FBorderOpacity := (Source as TAdvSmoothTimeLineBarIndicator).Opacity;
    FBorderWidth := (Source as TAdvSmoothTimeLineBarIndicator).BorderWidth;
    FPicture.Assign((Source as TAdvSmoothTimeLineBarIndicator).Picture);
    FSize := (Source as TAdvSmoothTimeLineBarIndicator).Size;
    FHint := (Source as TAdvSmoothTimeLineBarIndicator).Hint;
    FShowTickMark := (Source as TAdvSmoothTimeLineBarIndicator).ShowTickMark;
    FTickMarkSize := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkSize;
    FTickMarkWidth := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkWidth;
    FTickMarkColor := (Source as TAdvSmoothTimeLineBarIndicator).TickMarkColor;
    FAnnotationColor := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationColor;
    FAnnotationRounded := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationRounded;
    FAnnotationLineColor := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationLineColor;
    FAnnotationOpacity := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationOpacity;
    FAnnotationLineOpacity := (Source as TAdvSmoothTimeLineBarIndicator).AnnotationLineOpacity;
    Changed;
  end;
end;

function TAdvSmoothTimeLineBarIndicator.CalculateAnnotation(g: TGPGraphics;
  f: TGPFont; sf: TGPStringFormat; I: integer): TGPRectF;
var
  rind: TGPRectF;
  htext, wtext: Double;
  sizer: TGPRectF;
  rtime: TGPRectF;
  RectChanged: Boolean;
  k: integer;
  raprev: TGPRectF;
begin
  Result := MakeRect(-1, -1, -1, -1);
  if (Position >= FOwner.Range.RangeFrom) and (Position <= FOwner.Range.RangeTo) then
  begin
    rtime := FOwner.GetTimeLineBarRect;
    rind := GetIndicatorRect;
    //Annotation
    htext := 0;
    wtext := 0;
    if Annotation <> '' then
    begin
      g.MeasureString(Annotation, Length(Annotation), f, MakeRect(0, 0, 10000, 1000), sf, sizer);
      htext := sizer.Height + 5;
      wtext := sizer.Width + 10;
    end;

    if Assigned(FOwner.ImageList) then
    begin
      if (AnnotationImageIndex >= 0) and (AnnotationImageIndex <= FOwner.ImageList.Count - 1) then
      begin
        if htext < FOwner.ImageList.Height + 5 then
          htext := FOwner.ImageList.Height + 5;

        if Annotation <> '' then
          wtext := wtext + FOwner.ImageList.Width + 5
        else
          wtext := wtext + FOwner.ImageList.Width + 10
      end;
    end;

    case AnnotationPosition of
      apOnTop:
      begin
        if rind.X < rtime.X + rtime.Width / 2 then
          Result := MakeRect(rind.X + rind.Width / 2 + 5, rind.Y - 15 - htext, wtext, htext)
        else
          Result := MakeRect(rind.X + rind.Width / 2 - 5 - wtext, rind.Y - 15 - htext, wtext, htext);

        if I > 0 then
        begin
          repeat
          RectChanged := false;
          for K := I - 1 downto 0 do
          begin
            raprev := FOwner.FAnnotationListTop.GetItem(k).AnnotationRect;

            while RectanglesInterSect(Makerect(raprev.X - 2, raprev.Y, raprev.Width + 4, raprev.Height + 4),
              MakeRect(Result.X - 2, Result.Y - 2, Result.Width + 4, Result.Height + 4)) do
            begin
              Result := MakeRect(Result.X, Result.Y - 15, Result.Width, Result.Height);
//              if Result.Y + Result.Height + 5 > FOwner.ClientRect.Bottom then
//                Result := MakeRect(Result.X + 15, rind.Y - 15 - htext, Result.Width, Result.Height);
              RectChanged := true;
            end;
          end;
          until (not RectChanged);
        end;
      end;
      apAtBottom:
      begin
        if rind.X < rtime.X + rtime.Width / 2 then
          Result := MakeRect(rind.X + rind.Width / 2 + 5, rind.Y + rind.Height + 15 + ((FOwner.GetTotalIndent + 1) * FOwner.RangeAppearance.IndentSpacing), wtext, htext)
        else
          Result := MakeRect(rind.X + rind.Width / 2 - wtext - 5, rind.Y + rind.Height + 15 + ((FOwner.GetTotalIndent + 1) * FOwner.RangeAppearance.IndentSpacing), wtext, htext);

        if I <> 0 then
        begin
          repeat
          RectChanged := false;
          for K := I - 1 downto 0 do
          begin
            raprev := FOwner.FAnnotationListBottom.GetItem(k).AnnotationRect;

            while RectanglesInterSect(Makerect(raprev.X - 2, raprev.Y, raprev.Width + 4, raprev.Height + 4),
              MakeRect(Result.X - 2, Result.Y - 2, Result.Width + 4, Result.Height + 4)) do
            begin
              Result := MakeRect(Result.X, Result.Y + 15, Result.Width, Result.Height);
//              if Result.Y + Result.Height + 5 > FOwner.ClientRect.Bottom then
//                Result := MakeRect(Result.X + 15, rind.Y + rind.Height + 15 + ((FOwner.GetTotalIndent + 1) * FOwner.RangeAppearance.IndentSpacing), Result.Width, Result.Height);
              RectChanged := true;
            end;
          end;
          until (not RectChanged);
        end;
      end;
    end;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.Changed;
begin
  FOwner.TimeLineBarIndicatorsChanged(Self);
end;

constructor TAdvSmoothTimeLineBarIndicator.Create(Collection: TCollection);
begin
  inherited;
  FOwner := (Collection as TAdvSmoothTimeLineBarIndicators).FOwner;
  FPosition := IncSecond(FOwner.Range.RangeFrom, 5);
  FShape := isDiamond;
  FColor := clGray;
  FColorTo := clSilver;
  FOpacity := 255;
  FOpacityTo := 255;
  FAngle := 0;
  FGradientType := gtForwardDiagonal;
  FBorderColor := clBlack;
  FBorderOpacity := 255;
  FBorderWidth := 1;
  FPicture := TAdvGDIPPicture.Create;
  FPicture.OnChange := PictureChanged;
  FSize := 15;
  FTickMarkSize := 10;
  FFixed := false;
  FTickMarkWidth := 1;
  FTickMarkColor := clBlack;
  FShowTickMark := true;
  FAnnotationColor := clSilver;
  FAnnotationPosition := apOnTop;
  FAnnotationLineColor := clBlack;
  FAnnotationOpacity := 255;
  FAnnotationLineOpacity := 255;
  FAnnotationImageIndex := -1;
  FAnnotationRounded := false;
  FAnnotationTextColor := clNone;
  if Assigned(FOwner.FDefaultIndicator) then
    Assign(FOwner.FDefaultIndicator);

  Changed;
end;

destructor TAdvSmoothTimeLineBarIndicator.Destroy;
begin
  FPicture.Free;
  inherited;
  Changed;
end;

procedure TAdvSmoothTimeLineBarIndicator.DrawAnnotation(g: TGPGraphics;
  f: TGPFont; sf: TGPStringFormat; btext: TGPSolidBrush; r: TGPRectF);
var
  b: TGPSolidBrush;
  bl: TGPLinearGradientBrush;
  ca: TCanvas;
  cahdl: THandle;
  p: TGPPen;
  imageindent: integer;
  rover: TGPRectF;
  rind: TGPRectF;
  path: TGPGraphicsPath;
begin
  if (Position >= FOwner.Range.RangeFrom) and (Position <= FOwner.Range.RangeTo) then
  begin
    rind := GetIndicatorRect;
    if AnnotationColor <> clNone then
    begin
      b := TGPSolidBrush.Create(MakeColor(AnnotationOpacity, AnnotationColor));
      if AnnotationRounded then
      begin
        path := CreateRoundRectangle(r, 5, rtBoth, false);
        g.FillPath(b, path);
        path.Free;
      end
      else
        g.FillRectangle(b, r);

      b.Free;

      p := TGPPen.Create(MakeColor(AnnotationLineOpacity, AnnotationLineColor));
      if AnnotationRounded then
      begin
        path := CreateRoundRectangle(r, 5, rtBoth, false);
        g.DrawPath(p, path);
        path.Free;
      end
      else
        g.DrawRectangle(p, r);

      p.Free;
    end;

    imageindent := 0;
    if Assigned(FOwner.ImageList) then
    begin
      if (AnnotationImageIndex >= 0) and (AnnotationImageIndex <= FOwner.ImageList.Count - 1) then
      begin
        cahdl := g.GetHDC;
        ca := TCanvas.Create;
        ca.Handle := cahdl;
        if r.X < rind.X then
        begin
          FOwner.ImageList.Draw(ca, Round(r.X + r.Width - 5 - FOwner.ImageList.Width),
            Round(r.Y + (r.Height - FOwner.ImageList.Height) / 2), AnnotationImageIndex);
        end
        else
        begin
          FOwner.ImageList.Draw(ca, Round(r.X + 5),
            Round(r.Y + (r.Height - FOwner.ImageList.Height) / 2), AnnotationImageIndex);
        end;
        imageindent := 5 + FOwner.ImageList.Width;

        ca.Free;
        g.ReleaseHDC(cahdl);
      end;
    end;

    if r.X < rind.X then
      g.DrawString(Annotation, Length(Annotation), f, MakeRect(r.X + 5, r.Y, r.Width, r.Height), sf, btext)
    else
      g.DrawString(Annotation, Length(Annotation), f, MakeRect(r.X + 5 + imageindent, r.Y, r.Width, r.Height), sf, btext);

    if AnnotationColor <> clNone then
    begin
      rover := MakeRect(r.X, r.Y, r.Width, r.Height / 2);
      bl := TGPLinearGradientBrush.Create(MakeRect(rover.X - 1, rover.Y - 1, rover.Width + 2, rover.Height + 2), MakeColor(75, clWhite), MakeColor(20, clWhite), LinearGradientModeVertical);
      if AnnotationRounded then
      begin
        path := CreateRoundRectangle(rover, 5, rtBoth, false);
        g.FillPath(bl, path);
        path.Free;
      end
      else
        g.FillRectangle(bl, rover);

      bl.Free;
    end;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.DrawAnnotationLine(g: TGPGraphics; r: TGPRectF; AnnotationPosition: TAdvSmoothTimeLineBarAnnotationPosition);
var
  rind: TGPRectF;
  rtime: TGPRectF;
  p: TGPPen;
begin
  if (Position >= FOwner.Range.RangeFrom) and (Position <= FOwner.Range.RangeTo) then
  begin
    rtime := FOwner.GetTimeLineBarRect;
    rind := GetIndicatorRect;
    p := TGPPen.Create(MakeColor(AnnotationLineOpacity, AnnotationLineColor));
    case AnnotationPosition of
      apOnTop: g.DrawLine(p, rind.X + rind.Width / 2, rtime.Y, rind.X + rind.Width / 2, r.Y + r.Height / 2);
      apAtBottom: g.DrawLine(p, rind.X + rind.Width / 2, rtime.Y + rtime.Height, rind.X + rind.Width / 2, r.Y + r.Height / 2);
    end;
    if r.X < rind.X then
      g.DrawLine(p, rind.X + rind.Width / 2, r.Y + r.Height / 2, r.X + r.Width , r.Y + R.Height / 2)
    else
      g.DrawLine(p, rind.X + rind.Width / 2, r.Y + r.Height / 2, r.X, r.Y + R.Height / 2);

    p.Free;
  end;
end;

function TAdvSmoothTimeLineBarIndicator.GetIndicatorRect: TGPRectF;
var
  r: TGPRectF;
begin
  r := FOwner.GetTimeLineBarRect;
  if FOwner.FMouseMovedOnIndicator and FOwner.FMouseMovedOnIndicator and (Index = FOwner.FSelectedIndicator) and not Fixed then
    Result.X := FOwner.FPx - Size / 2
  else
    Result.X := FOwner.DateTimeToX(Position) - Size / 2;

  Result.X := Max(r.X - Size / 2, Min(Result.X, r.X + r.Width - Size / 2));

  Result.Y := r.y + r.Height / 2 - Size / 2;
  Result.Width := Size;
  Result.Height := Size;
end;

function TAdvSmoothTimeLineBarIndicator.GetPosition: TDateTime;
begin
  if FOwner.FMouseMovedOnIndicator and FOwner.FMouseMovedOnIndicator and (Index = FOwner.FSelectedIndicator) and not Fixed then
    Result := FOwner.XToDateTime(Round(FOwner.FPx - Size / 2))
  else
    Result := FPosition;
end;

procedure TAdvSmoothTimeLineBarIndicator.PictureChanged(Sender: TObject);
begin
  Changed;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAngle(const Value: integer);
begin
  if FAngle <> value then
  begin
    FAngle := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotation(const Value: String);
begin
  if FAnnotation <> value then
  begin
    FAnnotation := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationColor(
  const Value: TColor);
begin
  if FAnnotationColor <> value then
  begin
    FAnnotationColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationImageIndex(
  const Value: integer);
begin
  if FAnnotationImageIndex <> value then
  begin
    FAnnotationImageIndex := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationLineColor(
  const Value: TColor);
begin
  if FAnnotationLineColor <> value then
  begin
    FAnnotationLineColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationLineOpacity(
  const Value: Byte);
begin
  if FAnnotationLineOpacity <> value then
  begin
    FAnnotationLineOpacity := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationOpacity(
  const Value: Byte);
begin
  if FAnnotationOpacity <> value then
  begin
    FAnnotationOpacity := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationPostion(
  const Value: TAdvSmoothTimeLineBarAnnotationPosition);
begin
  if FAnnotationPosition <> value then
  begin
    FAnnotationPosition := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationRounded(
  const Value: Boolean);
begin
  if FAnnotationRounded <> value then
  begin
    FAnnotationRounded := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetAnnotationTextColor(
  const Value: TColor);
begin
  if FAnnotationTextColor <> value then
  begin
    FAnnotationTextColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetBorderColor(const Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetBorderOpacity(const Value: Byte);
begin
  if FBorderOpacity <> value then
  begin
    FBorderOpacity := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetBorderWidth(const Value: integer);
begin
  if FBorderWidth <> value then
  begin
    FBorderWidth := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetColor(const Value: TColor);
begin
  if FColor <> value then
  begin
    FColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetColorTo(const Value: TColor);
begin
  if FColorTo <> value then
  begin
    FColorTo := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetFixed(const Value: Boolean);
begin
  if FFixed <> value then
  begin
    FFixed := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetGradientType(
  const Value: TAdvGradientType);
begin
  if FGradientType <> value then
  begin
    FGradientType := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetHint(const Value: String);
begin
  if FHint <> Value then
  begin
    FHint := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetOpacity(const Value: Byte);
begin
  if FOpacity <> value then
  begin
    FOpacity := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetOpacityTo(const Value: Byte);
begin
  if FOpacityTo <> Value then
  begin
    FOpacityTo := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetPicture(
  const Value: TAdvGDIPPicture);
begin
  if FPicture <> value then
  begin
    FPicture.Assign(Value);
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetPosition(const Value: TDateTime);
begin
  FPosition := Value;
  Changed;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetShape(
  const Value: TAdvSmoothTimeLineBarIndicatorShape);
begin
  if FShape <> value then
  begin
    FShape := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetShowTickMark(const Value: Boolean);
begin
  if FShowTickMark <> value then
  begin
    FShowTickMark := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetSize(const Value: integer);
begin
  if FSize <> value then
  begin
    FSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetTickMarkColor(const Value: TColor);
begin
  if FTickMarkColor <> value then
  begin
    FTickMarkColor := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetTickMarkSize(const Value: integer);
begin
  if FTickMarkSize <> value then
  begin
    FTickMarkSize := Value;
    Changed;
  end;
end;

procedure TAdvSmoothTimeLineBarIndicator.SetTickMarkWidth(const Value: integer);
begin
  if FTickMarkWidth <> value then
  begin
    FTickMarkWidth := Value;
    Changed;
  end;
end;

{ TAdvSmoothTimeLineAnnotationList }

function TAdvSmoothTimeLineAnnotationList.Add: TAdvSmoothTimeLineAnnotationItem;
begin
  Result := TAdvSmoothTimeLineAnnotationItem(inherited Add);
end;

procedure TAdvSmoothTimeLineAnnotationList.Clear;
begin
  if Count > 0 then
  begin
    BeginUpdate;
    try
      while Count > 0 do
      begin
        TAdvSmoothTimeLineAnnotationItem(Items[Count - 1]).Indicator := nil;
        TCollectionItem(Items[Count - 1]).Free;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

function TAdvSmoothTimeLineAnnotationList.Compare(Item1,
  Item2: TAdvSmoothTimeLineAnnotationItem): integer;
var
  pos1, pos2: Double;
begin
  pos1 := Item1.Indicator.Position;
  pos2 := Item2.Indicator.Position;

  if pos2 < pos1 then
    Result := -1
  else if pos2 > pos1 then
    Result := 1
  else
    Result := 0;
end;

constructor TAdvSmoothTimeLineAnnotationList.Create(AOwner: TAdvSmoothTimeLine);
begin
  inherited Create(TAdvSmoothTimeLineAnnotationItem);
  FOwner := AOwner;
end;

procedure TAdvSmoothTimeLineAnnotationList.Delete(Index: Integer);
begin
  Items[Index].Free;
end;

function TAdvSmoothTimeLineAnnotationList.GetItem(
  index: integer): TAdvSmoothTimeLineAnnotationItem;
begin
  Result := TAdvSmoothTimeLineAnnotationItem(inherited Items[Index]);
end;

function TAdvSmoothTimeLineAnnotationList.Insert(
  Index: Integer): TAdvSmoothTimeLineAnnotationItem;
begin
  Result := TAdvSmoothTimeLineAnnotationItem(inherited Insert(Index));
end;

procedure TAdvSmoothTimeLineAnnotationList.QuickSort(L, R: Integer);
var
  I, J, p: Integer;
  Save: TCollectionItem;
  SortList: TList;
begin
  //This cast allows us to get at the private elements in the base class
  SortList := TShadowedCollection(Self).FItems;

  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while Compare(Items[I], Items[P]) < 0 do
        Inc(I);
      while Compare(Items[J], Items[P]) > 0 do
        Dec(J);
      if I <= J then begin
        Save              := SortList.Items[I];
        SortList.Items[I] := SortList.Items[J];
        SortList.Items[J] := Save;
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TAdvSmoothTimeLineAnnotationList.SetItem(Index: Integer;
  const Value: TAdvSmoothTimeLineAnnotationItem);
begin
  inherited Items[Index] := Value;
end;

end.
