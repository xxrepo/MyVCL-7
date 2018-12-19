{*******************************************************}
{                                                       }
{                       EhLib v2.0                      }
{            TDBEditEh,TDBDateTimeEditEh,               }
{      TDBComboBoxEh,TDBNumberEditEh components         }
{                                                       }
{     Copyright (c) 2001 by Dmitry V. Bolshakov         }
{                                                       }
{*******************************************************}

unit DBCtrlsEh;

{$I EhLib.Inc}

interface

uses Windows, SysUtils, Messages, Classes, Controls, Forms, Graphics, Menus,
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
  StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, Db, DBCtrls, Imglist,
  ToolCtrlsEh, Consts;

const
   CM_CHILDWIDTHCHANGEDEH = WM_USER + 101;
   CM_EDITIMAGECHANGEDEH = WM_USER + 102;
type

{ TEditButtonControlEh }

  TEditButtonStyleEh = (ebsDropDownEh, ebsEllipsisEh, ebsGlyphEh, ebsUpDownEh);

  TEditButtonControlEh = class(TSpeedButton)
  private
    FActive: Boolean;
    FButtonNum:Integer;
    FStyle: TEditButtonStyleEh;
    function GetWidth: Integer;
    procedure CMHitTest(var Message: TCMHitTest); message CM_HITTEST;
    procedure SetStyle(const Value: TEditButtonStyleEh);
    procedure SetWidth(const Value: Integer);
  protected
    procedure Paint; override;
  public
    procedure SetState(NewState:TButtonState; IsActive:Boolean; ButtonNum:Integer);
    procedure SetWidthNoNotify(AWidth:Integer);
    property Style:TEditButtonStyleEh read FStyle write SetStyle default ebsDropDownEh;
    property Width: Integer read GetWidth write SetWidth;
  end;

{ TEditButtonEh }

  TEditButtonEh = class(TPersistent)
  private
    FEditButtonControl: TEditButtonControlEh;
    FEditControl: TWinControl;
    FShortCut: TShortCut;
    FStyle: TEditButtonStyleEh;
    FVisible: Boolean;
    FWidth: Integer;
    function GetGlyph: TBitmap;
    function GetNumGlyphs: Integer;
    procedure SetGlyph(const Value: TBitmap);
    procedure SetNumGlyphs(const Value: Integer);
    procedure SetStyle(const Value: TEditButtonStyleEh);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: Integer);
  public
    constructor Create(EditControl: TWinControl; EditButtonControl: TEditButtonControlEh);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property NumGlyphs: Integer read GetNumGlyphs write SetNumGlyphs default 1;
    property ShortCut: TShortCut read FShortCut write FShortCut default 32808; //Menus.ShortCut(VK_DOWN, [ssAlt]);
    property Style: TEditButtonStyleEh read FStyle write SetStyle default ebsDropDownEh;
    property Visible: Boolean read FVisible write SetVisible default False;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

{ TEditImageEh }

  TEditImageEh = class(TPersistent)
  private
    FEditControl: TWinControl;
    FImageIndex:Integer;
    FImages:TCustomImageList;
    FUseImageHeight: Boolean;
    FVisible: Boolean;
    FWidth: Integer;
    procedure SetImageIndex(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetUseImageHeight(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: Integer);
  public
    constructor Create(EditControl: TWinControl);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property ImageIndex: Integer read FImageIndex write SetImageIndex default 0;
    property Images: TCustomImageList read FImages write SetImages;
    property UseImageHeight: Boolean read FUseImageHeight write SetUseImageHeight default True;
    property Visible: Boolean read FVisible write SetVisible default False;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

{ TFieldDataLinkEh }

  TFieldDataLinkEh = class(TDataLink)
  private
    FFields:TFieldsArrEh;
    FFieldName: string;
    FControl: TComponent;
    //FEditing: Boolean;
    //FModified: Boolean;
    FOnDataChange: TNotifyEvent;
    FOnEditingChange: TNotifyEvent;
    FOnUpdateData: TNotifyEvent;
    FOnActiveChange: TNotifyEvent;
    FMultiFields: Boolean;
    FDataIndepended: Boolean;
    FEditing: Boolean;
    FModified: Boolean;

    function GetActive: Boolean;
    function GetCanModify: Boolean;
    function GetDataSetActive: Boolean;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetFieldsCount: Integer;
    function GetFieldsField(Index: Integer): TField;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetEditing(Value: Boolean);
    procedure SetField(Value: TList);
    procedure SetFieldName(const Value: string);
    procedure SetMultiFields(const Value: Boolean);
    procedure UpdateField;
    procedure UpdateRightToLeft;
  protected
    DataIndependentValue:Variant;

    function FieldFound(Value:TField):Boolean;
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    procedure UpdateDataIndepended;
  public
    constructor Create;
    function Edit: Boolean;
    procedure Modified;
    procedure SetText(Text:String);
    procedure SetValue(Value:Variant);
    procedure Reset;

    property Active: Boolean read GetActive;
    property CanModify: Boolean read GetCanModify;
    property Control: TComponent read FControl write FControl;
    property DataIndepended: Boolean read FDataIndepended;
    property DataSetActive: Boolean read GetDataSetActive;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Editing: Boolean read FEditing;
    property Field: TField read GetField;
    property FieldName: string read FFieldName write SetFieldName;
    property Fields[Index: Integer]: TField read GetFieldsField;
    property FieldsCount: Integer read GetFieldsCount;
    property MultiFields: Boolean read FMultiFields write SetMultiFields;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
    property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
    property OnEditingChange: TNotifyEvent read FOnEditingChange write FOnEditingChange;
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
  end;

{ TCustomDBEditEh }

  TDBEditEhValue = (evAlignmentEh, evEditMaskEh);
  TDBEditEhValues = set of TDBEditEhValue;

  TCustomDBEditEh = class(TCustomMaskEdit)
  private
    FAlwaysShowBorder: Boolean;
    FAssignedValues: TDBEditEhValues;
    FCanvas: TControlCanvas;
    FEditButton: TEditButtonEh;
    FEditImage:TEditImageEh;
    FFlat: Boolean;
    FOnButtonClick: TButtonClickEventEh;
    FOnButtonDown: TButtonDownEventEh;
    FOnUpdateData: TUpdateDataEventEh;
    FReadOnly: Boolean;
    FTimerActive: Boolean;
    FTimerInterval: Integer;
    FWordWrap: Boolean;
    function GetAlignment: TAlignment;
   {$IFNDEF EH_LIB_6}
    function GetAutoSize: Boolean;
    {$ENDIF}
    function GetEditMask: String;
    function GetField: TField;
    function GetReadOnly: Boolean;
    function GetText: String;
    function GetTextMargins: TPoint;
    function GetValue: Variant;
    function ImageRect: TRect;
    function IsAlignmentStored: Boolean;
    function IsEditMaskStored: Boolean;
    function IsTextStored: Boolean;
    function IsValueStored: Boolean;
    function OverButton(const P: TPoint): Boolean;
    procedure ActiveChange(Sender: TObject);
    procedure CheckCursor;
    procedure CMChildWidthChangedEh(var Message: TMessage); message CM_CHILDWIDTHCHANGEDEH;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMEditImageChangedEh(var Message: TMessage); message CM_EDITIMAGECHANGEDEH;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure CMMouseEnter (var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave (var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure DataChange(Sender: TObject);
    procedure DrawBorder(DC: HDC; ActiveBorder: Boolean);
    procedure DrawButtonLine(DC: HDC);
    procedure DrawEditImage(DC: HDC);
    procedure EditingChange(Sender: TObject);
    procedure ReadEditMask(Reader: TReader);
    procedure ResetTimer(Interval: Integer);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetAlwaysShowBorder(const Value: Boolean);
    procedure SetEditButton(const Value: TEditButtonEh);
    procedure SetEditImage(const Value: TEditImageEh);
    procedure SetEditMask(const Value: String);
    procedure SetEditRect;
    procedure SetFlat(const Value: Boolean);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure SetText(const Value: String);
    procedure SetValue(const Value: Variant);
    procedure SetWordWrap(const Value: Boolean);
    procedure InternalUpdateData(Sender: TObject);
    procedure UpdateDrawBorder;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMNCPaint(var Message: TMessage);  message WM_NCPAINT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    procedure WMUndo(var Message: TMessage); message WM_UNDO;
    procedure WriteEditMask(Writer: TWriter);
  protected
    FAlignment: TAlignment;
    FBorderActive: Boolean;
    FButtonHeight:Integer;
    FButtonLineWidth:Integer;
    FButtonWidth:Integer;
    FDataLink: TFieldDataLinkEh;
    FDataPosting: Boolean;
    FDownButton: Integer;
    FEditSpeedButton:TEditButtonControlEh;
    FFocused: Boolean;
    FImageWidth:Integer;
    FMouseAboveControl: Boolean;
    FPressed: Boolean;
    FPressedRect :TRect;
    FTracking: Boolean;
    function ButtonEnabled: Boolean; virtual;
    function ButtonRect: TRect;
    function CreateDataLink:TFieldDataLinkEh; virtual;
    function CreateEditButton: TEditButtonEh; virtual;
    function CreateEditButtonControl: TEditButtonControlEh; virtual;
    function CreateEditImage: TEditImageEh; virtual;
    function DataIndepended:Boolean; virtual;
    function DefaultAlignment: TAlignment; virtual;
    function DefaultEditMask: String; virtual;
    function EditCanModify: Boolean; override;
    function EditRect:TRect;
    function GetDataField: string; virtual;
    function GetDataSource: TDataSource; virtual;
    function GetVariantValue:Variant; virtual;
    function IsValidChar(InputChar: Char): Boolean; virtual;
    function PostDataEvent: Boolean;
    procedure ActiveChanged; virtual;
    procedure AdjustHeight; virtual;
    procedure ButtonDown(IsDownButton:Boolean); virtual;
    procedure Change; override;
    procedure CloseUp(Accept: Boolean); virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DataChanged; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DropDown; virtual;
    procedure EditingChanged; virtual;
    procedure InternalSetText(AText:String); virtual;
    procedure InternalSetValue(AValue:Variant); virtual;
    procedure InternalUpdatePostData; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PaintWindow(DC: HDC); override;
    procedure ResetMaxLength; virtual;
    procedure SetAutoSize(Value: Boolean); {$IFDEF EH_LIB_6} override; {$ELSE} virtual; {$ENDIF}
    procedure SetControlEditMask(Value:string);
    procedure SetControlReadOnly(Value:Boolean);
    procedure SetDataField(const Value: string); virtual;
    procedure SetDataSource(Value: TDataSource); virtual;
    procedure SetVariantValue(const VariantValue: Variant); virtual;
    procedure StopTimer;
    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure UpdateButtonState;
    procedure UpdateControlReadOnly; virtual;
    procedure UpdateHeight; virtual;
    procedure WndProc(var Message: TMessage); override;
    property AssignedValues: TDBEditEhValues read FAssignedValues;
   {$IFNDEF EH_LIB_6}
    property AutoSize: Boolean read GetAutoSize write SetAutoSize default True;
    {$ENDIF}
    property EditButton: TEditButtonEh read FEditButton write SetEditButton;
    property EditImage: TEditImageEh read FEditImage write SetEditImage;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property OnButtonClick: TButtonClickEventEh read FOnButtonClick write FOnButtonClick;
    property OnButtonDown: TButtonDownEventEh read FOnButtonDown write FOnButtonDown;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    procedure DefaultHandler(var Message); override;
    procedure Reset; override;
    procedure UpdateData; virtual;
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property AlwaysShowBorder: Boolean read FAlwaysShowBorder write SetAlwaysShowBorder default False;
    property DataField: String read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property EditMask: String read GetEditMask write SetEditMask stored False;
    property Field: TField read GetField;
    property Flat:Boolean read FFlat write SetFlat default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property Text: String read GetText write SetText stored IsTextStored;
    property Value:Variant read GetValue write SetValue stored IsValueStored;
    property OnUpdateData: TUpdateDataEventEh read FOnUpdateData write FOnUpdateData;
  end;

  TDBEditEh = class(TCustomDBEditEh)
  published
    property Alignment;
    property AlwaysShowBorder;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property EditMask;
    property Font;
    property Flat;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property WordWrap;
    property OnChange;
    property OnClick;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnUpdateData;
    property OnStartDock;
    property OnStartDrag;
  end;


{ TDateEditButtonEh }

  TVisibleEditButtonEh = class(TEditButtonEh)
  public
    constructor Create(EditControl: TWinControl; EditButtonControl: TEditButtonControlEh);
  published
    property Visible default True;
  end;

{ TCustomDBDateTimeEditEh }

  TDateTimeKindEh = (dtkDateEh, dtkTimeEh {, dtkDateTimeEh} );

  TCustomDBDateTimeEditEh = class(TCustomDBEditEh)
  private
    FCalendarVisible:Boolean;
    FDropDownCalendar:TWinControl;
    FEditValidating:Boolean;
    FInternalTextSetting:Boolean;
    FKind: TDateTimeKindEh;
    FValue:Variant;
    function GetDropDownCalendar: TWinControl;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure SetKind(const Value: TDateTimeKindEh);
    procedure UpdateValueFromText;
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
  protected
    FFourDigitYear:Boolean;
    function CreateEditButton: TEditButtonEh; override;
    function GetVariantValue:Variant; override;
    procedure ButtonDown(IsDownButton:Boolean); override;
    procedure Change; override;
    procedure DataChanged; override;
    procedure DropDown; override;
    procedure IncrementItemAtCurPos(IsIncrease:Boolean);
    procedure InternalSetControlText(AText:String);
    procedure InternalSetText(AText:String); override;
    procedure InternalSetValue(AValue:Variant); override;
    procedure InternalUpdatePostData; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure UpdateFourDigitYear; virtual;
    procedure WndProc(var Message: TMessage); override;
    property DropDownCalendar: TWinControl read GetDropDownCalendar;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DateTimeFormat:String;
    procedure CloseUp(Accept: Boolean); override;
    procedure UpdateMask; virtual;
    procedure ValidateEdit; override;
    property Kind: TDateTimeKindEh read FKind write SetKind;
  end;

{ TDBDateTimeEditEh }

  TDBDateTimeEditEh = class(TCustomDBDateTimeEditEh)
  published
    property Alignment;
    property AlwaysShowBorder;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property EditButton;
    property Font;
    property Flat;
    property ImeMode;
    property ImeName;
    property Kind;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Value;
    property Visible;
    property OnButtonClick;
    property OnButtonDown;
    property OnChange;
    property OnClick;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnUpdateData;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TDropDownBoxEh }

  TDropDownBoxEh = class(TPersistent)
  private
    FAlign: TDropDownAlign;
    FAutoDrop: Boolean;
    FRows: Integer;
    FSizable: Boolean;
    FWidth: Integer;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Align: TDropDownAlign read FAlign write FAlign default daLeft;
    property AutoDrop: Boolean read FAutoDrop write FAutoDrop default False;
    property Rows: Integer read FRows write FRows default 7;
    property Sizable: Boolean read FSizable write FSizable default False;
    property Width: Integer read FWidth write FWidth default 0;
  end;

{ TCustomDBComboBoxEh }

  TCustomDBComboBoxEh = class(TCustomDBEditEh)
  private
    FDropDownBox: TDropDownBoxEh;
    FItemIndex: Integer;
    FItems: TStrings;
    FKeyItems: TStrings;
    FListVisible:Boolean;
    FOnNotInList: TNotInListEventEh;
    FPopupListbox:TWinControl;
//    FStyle: TComboBoxStyle;
    FVarValue:Variant;
    function GetImages: TCustomImageList;
    function GetPopupListbox: TWinControl;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure ItemsChanged(Sender: TObject);
    procedure KeyItemsChanged(Sender: TObject);
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure SetComboBoxStyle(const Value: TComboBoxStyle);
    procedure SetDropDownBox(const Value: TDropDownBoxEh);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetItemIndex(const Value: Integer);
    procedure SetItems(const Value: TStrings);
    procedure SetKeyItems(const Value: TStrings);
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
  protected
    FItemsCount:Integer;
    FKeyBased:Boolean;
    function ConvertDataText(const Value:String):String;
    function CreateEditButton: TEditButtonEh; override;
    function DefaultAlignment: TAlignment; override;
    function GetVariantValue:Variant; override;
    function IsValidChar(InputChar: Char): Boolean; override;
    function LocateStr(Str: String; PartialKey:Boolean): Boolean; virtual;
    function ProcessSearchStr(Str: String):Boolean; virtual;
    function TextListIndepended: Boolean;
    procedure ButtonDown(IsDownButton:Boolean); override;
    procedure Change; override;
    procedure DataChanged; override;
    procedure InternalSetItemIndex(const Value: Integer);
    procedure InternalSetText(AText:String); override;
    procedure InternalSetValue(AValue:Variant); override;
    procedure InternalUpdatePostData; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure ResetMaxLength; override;
    procedure SetVariantValue(const VariantValue: Variant); override;
    procedure UpdateControlReadOnly; override;
    procedure UpdateItemIndex;
    procedure UpdateItems;
    procedure WndProc(var Message: TMessage); override;
    property PopupListbox: TWinControl read GetPopupListbox;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseUp(Accept: Boolean); override;
    procedure DefaultHandler(var Message); override;
    procedure DropDown; override;
    procedure SelectNextValue(IsPrior:Boolean);
    procedure UpdateData; override;
    property DropDownBox: TDropDownBoxEh read FDropDownBox write SetDropDownBox;
    property Images: TCustomImageList read GetImages write SetImages;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property Items: TStrings read FItems write SetItems;
    property KeyItems: TStrings read FKeyItems write SetKeyItems;
    property ListVisible: Boolean read FListVisible;
    //property Style: TComboBoxStyle read FStyle write SetComboBoxStyle default csDropDown;
    property OnNotInList: TNotInListEventEh read FOnNotInList write FOnNotInList;
  end;

{ TDBComboBoxEh }

  TDBComboBoxEh = class(TCustomDBComboBoxEh)
  published
    property Alignment;
    property AlwaysShowBorder;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropDownBox;
    property Enabled;
    property EditButton;
    property EditMask;
    property Font;
    property Flat;
    property ImeMode;
    property ImeName;
    property Images;
    property Items;
    property KeyItems;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property WordWrap;
    property OnButtonClick;
    property OnButtonDown;
    property OnChange;
    property OnClick;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnNotInList;
    property OnUpdateData;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TCustomDBNumberEdit }

  TDBNumberValue = (evDisplayFormatEh, evCurrencyEh, evMaxValueEh, evMinValueEh);
  TDBNumberValues = set of TDBNumberValue;

  TCustomDBNumberEditEh = class(TCustomDBEditEh)
  private
    FAssignedValues: TDBNumberValues;
    FCurrency: Boolean;
    FDecimalPlaces: Cardinal;
    FDisplayFormat: String;
    FEditFormat: String;
    FIncrement: Extended;
    FInternalTextSetting:Boolean;
    FMinValue, FMaxValue: Extended;
    FValue:Variant;
//    FFormatting: Boolean;
    function CheckValue(NewValue: Extended): Extended;
    function DisplayFormatToEditFormat(const AFormat: string): string;
    function GetCurrency: Boolean;
    function GetDisplayFormat: string;
    function GetMaxValue: Extended;
    function GetMinValue: Extended;
    function IsCurrencyStored: Boolean;
    function IsDisplayFormatStored: Boolean;
    function IsIncrementStored: Boolean;
    function IsMaxValueStored: Boolean;
    function IsMinValueStored: Boolean;
    function TextToValText(const AValue: string): string;
    procedure SetCurrency(const Value: Boolean);
    procedure SetDecimalPlaces(Value: Cardinal);
    procedure SetDisplayFormat(const Value: string);
    procedure SetMaxValue(AValue: Extended);
    procedure SetMinValue(AValue: Extended);
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
  protected
    function DefaultAlignment: TAlignment; override;
    function DefaultCurrency: Boolean;
    function DefaultDisplayFormat: String;
    function DefaultMaxValue:Extended;
    function DefaultMinValue:Extended;
    function FormatDisplayText(Value: Extended): string;
    function GetDisplayText: string; virtual;
    function GetVariantValue:Variant; override;
    function IsValidChar(Key: Char): Boolean; override;
    procedure ButtonDown(IsDownButton:Boolean); override;
    procedure Change; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DataChanged; override;
    procedure InternalSetControlText(AText:String);
    procedure InternalSetText(AText:String); override;
    procedure InternalSetValue(AValue:Variant); override;
    procedure InternalUpdatePostData; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure ReformatEditText(NewText:String); dynamic;
    procedure UpdateValueFromText;
    property AssignedValues: TDBNumberValues read FAssignedValues;
    property currency:Boolean read GetCurrency write SetCurrency stored IsCurrencyStored;
    property DecimalPlaces: Cardinal read FDecimalPlaces write SetDecimalPlaces default 2;
    property DisplayFormat:String read GetDisplayFormat write SetDisplayFormat stored IsDisplayFormatStored;
    property Increment: Extended read FIncrement write FIncrement stored IsIncrementStored;
    property MaxLength default 0;
    property MaxValue: Extended read GetMaxValue write SetMaxValue stored IsMaxValueStored;
    property MinValue: Extended read GetMinValue write SetMinValue stored IsMinValueStored;
//    property Formatting: Boolean read FFormatting;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
//    procedure Clear; override;
    procedure IncrementValue(IsIncrease:Boolean);
    property DisplayText: string read GetDisplayText;
  end;

{ TNumberEdit }

  TDBNumberEditEh = class(TCustomDBNumberEditEh)
  published
    property Alignment;
    property AlwaysShowBorder;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property currency;
    property DataField;
    property DataSource;
    property DecimalPlaces;
    property DisplayFormat;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property EditButton;
    property Font;
    property Flat;
    property ImeMode;
    property ImeName;
    property Increment;
    //property MaxLength;
    property MaxValue;
    property MinValue;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Value;
    property Visible;
    property OnButtonClick;
    property OnButtonDown;
    property OnChange;
    property OnClick;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnUpdateData;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

uses Commctrl, Clipbrd, DbConsts, Dialogs;

type
  TWinControlCracker = class(TWinControl) end;

const
  InitRepeatPause:Integer = 500;  { pause before first repeat timer (ms) }
  RepeatPause:Integer     = 100;  { pause before next repeat timers (ms) }

{ TEditButtonControlEh }

procedure TEditButtonControlEh.CMHitTest(var Message: TCMHitTest);
begin
  Message.Result := 0;
end;

function TEditButtonControlEh.GetWidth: Integer;
begin
  Result := inherited Width;
end;

procedure TEditButtonControlEh.Paint;
const
  StyleFlags : array [TEditButtonStyleEh] of TDrawButtonControlStyleEh =
   (bcsDropDownEh, bcsEllipsisEh, bcsUpDownEh, bcsUpDownEh);
var Rgn, SaveRgn: HRgn;
    r:Integer;
    BRect: TRect;
    IsClipRgn:Boolean;
begin
  if not (Style = ebsGlyphEh) then
    PaintButtonControlEh(Canvas.Handle,Rect(0,0,Width,Height),
      TWinControlCracker(Parent).Color,StyleFlags[Style],FButtonNum,
      Flat, FActive, Enabled, cbUnchecked)
  else
  begin
    IsClipRgn := Flat and not FActive;
    BRect := BoundsRect;
    r := 0;
    SaveRgn := 0;
    if IsClipRgn then
    begin
      SaveRgn := CreateRectRgn(0,0,0,0);
      r := GetClipRgn(Canvas.Handle, SaveRgn);
      with BRect do
        Rgn := CreateRectRgn(Left+1, Top+1, Right-1, Bottom-1);
      SelectClipRgn(Canvas.Handle, Rgn);
      DeleteObject(Rgn);
    end;

    inherited Paint;

    if IsClipRgn then
    begin
      if r = 0 then
        SelectClipRgn(Canvas.Handle, 0)
      else
        SelectClipRgn(Canvas.Handle, SaveRgn);
      DeleteObject(SaveRgn);
      OffsetRect(BRect,-Left,-Top);
      Canvas.Brush.Color := TWinControlCracker(Parent).Color;
      Canvas.FrameRect(BRect);
    end;
  end;
end;

procedure TEditButtonControlEh.SetState(NewState:TButtonState; IsActive:Boolean; ButtonNum:Integer);
begin
  if (FState <> NewState) or (IsActive <> FActive) or (ButtonNum <> FButtonNum) then
  begin
    if (IsActive <> FActive) then
      if IsActive = True
        then Perform(CM_MOUSEENTER,0,0)
        else Perform(CM_MOUSELEAVE,0,0);
    FActive := IsActive;
    FState := NewState;
    FButtonNum := ButtonNum;
    Invalidate;
  end;
end;

procedure TEditButtonControlEh.SetStyle(const Value: TEditButtonStyleEh);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;

procedure TEditButtonControlEh.SetWidth(const Value: Integer);
begin
  if inherited Width <> Value then
  begin
    inherited Width := Value;
    Parent.Perform(CM_CHILDWIDTHCHANGEDEH,Integer(Self),0);
  end;
end;

procedure TEditButtonControlEh.SetWidthNoNotify(AWidth: Integer);
begin
  inherited Width := AWidth;
end;

{ TEditButtonEh }

constructor TEditButtonEh.Create(EditControl: TWinControl; EditButtonControl: TEditButtonControlEh);
begin
  inherited Create;
  FEditControl := EditControl;
  FEditButtonControl := EditButtonControl;
  FShortCut := Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
end;

destructor TEditButtonEh.Destroy;
begin
  inherited Destroy;
end;

procedure TEditButtonEh.Assign(Source: TPersistent);
begin
  if Source is TEditButtonEh then
  begin
    Glyph := TEditButtonEh(Source).Glyph;
    NumGlyphs := TEditButtonEh(Source).NumGlyphs;
    Style := TEditButtonEh(Source).Style;
    ShortCut := TEditButtonEh(Source).ShortCut;
    Visible := TEditButtonEh(Source).Visible;
    Width := TEditButtonEh(Source).Width;
  end else
    inherited Assign(Source);
end;

function TEditButtonEh.GetGlyph: TBitmap;
begin
  Result := FEditButtonControl.Glyph;
end;

function TEditButtonEh.GetNumGlyphs: Integer;
begin
  Result := FEditButtonControl.NumGlyphs;
end;

procedure TEditButtonEh.SetGlyph(const Value: TBitmap);
begin
  FEditButtonControl.Glyph := Value;
end;

procedure TEditButtonEh.SetNumGlyphs(const Value: Integer);
begin
  FEditButtonControl.NumGlyphs := Value;
end;

procedure TEditButtonEh.SetStyle(const Value: TEditButtonStyleEh);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    FEditButtonControl.Style := Value;
  end;
end;

procedure TEditButtonEh.SetWidth(const Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    if FEditControl <> nil then FEditControl.Perform(CM_CHILDWIDTHCHANGEDEH,Integer(Self),0);
    //FEditButtonControl.Width := Value;
  end;
end;

procedure TEditButtonEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    if FEditControl <> nil then FEditControl.Perform(CM_CHILDWIDTHCHANGEDEH,Integer(Self),0);
  end;
end;

{ TEditImageEh }

constructor TEditImageEh.Create(EditControl: TWinControl);
begin
  inherited Create;
  FEditControl := EditControl;
  FUseImageHeight := True;
end;

destructor TEditImageEh.Destroy;
begin
  inherited Destroy;
end;

procedure TEditImageEh.Assign(Source: TPersistent);
begin
  if Source is TEditImageEh then
  begin
    Images := TEditImageEh(Source).Images;
    ImageIndex := TEditImageEh(Source).ImageIndex;
    Visible := TEditImageEh(Source).Visible;
    Width := TEditImageEh(Source).Width;
  end else
    inherited Assign(Source);
end;

procedure TEditImageEh.SetImageIndex(const Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if FEditControl <> nil then FEditControl.Invalidate;
  end;
end;

procedure TEditImageEh.SetImages(const Value: TCustomImageList);
begin
  if FImages <> Value then
  begin
    FImages := Value;
    if FEditControl <> nil then
    begin
      FEditControl.Perform(CM_EDITIMAGECHANGEDEH,Integer(Self),0);
      if Value <> nil then Value.FreeNotification(FEditControl);
    end;
  end;
end;

procedure TEditImageEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    if FEditControl <> nil then FEditControl.Perform(CM_EDITIMAGECHANGEDEH,Integer(Self),0);
  end;
end;

procedure TEditImageEh.SetWidth(const Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    if FEditControl <> nil then FEditControl.Perform(CM_EDITIMAGECHANGEDEH,Integer(Self),0);
  end;
end;

procedure TEditImageEh.SetUseImageHeight(const Value: Boolean);
begin
  if FUseImageHeight <> Value then
  begin
    FUseImageHeight := Value;
    if FEditControl <> nil then FEditControl.Perform(CM_EDITIMAGECHANGEDEH,Integer(Self),0);
  end;
end;

{ TFieldDataLinkEh }

constructor TFieldDataLinkEh.Create;
begin
  inherited Create;
  VisualControl := True;
  FDataIndepended := True;
  DataIndependentValue := Null;
end;

function TFieldDataLinkEh.Edit: Boolean;
begin
  if DataIndepended then
  begin
    if not Editing and not ReadOnly then
    begin
      FEditing := True;
      FModified := False;
      if Assigned(OnEditingChange) then OnEditingChange(Self);
    end;
  end else if CanModify then
    inherited Edit;
 Result := FEditing;
end;

function TFieldDataLinkEh.GetActive: Boolean;
begin
  if DataIndepended then Result := True
  else Result := inherited Active and (Field <> nil);
end;

function TFieldDataLinkEh.GetDataSetActive: Boolean;
begin
  Result := (DataSource <> nil) and (DataSource.DataSet <> nil) and DataSource.DataSet.Active;
end;

function TFieldDataLinkEh.GetCanModify: Boolean;
begin
//  Result := inherited CanModify or DataIndepended;
  Result := ((Field <> nil) and Field.CanModify) or DataIndepended;
end;

function TFieldDataLinkEh.GetDataSource: TDataSource;
begin
  Result := inherited DataSource;
end;

procedure TFieldDataLinkEh.Modified;
begin
  FModified := True;
end;

procedure TFieldDataLinkEh.RecordChanged(Field: TField);
begin
  if (Field = nil) or FieldFound(Field) then
  begin
    if Assigned(FOnDataChange) then FOnDataChange(Self);
    FModified := False;
  end;
end;

procedure TFieldDataLinkEh.SetDataSource(const Value: TDataSource);
begin
  if Value <> inherited DataSource then
  begin
    inherited DataSource := Value;
    UpdateDataIndepended;
  end;
end;

procedure TFieldDataLinkEh.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName :=  Value;
    UpdateField;
    UpdateDataIndepended;
  end;
end;

procedure TFieldDataLinkEh.SetText(Text:String);
begin
  if DataIndepended then
  begin
    DataIndependentValue := Text;
    RecordChanged(nil);
  end else if (Field is TMemoField) then {if Field <> nil then}
    Field.AsString := Text
  else
    Field.Text := Text;
end;

procedure TFieldDataLinkEh.SetValue(Value: Variant);
var i:Integer;
begin
  if DataIndepended then
  begin
    DataIndependentValue := Value;
    RecordChanged(nil);
  end else {if Field <> nil then} if FieldsCount > 1 then
  begin
    if VarEquals(Value,Null)
      then for i := 0 to FieldsCount-1 do Fields[i].AsVariant := Null
      else for i := 0 to FieldsCount-1 do Fields[i].AsVariant := Value[i]
  end else
    Field.AsVariant := Value;
end;

procedure TFieldDataLinkEh.UpdateData;
begin
  if DataIndepended then
  begin
    if FModified then
      if Assigned(OnUpdateData) then OnUpdateData(Self);
    FEditing := False;
    FModified := False;
  end else if FModified then
  begin
    if (Field <> nil) and Assigned(FOnUpdateData) then FOnUpdateData(Self);
    FModified := False;
  end;
end;

procedure TFieldDataLinkEh.UpdateDataIndepended;
begin
  if FDataIndepended <> ((DataSource = nil) and (FieldName = '')) then
  begin
    FDataIndepended := (DataSource = nil) and (FieldName = '');
    DataIndependentValue := Null;
    //if {FDataIndepended and} Assigned(OnRecordChange) then OnActiveChange(Self);
    LayoutChanged;
  end;
end;

procedure TFieldDataLinkEh.ActiveChanged;
begin
  UpdateField;
  if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TFieldDataLinkEh.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

function TFieldDataLinkEh.FieldFound(Value: TField): Boolean;
var i:Integer;
begin
  Result := False;
  for i := 0 to Length(FFields)-1 do
    if FFields[i] = Value then
    begin
      Result := True;
      Exit;
    end;
end;

procedure TFieldDataLinkEh.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and FieldFound(Field^) and (FControl is TWinControl) then
    if TWinControl(FControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(FControl).SetFocus;
    end;
end;

function TFieldDataLinkEh.GetField: TField;
begin
  if Length(FFields) = 0
    then Result := nil
    else Result := FFields[0];
end;

function TFieldDataLinkEh.GetFieldsCount: Integer;
begin
  Result := Length(FFields);
end;

function TFieldDataLinkEh.GetFieldsField(Index: Integer): TField;
begin
  if Length(FFields) = 0 then
    Result := nil else
    Result := FFields[Index];
end;

procedure TFieldDataLinkEh.LayoutChanged;
begin
  UpdateField;
end;

procedure TFieldDataLinkEh.Reset;
begin
  RecordChanged(nil);
end;

procedure TFieldDataLinkEh.SetMultiFields(const Value: Boolean);
begin
  if FMultiFields <> Value then
  begin
    FMultiFields := Value;
    UpdateField;
  end;
end;

procedure TFieldDataLinkEh.UpdateField;
var FieldList:TList;
begin
  FieldList := TList.Create;
  if inherited Active and (FFieldName <> '') then
  begin
    if MultiFields then
      if Assigned(FControl)
        then GetFieldsProperty(FieldList,DataSource.DataSet, FControl, FFieldName)
        else DataSet.GetFieldList(FieldList,FFieldName)
    else
      if Assigned(FControl)
        then FieldList.Add(GetFieldProperty(DataSource.DataSet, FControl, FFieldName))
        else FieldList.Add(DataSource.DataSet.FieldByName(FFieldName));
  end;
  SetField(FieldList);
  FieldList.Free;
end;

procedure TFieldDataLinkEh.UpdateRightToLeft;
var
  IsRightAligned: Boolean;
  AUseRightToLeftAlignment: Boolean;
begin
  if Assigned(FControl) and (FControl is TWinControl) then
    with FControl as TWinControl do
      if IsRightToLeft then
      begin
        IsRightAligned :=
          (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_RIGHT) = WS_EX_RIGHT;
        AUseRightToLeftAlignment :=
          DBUseRightToLeftAlignment(TControl(FControl), Field);
        if (IsRightAligned and (not AUseRightToLeftAlignment)) or
           ((not IsRightAligned) and AUseRightToLeftAlignment) then
          Perform(CM_RECREATEWND, 0, 0);
      end;
end;

procedure TFieldDataLinkEh.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    FModified := False;
    if Assigned(FOnEditingChange) then FOnEditingChange(Self);
  end;
end;

procedure TFieldDataLinkEh.SetField(Value: TList);
  function CompareFieldsAndList(Value: TList): Boolean;
  begin
    Result := True;
  end;
var i:Integer;
begin
  if CompareFieldsAndList(Value) then
  begin
    SetLength(FFields,Value.Count);
    for i := 0 to Value.Count-1 do FFields[i] := Value[i];
    EditingChanged;
    RecordChanged(nil);
    UpdateRightToLeft;
  end;
end;

{ TCustomDBEditEh }

procedure TCustomDBEditEh.ResetMaxLength;
var
  F: TField;
begin
  if (MaxLength > 0) then
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
    begin
      F := DataSource.DataSet.FindField(DataField);
      if Assigned(F) and (F.DataType in [ftString, ftWideString]) and (F.Size = MaxLength)
        then MaxLength := 0;
    end else
      MaxLength := 0;
end;

constructor TCustomDBEditEh.Create(AOwner: TComponent);
begin
{$ifdef eval}
  {$INCLUDE eval}
{$endif}
  //ComponentState := ComponentState + [csDesigning];
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := CreateDataLink;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := InternalUpdateData;
  FDataLink.OnActiveChange := ActiveChange;

  FEditSpeedButton := CreateEditButtonControl;
  FEditButton := CreateEditButton;
  FEditImage := CreateEditImage;

  UpdateControlReadOnly;
end;

destructor TCustomDBEditEh.Destroy;
begin
  FEditImage.Free;
  FEditButton.Free;
  FEditSpeedButton.Free;
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  inherited Destroy;
end;

procedure TCustomDBEditEh.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  if NewStyleControls then
  begin
    if Ctl3D then I := 8 else I := 6;
    if Flat then Dec(I,2);
    I := GetSystemMetrics(SM_CYBORDER) * I;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  if (EditImage.Images <> nil) and EditImage.UseImageHeight and
     (EditImage.Images.Height > Metrics.tmHeight)
    then Height := EditImage.Images.Height + I
    else Height := Metrics.tmHeight + I;
end;

function TCustomDBEditEh.ButtonRect: TRect;
begin
  if NewStyleControls and not Ctl3D and (BorderStyle = bsSingle)
    then Result := Rect(ClientWidth - FButtonWidth-1, 1, ClientWidth-1, ClientHeight-1)
    else Result := Rect(ClientWidth - FButtonWidth, 0, ClientWidth, ClientHeight);
  if inherited UseRightToLeftAlignment then
    OffsetRect(Result,FButtonWidth - ClientWidth,0);
end;

function TCustomDBEditEh.ButtonEnabled: Boolean;
begin
  Result := Enabled and FDataLink.Active;
end;

procedure TCustomDBEditEh.ButtonDown(IsDownButton:Boolean);
begin
  if EditButton.Style <> ebsUpDownEh then
    DropDown;
end;

procedure TCustomDBEditEh.DefaultHandler(var Message);
begin
  case TMessage(Message).Msg of
    WM_LBUTTONDBLCLK,WM_LBUTTONDOWN,WM_LBUTTONUP,
    WM_MBUTTONDBLCLK,WM_MBUTTONDOWN,WM_MBUTTONUP,
    WM_RBUTTONDBLCLK,WM_RBUTTONDOWN,WM_RBUTTONUP:
      with TWMMouse(Message) do
        if PtInRect(ButtonRect,Point(XPos,YPos)) or PtInRect(ImageRect,Point(XPos,YPos)) then
          Exit;
    WM_CHAR:
      with TWMKey(Message) do
        // Check wordwrap mode in future
        if Char(CharCode) in [#13,#10] then
          CharCode := 0;
  end;
  inherited DefaultHandler(Message);
end;

procedure TCustomDBEditEh.Loaded;
begin
  inherited Loaded;
  ResetMaxLength;
  if (csDesigning in ComponentState) then DataChange(Self);
  UpdateDrawBorder;
end;

procedure TCustomDBEditEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Handled, AutoRepeat: Boolean;
begin
  Handled := False;
  if EditButton.Style = ebsUpDownEh
    then AutoRepeat := True
    else AutoRepeat := False;
  if (Button = mbLeft) then
  begin
    if csLButtonDown in ControlState then SetFocus;
    //SetFocus;
    if not FFocused then Exit;
    if ButtonEnabled and OverButton(Point(X,Y)) then
    begin
      MouseCapture := True;

      FDownButton := 0;
      FPressed := False;
      FTracking := False;
      if EditButton.Style = ebsUpDownEh then
      begin
        if Y < (FButtonHeight div 2) then
        begin
          FDownButton := 1;
          with ButtonRect do
            FPressedRect := Rect(Left,Top,Right,Top+(FButtonHeight div 2));
        end else if Y > (FButtonHeight - FButtonHeight div 2) then
        begin
          FDownButton := 2;
          with ButtonRect do
            FPressedRect := Rect(Left,Top+(FButtonHeight - FButtonHeight div 2),Right,Top+FButtonHeight);
        end;
      end else
      begin
        FDownButton := 2;
        with ButtonRect do
          FPressedRect := Rect(Left,Top,Right,Top+FButtonHeight);
      end;
      if FDownButton <> 0 then
      begin
        FPressed := True;
        FTracking := True;
        UpdateButtonState;
        Repaint;

        if Assigned(FOnButtonDown) then
          FOnButtonDown(Self,FDownButton <> 2,AutoRepeat,Handled);
        //if not MouseCapture then Exit;
        if not Handled then ButtonDown(FDownButton = 2);
        if AutoRepeat then ResetTimer(InitRepeatPause);

      end;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCustomDBEditEh.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FTracking then TrackButton(X, Y);
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDBEditEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ADownButton: Integer;
    Handled: Boolean;
    APressedRect: TRect;
begin
  ADownButton := FDownButton;
  APressedRect := FPressedRect;
  StopTracking;
  Handled := False;
  if PtInRect(APressedRect,Point(X,Y)) and Assigned(FOnButtonClick) and (ADownButton <> 0) then
    FOnButtonClick(Self, Handled);
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TCustomDBEditEh.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
    if (FDataLink <> nil) and (AComponent = DataSource)
    then
      DataSource := nil
    else if (EditImage.Images <> nil)  and (AComponent = EditImage.Images)
    then
      EditImage.Images := nil;
end;

function TCustomDBEditEh.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TCustomDBEditEh.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (ShortCut(Key,Shift) = FEditButton.ShortCut) and ButtonEnabled then
  begin
    DropDown;
    Key := 0;
  end else if (Key = Word('A')) and (Shift = [ssCtrl]) then
    SelectAll;
  if ((Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift))) and not ReadOnly
    then FDataLink.Edit;
end;

procedure TCustomDBEditEh.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if not DataIndepended then
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and not IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      if not ReadOnly then FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
  end;
end;

function TCustomDBEditEh.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

function  TCustomDBEditEh.EditRect:TRect;
begin
  if NewStyleControls and not Ctl3D and (BorderStyle = bsSingle) then
    Result := Rect(1+FImageWidth, 1, ClientWidth - FButtonWidth-2, ClientHeight-1)
  else
    Result := Rect(FImageWidth, 0, ClientWidth - FButtonWidth-1, ClientHeight);
  if inherited UseRightToLeftAlignment then
    OffsetRect(Result,FButtonWidth-FImageWidth,0);
end;

procedure TCustomDBEditEh.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TCustomDBEditEh.SetFlat(const Value: Boolean);
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    FEditSpeedButton.Flat := FFlat;
    RecreateWnd;
  end;
end;

procedure TCustomDBEditEh.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then Invalidate;
    FDataLink.Reset;
  end;
end;

function TCustomDBEditEh.CreateEditButton: TEditButtonEh;
begin
  Result := TEditButtonEh.Create(Self,FEditSpeedButton);
end;

function TCustomDBEditEh.CreateEditButtonControl: TEditButtonControlEh;
begin
  Result := TEditButtonControlEh.Create(Self);
  with Result do
  begin
    ControlStyle := ControlStyle + [csReplicatable];
    Width := 10;
    Height := 17;
    Visible := True;
    Transparent := False;
    Parent := Self;
  end;
end;

function TCustomDBEditEh.CreateEditImage: TEditImageEh;
begin
  Result := TEditImageEh.Create(Self);
end;

function TCustomDBEditEh.CreateDataLink:TFieldDataLinkEh;
begin
  Result := TFieldDataLinkEh.Create;
end;

procedure TCustomDBEditEh.Change;
begin
  FDataLink.Modified;
  Modified := True;
  inherited Change;
end;

procedure TCustomDBEditEh.CreateParams(var Params: TCreateParams);
const
  Alignments: array[Boolean, Boolean, TAlignment] of DWORD =
    (((ES_LEFT, ES_LEFT, ES_LEFT),(ES_RIGHT, ES_RIGHT, ES_RIGHT)),
     ((ES_LEFT, ES_RIGHT, ES_CENTER),(ES_RIGHT, ES_LEFT, ES_CENTER)));
  WordWraps: array[Boolean] of DWORD = (0, ES_AUTOHSCROLL);
  PasswordChars: array[Boolean] of DWORD = (ES_MULTILINE, 0);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not WordWraps[FWordWrap] or
                  PasswordChars[PasswordChar <> #0] or
                  Alignments[FWordWrap, UseRightToLeftAlignment, Alignment];
end;

procedure TCustomDBEditEh.CreateWnd;
begin
  inherited CreateWnd;
  UpdateHeight;
  UpdateDrawBorder;
  if not EditButton.Visible then
    FButtonWidth := 0
  else if EditButton.Width > 0 then
    FButtonWidth := EditButton.Width
  else if Flat then
    FButtonWidth := FlatButtonWidth
  else
    FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);

  if not EditImage.Visible or (EditImage.Images = nil) then
    FImageWidth := 0
  else if (EditImage.Width > 0) and (EditImage.Images <> nil) then
    FImageWidth := EditImage.Width + 4 //  two pixel indent from left and right
  else if EditImage.Images <> nil then
    FImageWidth := EditImage.Images.Width + 4;
  SetEditRect;
end;

function TCustomDBEditEh.DataIndepended:Boolean;
begin
  Result := FDataLink.DataIndepended;
end;

function TCustomDBEditEh.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TCustomDBEditEh.ResetTimer(Interval: Integer);
begin
  if FTimerActive = False then
    SetTimer(Handle, 1, Interval, nil)
  else if Interval <> FTimerInterval then
  begin
    StopTimer;
    SetTimer(Handle, 1, Interval, nil);
  end;
  FTimerInterval := Interval;
  FTimerActive := True;
end;

procedure TCustomDBEditEh.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState))
    then FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
  DataChange(nil);
  Invalidate;
end;

procedure TCustomDBEditEh.SetEditRect;
var
  Loc: TRect;
  AClientHeight:Integer;
begin
  if EditButton.Visible then
    if inherited UseRightToLeftAlignment
       then SetRect(Loc, FButtonWidth+1, 0, ClientWidth, ClientHeight)
       else SetRect(Loc, 0, 0, ClientWidth - FButtonWidth, ClientHeight)
  else
    SetRect(Loc, 0, 0, ClientWidth, ClientHeight);
  if EditImage.Visible and (EditImage.Images <> nil) then
    if inherited UseRightToLeftAlignment
      then Dec(Loc.Right,FImageWidth)
      else Inc(Loc.Left,FImageWidth);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));

  AClientHeight := ClientHeight;
  if NewStyleControls and not Ctl3D and (BorderStyle = bsSingle) then
    Dec(AClientHeight,2);
  if AClientHeight > Round(FButtonWidth * 3 / 2)
    then FButtonHeight := FButtonWidth
    else FButtonHeight := AClientHeight;
  if Flat and EditButton.Visible
    then FButtonLineWidth := 1
    else FButtonLineWidth := 0;

  with ButtonRect do
    if inherited UseRightToLeftAlignment then
      FEditSpeedButton.BoundsRect := Rect(Left,Top,Right-FButtonLineWidth,Top+FButtonHeight)
    else
      FEditSpeedButton.BoundsRect := Rect(Left+FButtonLineWidth,Top,Right,Top+FButtonHeight);
  FEditSpeedButton.Visible := EditButton.Visible;
end;

function TCustomDBEditEh.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TCustomDBEditEh.SetDataField(const Value: string);
begin
  if not (csDesigning in ComponentState) then
    ResetMaxLength;
  FDataLink.FieldName := Value;
  UpdateButtonState;
  Invalidate;
end;

function TCustomDBEditEh.GetReadOnly: Boolean;
begin
  Result := FReadOnly;
end;

procedure TCustomDBEditEh.SetEditButton(const Value: TEditButtonEh);
begin
  FEditButton.Assign(Value);
end;

procedure TCustomDBEditEh.SetEditImage(const Value: TEditImageEh);
begin
  FEditImage.Assign(Value);
end;

procedure TCustomDBEditEh.SetReadOnly(Value: Boolean);
begin
  if FReadOnly <> Value then
  begin
    FReadOnly := Value;
    EditingChanged;
  end;
end;

procedure TCustomDBEditEh.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
    FPressed := False;
    FDownButton := 0;
    FPressedRect := Rect(0,0,0,0);
    UpdateButtonState;
    Repaint;
    StopTimer;
  end;
end;

procedure TCustomDBEditEh.TrackButton(X, Y: Integer);
var
  NewState: Boolean;
begin
  NewState := PtInRect(FPressedRect, Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    UpdateButtonState;
    Repaint;
  end;
end;

procedure TCustomDBEditEh.UpdateButtonState;
begin
  with TEditButtonControlEh(FEditSpeedButton) do
    if not ButtonEnabled then
    begin
      Enabled := False;
      SetState(bsDisabled,FBorderActive,FDownButton)
    end else if FPressed then
    begin
      Enabled := True;
      SetState(bsDown,FBorderActive,FDownButton);
    end else
    begin
      Enabled := True;
      SetState(bsUp,FBorderActive,0);
    end;
end;

procedure TCustomDBEditEh.UpdateControlReadOnly;
begin
  SetControlReadOnly(not FDataLink.CanModify or ReadOnly);
end;

function TCustomDBEditEh.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TCustomDBEditEh.ActiveChange(Sender: TObject);
begin
  ActiveChanged;
end;

procedure TCustomDBEditEh.DataChange(Sender: TObject);
begin
  DataChanged;
  UpdateButtonState;
end;

procedure TCustomDBEditEh.DrawBorder(DC: HDC; ActiveBorder: Boolean);
var
  R: TRect;
  BtnFaceBrush: HBRUSH;
  NeedReleaseDC: Boolean;
begin
  if not (NewStyleControls and Ctl3D and (BorderStyle = bsSingle))
    or not HandleAllocated then Exit;

  NeedReleaseDC := False;
  if DC = 0 then
  begin
    DC := GetWindowDC(Handle);
    NeedReleaseDC := True;
  end;
  BtnFaceBrush := GetSysColorBrush(COLOR_BTNFACE);

  GetWindowRect(Handle, R);
  OffsetRect (R, -R.Left, -R.Top);

  if ActiveBorder
    then DrawEdge (DC, R, BDR_SUNKENOUTER, BF_RECT)
    else FrameRect(DC, R, BtnFaceBrush);

  OffsetRect (R, -R.Left, -R.Top);
  InflateRect(R, -1, -1);
  FrameRect (DC, R, BtnFaceBrush);

  if NeedReleaseDC then
    ReleaseDC(Handle, DC);
end;

procedure TCustomDBEditEh.DrawButtonLine(DC: HDC);
var BRect: TRect;
    NeedReleaseDC: Boolean;
    Brush: HBRUSH;
begin
  if FButtonLineWidth = 0 then Exit;

  NeedReleaseDC := False;
  if DC = 0 then
  begin
    DC := GetDC(Handle);
    NeedReleaseDC := True;
  end;

  BRect := ButtonRect;
  BRect.Right := BRect.Left + FButtonLineWidth;
  BRect.Bottom := BRect.Top + FButtonHeight;
  if FBorderActive then
    FrameRect(DC, BRect,GetSysColorBrush(COLOR_BTNFACE))
  else
  begin
    Brush := CreateSolidBrush(ColorToRGB(Color));
    FrameRect(DC, BRect,Brush);
    DeleteObject(Brush);
  end;

  if NeedReleaseDC then
    ReleaseDC(Handle, DC);
end;

function GetRGBColor(Value: TColor): DWORD;
begin
  Result := ColorToRGB(Value);
  case Result of
    clNone: Result := CLR_NONE;
    clDefault: Result := CLR_DEFAULT;
  end;
end;

procedure DrawImage(DC: HDC; ARect:TRect; Images:TCustomImageList;
                    ImageIndex:Integer; Selected: Boolean);
const
  ImageTypes: array[TImageType] of Longint = (0, ILD_MASK);
  ImageSelTypes: array[Boolean] of Longint = (0, ILD_SELECTED);
var CheckedRect,AUnionRect:TRect;
    OldRectRgn,RectRgn:HRGN;
    r,x,y:Integer;
    procedure DrawIm;
    var ABlendColor: TColor;
    begin
      with Images do
        if HandleAllocated then
        begin
          if Selected then  ABlendColor := clHighlight
          else ABlendColor := BlendColor;
          ImageList_DrawEx(Handle, ImageIndex, DC, x, y, 0, 0,
            GetRGBColor(BkColor), GetRGBColor(ABlendColor),
            ImageTypes[ImageType] or ImageSelTypes[Selected]);
        end;
    end;
begin
  with Images do
  begin
    x := (ARect.Right + ARect.Left - Images.Width) div 2;
    y := (ARect.Bottom + ARect.Top - Images.Height) div 2;
    CheckedRect := Rect(X,Y,X+Images.Width,Y+Images.Height);
    UnionRect(AUnionRect,CheckedRect,ARect);
    if EqualRect(AUnionRect,ARect) then // ARect containt image
      DrawIm
    else
    begin                          // Need clip
      OldRectRgn := CreateRectRgn(0,0,0,0);
      r := GetClipRgn(DC, OldRectRgn);
      RectRgn := CreateRectRgn(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
      SelectClipRgn(DC, RectRgn);
      DeleteObject(RectRgn);

      DrawIm;

      if r = 0
        then SelectClipRgn(DC, 0)
        else SelectClipRgn(DC, OldRectRgn);
      DeleteObject(OldRectRgn);
    end;
  end;
end;

procedure TCustomDBEditEh.DrawEditImage(DC: HDC);
var ImRect:TRect;
begin
  with EditImage do
  begin
    if not Visible or (Images = nil) or (ImageIndex < 0) then Exit;
    ImRect := ImageRect;
    InflateRect(ImRect,-2,-1);
    DrawImage(DC,ImRect,Images,ImageIndex,False);
  end;
end;

procedure TCustomDBEditEh.EditingChange(Sender: TObject);
begin
  EditingChanged;
end;

function TCustomDBEditEh.PostDataEvent: Boolean;
begin
  Result := False;
  FDataPosting := True;
  try
    if Assigned(FOnUpdateData) then FOnUpdateData(Self,Result);
  finally
    FDataPosting := False;
  end;
end;

procedure TCustomDBEditEh.ReadEditMask(Reader: TReader);
begin
  EditMask := Reader.ReadString;
end;

procedure TCustomDBEditEh.WriteEditMask(Writer: TWriter);
begin
  Writer.WriteString(EditMask);
end;

procedure TCustomDBEditEh.InternalUpdateData(Sender: TObject);
begin
  UpdateData;
end;

procedure TCustomDBEditEh.UpdateDrawBorder;
var NewBorderActive:Boolean;
begin
  if (csLoading in ComponentState) then Exit;
  NewBorderActive := (csDesigning in ComponentState) or (GetFocus = Handle)
                  or FMouseAboveControl or AlwaysShowBorder;
  if NewBorderActive <> FBorderActive then
  begin
    FBorderActive := NewBorderActive;
    if NewStyleControls and Ctl3D and (BorderStyle = bsSingle) and Flat
      then DrawBorder(0,FBorderActive);
    UpdateButtonState;
    DrawButtonLine(0);
  end;
end;

procedure TCustomDBEditEh.WMUndo(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TCustomDBEditEh.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TCustomDBEditEh.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TCustomDBEditEh.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS or DLGC_HASSETSEL;
end;

procedure TCustomDBEditEh.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  inherited;
  if (Message.CharCode = VK_ESCAPE) and Modified then
    Message.Result := 1;
end;

procedure TCustomDBEditEh.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  ClearButtonsBitmapCache;
end;

procedure TCustomDBEditEh.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
  if AutoSelect and not (csLButtonDown in ControlState) then SelectAll;
  if SysLocale.FarEast and FDataLink.CanModify then
    SetControlReadOnly(False);
  UpdateDrawBorder;
  Invalidate;
end;

procedure TCustomDBEditEh.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  SetFocused(False);
  CheckCursor;
  DoExit;
  UpdateDrawBorder;
  Invalidate;
end;

procedure TCustomDBEditEh.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if (csFixedHeight in ControlStyle) and not ((csDesigning in
    ComponentState) and (csLoading in ComponentState)) then AdjustHeight;
end;

procedure TCustomDBEditEh.CMMouseEnter(var Message: TMessage);
begin
  if Message.LParam = 0 then
  begin
    FMouseAboveControl := True;
    UpdateDrawBorder;
  end;
end;

procedure TCustomDBEditEh.CMMouseLeave(var Message: TMessage);
begin
  if Message.LParam = 0 then
  begin
    FMouseAboveControl := False;
    UpdateDrawBorder;
  end;
end;

procedure TCustomDBEditEh.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TCustomDBEditEh.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
end;

procedure TCustomDBEditEh.WMNCPaint(var Message: TMessage);
begin
  if NewStyleControls and Ctl3D and (BorderStyle = bsSingle) and Flat then
  begin
    DrawBorder(0,FBorderActive);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TCustomDBEditEh.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  if PtInRect(ButtonRect,Point(P.X,P.Y)) or PtInRect(ImageRect,Point(P.X,P.Y))
    then Windows.SetCursor(LoadCursor(0, idc_Arrow))
    else inherited;
end;

procedure TCustomDBEditEh.CheckCursor;
var
  SelStart, SelStop: Integer;
begin
  if not HandleAllocated then  Exit;
  if (IsMasked) then
  begin
    GetSel(SelStart, SelStop);
    if SelStart = SelStop then
      if SelStart-2 < 0
        then SetCursor(0)
        else SetCursor(SelStart-2);
  end;
end;

{ // Fixing up bug with mouseclick cursor pos in masked mode
procedure TCustomDBEditEh.EMGetSel(var Message: TMessage);
begin
  inherited;
  if FFixingCurPos and (PInteger(Message.WParam)^ = PInteger(Message.LParam)^) then
  begin
    PInteger(Message.WParam)^ := PInteger(Message.WParam)^ - 3;
    if PInteger(Message.WParam)^ < 0 then PInteger(Message.WParam)^ := 0;
    PInteger(Message.LParam)^ := PInteger(Message.LParam)^ - 3;
    if PInteger(Message.LParam)^ < 0 then PInteger(Message.LParam)^ := 0;
  end;
end;
}

procedure TCustomDBEditEh.PaintWindow(DC: HDC);
const
  AlignStyle : array[Boolean, TAlignment] of DWORD =
   ((WS_EX_LEFT, WS_EX_RIGHT, WS_EX_LEFT),
    (WS_EX_RIGHT, WS_EX_LEFT, WS_EX_LEFT));
var
  Left: Integer;
  Margins: TPoint;
  R: TRect;
//  DC: HDC;
  PS: TPaintStruct;
  S: string;
  AAlignment: TAlignment;
  ExStyle: DWORD;
  PaintControlName:Boolean;
//  TextPainted:Boolean;
begin
  DrawButtonLine(DC);
  DrawEditImage(DC);
  AAlignment := Alignment;
  if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
  PaintControlName := (csDesigning in ComponentState) and not (FDataLink.Active);
//  TextPainted := False;
  if ((AAlignment = taLeftJustify) or FFocused or FWordWrap) and
    not (csPaintCopy in ControlState) and not PaintControlName then
  begin
    if SysLocale.MiddleEast and HandleAllocated and (IsRightToLeft) then
    begin { This keeps the right aligned text, right aligned }
      ExStyle := DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) and (not WS_EX_RIGHT) and
        (not WS_EX_RTLREADING) and (not WS_EX_LEFTSCROLLBAR);
      if UseRightToLeftReading then ExStyle := ExStyle or WS_EX_RTLREADING;
      if UseRightToLeftScrollbar then ExStyle := ExStyle or WS_EX_LEFTSCROLLBAR;
      ExStyle := ExStyle or
        AlignStyle[UseRightToLeftAlignment, AAlignment];
      if DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) <> ExStyle then
        SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
    end;
    inherited PaintWindow(DC);
//    with EditImage do
//      if not Visible or (ImageList = nil) or (ImageIndex < 0) then Exit;
//    TextPainted := True;
    Exit;
  end;
{ Since edit controls do not handle justification unless multi-line (and
  then only poorly) we will draw right and center justify manually unless
  the edit has the focus. }
  if FCanvas = nil then
  begin
    FCanvas := TControlCanvas.Create;
    FCanvas.Control := Self;
  end;
//  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
//    with EditImage do
//      if Visible and (ImageList <> nil) and (ImageIndex >= 0) then
//        DrawEditImage(FCanvas);
//    if TextPainted then Exit;

    FCanvas.Font := Font;
    with FCanvas do
    begin
      R := ClientRect;
      if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then
      begin
        Brush.Color := clWindowFrame;
        FrameRect(R);
        InflateRect(R, -1, -1);
      end;
      R := EditRect;
      Brush.Color := Color;
      if not Enabled then
        Font.Color := clGrayText;
      if PaintControlName then
        S := Name
      else if (csPaintCopy in ControlState) and (FDataLink.Field <> nil) then
      begin
        S := FDataLink.Field.DisplayText;
        case CharCase of
          ecUpperCase: S := AnsiUpperCase(S);
          ecLowerCase: S := AnsiLowerCase(S);
        end;
      end else
        S := EditText;
      if PasswordChar <> #0 then FillChar(S[1], Length(S), PasswordChar);
      Margins := GetTextMargins;
      case AAlignment of
        taLeftJustify: Left := Margins.X;
        taRightJustify: Left := EditRect.Right {ClientWidth} - TextWidth(S) - Margins.X;
      else
        Left := (EditRect.Right {ClientWidth} - TextWidth(S)) div 2;
      end;
      if SysLocale.MiddleEast then UpdateTextFlags;
      TextRect(R, Left, Margins.Y, S);
    end;
  finally
    FCanvas.Handle := 0;
    if DC = 0 then EndPaint(Handle, PS);
  end;
end;

procedure TCustomDBEditEh.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TCustomDBEditEh.GetVariantValue: Variant;
begin
  if DataIndepended then
    Result := Variant({Edit}Text)
  else
    Result := Variant(Text);
end;

function TCustomDBEditEh.IsValidChar(InputChar: Char): Boolean;
begin
  if (FDataLink.Field <> nil) then
    Result := FDataLink.Field.IsValidChar(InputChar)
  else
    Result := True;
end;

procedure TCustomDBEditEh.CMChildWidthChangedEh(var Message: TMessage);
begin
  RecreateWnd;
end;

procedure TCustomDBEditEh.CMDialogKey(var Message: TCMDialogKey);
begin
  inherited;
end;

procedure TCustomDBEditEh.CMEditImageChangedEh(var Message: TMessage);
begin
  RecreateWnd;
end;

procedure TCustomDBEditEh.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  UpdateButtonState;
end;

function TCustomDBEditEh.GetTextMargins: TPoint;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  if NewStyleControls then
  begin
    if BorderStyle = bsNone then I := 0 else
      if Ctl3D then I := 1 else I := 2;
    Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
    Result.Y := I;
  end else
  begin
    if BorderStyle = bsNone then I := 0 else
    begin
      DC := GetDC(0);
      GetTextMetrics(DC, SysMetrics);
      SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
      ReleaseDC(0, DC);
      I := SysMetrics.tmHeight;
      if I > Metrics.tmHeight then I := Metrics.tmHeight;
      I := I div 4;
    end;
    Result.X := I;
    Result.Y := I;
  end;
end;

function TCustomDBEditEh.OverButton(const P: TPoint): Boolean;
begin
  with ButtonRect do
    Result := PtInRect(Rect(Left,Top,Right,Top+FButtonHeight) , P);
end;

function TCustomDBEditEh.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TCustomDBEditEh.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TCustomDBEditEh.UpdateHeight;
begin
  if AutoSize and (BorderStyle = bsSingle) then
  begin
    ControlStyle := ControlStyle + [csFixedHeight];
    AdjustHeight;
  end else
    ControlStyle := ControlStyle - [csFixedHeight];
end;

function TCustomDBEditEh.GetText: String;
begin
  Result := inherited Text;
end;

procedure TCustomDBEditEh.SetText(const Value: String);
begin
  if (csDesigning in ComponentState) and not DataIndepended then Exit;
  if not DataIndepended then DataSource.DataSet.Edit;
  InternalSetText(Value);
  if FDataPosting then Exit;
  try
    UpdateData;
  except
    FDataLink.Reset;
    raise;
  end;
end;

function TCustomDBEditEh.GetValue: Variant;
begin
  Result := GetVariantValue;
end;

procedure TCustomDBEditEh.SetValue(const Value: Variant);
begin
  SetVariantValue(Value);
end;

procedure TCustomDBEditEh.SetVariantValue(const VariantValue: Variant);
begin
  if (csDesigning in ComponentState) and not DataIndepended then Exit;
  if not DataIndepended then DataSource.DataSet.Edit;
  InternalSetValue(VariantValue);
  if FDataPosting then Exit;
  try
    UpdateData;
  except
    FDataLink.Reset;
    raise;
  end;
end;

procedure TCustomDBEditEh.SetControlEditMask(Value:string);
begin
  inherited EditMask := Value;
end;

procedure TCustomDBEditEh.SetControlReadOnly(Value:Boolean);
begin
  inherited ReadOnly := Value;
end;

function TCustomDBEditEh.ImageRect: TRect;
begin
  Result := Rect(0, 0, FImageWidth, ClientHeight);
  if inherited UseRightToLeftAlignment then
    OffsetRect(Result,ClientWidth-FImageWidth,0);
end;

procedure TCustomDBEditEh.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
    FTimerInterval := -1;
  end;
end;

procedure TCustomDBEditEh.InternalUpdatePostData;
begin
  if DataIndepended then FDataLink.SetText(EditText)
  else FDataLink.SetText(Text);
end;

procedure TCustomDBEditEh.UpdateData;
begin
  if FFocused then ValidateEdit;
  if not PostDataEvent then
    InternalUpdatePostData;
end;

procedure TCustomDBEditEh.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
end;

procedure TCustomDBEditEh.DropDown;
begin
end;

procedure TCustomDBEditEh.CloseUp(Accept: Boolean);
begin
end;

procedure TCustomDBEditEh.ActiveChanged;
begin
  ResetMaxLength;
  UpdateButtonState;
end;

procedure TCustomDBEditEh.DataChanged;
begin
  if FDataLink.Field <> nil then
  begin
    (*if (FAlignment <> FDataLink.Field.Alignment) and not PersistentProps['Alignment'] then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
      Invalidate;
    end;*)
    if FAlignment <> FDataLink.Field.Alignment then Invalidate;
    if not (evEditMaskEh in FAssignedValues) then
      SetControlEditMask(FDataLink.Field.EditMask);
    if not (csDesigning in ComponentState) then
    begin
      if (FDataLink.Field.DataType in [ftString, ftWideString]) and (MaxLength = 0) then
        MaxLength := FDataLink.Field.Size;
    end;
    if FFocused and FDataLink.CanModify then
      if (FDataLink.Field is TMemoField) then
        InternalSetText(FDataLink.Field.AsString)
      else InternalSetText(FDataLink.Field.Text)
    else
    begin
      if (FDataLink.Field is TMemoField) then
        EditText := FDataLink.Field.AsString
      else EditText := FDataLink.Field.DisplayText;
      {if FDataLink.Editing and FDataLink.FModified then
        Modified := True;}
    end;
  end
  else if DataIndepended then
  begin
    if not (evEditMaskEh in FAssignedValues) then
      SetControlEditMask('');
    EditText := VarToStr(FDataLink.DataIndependentValue);
    //InternalSetText(VarToStr(FDataLink.DataIndependentValue));
  end else
  begin
    if not (evEditMaskEh in FAssignedValues) then
      SetControlEditMask('');
    EditText := '';
  end;
  UpdateControlReadOnly;
  Modified := False;
end;

procedure TCustomDBEditEh.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('EditMask', ReadEditMask, WriteEditMask, IsEditMaskStored);
end;

procedure TCustomDBEditEh.EditingChanged;
begin
  UpdateControlReadOnly;
end;

procedure TCustomDBEditEh.InternalSetText(AText:String);
begin
  inherited Text := AText;
end;

procedure TCustomDBEditEh.InternalSetValue(AValue:Variant);
begin
  InternalSetText(VarToStr(AValue));
end;

{ TPopupMonthCalendar }

type
  TPopupMonthCalendar = class(TMonthCalendar)
  private
    FOwner:TCustomDBDateTimeEditEh;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  protected
    constructor CreateEh(AOwner:TCustomDBDateTimeEditEh);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
end;

constructor TPopupMonthCalendar.CreateEh(AOwner: TCustomDBDateTimeEditEh);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  AutoSize := True;
end;

procedure TPopupMonthCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER or WS_POPUP;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupMonthCalendar.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key,Shift);
  if Key in [VK_RETURN,VK_ESCAPE] then
  begin
    FOwner.CloseUp(Key = VK_RETURN);
    Key := 0;
  end;
end;

procedure TPopupMonthCalendar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button,Shift,X,Y);
  if not PtInRect(Rect(0,0,Width,Height),Point(X,Y)) then
    FOwner.CloseUp(False)
end;

procedure TPopupMonthCalendar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var MCHInfo:TMCHitTestInfo;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if not PtInRect(Rect(0,0,Width,Height),Point(X,Y)) then Exit;
  MCHInfo.cbSize := SizeOf(TMCHitTestInfo);
  MCHInfo.pt.x := X;
  MCHInfo.pt.y := Y;
  MonthCal_HitTest(Handle,MCHInfo);
  if ((MCHInfo.uHit and MCHT_CALENDARDATE) > 0) and  (MCHInfo.uHit <> MCHT_CALENDARDAY) and
   (MCHInfo.uHit <> MCHT_TITLEBTNNEXT) and (MCHInfo.uHit <> MCHT_TITLEBTNPREV) then
    FOwner.CloseUp(True)
  else if (MCHInfo.uHit and MCHT_NOWHERE > 0) then
    FOwner.CloseUp(False)
  else if not ((X >= 0) and (Y >= 0) and (X < Width) and (Y < Height)) then
    FOwner.CloseUp(False);
end;

procedure TPopupMonthCalendar.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) then
  begin
    FOwner.CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TPopupMonthCalendar.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TPopupMonthCalendar.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if GetParent(Message.FocusedWnd) <> Handle then
    FOwner.CloseUp(False);
end;

procedure TCustomDBEditEh.WMTimer(var Message: TWMTimer);
var Handled, AutoRepeat: Boolean;
begin
  inherited;
  if not FPressed then Exit;
  if FTimerInterval = InitRepeatPause then ResetTimer(RepeatPause);
  AutoRepeat := True;
  Handled := False;
  if Assigned(FOnButtonClick)
    then FOnButtonDown(Self,FDownButton <> 2,AutoRepeat, Handled);
  if not Handled and FPressed then
    if FDownButton = 1 then ButtonDown(False)
    else if FDownButton = 2 then ButtonDown(True);
end;

procedure TCustomDBEditEh.WMSize(var Message: TWMSize);
begin
  inherited;
  SetEditRect;
end;

function TCustomDBEditEh.GetAlignment: TAlignment;
begin
  if evAlignmentEh in FAssignedValues then Result := FAlignment
  else Result := DefaultAlignment;
end;

procedure TCustomDBEditEh.SetAlignment(const Value: TAlignment);
begin
  if (evAlignmentEh in FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FAssignedValues, evAlignmentEh);
  if WordWrap
    then RecreateWnd
    else Invalidate;
end;

function TCustomDBEditEh.IsAlignmentStored: Boolean;
begin
  Result := (evAlignmentEh in FAssignedValues);
end;

function TCustomDBEditEh.DefaultAlignment: TAlignment;
begin
  if Assigned(Field)
    then Result := Field.Alignment
    else Result := taLeftJustify;
end;

function TCustomDBEditEh.GetEditMask: String;
begin
  Result := inherited EditMask;
end;

procedure TCustomDBEditEh.SetEditMask(const Value: String);
var OldText:String;
begin
  OldText := '';
  if (evEditMaskEh in FAssignedValues) and (Value = inherited EditMask) then Exit;
  if (csLoading in ComponentState) and (Text <> '') and DataIndepended then
    OldText := Text;
  inherited EditMask := Value;
  Include(FAssignedValues, evEditMaskEh);
  if (csLoading in ComponentState) and (OldText <> '') and DataIndepended then
    InternalSetText(OldText);
  if {not (csLoading in ComponentState) and }DataIndepended then
    InternalUpdatePostData
  else
    DataChange(nil);
end;

function TCustomDBEditEh.IsEditMaskStored: Boolean;
begin
  Result := (evEditMaskEh in FAssignedValues);
end;

function TCustomDBEditEh.DefaultEditMask: String;
begin
  if Assigned(Field)
    then Result := Field.EditMask
    else Result := '';
end;

function TCustomDBEditEh.IsTextStored: Boolean;
begin
  Result := (Text <> '') and DataIndepended;
end;

function TCustomDBEditEh.IsValueStored: Boolean;
begin
  Result := (Value <> Null) and DataIndepended;
end;

{$IFNDEF EH_LIB_6}
function TCustomDBEditEh.GetAutoSize: Boolean;
begin
  Result := inherited AutoSize;
end;
{$ENDIF}

procedure TCustomDBEditEh.SetAutoSize(Value: Boolean);
begin
  if AutoSize <> Value then
  begin
    {$IFDEF EH_LIB_6}
    inherited SetAutoSize(Value);
   {$ELSE}
    inherited AutoSize := Value;
   {$ENDIF}
    UpdateHeight;
  end;
end;

procedure TCustomDBEditEh.SetAlwaysShowBorder(const Value: Boolean);
begin
  if FAlwaysShowBorder <> Value then
  begin
    FAlwaysShowBorder := Value;
    UpdateDrawBorder;
  end;
end;

procedure TCustomDBEditEh.SetWordWrap(const Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    RecreateWnd;
  end;
end;

{ TCustomDBDateTimeEditEh }

type   TDateOrder = (doMDY, doDMY, doYMD);
const
  CenturyOffset: Byte = 60;
  DefaultDateOrder = doDMY;

function MakeStr(C: Char; N: Integer): string;
begin
  if N < 1
    then Result := ''
  else
  begin
    SetLength(Result, N);
    FillChar(Result[1], Length(Result), C);
  end;
end;

function MonthFromName(const S: string; MaxLen: Byte): Byte;
begin
  if Length(S) > 0 then
    for Result := 1 to 12 do
    begin
      if (Length(LongMonthNames[Result]) > 0) and
        (AnsiCompareText(Copy(S, 1, MaxLen),
        Copy(LongMonthNames[Result], 1, MaxLen)) = 0)
        then Exit;
    end;
  Result := 0;
end;

procedure ExtractMask(const Format, S: string; Ch: Char; Cnt: Integer;
  var I: Integer; Blank, Default: Integer);
var
  Tmp: string[20];
  J, L: Integer;
begin
  I := Default;
  Ch := UpCase(Ch);
  L := Length(Format);
  if Length(S) < L then L := Length(S)
  else if Length(S) > L then Exit;
  J := Pos(MakeStr(Ch, Cnt), AnsiUpperCase(Format));
  if J <= 0 then Exit;
  Tmp := '';
  while (J <= L) and (UpCase(Format[J]) = Ch) do
  begin
    if S[J] <> ' ' then Tmp := Tmp + S[J];
    Inc(J);
  end;
  if Tmp = '' then I := Blank
  else if Cnt > 1 then
  begin
    I := MonthFromName(Tmp, Length(Tmp));
    if I = 0 then I := -1;
  end
  else I := StrToIntDef(Tmp, -1);
end;

function CurrentYear: Word;
var
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  Result := SystemTime.wYear;
end;

function ExpandYear(Year: Integer): Integer;
var
  N: Longint;
begin
  Result := Year;
  if Result < 100 then
  begin
    N := CurrentYear - CenturyOffset;
    Inc(Result, N div 100 * 100);
    if (CenturyOffset > 0) and (Result < N) then
      Inc(Result, 100);
  end;
end;

function DaysPerMonth(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and IsLeapYear(AYear) then Inc(Result); { leap-year Feb is special }
end;

function IsValidDate(Y, M, D: Integer): Boolean;
begin
  Result := (Y >= 1) and (Y <= 9999) and (M >= 1) and (M <= 12) and
    (D >= 1) and (D <= DaysPerMonth(Y, M));
end;

function IsValidTime(Hor, Min, Sec: Integer): Boolean;
begin
  Result := (Hor >= 0) and (Hor <= 23) and
            (Min >= 0) and (Min <= 59) and
            (Sec >= 0) and (Sec <= 59);
end;

function ScanDateStr(const Format, S: string; var D, M, Y: Integer): Boolean;
begin
  ExtractMask(Format, S, 'm', 3, M, -1, 0); { short month name? }
  if M = 0 then ExtractMask(Format, S, 'm', 1, M, -1, 0);
  ExtractMask(Format, S, 'd', 1, D, -1, 1);
  ExtractMask(Format, S, 'y', 1, Y, -1, CurrentYear);
  if Y > 0 then Y := ExpandYear(Y);
  Result := IsValidDate(Y, M, D);
end;

function ScanTimeStr(const Format, S: string; var Hor, Min, Sec: Integer): Boolean;
begin
  ExtractMask(Format, S, 'h', 1, Hor, -1, 0);
  ExtractMask(Format, S, 'n', 1, Min, -1, 0);
  ExtractMask(Format, S, 's', 1, Sec, -1, 0);
  Result := IsValidTime(Hor, Min, Sec);
end;

function CorrectDate(var Year, Month, Day: Integer): Boolean;
var CurYear,CurMonth,CurDay: Word;
begin
  Result := False;
  DecodeDate(Date,CurYear,CurMonth,CurDay);
  if Day <= 0 then Day := CurDay;
  if Month <= 0 then Month := CurMonth;
  if Year <= 0 then Year := CurYear;
  if Month > 12 then Month := 12;
  if Year > 9999 then Year := 9999;
  if DaysPerMonth(Year,Month) < Day then
    Day := DaysPerMonth(Year,Month);
  if (Day <> CurDay) or (Month <> CurMonth) or (Year <> CurYear) then
    Result := True;
end;

function CorrectTime(var Hor, Min, Sec: Integer): Boolean;
begin
  Result := False;
  if (Hor < 0) or (Min < 0) or (Sec < 0) or
     (Hor > 23) or (Min > 59) or (Sec > 59) then
  begin
    Result := True;
    if (Hor < 0) then Hor := 0;
    if Min < 0 then Min := 0;
    if Sec < 0 then Sec := 0;
    if Hor > 23 then Hor := 23;
    if Min > 59 then Min := 59;
    if Sec > 59 then Sec := 59;
  end;
end;

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := DefaultDateOrder;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
{$IFDEF RX_D3}
      'E': Result := doYMD;
{$ENDIF}
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := DefaultDateOrder; { default }
end;

function DefDateFormat(FourDigitYear: Boolean): string;
begin
  if FourDigitYear then
  begin
    case GetDateOrder(ShortDateFormat) of
      doMDY: Result := 'MM/DD/YYYY';
      doDMY: Result := 'DD/MM/YYYY';
      doYMD: Result := 'YYYY/MM/DD';
    end;
  end else
  begin
    case GetDateOrder(ShortDateFormat) of
      doMDY: Result := 'MM/DD/YY';
      doDMY: Result := 'DD/MM/YY';
      doYMD: Result := 'YY/MM/DD';
    end;
  end;
end;

function DefTimeFormat: string;
begin
  Result := 'HH:NN:SS';
end;

function DefDateMask(BlanksChar: Char; FourDigitYear: Boolean): string;
begin
  if FourDigitYear then
  begin
    case GetDateOrder(ShortDateFormat) of
      doMDY, doDMY: Result := '!99/99/9999;1;';
      doYMD: Result := '!9999/99/99;1;';
    end;
  end else
  begin
    case GetDateOrder(ShortDateFormat) of
      doMDY, doDMY: Result := '!99/99/99;1;';
      doYMD: Result := '!99/99/99;1;';
    end;
  end;
  if Result <> '' then Result := Result + BlanksChar;
end;

function DefTimeMask(BlanksChar: Char): string;
begin
  Result := '!99:99:99;1;' + BlanksChar;
end;

function DoEncodeDate(Year, Month, Day: Word; var Date: TDateTime): Boolean;
var
  I: Integer;
  DayTable: PDayTable;
begin
  Result := False;
  DayTable := @MonthDays[IsLeapYear(Year)];
  if (Year >= 1) and (Year <= 9999) and (Month >= 1) and (Month <= 12) and
    (Day >= 1) and (Day <= DayTable^[Month]) then
  begin
    for I := 1 to Month - 1 do Inc(Day, DayTable^[I]);
    I := Year - 1;
    Date := I * 365 + I div 4 - I div 100 + I div 400 + Day - DateDelta;
    Result := True;
  end;
end;

function InternalStrToDate(const DateFormat: String; var S: String;
            FourDigitYear, AutoCorrect, RaiseError: Boolean): Variant;
var
  D, M, Y: Integer;
  ADate:TDateTime;
begin
  Result := Null;
  if S <> '' then
  begin
    ScanDateStr(DateFormat, S, D, M, Y);
    if (Y >= 0) or (M >= 0) or (D >= 0) then
    begin
      if AutoCorrect then
        if CorrectDate(Y, M, D) then
          S := FormatDateTime(DefDateFormat(FourDigitYear),EncodeDate(Y, M, D));
      if DoEncodeDate(Y, M, D, ADate) then
        Result := ADate
      else if RaiseError then
        {$IFDEF EH_LIB_6}
        raise EConvertError.CreateRes(@SDateEncodeError);
        {$ELSE}
        raise EConvertError.Create(SDateEncodeError);
        {$ENDIF}
    end;
  end;
end;

function DoEncodeTime(Hour, Min, Sec, MSec: Word; var Time: TDateTime): Boolean;
begin
  Result := False;
  if (Hour < 24) and (Min < 60) and (Sec < 60) and (MSec < 1000) then
  begin
    Time := (Hour * 3600000 + Min * 60000 + Sec * 1000 + MSec) / MSecsPerDay;
    Result := True;
  end;
end;

function InternalStrToTime(const DateFormat: String; var S: String;
            AutoCorrect, RaiseError: Boolean): Variant;
var
  Hor, Min, Sec: Integer;
  ATime: TDateTime;
begin
  Result := Null;
  if S <> '' then
  begin
    ScanTimeStr(DateFormat, S, Hor, Min, Sec);
    if (Hor > -1) or (Min > -1) or (Sec > -1) then
    begin
      if AutoCorrect then
        if CorrectTime(Hor, Min, Sec) then
          S := FormatDateTime(DefTimeFormat,EncodeTime(Hor, Min, Sec, 0));
      if DoEncodeTime(Hor, Min, Sec, 0, ATime) then
        Result := ATime
      else if RaiseError then
        {$IFDEF EH_LIB_6}
        raise EConvertError.CreateRes(@SDateEncodeError);
        {$ELSE}
        raise EConvertError.Create(SDateEncodeError);
        {$ENDIF}
    end;
  end;
end;

procedure GetFormatElementAtPos(Text: String; var Pos, Len:Integer; FourDigitYear:Boolean);
var FormatChar:Char;
    DateFormat:String;
    i,fp,l:Integer;
begin
  DateFormat := DefDateFormat(FourDigitYear);
  if Pos > Length(DateFormat) then Pos := Length(DateFormat);
  FormatChar := DateFormat[Pos];
  if FormatChar in [DateSeparator,TimeSeparator] then
  begin
    Inc(Pos);
    if Pos > Length(DateFormat) then Exit;
    FormatChar := DateFormat[Pos];
  end;
  if not (AnsiUpperCase(FormatChar)[1] in ['D','M','Y','H','N','S']) then Exit;
  fp := 0;
  for i := 1 to Length(DateFormat) do
    if DateFormat[i] = FormatChar then
    begin
      fp := i;
      Break;
    end;
  l := Length(DateFormat) - fp + 1;
  for i := fp to Length(DateFormat) do
    if DateFormat[i] <> FormatChar then
    begin
      l := i-fp;
      Break;
    end;
  Pos := fp; Len := l;
end;

function IncrementStrDateAtPos(const Text, DateTimeFormat: String; IsIncrease:Boolean; var Pos, Len:Integer):String;
var FormatChar:Char;
    DFormat:String;
    i,fp,l,n:Integer;
begin
  Result := Text;
  if Pos > Length(DateTimeFormat) then Pos := Length(DateTimeFormat);
  FormatChar := DateTimeFormat[Pos];
  if FormatChar in [DateSeparator,TimeSeparator] then
  begin
    Inc(Pos);
    if Pos > Length(DateTimeFormat) then Exit;
    FormatChar := DateTimeFormat[Pos];
  end;
  if not (AnsiUpperCase(FormatChar)[1] in ['D','M','Y','H','N','S']) then Exit;
  fp := 0;
  for i := 1 to Length(DateTimeFormat) do
    if DateTimeFormat[i] = FormatChar then
    begin
      fp := i;
      Break;
    end;
  l := Length(DateTimeFormat) - fp + 1;
  DFormat := '';
  for i := fp to Length(DateTimeFormat) do
    if DateTimeFormat[i] <> FormatChar then
    begin
      l := i-fp;
      Break;
    end else
      DFormat := DFormat + '0';
  n := StrToIntDef(Copy(Text,fp,l),0);
  case AnsiUpperCase(FormatChar)[1] of
    'D': if IsIncrease then if n >= 31 then n := 1 else Inc(n)
         else if n <= 1 then n := 31 else Dec(n);
    'M': if IsIncrease then if n >= 12 then n := 1 else Inc(n)
         else if n <= 1 then n := 12 else Dec(n);
    'Y': if IsIncrease then if n >= 9999 then n := 1 else Inc(n)
         else if n <= 1 then n := 9999 else Dec(n);
    'H': if IsIncrease then if n >= 23 then n := 0 else Inc(n)
         else if n <= 0 then n := 23 else Dec(n);
    'N','S': if IsIncrease then if n >= 59 then n := 0 else Inc(n)
         else if n <= 0 then n := 59 else Dec(n);
  end;
  DFormat := FormatFloat(DFormat,n);
  Pos := fp; Len := l;
  Result := Copy(Text,1,fp-1) + DFormat + Copy(Text,fp+ l,255);
end;

constructor TCustomDBDateTimeEditEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  UpdateFourDigitYear;
  UpdateMask;
end;

destructor TCustomDBDateTimeEditEh.Destroy;
begin
  FDropDownCalendar.Free;
  inherited Destroy;
end;

procedure TCustomDBDateTimeEditEh.ButtonDown(IsDownButton: Boolean);
begin
  if (EditButton.Style = ebsUpDownEh) and (FDownButton<>0) then
  begin
    if not ReadOnly and FDataLink.Edit then
      IncrementItemAtCurPos(FDownButton=1)
  end else
    inherited ButtonDown(IsDownButton);
end;

procedure TCustomDBDateTimeEditEh.Change;
begin
  inherited Change;
  if not FInternalTextSetting then
    UpdateValueFromText;
end;

procedure TCustomDBDateTimeEditEh.DropDown;
var P:TPoint;
begin
  if not FCalendarVisible then
  begin
    if Value = Null then TPopupMonthCalendar(DropDownCalendar).Date := Date
    else TPopupMonthCalendar(DropDownCalendar).Date := Value;
    P := ClientToScreen(Point(0,Height));
    SetWindowPos(DropDownCalendar.Handle, HWND_TOPMOST, P.X, P.Y, 0, 0,
        SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    DropDownCalendar.Visible := True;
    FCalendarVisible := True;
  end else
   CloseUp(False);
end;

procedure TCustomDBDateTimeEditEh.ValidateEdit;
var S:String;
    V:Variant;
begin
  if FEditValidating then Exit;
  FEditValidating := True;
  try
    inherited ValidateEdit;
    S := Text;
    if Kind = dtkDateEh then
      V := InternalStrToDate(DateTimeFormat,S,FFourDigitYear,True,False)
    else
      V := InternalStrToTime(DateTimeFormat,S,True,False);
    if V = Null then InternalSetControlText('')
    else InternalSetControlText(FormatDateTime(DateTimeFormat,V));
    FValue := V;
  finally
    FEditValidating := False;
  end;
end;

procedure TCustomDBDateTimeEditEh.CloseUp(Accept: Boolean);
begin
  if FCalendarVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    if (GetFocus = DropDownCalendar.Handle) or
       (GetParent(GetFocus) = DropDownCalendar.Handle) then
      SetFocus;
    SetWindowPos(DropDownCalendar.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FCalendarVisible := False;
    DropDownCalendar.Visible := False;
    if Accept and not ReadOnly and FDataLink.Edit and (Kind = dtkDateEh) then
    begin
      InternalSetValue(TPopupMonthCalendar(DropDownCalendar).Date);
      if FFocused then SelectAll;
      /////Modified := True;
    end;
  end;
end;

function TCustomDBDateTimeEditEh.GetVariantValue: Variant;
//var s:String;
begin
  Result := FValue;
{  if FFocused then ValidateEdit;
  s := Text;
  if Kind = dtkDate then
    Result := InternalStrToDate(DateTimeFormat,s,True,True)
  else
    Result := InternalStrToTime(DateTimeFormat,s,True);}
end;

function TCustomDBDateTimeEditEh.GetDropDownCalendar: TWinControl;
begin
  if FDropDownCalendar = nil then
  begin
    FDropDownCalendar := TPopupMonthCalendar.CreateEh(Self);
    FDropDownCalendar.Visible := False;
    FDropDownCalendar.Parent := Self;
  end;
  Result := FDropDownCalendar;
end;

procedure TCustomDBDateTimeEditEh.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key in [VK_DOWN,VK_UP]) and (Shift = []) and not ReadOnly and FDataLink.Edit then
  begin
    if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);
    if Key = 0 then Exit;
    IncrementItemAtCurPos(Key=VK_UP);
    /////Modified := True;
  end else if (Key in [VK_LEFT,VK_RIGHT]) and (Shift = []) and (SelLength > 1) then
  begin
    if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);
    if Key = 0 then Exit;
    if Key = VK_LEFT then SetCursor(SelStart)
    else SetCursor(SelStart+SelLength-1);
  end;
  inherited KeyDown(Key,Shift);
end;

procedure TCustomDBDateTimeEditEh.KeyPress(var Key: Char);
var SStart,SLen,NewPos:Integer;
begin
  if FCalendarVisible and (Key in [#13, #27]) then
  begin
    CloseUp(Key = #13);
    Key := #0;
  end;
  inherited KeyPress(Key);
  if Key in [DateSeparator,TimeSeparator] then
  begin
    SStart := SelStart + 1;
    NewPos := Pos(Key,Copy(Text,SStart,255));
    if NewPos = 0 then NewPos := 1
    else Inc(NewPos,SStart+1);
    GetFormatElementAtPos(Text,NewPos,SLen,FFourDigitYear);
    SetSel(NewPos-1,NewPos + SLen - 1);
    Key := #0;
  end;
end;

procedure TCustomDBDateTimeEditEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    if FCalendarVisible then
    begin
      ListPos := DropDownCalendar.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(DropDownCalendar.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        MousePos.y := 0;  //To avoid activation of the year control
        SendMessage(DropDownCalendar.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDBDateTimeEditEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  //if FCalendarVisible then
  //  SetCaptureControl(DropDownCalendar);
end;

procedure TCustomDBDateTimeEditEh.UpdateFourDigitYear;
var AFourDigitYear:Boolean;
begin
  AFourDigitYear := (Pos('YYYY', AnsiUpperCase(ShortDateFormat)) > 0) or
                    (Pos('YYY', AnsiUpperCase(ShortDateFormat)) > 0);
  if AFourDigitYear <> FFourDigitYear then
  begin
    FFourDigitYear := AFourDigitYear;
    UpdateMask;
  end;
end;

procedure TCustomDBDateTimeEditEh.CMCancelMode(var Message: TCMCancelMode);
  function CheckActiveListChilds:Boolean;
  var i:Integer;
  begin
    Result := False;
    if DropDownCalendar <> nil then
      for i := 0 to DropDownCalendar.ControlCount - 1 do
        if DropDownCalendar.Controls[I] = Message.Sender then
        begin
          Result := True;
          Exit;
        end;
  end;
begin
  inherited;
  if (Message.Sender <> Self) and (Message.Sender <> DropDownCalendar) and
   not CheckActiveListChilds then
    CloseUp(False);
end;

procedure TCustomDBDateTimeEditEh.CMEnter(var Message: TCMEnter);
begin
  UpdateFourDigitYear;
  inherited;
end;

procedure TCustomDBDateTimeEditEh.WMKillFocus(var Message: TWMKillFocus);
begin
 if FCalendarVisible and not
   ( (Message.FocusedWnd = DropDownCalendar.Handle) or
     (GetParent(Message.FocusedWnd) = DropDownCalendar.Handle)
    ) then
     CloseUp(False);
 inherited;
end;

procedure TCustomDBDateTimeEditEh.WMGetDlgCode(var Message: TMessage);
begin
  inherited;
//  if FCalendarVisible then Message.Result := Message.Result or DLGC_WANTALLKEYS;
end;

procedure TCustomDBDateTimeEditEh.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) and FCalendarVisible then
  begin
    //CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TCustomDBDateTimeEditEh.WndProc(var Message: TMessage);
begin
  if FCalendarVisible then
  begin
    case Message.Msg of
      wm_KeyDown, wm_SysKeyDown, wm_Char:
      with TWMKey(Message) do
      begin
         if (CharCode in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT{, VK_RETURN, VK_ESCAPE}]) or
           ((CharCode in [VK_HOME,VK_END]) and (ssCtrl in KeyDataToShiftState(KeyData))) or
           ((CharCode in [VK_LEFT, VK_RIGHT]) ) then
         begin
           SendMessage(DropDownCalendar.Handle, Msg, Message.WParam, Message.LParam);
           Exit;
         end;
      end;
    end;
  end;
  inherited WndProc(Message);
end;

procedure TCustomDBDateTimeEditEh.DataChanged;
begin
  if FDataLink.Field <> nil then
  begin
    (*if (FAlignment <> FDataLink.Field.Alignment) and not PersistentProps['Alignment'] then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
      Invalidate;
    end;*)
    if FAlignment <> FDataLink.Field.Alignment then Invalidate;
    InternalSetValue(FDataLink.Field.Value);
    {if FDataLink.Editing and FDataLink.FModified then
      Modified := True;}
  end
  else if DataIndepended then
  begin
    //FAlignment := taLeftJustify;
    //if csDesigning in ComponentState then
    // EditText := Name else
      InternalSetValue(FDataLink.DataIndependentValue);
  end else
  begin
    //FAlignment := taLeftJustify;
    //if csDesigning in ComponentState then
    //  EditText := Name else
      InternalSetValue(Null);
  end;
  Modified := False;
end;

procedure TCustomDBDateTimeEditEh.InternalSetControlText(AText:String);
begin
  if FInternalTextSetting then Exit;
  FInternalTextSetting := True;
  try
    inherited InternalSetText(AText);
  finally
    FInternalTextSetting := False;
  end;
end;

procedure TCustomDBDateTimeEditEh.InternalSetText(AText:String);
begin
  if Kind = dtkDateEh
    then FValue := InternalStrToDate(DateTimeFormat,AText,FFourDigitYear,False,True)
    else FValue := InternalStrToTime(DateTimeFormat,AText,False,True);
  InternalSetControlText(AText);
end;

procedure TCustomDBDateTimeEditEh.InternalSetValue(AValue: Variant);
begin
  //if VarEquals(FValue,AValue) then Exit;

  if AValue = Null then
  begin
    InternalSetControlText('');
    FValue := Null;
  end else
  begin
    FValue := VarAsType(AValue,varDate);
    if Kind = dtkDateEh then
    begin
      FValue := Int(FValue);
      InternalSetControlText(FormatDateTime(DefDateFormat(FFourDigitYear),FValue));
    end else
    begin
      FValue := Frac(FValue);
      InternalSetControlText(FormatDateTime(DefTimeFormat,FValue));
    end;
  end;
end;

procedure TCustomDBDateTimeEditEh.IncrementItemAtCurPos(IsIncrease:Boolean);
var SStart,SLen:Integer;
begin
  SStart := SelStart + 1;
  SLen := SelLength;
  InternalSetControlText(IncrementStrDateAtPos(Text, DateTimeFormat, IsIncrease, SStart, SLen));
  UpdateValueFromText;
  SetCursor(SStart-1);
  SelLength := SLen;
end;

procedure TCustomDBDateTimeEditEh.SetKind(const Value: TDateTimeKindEh);
begin
  if Value <> FKind then
  begin
    FKind := Value;
    UpdateMask;
    DataChange(nil);
  end;
end;

procedure TCustomDBDateTimeEditEh.UpdateValueFromText;
var s:String;
begin
  s := Text;
  try
    if Kind = dtkDateEh then
      FValue := InternalStrToDate(DateTimeFormat,s,FFourDigitYear,False,False)
    else
      FValue := InternalStrToTime(DateTimeFormat,s,False,False);
  except
    on EConvertError do FValue := Null;
  end;
end;

procedure TCustomDBDateTimeEditEh.UpdateMask;
begin
  if Kind = dtkDateEh
    then SetControlEditMask(DefDateMask(' ',FFourDigitYear))
    else SetControlEditMask(DefTimeMask(' '));
end;

function TCustomDBDateTimeEditEh.DateTimeFormat: String;
begin
  if Kind = dtkDateEh
    then Result := DefDateFormat(FFourDigitYear)
    else Result := DefTimeFormat();
end;

procedure TCustomDBDateTimeEditEh.InternalUpdatePostData;
var v:Variant;
begin
  v := GetVariantValue;
  if (FDataLink.Field <> nil) and (v <> Null) then
    if Kind = dtkDateEh
      then FDataLink.SetValue(v + Frac(FDataLink.Field.AsDateTime))
      else FDataLink.SetValue(v + Integer(Trunc(FDataLink.Field.AsDateTime)))
  else
    FDataLink.SetValue(v);
end;

function TCustomDBDateTimeEditEh.CreateEditButton: TEditButtonEh;
begin
  Result := TVisibleEditButtonEh.Create(Self,FEditSpeedButton);
end;

{ TDateEditButtonEh }

constructor TVisibleEditButtonEh.Create(EditControl: TWinControl; EditButtonControl: TEditButtonControlEh);
begin
  inherited Create(EditControl,EditButtonControl);
  Visible := True;
end;

{ TDropDownBoxEh }

procedure TDropDownBoxEh.Assign(Source: TPersistent);
begin
  if Source is TDropDownBoxEh then
  begin
    Align := TDropDownBoxEh(Source).Align;
    Rows := TDropDownBoxEh(Source).Rows;
    Width := TDropDownBoxEh(Source).Width;
    Sizable := TDropDownBoxEh(Source).Sizable;
  end else
    inherited Assign(Source);
end;

{ TPopupListboxEh }

type
  TPopupListboxEh = class(TCustomListbox)
  private
    FImageList: TCustomImageList;
    FRowCount: Integer;
    FSearchText: String;
    FSearchTickCount: Longint;
    FSizeGrip:TSizeGripEh;
    FSizeGripResized:Boolean;
    function CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
    function GetBorderSize: Integer;
    function GetTextHeight: Integer;
    procedure CMSetSizeGripChangePosition(var Message:TMessage); message cm_SetSizeGripChangePosition;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure SetImageList(const Value: TCustomImageList);
    procedure SetRowCount(Value: Integer);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    property ImageList: TCustomImageList read FImageList write SetImageList;
    property RowCount: Integer read FRowCount write SetRowCount;
  public
    constructor Create(Owner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property SizeGrip: TSizeGripEh read FSizeGrip;
    property SizeGripResized:Boolean read FSizeGripResized write FSizeGripResized;
  end;

constructor TPopupListboxEh.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  Style := lbOwnerDrawFixed;
  FSizeGrip := TSizeGripEh.Create(Self);
  TabStop := False;
  with FSizeGrip do
  begin
    Parent := Self;
    TriangleWindow := True;
  end;
end;

procedure TPopupListboxEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER or WS_CLIPCHILDREN;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupListboxEh.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupListboxEh.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var X: Integer;
    ImRect: TRect;
begin
  if ImageList = nil then
    inherited DrawItem(Index,Rect,State)
  else
  begin
    if UseRightToLeftAlignment
      then ImRect := Classes.Rect(Rect.Right,Rect.Top,Rect.Right-ImageList.Width-4,Rect.Bottom)
      else ImRect := Classes.Rect(0,Rect.Top,ImageList.Width+4,Rect.Bottom);
    DrawImage(Canvas.Handle, ImRect, ImageList, Index, odSelected in State);
    if UseRightToLeftAlignment
      then Dec(Rect.Right,ImageList.Width+4)
      else Inc(Rect.Left,ImageList.Width+4);
//    Canvas.FillRect(Rect);
    if UseRightToLeftAlignment
      then X := Rect.Right-Canvas.TextWidth(Items[Index])-2
      else X := ImageList.Width+5;
    if Index < Items.Count then
      ExtTextOut(Canvas.Handle, X, Rect.Top, ETO_OPAQUE or ETO_CLIPPED,
        @Rect, PChar(Items[Index]), Length(Items[Index]), nil);
//      DrawText(Canvas.Handle, PChar(Items[Index]), Length(Items[Index]), Rect,
//        DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
  end;
end;

function TPopupListboxEh.CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if NewWidth < GetSystemMetrics(SM_CXVSCROLL) then
    NewWidth := GetSystemMetrics(SM_CXVSCROLL);
  if NewHeight < GetSystemMetrics(SM_CYVSCROLL) then
    NewHeight := GetSystemMetrics(SM_CYVSCROLL);
end;

function TPopupListboxEh.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top;
end;

function TPopupListboxEh.GetTextHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

procedure TPopupListboxEh.KeyPress(var Key: Char);
var
  TickCount: Integer;
begin
  case Key of
    #8, #27: FSearchText := '';
    #32..#255:
      begin
        TickCount := GetTickCount;
        if TickCount - FSearchTickCount > 2000 then FSearchText := '';
        FSearchTickCount := TickCount;
        if Length(FSearchText) < 32 then FSearchText := FSearchText + Key;
        SendMessage(Handle, LB_SelectString, WORD(-1), Longint(PChar(FSearchText)));
        Key := #0;
      end;
  end;
  inherited Keypress(Key);
end;

procedure TPopupListboxEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var Index:Integer;
begin
  inherited MouseMove(Shift, X, Y);
  if [ssLeft, ssRight, ssMiddle] * Shift = [] then
  begin
    Index := ItemAtPos(Point(X,Y),True);
    if Index >= 0 then ItemIndex := Index;
  end;
end;

procedure TPopupListboxEh.CMSetSizeGripChangePosition(var Message:TMessage);
begin
  FSizeGrip.ChangePosition(TSizeGripChangePosition(Message.WParam));
end;

procedure TPopupListboxEh.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
begin
  if ImageList = nil then
    inherited
  else
    with Message.DrawItemStruct^ do
    begin
      {$IFDEF EH_LIB_5}
      State := TOwnerDrawState(LongRec(itemState).Lo);
      {$ELSE}
      State := TOwnerDrawState(WordRec(LongRec(itemState).Lo).Lo);
      {$ENDIF}
      Canvas.Handle := hDC;
      Canvas.Font := Font;
      Canvas.Brush := Brush;
      if (Integer(itemID) >= 0) and (odSelected in State) then
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText
      end;
      if Integer(itemID) >= 0
        then DrawItem(itemID, rcItem, State)
        else Canvas.FillRect(rcItem);
      if UseRightToLeftAlignment
        then Dec(rcItem.Right,ImageList.Width+4)
        else Inc(rcItem.Left,ImageList.Width+4);
      if odFocused in State
        then DrawFocusRect(hDC, rcItem);
      Canvas.Handle := 0;
    end;
end;

procedure TPopupListboxEh.SetImageList(const Value: TCustomImageList);
begin
  FImageList := Value;
end;

procedure TPopupListboxEh.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  Height := Value * ItemHeight + GetBorderSize;
end;

procedure TPopupListboxEh.WMSize(var Message: TWMSize);
begin
  inherited;
  FSizeGrip.UpdatePosition;
  FSizeGripResized := True;
end;

procedure TPopupListboxEh.WMWindowPosChanging(var Message: TWMWindowPosChanging);
begin
  if ComponentState * [csReading, csDestroying] = [] then
    with Message.WindowPos^ do
      if (flags and SWP_NOSIZE = 0) and not CheckNewSize(cx, cy) then
        flags := flags or SWP_NOSIZE;
  inherited;
end;

procedure TPopupListboxEh.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := ItemHeight;
  if TextHeight = 0 then TextHeight := GetTextHeight;
  Rows := (AHeight - BorderSize) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize);
end;

{ TCustomDBComboBoxEh }

constructor TCustomDBComboBoxEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
  TStringList(FItems).OnChange := ItemsChanged;
  FKeyItems := TStringList.Create;
  TStringList(FKeyItems).OnChange := KeyItemsChanged;
  FVarValue := Null;
  FDropDownBox := TDropDownBoxEh.Create;
  FDropDownBox.Rows := 7;
end;

destructor TCustomDBComboBoxEh.Destroy;
begin
  FDropDownBox.Free;
  FKeyItems.Free;
  FItems.Free;
  inherited Destroy;
end;

procedure TCustomDBComboBoxEh.ButtonDown(IsDownButton:Boolean);
begin
  if (EditButton.Style = ebsUpDownEh) and (FDownButton<>0) then
  begin
    if EditCanModify then
      SelectNextValue(FDownButton=1)
  end else
    inherited ButtonDown(IsDownButton);
end;

function TCustomDBComboBoxEh.CreateEditButton: TEditButtonEh;
begin
  Result := TVisibleEditButtonEh.Create(Self,FEditSpeedButton);
end;

function TCustomDBComboBoxEh.ConvertDataText(const Value:String):String;
var Index:Integer;
begin
  if TextListIndepended then
    Result := Value
  else
  begin
    if FKeyBased
      then Index := KeyItems.IndexOf(Value)
      else Index := Items.IndexOf(Value);
    if (Index >= 0) and (Index < Items.Count)
      then Result := Items.Strings[Index]
      else Result := '';
  end;
end;

function TCustomDBComboBoxEh.DefaultAlignment: TAlignment;
begin
  if FKeyBased
    then Result := taLeftJustify
    else Result := inherited DefaultAlignment;
end;

function TCustomDBComboBoxEh.GetVariantValue:Variant;
begin
  if FKeyBased
    then Result := FVarValue
    else Result := inherited GetVariantValue;
end;

function TCustomDBComboBoxEh.IsValidChar(InputChar: Char): Boolean;
begin
  if FKeyBased
    then Result := True
    else Result := inherited IsValidChar(InputChar);
end;

function TCustomDBComboBoxEh.LocateStr(Str: String; PartialKey:Boolean): Boolean;
  function LocateItem:Integer;
  var i:Integer;
      s: string;
  begin
    Result := -1;
    for i := 0 to FItemsCount-1 do
    begin
      s := Items[i];
      if PartialKey then Delete(s, Length(Str) + 1, MaxInt);
      if AnsiCompareText(s, Str) = 0 then
      begin
        Result := i;
        Break;
      end;
    end;
  end;
var Index:Integer;
    OldIndex:Integer;
begin
  Result := False;
  OldIndex := ItemIndex;
  if not EditCanModify then Exit;
  try
    Index := LocateItem;
    if Index >= 0 then
    begin
      InternalSetItemIndex(Index);
      SelStart := Length(Text);
      SelLength := Length(Str) - SelStart;
    end
    else if not FKeyBased then
      InternalSetItemIndex(-1);
    if OldIndex <> Index then Result := True;
  except
    { If you attempt to search for a string larger than what the field
      can hold, and exception will be raised.  Just trap it and
      reset the SearchText back to the old value. }
    InternalSetItemIndex(OldIndex);
  end;
end;

function TCustomDBComboBoxEh.TextListIndepended: Boolean;
begin
  Result := not (FKeyBased {or (Style in [csDropDownList..csOwnerDrawVariable])});
end;

procedure TCustomDBComboBoxEh.DataChanged;
begin
  if FDataLink.Field <> nil then
  begin
    (*if (FAlignment <> FDataLink.Field.Alignment) and not PersistentProps['Alignment'] then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
    end;
    if not FKeyBased then
      EditMask := FDataLink.Field.EditMask;*)
    if FAlignment <> FDataLink.Field.Alignment then Invalidate;
    if not (evEditMaskEh in FAssignedValues) then
      SetControlEditMask(FDataLink.Field.EditMask);
    if not (csDesigning in ComponentState) then
    begin
      if (FDataLink.Field.DataType in [ftString, ftWideString]) and (MaxLength = 0) and not FKeyBased
      then
        MaxLength := FDataLink.Field.Size
    end;
    if (FFocused and FDataLink.CanModify) or FKeyBased then
      InternalSetValue(FDataLink.Field.Text)
    else
    begin
      EditText := FDataLink.Field.DisplayText;
      {if FDataLink.Editing and FDataLink.FModified then
        Modified := True;}
    end;
  end
  else if DataIndepended then
  begin
    //FAlignment := taLeftJustify;
    //EditMask := '';
     if not (evEditMaskEh in FAssignedValues) then
       SetControlEditMask('');
     EditText := VarToStr(FDataLink.DataIndependentValue);
  end else
  begin
    //FAlignment := taLeftJustify;
    //EditMask := '';
    //if csDesigning in ComponentState then
    //  EditText := Name else
    if not (evEditMaskEh in FAssignedValues) then
      SetControlEditMask('');
    EditText := '';
  end;
  Modified := False;
end;

function AlignDropDownWindow(MasterWin,DropDownWin:TWinControl;Align:TDropDownAlign):TPoint;
var P:TPoint;
    Y:Integer;
    WorkArea: TRect;
begin
  P := MasterWin.Parent.ClientToScreen(Point(MasterWin.Left, MasterWin.Top));
  Y := P.Y + MasterWin.Height;
  SystemParametersInfo(SPI_GETWORKAREA,0,Pointer(@WorkArea),0);

  if ((Y + DropDownWin.Height > WorkArea.Bottom) and (P.Y - DropDownWin.Height >= WorkArea.Top)) or
     ((P.Y - DropDownWin.Height < WorkArea.Top) and (WorkArea.Bottom - Y < P.Y - WorkArea.Top))
  then
  begin
    if P.Y - DropDownWin.Height < WorkArea.Top then
      DropDownWin.Height := P.Y - WorkArea.Top;
    Y := P.Y - DropDownWin.Height;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToTop),0);
  end else
  begin
    if Y + DropDownWin.Height > WorkArea.Bottom then
      DropDownWin.Height := WorkArea.Bottom - Y;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToBottom),0);
  end;

  case Align of
    daRight: Dec(P.X, DropDownWin.Width - MasterWin.Width);
    daCenter: Dec(P.X, (DropDownWin.Width - MasterWin.Width) div 2);
  end;

  if (DropDownWin.Width > WorkArea.Right - WorkArea.Left) then
    DropDownWin.Width := WorkArea.Right - WorkArea.Left;
  if (P.X + DropDownWin.Width > WorkArea.Right) then
  begin
    P.X := WorkArea.Right - DropDownWin.Width;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToLeft),0);
  end
  else if P.X < 0 then
  begin
    P.X := 0;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToRight),0);
  end else if Align = daRight then
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToLeft),0)
  else
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToRight),0);

  Result := Point(P.X,Y);
end;

procedure TCustomDBComboBoxEh.DropDown;
  function GetItemsMaxWidth:Integer;
  var i,w:Integer;
  begin
    Result := 0;
    if FCanvas = nil then
    begin
      FCanvas := TControlCanvas.Create;
      FCanvas.Control := Self;
    end;
    FCanvas.Handle := GetDC(0);
    FCanvas.Font := Font;
    for i := 0 to FItemsCount-1 do
    begin
      w := FCanvas.TextWidth(Items[i]);
      if w > Result then Result := w;
    end;
    ReleaseDC(0, FCanvas.Handle);
    FCanvas.Handle := 0;
    Inc(Result,5);
    if Images <> nil then Inc(Result,Images.Width+4);
  end;
var P:TPoint;
begin
  if not FListVisible then
  begin
    with TPopupListboxEh(PopupListbox) do
    begin
      Color := Self.Color;
      Font := Self.Font;
      ImageList := Self.Images;
      ItemHeight := GetTextHeight;
      if (Images <> nil) and (EditImage.UseImageHeight) and (ItemHeight < Images.Height + 1) then
        ItemHeight := Images.Height;
      Items := Self.Items;
      ItemIndex := Self.ItemIndex;
      RowCount := DropDownBox.Rows;
      if (FDropDownBox.Width = -1) then ClientWidth := GetItemsMaxWidth
      else if FDropDownBox.Width > 0 then Width := FDropDownBox.Width
      else Width := Self.Width;
      if (Width < Self.Width) then Width := Self.Width;
      if Items.Count < RowCount then RowCount := Items.Count;
    end;
//    P := ClientToScreen(Point(0,Height));
    P := AlignDropDownWindow(Self,PopupListbox,FDropDownBox.Align);
    SetWindowPos(PopupListbox.Handle, HWND_TOPMOST, P.X, P.Y, 0, 0,
        SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    PopupListbox.Visible := True;  //commment for Tab key
    TPopupListboxEh(PopupListbox).FSizeGrip.Visible := FDropDownBox.Sizable;
    FListVisible := True;
    TPopupListboxEh(PopupListbox).FSizeGripResized := False;
  end else
    CloseUp(False);
end;

procedure TCustomDBComboBoxEh.UpdateControlReadOnly;
begin
  SetControlReadOnly(not FDataLink.Editing or ReadOnly or FKeyBased);
end;

function TCustomDBComboBoxEh.GetPopupListbox: TWinControl;
begin
  if FPopupListbox = nil then
  begin
    FPopupListbox := TPopupListboxEh.Create(Self);
    FPopupListbox.Visible := False;
    FPopupListbox.Parent := Self;
    TWinControlCracker(FPopupListbox).OnMouseUp := ListMouseUp;
  end;
  Result := FPopupListbox;
end;

procedure TCustomDBComboBoxEh.ListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FPopupListbox.ClientRect, Point(X, Y)));
end;

procedure TCustomDBComboBoxEh.InternalSetItemIndex(const Value: Integer);
begin
  if FItemIndex <> Value then
  begin
    if (Value >= 0) and (Value < FItemsCount) then
    begin
      FItemIndex := Value;
      if FKeyBased then
        FVarValue := KeyItems.Strings[FItemIndex];
    end else
      FItemIndex := -1;
    EditImage.ImageIndex := FItemIndex;
    if FListVisible then TPopupListboxEh(PopupListbox).ItemIndex := FItemIndex;
    if FItemIndex >= 0 then
      //inherited InternalSetText(Items.Strings[FItemIndex])
      EditText := Items.Strings[FItemIndex]
    else inherited InternalSetText('');
  end;
end;

procedure TCustomDBComboBoxEh.InternalSetText(AText:String);
var Index:Integer;
begin
  if FKeyBased then
  begin
    Index := Items.IndexOf(AText);
    if (Index >= 0) and (Index < FItemsCount) then
    begin
      FItemIndex := Index;
      EditImage.ImageIndex := FItemIndex;
      if FListVisible then TPopupListboxEh(PopupListbox).ItemIndex := FItemIndex;
      FVarValue := KeyItems.Strings[Index];
      inherited InternalSetText(AText);
    end
  end else
  begin
    inherited InternalSetText(AText);
    UpdateItemIndex;
  end;
end;

procedure TCustomDBComboBoxEh.InternalSetValue(AValue:Variant);
begin
  if FKeyBased then
  begin
    FVarValue := AValue;
    if FVarValue = Null then
    begin
      inherited InternalSetText('');
      FItemIndex := -1;
    end else
    begin
      FItemIndex := KeyItems.IndexOf(VarToStr(AValue));
      if (FItemIndex >= 0) and (FItemIndex < FItemsCount)
        then inherited InternalSetText(Items.Strings[FItemIndex])
        else inherited InternalSetText('');
    end;
    EditImage.ImageIndex := FItemIndex;
    if FListVisible then TPopupListboxEh(PopupListbox).ItemIndex := FItemIndex;
  end else
  begin
    inherited InternalSetValue(AValue);
    UpdateItemIndex;
  end;
end;

procedure TCustomDBComboBoxEh.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if ((Key = VK_UP) or (Key = VK_DOWN)) and (not WordWrap or (SelLength = Length(Text)))  then
    {if ssAlt in Shift then
    begin
      if FListVisible then CloseUp(True) else DropDown;
      Key := 0;
    end else}
    if EditCanModify and not FListVisible then
    begin
      SelectNextValue(Key = VK_UP);
      Key := 0;
    end;
  if (Key = VK_DELETE) and FKeyBased and
     ( (Assigned(Field) and not Field.Required) or DataIndepended ) and
     EditCanModify then
    InternalSetValue(Null);
end;

procedure TCustomDBComboBoxEh.KeyPress(var Key: Char);
begin
  if FListVisible and (Key in [#13, #27]) then
  begin
    CloseUp(Key = #13);
    Key := #0;
  end;
  inherited KeyPress(Key);
  case Key of
    #8: //VK_BACK
    if FKeyBased then
    begin
      //////Modified := ProcessSearchStr(Key) or Modified;
      ProcessSearchStr(Key);
      Key := #0;
    end;
    {#13: //VK_RETURN
    begin
      Key := #0;
      FDataLink.UpdateRecord;
      SelectAll;
    end;}
    #32..#255:
    begin
      if DropDownBox.AutoDrop and not FListVisible then DropDown;
      if FKeyBased then
      begin
        //////////Modified := ProcessSearchStr(Key) or Modified;
        ProcessSearchStr(Key);
        Key := #0;
      end;
    end;
  end;
end;

procedure TCustomDBComboBoxEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var Handled: Boolean;
begin
//  Handled := False;
  if (Button = mbLeft) and FKeyBased and not PtInRect(ButtonRect,Point(X,Y)) and ButtonEnabled then
  begin
    MouseCapture := True;
    SelectAll;
    FTracking := True;
    TrackButton(X, Y);
    //if Assigned(FOnButtonClick) then
      //FOnButtonClick(Self,Handled);
      //FOnButtonClick(Self,FDownButton <> 2,AutoRepeat,Handled);
    {if not Handled then }ButtonDown(FDownButton = 2);
    //if AutoRepeat then ResetTimer(InitRepeatPause);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCustomDBComboBoxEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    if FListVisible then
    begin
      ListPos := PopupListbox.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(PopupListbox.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(PopupListbox.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

function TCustomDBComboBoxEh.ProcessSearchStr(Str: String):Boolean;
var
  S, SearchText: string;
  OldSelLenght:Integer;
begin
  Result := False;
  if DataIndepended or (FDataLink.Field <> nil) then
    if EditCanModify then
    begin
      if (Length(Str) = 1) and (Str[1] = #8) then
      begin
        if Length(Text) = SelLength then
        begin
          SelStart := MAXINT;
          SelLength := -1;
        end else
        begin
          OldSelLenght := Abs(SelLength);
          SelStart := MAXINT;
          SelLength := -OldSelLenght-1;
        end
      end else
      begin
        SearchText := Copy(Text,1,SelStart);
        S := SearchText + Str;
        Result := LocateStr(S, True);
      end;
    end;
end;

procedure TCustomDBComboBoxEh.ResetMaxLength;
begin
  if (MaxLength > 0) then
    if FKeyBased then MaxLength := 0
    else inherited ResetMaxLength;
end;

procedure TCustomDBComboBoxEh.SetVariantValue(const VariantValue: Variant);
var Index:Integer;
begin
  if FKeyBased then
  begin
    Index := KeyItems.IndexOf(VarToStr(VariantValue));
    if (Index >= 0) and (Index < KeyItems.Count) then
      inherited SetVariantValue(Items.Strings[Index]);
  end else
    inherited SetVariantValue(VariantValue);
end;

procedure TCustomDBComboBoxEh.SetItemIndex(const Value: Integer);
begin
  if (csDesigning in ComponentState) and not DataIndepended then Exit;
  if not DataIndepended then DataSource.DataSet.Edit;
  InternalSetItemIndex(Value);
  try
    UpdateData;
  except
    FDataLink.Reset;
    raise;
  end;
end;

procedure TCustomDBComboBoxEh.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TCustomDBComboBoxEh.SetKeyItems(const Value: TStrings);
begin
  FKeyItems.Assign(Value);
end;

procedure TCustomDBComboBoxEh.ItemsChanged(Sender: TObject);
begin
  UpdateItems;
  UpdateItemIndex;
  ResetMaxLength;
  //DataChange(nil);
end;

procedure TCustomDBComboBoxEh.KeyItemsChanged(Sender: TObject);
begin
  UpdateItems;
  UpdateItemIndex;
  ResetMaxLength;
  DataChange(nil);
end;

function Min(A,B: Integer): Integer;
begin
  if A > B then Result := B
  else Result := A;
end;

procedure TCustomDBComboBoxEh.UpdateItems;
begin
  FItemsCount := Items.Count;
  FKeyBased := False;
  if KeyItems.Count > 0 then
  begin
    FKeyBased := True;
    FItemsCount := Min(FItemsCount,KeyItems.Count);
    EditText := '';
  end;
  UpdateControlReadOnly;
end;

procedure TCustomDBComboBoxEh.UpdateItemIndex;
begin
  FItemIndex := Items.IndexOf(EditText);
  EditImage.ImageIndex := FItemIndex;
  if FListVisible then TPopupListboxEh(PopupListbox).ItemIndex := FItemIndex;
end;

procedure TCustomDBComboBoxEh.WndProc(var Message: TMessage);
begin
  if FListVisible then
  begin
    case Message.Msg of
      wm_KeyDown, wm_SysKeyDown, wm_Char:
      with TWMKey(Message) do
      begin
         if (CharCode in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT]) or
           ((CharCode in [VK_HOME,VK_END]) and (ssCtrl in KeyDataToShiftState(KeyData))) or
           ((CharCode in [VK_LEFT, VK_RIGHT]) ) then
         begin
           SendMessage(PopupListbox.Handle, Msg, Message.WParam, Message.LParam);
           Exit;
         end;
      end;
    end;
  end;
  inherited WndProc(Message);
end;

{procedure TCustomDBComboBoxEh.SetComboBoxStyle(const Value: TComboBoxStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    DataChange(nil);
  end;
end;}

procedure TCustomDBComboBoxEh.CMCancelMode(var Message: TCMCancelMode);
  function CheckDataListChilds:Boolean;
  var i:Integer;
  begin
    Result := False;
    if PopupListbox <> nil then
      for i := 0 to PopupListbox.ControlCount - 1 do
        if PopupListbox.Controls[I] = Message.Sender then
        begin
          Result := True;
          Exit;
        end;
  end;
begin
  inherited;
  if (Message.Sender <> Self) and
     (Message.Sender <> PopupListbox) and not CheckDataListChilds then
    CloseUp(False);
end;

procedure TCustomDBComboBoxEh.CloseUp(Accept: Boolean);
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    SetWindowPos(PopupListbox.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    PopupListbox.Visible := False;
    if TPopupListboxEh(PopupListbox).SizeGripResized then
    begin
      DropDownBox.Rows := TPopupListboxEh(PopupListbox).RowCount;
      DropDownBox.Width := TPopupListboxEh(PopupListbox).Width;
    end;
    if (GetFocus = PopupListbox.Handle) then
      SetFocus;
    FListVisible := False;
    if Accept and not ReadOnly and FDataLink.Edit then
    begin
      InternalSetItemIndex(TPopupListboxEh(PopupListbox).ItemIndex);
      if FFocused then SelectAll;
      //////Modified := True;
    end;
  end;
end;

procedure TCustomDBComboBoxEh.DefaultHandler(var Message);
begin
  with TWMMouse(Message) do
    case Msg of
      WM_LBUTTONDBLCLK,WM_LBUTTONDOWN,WM_LBUTTONUP,
      WM_MBUTTONDBLCLK,WM_MBUTTONDOWN,WM_MBUTTONUP,
      WM_RBUTTONDBLCLK,WM_RBUTTONDOWN,WM_RBUTTONUP:
        if FKeyBased then Exit;
    end;
  inherited DefaultHandler(Message);
end;


procedure TCustomDBComboBoxEh.SelectNextValue(IsPrior:Boolean);
var OldItemIndex:Integer;
begin
  OldItemIndex := ItemIndex;
  if IsPrior then
  begin
    if ItemIndex > 0 then
      InternalSetItemIndex(ItemIndex-1)
    else if ItemIndex <> 0 then
      InternalSetItemIndex(FItemsCount-1)
  end else if ItemIndex < FItemsCount-1 then
    InternalSetItemIndex(ItemIndex+1);
  if OldItemIndex <> ItemIndex then
  begin
    ///////Modified := True;
    SelectAll;
  end;
end;

procedure TCustomDBComboBoxEh.WMChar(var Message: TWMChar);
var OldSelStart:Integer;
begin
  inherited;
  if Message.CharCode = 0 then Exit;
  if not FKeyBased and not (Message.CharCode = VK_DELETE) and
     not (ssCtrl in KeyDataToShiftState(Message.KeyData)) then
   if not ((SelStart = Length(Text)) and (SelLength = 0)) or (Message.CharCode = VK_BACK) then
   begin
      OldSelStart := SelStart;
      if LocateStr(Text,False) then
      begin
        SelStart := Length(Text);
        SelLength := OldSelStart - SelStart;
      end;
   end else
     ProcessSearchStr('');
end;

procedure TCustomDBComboBoxEh.WMGetDlgCode(var Message: TMessage);
begin
  inherited;
//  if FListVisible then Message.Result := Message.Result or DLGC_WANTALLKEYS;
end;

procedure TCustomDBComboBoxEh.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) and FListVisible then
  begin
    //CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TCustomDBComboBoxEh.WMKillFocus(var Message: TWMKillFocus);
begin
 if FListVisible and not(Message.FocusedWnd = PopupListbox.Handle) then
   CloseUp(False);
 inherited;
end;

procedure TCustomDBComboBoxEh.WMPaste(var Message: TMessage);
begin
  if not FKeyBased then
    inherited
  else if Clipboard.HasFormat(CF_TEXT) then
    ///////Modified := ProcessSearchStr(Clipboard.AsText) or Modified;
    ProcessSearchStr(Clipboard.AsText);
end;

procedure TCustomDBComboBoxEh.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  if FKeyBased then Windows.SetCursor(LoadCursor(0, idc_Arrow))
  else inherited;
end;

procedure TCustomDBComboBoxEh.Change;
begin
  inherited Change;
  if not FKeyBased then
    UpdateItemIndex;
end;

procedure TCustomDBComboBoxEh.InternalUpdatePostData;
begin
  if DataIndepended and not FKeyBased
    then FDataLink.SetText(EditText)
    else FDataLink.SetText(VarToStr(Value));
end;

procedure TCustomDBComboBoxEh.UpdateData;
var RecheckInList:Boolean;
begin
  if Assigned(FOnNotInList) {and Focused} then
  begin
    RecheckInList := False;
    if ItemIndex = -1 then
    begin
      FOnNotInList(Self,EditText, RecheckInList);
      {if RecheckInList and (ItemIndex <> -1) then
        SetKeyValue(FKeyField.Value)}
    end;
  end;
  inherited UpdateData;
end;

function TCustomDBComboBoxEh.GetImages: TCustomImageList;
begin
  Result := EditImage.Images;
end;

procedure TCustomDBComboBoxEh.SetImages(const Value: TCustomImageList);
begin
  EditImage.Images := Value;
  EditImage.Visible := True;
  //if EditImage.Images <> nil then EditImage.Visible := True
  //else EditImage.Visible := False;
end;

procedure TCustomDBComboBoxEh.SetDropDownBox(const Value: TDropDownBoxEh);
begin
  FDropDownBox.Assign(Value);
end;

{ TCustomNumberEdit }

function IsValidFloat(const Value: string; var RetValue: Extended): Boolean;
var
  I: Integer;
  Buffer: array[0..63] of Char;
begin
  Result := False;
  for I := 1 to Length(Value) do
    if not (Value[I] in [DecimalSeparator, '-', '+', '0'..'9', 'e', 'E']) then
      Exit;
  Result := TextToFloat(StrPLCopy(Buffer, Value,
    SizeOf(Buffer) - 1), RetValue , fvExtended );
end;

function FormatFloatStr(const S: string; Thousands: Boolean): string;
var
  I, MaxSym, MinSym, Group: Integer;
  IsSign: Boolean;
begin
  Result := '';
  MaxSym := Length(S);
  IsSign := (MaxSym > 0) and (S[1] in ['-', '+']);
  if IsSign then MinSym := 2
  else MinSym := 1;
  I := Pos(DecimalSeparator, S);
  if I > 0 then MaxSym := I - 1;
  I := Pos('E', AnsiUpperCase(S));
  if I > 0 then MaxSym := Min(I - 1, MaxSym);
  Result := Copy(S, MaxSym + 1, MaxInt);
  Group := 0;
  for I := MaxSym downto MinSym do
  begin
    Result := S[I] + Result;
    Inc(Group);
    if (Group = 3) and Thousands and (I > MinSym) then
    begin
      Group := 0;
      Result := ThousandSeparator + Result;
    end;
  end;
  if IsSign then Result := S[1] + Result;
end;

function CurrencyEditFormat: String;
var i:Integer;
begin
  Result := ',#.';
  for i := 1 to CurrencyDecimals do
    Result := Result + '0';
end;

constructor TCustomDBNumberEditEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //ComponentState := ComponentState + [csDesigning];
  ControlStyle := ControlStyle - [csSetCaption];
  MaxLength := 0;
  FDecimalPlaces := 2;
  FIncrement := 1.0;
  { forces update }
  DataChange(nil);
end;

destructor TCustomDBNumberEditEh.Destroy;
begin
  inherited Destroy;
end;

function TCustomDBNumberEditEh.IsValidChar(Key: Char): Boolean;
var
  S: string;
  SelStart, SelStop, DecPos: Integer;
  RetValue: Extended;
begin
  Result := False;
  S := EditText;
  GetSel(SelStart, SelStop);
  System.Delete(S, SelStart + 1, SelStop - SelStart);
  System.Insert(Key, S, SelStart + 1);
  S := TextToValText(S);
  DecPos := Pos(DecimalSeparator, S);
  if (DecPos > 0) then
  begin
    SelStart := Pos('E', UpperCase(S));
    if (SelStart > DecPos) then DecPos := SelStart - DecPos
    else DecPos := Length(S) - DecPos;
    if DecPos > Integer(FDecimalPlaces) then Exit;
  end;
  Result := IsValidFloat(S, RetValue);
  if Result and (FMinValue >= 0) and (FMaxValue > 0) and (RetValue < 0) then
    Result := False;
end;

procedure TCustomDBNumberEditEh.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if not ReadOnly and ((Key = VK_UP) or (Key = VK_DOWN)) then
  begin
    IncrementValue(Key = VK_UP);
    Key := 0;
  end;
end;

procedure TCustomDBNumberEditEh.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if Key in ['.', ','] then Key := DecimalSeparator;
  if (Key in [#32..#255]) and not IsValidChar(Key) then
  begin
    Key := #0;
  end
  else if Key = #27 then
  begin
    Reset;
    Key := #0;
  end;
end;

procedure TCustomDBNumberEditEh.SetDecimalPlaces(Value: Cardinal);
begin
  if FDecimalPlaces <> Value then
  begin
    FDecimalPlaces := Value;
    DataChange(nil);
    Invalidate;
  end;
end;

function TCustomDBNumberEditEh.FormatDisplayText(Value: Extended): string;
begin
  if DisplayFormat <> '' then
    Result := FormatFloat(DisplayFormat, Value)
  else if Currency then
    Result := CurrToStrF(Value,ffCurrency,CurrencyDecimals)
  else
    Result := FloatToStr(Value);
end;

function TCustomDBNumberEditEh.GetDisplayText: string;
begin
  if FValue = Null then Result := ''
  else Result := FormatDisplayText(FValue);
end;

function TCustomDBNumberEditEh.GetVariantValue:Variant;
begin
  //if Modified then UpdateValueFromText;
  Result := FValue;
end;

{procedure TCustomDBNumberEditEh.Clear;
begin
  Text := '';
end;}

procedure TCustomDBNumberEditEh.DataChanged;
begin
  if (DisplayFormat = '') and Currency then FEditFormat := CurrencyEditFormat
  else FEditFormat := DisplayFormatToEditFormat(DisplayFormat);
  if FDataLink.Field <> nil then
  begin
    if not (evAlignmentEh in inherited AssignedValues) and
           (FAlignment <> FDataLink.Field.Alignment) then
    begin
      FAlignment := FDataLink.Field.Alignment;
      RecreateWnd;
    end;
    InternalSetValue(FDataLink.Field.Value);
  end
  else if DataIndepended then
    InternalSetValue(FDataLink.DataIndependentValue)
  else
  begin
    //inherited InternalSetText('');
    //FValue := Null;
    InternalSetValue(Null);
  end;
  Modified := False;
end;

function TCustomDBNumberEditEh.CheckValue(NewValue: Extended): Extended;
begin
  Result := NewValue;
  if (FMaxValue <> FMinValue) then
  begin
    if (FMaxValue > FMinValue) then
    begin
      if NewValue < FMinValue then Result := FMinValue
      else if NewValue > FMaxValue then Result := FMaxValue;
    end else
    begin
      if FMaxValue = 0 then
      begin
        if NewValue < FMinValue then Result := FMinValue;
      end else if FMinValue = 0 then
      begin
        if NewValue > FMaxValue then Result := FMaxValue;
      end;
    end;
  end;
end;

function TCustomDBNumberEditEh.DisplayFormatToEditFormat(const AFormat: string): string;
var i:Integer;
    C,Quote,E:Char;
    EPlus:String;
    ENullCount:Integer;
begin
  Result := '';
  Quote := #0;
  E := #0;
  EPlus := '';
  ENullCount := 0;
  for i := 1 to Length(AFormat) do
  begin
    C := AFormat[i];
    if C in ['''','"'] then
    begin
      if C = Quote then Quote := #0 else Quote := C;
    end else if Quote <> #0 then
       Continue
    else if (C in ['0','#','.',',']) then
      if (C = '0') and (EPlus = 'E+') then
      begin
        if ENullCount >= 4 then Exit else Inc(ENullCount);
      end else
        Result := Result + C
    else if (C in ['e','E']) then
    begin
      E := 'E';
      EPlus := '';
      Continue;
    end else if (C = '+') and (E = 'E') then
    begin
      E := #0;
      EPlus := 'E+';
      Continue;
    end else if C = ';' then Exit;
    E := #0;
    EPlus := '';
  end;
end;

procedure TCustomDBNumberEditEh.InternalSetControlText(AText:String);
begin
  if FInternalTextSetting then Exit;
  FInternalTextSetting := True;
  try
    inherited InternalSetText(AText);
  finally
    FInternalTextSetting := False;
  end;
end;

procedure TCustomDBNumberEditEh.InternalSetText(AText:String);
begin
  if AText = ''
    then InternalSetValue(Null)
    else InternalSetValue(StrToFloat(TextToValText(AText)));
end;

procedure TCustomDBNumberEditEh.InternalSetValue(AValue:Variant);
begin
  if AValue = Null then
  begin
    InternalSetControlText('');
    FValue := Null;
  end else
  begin
    FValue := VarAsType(AValue,varDouble);
    FDataLink.Modified;
    if FFocused and FDataLink.CanModify then
      ReformatEditText(FormatFloat(FEditFormat, FValue))
      //inherited InternalSetText(FormatFloat(FEditFormat, FValue))
    else
      InternalSetControlText(DisplayText);
  end;
end;

procedure TCustomDBNumberEditEh.UpdateValueFromText;
var s:String;
begin
//  if FFocused then ValidateEdit;
  s := TextToValText(EditText);
  if s = '' then
  begin
    FValue := Null;
    InternalSetControlText('');
  end else
  begin
    FValue := CheckValue(StrToFloat(s));
      //if FFocused and FDataLink.CanModify then
      //  ReformatEditText(FormatFloat(FEditFormat, v));
  end;
end;

procedure TCustomDBNumberEditEh.InternalUpdatePostData;
begin
  FDataLink.SetValue(Value);
end;

procedure TCustomDBNumberEditEh.SetMinValue(AValue: Extended);
begin
  if (evMinValueEh in FAssignedValues) and (AValue = FMinValue) then Exit;
  FMinValue := AValue;
  if not (csLoading in ComponentState) and DataIndepended then UpdateData;
  Include(FAssignedValues, evMinValueEh);
end;

procedure TCustomDBNumberEditEh.SetMaxValue(AValue: Extended);
begin
  if (evMaxValueEh in FAssignedValues) and (AValue = FMaxValue)
    then Exit;
  FMaxValue := AValue;
  if not (csLoading in ComponentState) and DataIndepended
    then UpdateData;
  Include(FAssignedValues, evMaxValueEh);
end;

function DelBSpace(const S: string): string;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] = ' ') do Inc(I);
  Result := Copy(S, I, MaxInt);
end;

function DelESpace(const S: string): string;
var
  I: Integer;
begin
  I := Length(S);
  while (I > 0) and (S[I] = ' ') do Dec(I);
  Result := Copy(S, 1, I);
end;

function DelRSpace(const S: string): string;
begin
  Result := DelBSpace(DelESpace(S));
end;

function DelChars(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do
    if Result[I] = Chr then Delete(Result, I, 1);
end;

function ReplaceStr(const S, Srch, Replace: string): string;
var
  I: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then
    begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;

function TCustomDBNumberEditEh.TextToValText(const AValue: string): string;
begin
  Result := DelRSpace(AValue);
  if DecimalSeparator <> ThousandSeparator then
    Result := DelChars(Result, ThousandSeparator);
  if (DecimalSeparator <> '.') and (ThousandSeparator <> '.') then
    Result := ReplaceStr(Result, '.', DecimalSeparator);
  if (DecimalSeparator <> ',') and (ThousandSeparator <> ',') then
    Result := ReplaceStr(Result, ',', DecimalSeparator);
  {if Result = '' then Result := '0'
  else if Result = '-' then Result := '-0';}
end;

procedure TCustomDBNumberEditEh.ReformatEditText(NewText: String);
var
  S: string;
  IsEmpty: Boolean;
  OldLen, SelStart, SelStop: Integer;
begin
  //FFormatting := True;
  try
    S := NewText;
    OldLen := Length(S);
    IsEmpty := (OldLen = 0) or (S = '-');
    if HandleAllocated then GetSel(SelStart, SelStop);
    if not IsEmpty then S := TextToValText(S);
    S := FormatFloatStr(S, Pos(',', FEditFormat) > 0);
    if S <> Text then
    begin
      InternalSetControlText(S);
      if HandleAllocated and (GetFocus = Handle) and not (csDesigning in ComponentState) then
      begin
        Inc(SelStart, Length(S) - OldLen);
        SetCursor(SelStart);
      end;
    end;
  finally
    //FFormatting := False;
  end;
end;

procedure TCustomDBNumberEditEh.Change;
///////var OldModified:Boolean;
begin
  inherited Change;
 if not FInternalTextSetting then
  begin
    ReformatEditText(inherited Text);
    UpdateValueFromText;
  end;
{  if not FFormatting then
  begin
    if FFocused then
    begin
      ////////OldModified := Modified;
      ReformatEditText(inherited Text);
      ////////Modified := OldModified;
    end;
    inherited Change;
  end;}
end;

procedure TCustomDBNumberEditEh.CreateParams(var Params: TCreateParams);
const
  Alignments: array[Boolean, TAlignment] of DWORD =
    ((ES_LEFT, ES_RIGHT, ES_CENTER),(ES_RIGHT, ES_LEFT, ES_CENTER));
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or Alignments[UseRightToLeftAlignment, Alignment];
end;

procedure TCustomDBNumberEditEh.WMPaste(var Message: TMessage);
var
  S: string;
begin
  S := EditText;
  try
    inherited;
    UpdateValueFromText;
  except
    EditText := S;
    SelectAll;
    if CanFocus then SetFocus;
  end;
end;

function TCustomDBNumberEditEh.IsIncrementStored: Boolean;
begin
  Result := FIncrement <> 1.0;
end;

procedure TCustomDBNumberEditEh.IncrementValue(IsIncrease:Boolean);
var Sign,ev:Extended;
begin
  if IsIncrease then Sign := 1 else Sign := -1;
  if Increment = 0 then Exit;
  if EditCanModify then
  begin
    if Value = Null
      then ev := Increment
      else ev := Value + Increment*Sign;
    InternalSetValue(CheckValue(ev));
    if FFocused then SelectAll;
  end;
end;

procedure TCustomDBNumberEditEh.ButtonDown(IsDownButton: Boolean);
begin
  if EditButton.Style = ebsUpDownEh then
  begin
    if not ReadOnly then IncrementValue(not IsDownButton)
  end else
    inherited ButtonDown(IsDownButton);
end;

function TCustomDBNumberEditEh.GetDisplayFormat: string;
begin
  if evDisplayFormatEh in FAssignedValues then Result := FDisplayFormat
  else Result := DefaultDisplayFormat;
end;

procedure TCustomDBNumberEditEh.SetDisplayFormat(const Value: string);
begin
  if (evDisplayFormatEh in FAssignedValues) and (Value = FDisplayFormat) then Exit;
  FDisplayFormat := Value;
  Include(FAssignedValues, evDisplayFormatEh);
  Invalidate;
  DataChange(nil);
end;

function TCustomDBNumberEditEh.IsDisplayFormatStored: Boolean;
begin
  Result := (evDisplayFormatEh in FAssignedValues);
end;

function TCustomDBNumberEditEh.DefaultDisplayFormat: String;
begin
  if Assigned(Field) then
    {$IFDEF EH_LIB_6}
    if Field is TSQLTimeStampField then Result := TSQLTimeStampField(Field).DisplayFormat
    else
    {$ENDIF}
    {$IFDEF EH_LIB_5}
    if Field is TAggregateField then Result := TAggregateField(Field).DisplayFormat
    else
    {$ENDIF}
    if Field is TDateTimeField then Result := TDateTimeField(Field).DisplayFormat
    else if Field is TNumericField then Result := TNumericField(Field).DisplayFormat
    else Result := ''
  else Result := '';
end;

function TCustomDBNumberEditEh.GetCurrency: Boolean;
begin
  if evCurrencyEh in FAssignedValues then Result := FCurrency
  else Result := DefaultCurrency;
end;

function TCustomDBNumberEditEh.IsCurrencyStored: Boolean;
begin
  Result := (evCurrencyEh in FAssignedValues);
end;

procedure TCustomDBNumberEditEh.SetCurrency(const Value: Boolean);
begin
  if (evCurrencyEh in FAssignedValues) and (Value = FCurrency) then Exit;
  FCurrency := Value;
  Include(FAssignedValues, evCurrencyEh);
  Invalidate;
  DataChange(nil);
end;

function TCustomDBNumberEditEh.DefaultCurrency: Boolean;
begin
  if Assigned(Field) then
    {$IFDEF EH_LIB_6}
    if Field is TFMTBCDField
      then Result := TFMTBCDField(Field).Currency
    else
    {$ENDIF}
    {$IFDEF EH_LIB_5}
    if Field is TAggregateField then Result := TAggregateField(Field).Currency
    else
    {$ENDIF}
    if Field is TBCDField
      then Result := TBCDField(Field).Currency
    else if Field is TFloatField
      then Result := TFloatField(Field).Currency
    else Result := False
  else Result := False;
end;

function TCustomDBNumberEditEh.IsMaxValueStored: Boolean;
begin
  Result := (evMaxValueEh in FAssignedValues);
end;

function TCustomDBNumberEditEh.IsMinValueStored: Boolean;
begin
  Result := (evMinValueEh in FAssignedValues);
end;

function TCustomDBNumberEditEh.GetMaxValue: Extended;
begin
  if evMaxValueEh in FAssignedValues
    then Result := FMaxValue
    else Result := DefaultMaxValue;
end;

function TCustomDBNumberEditEh.GetMinValue: Extended;
begin
  if evMinValueEh in FAssignedValues
    then Result := FMinValue
    else Result := DefaultMinValue;
end;

function TCustomDBNumberEditEh.DefaultMaxValue: Extended;
begin
  if Assigned(Field) then
    if Field is TIntegerField then Result := TIntegerField(Field).MaxValue
    else if Field is TBCDField then Result := TBCDField(Field).MaxValue
    else if Field is TFloatField then Result := TFloatField(Field).MaxValue
    {$IFDEF EH_LIB_6}
    //else if Field is TFMTBCDField then Result := TFMTBCDField(Field).MaxValue
    {$ENDIF}
    else Result := 0
  else Result := 0;
end;

function TCustomDBNumberEditEh.DefaultMinValue: Extended;
begin
  if Assigned(Field) then
    if Field is TIntegerField then Result := TIntegerField(Field).MinValue
    else if Field is TBCDField then Result := TBCDField(Field).MinValue
    else if Field is TFloatField then Result := TFloatField(Field).MinValue
    {$IFDEF EH_LIB_6}
    //else if Field is TFMTBCDField then Result := TFMTBCDField(Field).MinValue
    {$ENDIF}
    else Result := 0
  else Result := 0;
end;

function TCustomDBNumberEditEh.DefaultAlignment: TAlignment;
begin
  if Assigned(Field) then Result := inherited DefaultAlignment
  else Result := taRightJustify;
end;

initialization
  FlatButtonWidth := GetDefaultFlatButtonWidth;
end.
