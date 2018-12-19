{*******************************************************}
{                                                       }
{                       EhLib v2.0                      }
{                     Tool controls                     }
{                                                       }
{      Copyright (c) 2001 by Dmitry V. Bolshakov        }
{                                                       }
{*******************************************************}

unit ToolCtrlsEh;

{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 Variants, 
  StdCtrls, Mask, Db, DBCtrls, Buttons;

type

  TFieldsArrEh = array of TField;

{ Standard events }

  TButtonClickEventEh = procedure(Sender: TObject; var Handled: Boolean) of object;
  TButtonDownEventEh = procedure(Sender: TObject; TopButton: Boolean;
    var AutoRepeat: Boolean;  var Handled: Boolean) of object;
  TCloseUpEventEh = procedure(Sender: TObject; Accept: Boolean) of object;
  TNotInListEventEh = procedure(Sender: TObject; NewText: String;
    var RecheckInList: Boolean) of object;
  TUpdateDataEventEh = procedure(Sender: TObject; var Handled: Boolean) of object;

{ TDBLookupControl }

  TDBLookupControlEh = class;

  TLookupCtrlDataLinkEh = class(TDataLink)
  private
    FDBLookupControl: TDBLookupControlEh;
  protected
    procedure ActiveChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create;
  end;

  TLookupCtrlListLinkEh = class(TDataLink)
  private
    FDBLookupControl: TDBLookupControlEh;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure LayoutChanged; override;
  public
    constructor Create;
  end;

  TDBLookupControlEh = class(TCustomControl)
  private
    FDataFieldName: string;
    FDataFields: TFieldsArrEh;
    FDataLink: TLookupCtrlDataLinkEh;
    FHasFocus: Boolean;
    FKeyFieldName: string;
    FKeyFields: TFieldsArrEh;
    FKeyValue: Variant;
    FListActive: Boolean;
    FListField: TField;
    FListFieldIndex: Integer;
    FListFieldName: string;
    FListFields: TList;
    FListLink: TLookupCtrlListLinkEh;
    FLookupMode: Boolean;
    FLookupSource: TDataSource;
    FMasterFieldNames:String;
    FMasterFields: TFieldsArrEh;
    FSearchText: string;
    function GetDataField: TField;
    function GetDataSource: TDataSource;
    function GetKeyFieldName: string;
    function GetListSource: TDataSource;
    function GetReadOnly: Boolean;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure DataLinkRecordChanged(Field: TField);
    procedure SetDataFieldName(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: string);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
  protected
    function CanModify: Boolean; virtual;
    function GetBorderSize: Integer; virtual;
    function GetTextHeight: Integer; virtual;
    function LocateKey: Boolean; virtual;
    procedure KeyValueChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ProcessSearchKey(Key: Char); virtual;
    procedure SelectKeyValue(const Value: Variant); virtual;
    procedure UpdateDataFields; virtual;
    procedure UpdateListFields; virtual;
    property DataField: string read FDataFieldName write SetDataFieldName;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property HasFocus: Boolean read FHasFocus;
    property KeyField: string read GetKeyFieldName write SetKeyFieldName;
    property KeyValue: Variant read FKeyValue write SetKeyValue;
    property ListActive: Boolean read FListActive;
    property ListField: string read FListFieldName write SetListFieldName;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ListFields: TList read FListFields;
    property ListLink: TLookupCtrlListLinkEh read FListLink;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property ParentColor default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property SearchText: string read FSearchText write FSearchText;
    property TabStop default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetDataField;
  end;

{ TDBLookupListBoxEh }

  TDBLookupListBoxEh = class(TDBLookupControlEh)
  private
    FBorderStyle: TBorderStyle;
    FKeyFields: TFieldsArrEh;
    FKeySelected: Boolean;
    FListField: TField;
    FLockPosition: Boolean;
    FMousePos: Integer;
    FPopup: Boolean;
    FRecordCount: Integer;
    FRecordIndex: Integer;
    FRowCount: Integer;
    FSelectedItem: string;
    FShowTitles: Boolean;
    FTimerActive: Boolean;
    FTracking: Boolean;
    function  GetKeyIndex: Integer;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure SelectCurrent;
    procedure SelectItemAt(X, Y: Integer);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetRowCount(Value: Integer);
    procedure SetShowTitles(const Value: Boolean);
    procedure StopTimer;
    procedure StopTracking;
    procedure TimerScroll;
    procedure UpdateScrollBar;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMTimer(var Message: TMessage); message WM_TIMER;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  protected
    FTitleHeight: Integer;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyValueChanged; override;
    procedure ListLinkDataChanged; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure UpdateListFields; override;
  public
    constructor Create(AOwner: TComponent); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property KeyValue;
    property SelectedItem: string read FSelectedItem;
    property ShowTitles:Boolean read FShowTitles write SetShowTitles;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RowCount: Integer read FRowCount write SetRowCount stored False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TSizeGripEh }

  TSizeGripPostion = (sgpTopLeft,sgpTopRight,sgpBottomRight,sgpBottomLeft);
  TSizeGripChangePosition = (sgcpToLeft,sgcpToRight,sgcpToTop,sgcpToBottom);

  TSizeGripEh = class(TCustomControl)
  private
    FInitScreenMousePos:TPoint;
    FInternalMove: Boolean;
    FOldMouseMovePos:TPoint;
    FParentRect:TRect;
    FParentResized:TNotifyEvent;
    FPosition: TSizeGripPostion;
    FTriangleWindow: Boolean;
    function GetVisible: Boolean;
    procedure SetPosition(const Value: TSizeGripPostion);
    procedure SetTriangleWindow(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure WMMove(var Message: TMessage); message WM_MOVE;
  protected
    procedure CreateWnd; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure ParentResized; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangePosition(NewPosition: TSizeGripChangePosition);
    procedure UpdatePosition;
    property Position:TSizeGripPostion read FPosition write SetPosition default sgpBottomRight;
    property TriangleWindow:Boolean read FTriangleWindow write SetTriangleWindow default True;
    property Visible: Boolean read GetVisible write SetVisible;
    property OnParentResized:TNotifyEvent read FParentResized write FParentResized;
  end;

{ TPopupDataListEh }
const
    cm_SetSizeGripChangePosition = WM_USER + 100;

type
  TPopupDataListEh = class(TDBLookupListBoxEh)
  private
    FOnUserKeyValueChange: TNotifyEvent;
    FSizeGrip:TSizeGripEh;
    FSizeGripResized:Boolean;
    FUserKeyValueChanged:Boolean;
    function CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
    procedure CMSetSizeGripChangePosition(var Message:TMessage); message cm_SetSizeGripChangePosition;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyValueChanged; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    property SizeGrip: TSizeGripEh read FSizeGrip;
    property SizeGripResized:Boolean read FSizeGripResized write FSizeGripResized;
    property OnUserKeyValueChange: TNotifyEvent read FOnUserKeyValueChange write FOnUserKeyValueChange;
  end;


  TDrawButtonControlStyleEh = (bcsDropDownEh, bcsEllipsisEh, bcsUpDownEh, bcsCheckboxEh);
  procedure PaintButtonControlEh(DC: HDC;ARect:TRect;ParentColor:TColor;
               Style:TDrawButtonControlStyleEh; DownButton:Integer;
               Flat,Active,Enabled:Boolean; State: TCheckBoxState);

  function GetDefaultFlatButtonWidth:Integer;

var
  FlatButtonWidth:Integer;

procedure GetFieldsProperty(List: TList; DataSet: TDataSet;
   Control: TComponent; const FieldNames: String); overload;

function GetFieldsProperty(DataSet: TDataSet; Control: TComponent;
   const FieldNames: String):TFieldsArrEh; overload;

procedure DataSetSetFieldValues(DataSet: TDataSet; Fields: String; Value:Variant);

function VarEquals(const V1, V2: Variant): Boolean;

var UseButtonsBitmapCache:Boolean = True;

procedure ClearButtonsBitmapCache;

implementation

uses DBConsts ,VDBConsts;

procedure DrawCheck(DC: HDC; R: TRect; AState: TCheckBoxState; AEnabled, AFlat: Boolean);
var
  DrawState,oldRgn: Integer;
  DrawRect: TRect;
//  OldBrushColor: TColor;
//  OldBrushStyle: TBrushStyle;
//  OldPenColor: TColor;
  Rgn, SaveRgn: HRgn;
//  Brush,SaveBrush: HBRUSH;
begin
  SaveRgn := 0;
  oldRgn := 0;
  DrawRect := R;
  with DrawRect do
    if (Right - Left) > (Bottom - Top) then
    begin
     Left := Left + ((Right - Left) - (Bottom - Top)) div 2;
     Right := Left + (Bottom - Top);
    end else if (Right - Left) < (Bottom - Top) then
    begin
     Top := Top + ((Bottom - Top) - (Right - Left)) div 2;
     Bottom := Top + (Right - Left);
    end;
  case AState of
    cbChecked:
      DrawState := DFCS_BUTTONCHECK or DFCS_CHECKED;
    cbUnchecked:
      DrawState := DFCS_BUTTONCHECK;
    else // cbGrayed
      DrawState := DFCS_BUTTON3STATE or DFCS_CHECKED;
  end;
  if not AEnabled then
    DrawState := DrawState or DFCS_INACTIVE;
//  with Canvas do
//  begin
    if AFlat then
    begin
      { Remember current clipping region }
      SaveRgn := CreateRectRgn(0,0,0,0);
      oldRgn := GetClipRgn(DC, SaveRgn);
      { Clip 3d-style checkbox to prevent flicker }
      with DrawRect do
        Rgn := CreateRectRgn(Left + 2, Top + 2, Right - 2, Bottom - 2);
      SelectClipRgn(DC, Rgn);
      DeleteObject(Rgn);
    end;
    if AFlat then InflateRect(DrawRect,1,1);
    DrawFrameControl(DC, DrawRect, DFC_BUTTON, DrawState);
    if AFlat then
    begin
      //SelectClipRgn(Handle, SaveRgn);
      if oldRgn = 0 then
        SelectClipRgn(DC, 0)
      else
        SelectClipRgn(DC, SaveRgn);
      DeleteObject(SaveRgn);
      { Draw flat rectangle in-place of clipped 3d checkbox above }
      InflateRect(DrawRect,-1,-1);
      FrameRect(DC,DrawRect,GetSysColorBrush(COLOR_BTNSHADOW));

      InflateRect(DrawRect,1,1);
      FrameRect(DC,DrawRect,GetCurrentObject(DC,OBJ_BRUSH));
    end;
//  end;
end;

const
  DownFlags : array [Boolean] of Integer = (0,DFCS_PUSHED);
  FlatFlags : array [Boolean] of Integer = (0,DFCS_FLAT);
  EnabledFlags : array [Boolean] of Integer = (DFCS_INACTIVE,0);
  IsDownFlags: array [Boolean] of Integer = (DFCS_SCROLLUP, DFCS_SCROLLDOWN);

procedure DrawEllipsisButton(DC: HDC; ARect: TRect; Enabled, Active, Flat, Pressed: Boolean);
var InterP,PWid,W,H:Integer;
    ElRect:TRect;
    Brush,SaveBrush: HBRUSH;
begin
  ElRect := ARect;
  Brush := GetSysColorBrush(COLOR_BTNFACE);
  if Flat then
  begin
    Windows.FillRect(DC, ElRect, Brush);
    InflateRect(ElRect,-1,-1)
  end else
  begin
    DrawEdge(DC, ElRect, EDGE_RAISED, BF_RECT or BF_MIDDLE or FlatFlags[Pressed]);
    InflateRect(ElRect,-2,-2);
    Windows.FillRect(DC, ElRect, Brush);
  end;
  InterP := 2;
  PWid := 2;
  W := ElRect.Right - ElRect.Left ;//+ Ord(not Active and Flat);
  if W < 12 then InterP := 1;
  if W < 8 then PWid := 1;
  W := ElRect.Left + W div 2 - PWid div 2 + Ord(Pressed) ;//- Ord(not Active and Flat);
  H := ElRect.Top + (ElRect.Bottom - ElRect.Top) div 2 - PWid div 2 + Ord(Pressed);

  if not Enabled then
  begin
    Inc(W);Inc(H);
    Brush := GetSysColorBrush(COLOR_BTNHILIGHT);
    SaveBrush := SelectObject(DC, Brush);
    PatBlt(DC, W, H, PWid, PWid, PATCOPY);
    PatBlt(DC, W - InterP - PWid, H, PWid, PWid, PATCOPY);
    PatBlt(DC, W + InterP + PWid, H, PWid, PWid, PATCOPY);
    Dec(W);Dec(H);
    SelectObject(DC, SaveBrush);
    Brush := GetSysColorBrush(COLOR_BTNSHADOW);
  end else
    Brush := GetSysColorBrush(COLOR_BTNTEXT);

  SaveBrush := SelectObject(DC, Brush);
  PatBlt(DC, W, H, PWid, PWid, PATCOPY);
  PatBlt(DC, W - InterP - PWid, H, PWid, PWid, PATCOPY);
  PatBlt(DC, W + InterP + PWid, H, PWid, PWid, PATCOPY);
  SelectObject(DC, SaveBrush);
end;

procedure DrawOneButton(DC: HDC; Style:TDrawButtonControlStyleEh;
  ARect: TRect; Enabled, Flat, Active, Down, DownDirection: Boolean);
var Rgn, SaveRgn: HRgn;
    r:Integer;
    Flags:Integer;
    IsClipRgn:Boolean;
    DRect:TRect;
//    Brush: HBRUSH;
begin
  DRect := ARect;
  LPtoDP(DC,DRect,2);

  IsClipRgn := Flat and Active;
  r := 0; SaveRgn := 0;
  if IsClipRgn then
  begin
    SaveRgn := CreateRectRgn(0,0,0,0);
    r := GetClipRgn(DC, SaveRgn);
    with DRect do
      Rgn := CreateRectRgn(Left+1, Top+1, Right-1, Bottom-1);
    SelectClipRgn(DC, Rgn);
    DeleteObject(Rgn);
  end;

  if Flat then
    if not Active {and not (Style=bcsUpDownEh)}
      then InflateRect(ARect,2,2)
      else InflateRect(ARect,1,1);
  Flags := DownFlags[Down] or FlatFlags[Flat] or EnabledFlags[Enabled];
  case Style of
    bcsDropDownEh: DrawFrameControl(DC, ARect, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    bcsEllipsisEh: DrawEllipsisButton(DC, ARect, Enabled, Active, Flat, Down);
    bcsUpDownEh: DrawFrameControl(DC, ARect, DFC_SCROLL, Flags or IsDownFlags[DownDirection]);
  end;
  if Flat then
    if not Active {and not (Style=bcsUpDownEh)}
      then InflateRect(ARect,-2,-2)
      else InflateRect(ARect,-1,-1);

  if IsClipRgn then
  begin
    if r = 0
      then SelectClipRgn(DC, 0)
      else SelectClipRgn(DC, SaveRgn);
    DeleteObject(SaveRgn);
    if Down
      then DrawEdge(DC, ARect, BDR_SUNKENOUTER, BF_RECT)
      else DrawEdge(DC, ARect, BDR_RAISEDINNER, BF_RECT)
  end;
end;

type
  PPoints = ^TPoints;
  TPoints = array[0..0] of TPoint;

  TButtonBitmapInfoEh = record
    Size:TPoint;
    BitmapType: TDrawButtonControlStyleEh;
    Flat:Boolean;
    case TDrawButtonControlStyleEh of
      bcsDropDownEh, bcsEllipsisEh, bcsUpDownEh: (Pressed, Active, Enabled, DownDirect:Boolean);
      bcsCheckboxEh: (State: TCheckBoxState);
  end;

  { TButtonsBitmapCache }

  TButtonBitmapInfoBitmapEh = record
    BitmapInfo: TButtonBitmapInfoEh;
    Bitmap: TBitmap;
  end;

  PButtonBitmapInfoBitmapEh = ^TButtonBitmapInfoBitmapEh;

  TButtonsBitmapCache = class(TList)
  private
    function Get(Index: Integer): PButtonBitmapInfoBitmapEh;
//    procedure Put(Index: Integer; const Value: PButtonBitmapInfoBitmapEh);
  public
    procedure Clear; override;
    function GetButtonBitmap(ButtonBitmapInfo: TButtonBitmapInfoEh):TBitmap;
    property Items[Index: Integer]: PButtonBitmapInfoBitmapEh read Get {write Put}; default;
  end;

var ButtonsBitmapCache: TButtonsBitmapCache;

procedure ClearButtonsBitmapCache;
begin
  ButtonsBitmapCache.Clear;
end;

function RectSize(ARect:TRect):TSize;
begin
  Result.cx := ARect.Right-ARect.Left;
  Result.cy := ARect.Bottom-ARect.Top;
end;

procedure PaintButtonControlEh(DC: HDC; ARect:TRect;ParentColor:TColor;
               Style:TDrawButtonControlStyleEh; DownButton:Integer;
               Flat,Active,Enabled:Boolean; State: TCheckBoxState);
var
  Rgn, SaveRgn: HRgn;
  HalfRect, DRect: TRect;
  ASize: TSize;
  r: Integer;
  Brush: HBRUSH;
  IsClipRgn: Boolean;
  BitmapInfo: TButtonBitmapInfoEh;
  Bitmap: TBitmap;
begin
  SaveRgn := 0; r := 0;
  FillChar(BitmapInfo,Sizeof(BitmapInfo),#0);
  BitmapInfo.BitmapType := Style;
  BitmapInfo.Flat := Flat;

  if Style = bcsCheckboxEh then
  begin
    ASize := RectSize(ARect);
    if ASize.cx < ASize.cy then
    begin
      ARect.Top := ARect.Top + (ASize.cy - ASize.cx) div 2;
      ARect.Bottom := ARect.Bottom - (ASize.cy - ASize.cx) div 2 - (ASize.cy - ASize.cx) mod 2;
    end else if ASize.cx > ASize.cy then
    begin
      ARect.Left := ARect.Left + (ASize.cx - ASize.cy) div 2;
      ARect.Right := ARect.Right - (ASize.cx - ASize.cy) div 2 - (ASize.cx - ASize.cy) mod 2;
    end;

    if Flat then InflateRect(ARect,-1,-1);
    if UseButtonsBitmapCache then
    begin
      BitmapInfo.Size := Point(ARect.Right-ARect.Left,ARect.Bottom-ARect.Top);
      BitmapInfo.State := State;
      Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);

      StretchBlt(DC, ARect.Left, ARect.Top, ARect.Right - ARect.Left,
        ARect.Bottom - ARect.Top, Bitmap.Canvas.Handle, 0, 0,
        Bitmap.Width, Bitmap.Height, cmSrcCopy);
    end else
      DrawCheck(DC,ARect,State,Enabled,Flat);

    if Flat then
    begin
      InflateRect(ARect,1,1);
      Brush := CreateSolidBrush(ColorToRGB(ParentColor));
      FrameRect(DC, ARect, Brush);
      DeleteObject(Brush);
    end;
  end else
  begin
    BitmapInfo.Active := Active;
    BitmapInfo.Enabled := Enabled;

    IsClipRgn := Flat and not Active;
    if IsClipRgn then
    begin
      DRect := ARect;
      LPtoDP(DC,DRect,2);
      InflateRect(ARect,-1,-1);
      if not UseButtonsBitmapCache then
      begin
        SaveRgn := CreateRectRgn(0,0,0,0);
        r := GetClipRgn(DC, SaveRgn);
        with DRect do
          Rgn := CreateRectRgn(Left+1, Top+1, Right-1, Bottom-1);
        SelectClipRgn(DC, Rgn);
        DeleteObject(Rgn);
      end;
    end;

    if Style = bcsUpDownEh then
    begin
      if IsClipRgn then InflateRect(ARect,1,1);
      HalfRect := ARect;
      with HalfRect do
        Bottom := Top + (Bottom-Top) div 2;
      if IsClipRgn then InflateRect(HalfRect,-1,-1);
      if UseButtonsBitmapCache then
      begin
        BitmapInfo.Size := Point(HalfRect.Right-HalfRect.Left,HalfRect.Bottom-HalfRect.Top);
        BitmapInfo.Pressed := DownButton=1;
        BitmapInfo.DownDirect := False;
        Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
        StretchBlt(DC, HalfRect.Left, HalfRect.Top, HalfRect.Right - HalfRect.Left,
          HalfRect.Bottom - HalfRect.Top, Bitmap.Canvas.Handle, 0, 0,
          Bitmap.Width, Bitmap.Height, cmSrcCopy);
      end else
        DrawOneButton(DC, Style, HalfRect, Enabled, Flat, Active, DownButton=1, False);
      if IsClipRgn then InflateRect(HalfRect,1,1);
      HalfRect.Bottom := ARect.Bottom;
      with HalfRect do
        Top := Bottom - (Bottom-Top) div 2;
      if IsClipRgn then InflateRect(HalfRect,-1,-1);
      if UseButtonsBitmapCache then
      begin
        BitmapInfo.Size := Point(HalfRect.Right-HalfRect.Left,HalfRect.Bottom-HalfRect.Top);
        BitmapInfo.Pressed := DownButton=2;
        BitmapInfo.DownDirect := True;
        Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
        StretchBlt(DC, HalfRect.Left, HalfRect.Top, HalfRect.Right - HalfRect.Left,
          HalfRect.Bottom - HalfRect.Top, Bitmap.Canvas.Handle, 0, 0,
          Bitmap.Width, Bitmap.Height, cmSrcCopy);
      end else
        DrawOneButton(DC, Style, HalfRect, Enabled, Flat, Active, DownButton=2, True);
      if IsClipRgn
        then InflateRect(ARect,-1,-1);
      if ((ARect.Bottom-ARect.Top) mod 2 = 1) or (IsClipRgn) then
      begin
        HalfRect := ARect;
        HalfRect.Top := (HalfRect.Bottom + HalfRect.Top) div 2;
        HalfRect.Bottom := HalfRect.Top;
        if (ARect.Bottom-ARect.Top) mod 2 = 1 then Inc(HalfRect.Bottom);
        if IsClipRgn then InflateRect(HalfRect,0,1);
        Brush := CreateSolidBrush(ColorToRGB(ParentColor));
        FillRect(DC, HalfRect,Brush);
        DeleteObject(Brush);
      end;
    end else if UseButtonsBitmapCache then
    begin
      BitmapInfo.Size := Point(ARect.Right-ARect.Left,ARect.Bottom-ARect.Top);
      BitmapInfo.Pressed := DownButton<>0;
      Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
      StretchBlt(DC, ARect.Left, ARect.Top, ARect.Right - ARect.Left,
        ARect.Bottom - ARect.Top, Bitmap.Canvas.Handle, 0, 0,
        Bitmap.Width, Bitmap.Height, cmSrcCopy);
    end else
      DrawOneButton(DC, Style, ARect, Enabled, Flat, Active, DownButton<>0, True);

    if IsClipRgn then
    begin
      InflateRect(ARect,1,1);
      if not UseButtonsBitmapCache then
      begin
        if r = 0
          then SelectClipRgn(DC, 0)
          else SelectClipRgn(DC, SaveRgn);
        DeleteObject(SaveRgn);
      end;
      Brush := CreateSolidBrush(ColorToRGB(ParentColor));
      FrameRect(DC, ARect, Brush);
      DeleteObject(Brush);
    end;
  end;
end;

function GetDefaultFlatButtonWidth:Integer;
var
  DC: HDC;
  SysMetrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  ReleaseDC(0, DC);
  Result := Round(SysMetrics.tmHeight / 3 * 2);
  if Result mod 2 = 1 then Inc(Result);
  if Result > GetSystemMetrics(SM_CXVSCROLL)
    then Result := GetSystemMetrics(SM_CXVSCROLL);
end;

{$DEBUGINFO OFF}
function VarEquals(const V1, V2: Variant): Boolean;
var i:Integer;
begin
  Result := not (VarIsArray(V1) xor VarIsArray(V2));
  if not Result then Exit;
  Result := False;
  try
    if VarIsArray(V1) and VarIsArray(V2) and
     (VarArrayDimCount(V1) = VarArrayDimCount(V2)) and
     (VarArrayLowBound(V1,1) = VarArrayLowBound(V2,1)) and
     (VarArrayHighBound(V1,1) = VarArrayHighBound(V2,1))
    then
      for i := VarArrayLowBound(V1,1) to VarArrayHighBound(V1,1) do
      begin
        Result := V1[i] = V2[i];
        if not Result then Exit;
      end
    else
      Result := V1 = V2;
  except
  end;
end;
{$DEBUGINFO ON}

function TButtonsBitmapCache.GetButtonBitmap(ButtonBitmapInfo: TButtonBitmapInfoEh):TBitmap;
var i: Integer;
    BitmapInfoBitmap: PButtonBitmapInfoBitmapEh;
begin
  if ButtonBitmapInfo.Size.X < 0 then ButtonBitmapInfo.Size.X := 0;
  if ButtonBitmapInfo.Size.Y < 0 then ButtonBitmapInfo.Size.Y := 0;
  for i := 0 to Count-1 do
    if CompareMem(@ButtonBitmapInfo,Items[i],SizeOf(TButtonBitmapInfoEh)) then
    begin
      Result := Items[i].Bitmap;
      Exit;
    end;
  New(BitmapInfoBitmap);
  Add(BitmapInfoBitmap);
  BitmapInfoBitmap.BitmapInfo := ButtonBitmapInfo;
  BitmapInfoBitmap.Bitmap := TBitmap.Create;
  BitmapInfoBitmap.Bitmap.Width := ButtonBitmapInfo.Size.X;
  BitmapInfoBitmap.Bitmap.Height := ButtonBitmapInfo.Size.Y;

  case ButtonBitmapInfo.BitmapType of
    bcsCheckboxEh:
      DrawCheck(BitmapInfoBitmap.Bitmap.Canvas.Handle,
                Rect(0,0,ButtonBitmapInfo.Size.X,ButtonBitmapInfo.Size.Y),
                ButtonBitmapInfo.State,
                True,
                ButtonBitmapInfo.Flat
                );
     bcsEllipsisEh, bcsUpDownEh, bcsDropDownEh:
       DrawOneButton(BitmapInfoBitmap.Bitmap.Canvas.Handle,ButtonBitmapInfo.BitmapType,
                Rect(0,0,ButtonBitmapInfo.Size.X,ButtonBitmapInfo.Size.Y),
                ButtonBitmapInfo.Enabled, ButtonBitmapInfo.Flat,
                ButtonBitmapInfo.Active, ButtonBitmapInfo.Pressed,
                ButtonBitmapInfo.DownDirect);
  end;
  Result := BitmapInfoBitmap.Bitmap;
end;

function TButtonsBitmapCache.Get(Index: Integer): PButtonBitmapInfoBitmapEh;
begin
  Result := inherited Items[Index];
end;

{procedure TButtonsBitmapCache.Put(Index: Integer; const Value: PButtonBitmapInfoBitmapEh);
begin
  inherited Items[Index] := Value;
end;}

procedure TButtonsBitmapCache.Clear;
var i: Integer;
begin
  for i := 0 to Count-1 do
  begin
    Items[i].Bitmap.Free;
    Dispose(Items[i]);
  end;
  inherited Clear;
end;

procedure GetFieldsProperty(List: TList; DataSet: TDataSet;
   Control: TComponent; const FieldNames: String);
var
  Pos: Integer;
  Field: TField;
  FieldName: String;
begin
  Pos := 1;
  while Pos <= Length(FieldNames) do
  begin
    FieldName := ExtractFieldName(FieldNames, Pos);
    Field := DataSet.FindField(FieldName);
    if Field = nil then
      DatabaseErrorFmt(SFieldNotFound, [FieldName], Control);
    if Assigned(List) then List.Add(Field);
  end;
end;

function GetFieldsProperty(DataSet: TDataSet; Control: TComponent;
   const FieldNames: String):TFieldsArrEh;
var FieldList:TList;
    i:Integer;
begin
  FieldList := TList.Create;
  GetFieldsProperty(FieldList,DataSet, Control, FieldNames);
  SetLength(Result,FieldList.Count);
  for i := 0 to FieldList.Count-1 do Result[i] := FieldList[i];
  FieldList.Free;
end;

procedure DataSetSetFieldValues(DataSet: TDataSet; Fields: String; Value:Variant);
var FieldList: TList;
    i:Integer;
begin
  if VarEquals(Value,Null) then
  begin
    FieldList := TList.Create;
    try
      Dataset.GetFieldList(FieldList,Fields);
      for i := 0 to FieldList.Count-1 do
        TField(FieldList[i]).Clear;
    finally
      FieldList.Free;
    end;
  end else
    DataSet.FieldValues[Fields] := Value;
end;

{ TDataSourceLink }

constructor TLookupCtrlDataLinkEh.Create;
begin
  inherited Create;
//  VisualControl := True;
end;

procedure TLookupCtrlDataLinkEh.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TLookupCtrlDataLinkEh.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FDBLookupControl.Field) and
    (FDBLookupControl <> nil) and FDBLookupControl.CanFocus then
  begin
    Field^ := nil;
    FDBLookupControl.SetFocus;
  end;
end;

procedure TLookupCtrlDataLinkEh.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TLookupCtrlDataLinkEh.RecordChanged(Field: TField);
begin
  if FDBLookupControl <> nil then FDBLookupControl.DataLinkRecordChanged(Field);
end;

{ TListSourceLink }

constructor TLookupCtrlListLinkEh.Create;
begin
  inherited Create;
//  VisualControl := True;
end;

procedure TLookupCtrlListLinkEh.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

procedure TLookupCtrlListLinkEh.DataSetChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkDataChanged;
end;

procedure TLookupCtrlListLinkEh.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

{ TDBLookupControlEh }

var
  SearchTickCount: Integer = 0;

constructor TDBLookupControlEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if NewStyleControls
    then ControlStyle := [csOpaque]
    else ControlStyle := [csOpaque, csFramed];
  ParentColor := False;
  TabStop := True;
  FLookupSource := TDataSource.Create(Self);
  FDataLink := TLookupCtrlDataLinkEh.Create;
  FDataLink.FDBLookupControl := Self;
  FListLink := TLookupCtrlListLinkEh.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := Null;
end;

destructor TDBLookupControlEh.Destroy;
begin
  inherited Destroy;
  FListFields.Free;
  FListFields := nil;
  FListLink.FDBLookupControl := nil;
  FListLink.Free;
  FListLink := nil;
  FDataLink.FDBLookupControl := nil;
  FDataLink.Free;
  FDataLink := nil;
end;

function TDBLookupControlEh.CanModify: Boolean;
  function MasterFieldsCanModify: Boolean;
  var i:Integer;
  begin
    Result := True;
    for i := 0 to Length(FMasterFields)-1 do
      if not FMasterFields[i].CanModify then
      begin
        Result := False;
        Exit;
      end;
  end;
begin
  Result := FListActive and not ReadOnly and ((FDataLink.DataSource = nil) or
    (Length(FMasterFields) <> 0) and MasterFieldsCanModify);
end;

procedure TDBLookupControlEh.CheckNotCircular;
begin
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink);
end;

procedure TDBLookupControlEh.CheckNotLookup;
begin
  if FLookupMode then DatabaseError(SPropDefByLookup);
  if FDataLink.DataSourceFixed then DatabaseError(SDataSourceFixed);
end;

procedure TDBLookupControlEh.UpdateDataFields;
 function MasterFieldNames: String;
  var i:Integer;
  begin
    Result := '';
    for i := 0 to Length(FMasterFields)-1 do
      if Result = '' then
        Result := FMasterFields[i].FieldName else
        Result := Result + ';' + FMasterFields[i].FieldName;
  end;
begin
  //FDataField := nil;
  //FMasterField := nil;
  FMasterFieldNames := '';
  if FDataLink.Active and (FDataFieldName <> '') then
  begin
    CheckNotCircular;
    FDataFields := GetFieldsProperty(FDataLink.DataSet, Self, FDataFieldName);
    if (Length(FDataFields) = 1) and (FDataFields[0].FieldKind = fkLookup)
      then FMasterFields := GetFieldsProperty(FDataLink.DataSet, Self, FDataFields[0].KeyFields)
      else FMasterFields := FDataFields;
    FMasterFieldNames := MasterFieldNames;
  end;
  SetLookupMode((Length(FDataFields) = 1) and (FDataFields[0].FieldKind = fkLookup));
  DataLinkRecordChanged(nil);
end;

procedure TDBLookupControlEh.DataLinkRecordChanged(Field: TField);
  function FieldFound(Value:TField) :Boolean;
  var i:Integer;
  begin
    Result := False;
    for i := 0 to Length(FMasterFields)-1 do
      if FMasterFields[i] = Value then
      begin
        Result := True;
        Exit;
      end;
  end;
begin
  if (Field = nil) or FieldFound(Field) then
    if Length(FMasterFields) > 0
      then SetKeyValue(FDataLink.DataSet.FieldValues[FMasterFieldNames])
      else SetKeyValue(Null);
end;

function TDBLookupControlEh.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top;
end;

function TDBLookupControlEh.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBLookupControlEh.GetKeyFieldName: string;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TDBLookupControlEh.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

function TDBLookupControlEh.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

function TDBLookupControlEh.GetTextHeight: Integer;
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

procedure TDBLookupControlEh.KeyValueChanged;
begin
end;

procedure TDBLookupControlEh.UpdateListFields;
var
  DataSet: TDataSet;
  ResultField: TField;
  i: Integer;
begin
  FListActive := False;
  //FKeyField := nil;
  FListField := nil;
  FListFields.Clear;
  if FListLink.Active and (FKeyFieldName <> '') then
  begin
    CheckNotCircular;
    DataSet := FListLink.DataSet;
    FKeyFields := GetFieldsProperty(DataSet, Self, FKeyFieldName);
    try
      DataSet.GetFieldList(FListFields, FListFieldName);
    except
      DatabaseErrorFmt(SFieldNotFound, [Self.Name, FListFieldName]);
    end;
    if FLookupMode then
    begin
      ResultField := GetFieldProperty(DataSet, Self, FDataFields[0].LookupResultField);
      if FListFields.IndexOf(ResultField) < 0 then
        FListFields.Insert(0, ResultField);
      FListField := ResultField;
    end else
    begin
      if FListFields.Count = 0 then
        for i := 0 to Length(FKeyFields)-1 do FListFields.Add(FKeyFields[i]);
      if (FListFieldIndex >= 0) and (FListFieldIndex < FListFields.Count) then
        FListField := FListFields[FListFieldIndex] else
        FListField := FListFields[0];
    end;
    FListActive := True;
  end;
end;

procedure TDBLookupControlEh.ListLinkDataChanged;
begin
end;

function TDBLookupControlEh.LocateKey: Boolean;
var
  KeySave: Variant;
begin
  Result := False;
  try
    KeySave := FKeyValue;
    if not VarIsNull(FKeyValue) and FListLink.DataSet.Active and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
    begin
      Result := True;
      FKeyValue := KeySave;
    end;
  except
  end;
end;

procedure TDBLookupControlEh.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if (FDataLink <> nil) and (AComponent = DataSource)
      then DataSource := nil;
    if (FListLink <> nil) and (AComponent = ListSource)
      then ListSource := nil;
  end;
end;

procedure TDBLookupControlEh.ProcessSearchKey(Key: Char);
var
  TickCount: Integer;
  S: string;
  CharMsg: TMsg;
begin
  if (FListField <> nil) and (FListField.FieldKind in [fkData, fkInternalCalc]) and
    (FListField.DataType in [ftString]) then
    case Key of
      #8, #27: SearchText := '';
      #32..#255:
        if CanModify then
        begin
          TickCount := GetTickCount;
          if TickCount - SearchTickCount > 2000 then SearchText := '';
          SearchTickCount := TickCount;
          if SysLocale.FarEast and (Key in LeadBytes) then
            if PeekMessage(CharMsg, Handle, WM_CHAR, WM_CHAR, PM_REMOVE) then
            begin
              if CharMsg.Message = WM_Quit then
              begin
                PostQuitMessage(CharMsg.wparam);
                Exit;
              end;
              SearchText := SearchText + Key;
              Key := Char(CharMsg.wParam);
            end;
          if Length(SearchText) < 32 then
          begin
            S := SearchText + Key;
            try
              if FListLink.DataSet.Locate(FListField.FieldName, S,
                [loCaseInsensitive, loPartialKey]) then
              begin
                SelectKeyValue(FListLink.DataSet.FieldValues[FKeyFieldName]{FKeyField.Value});
                SearchText := S;
              end;
            except
              { If you attempt to search for a string larger than what the field
                can hold, and exception will be raised.  Just trap it and
                reset the SearchText back to the old value. }
              SearchText := S;
            end;
          end;
        end;
    end;
end;

procedure TDBLookupControlEh.SelectKeyValue(const Value: Variant);
begin
  if Length(FMasterFields)> 0 then
  begin
    if FDataLink.Edit then
      FDataLink.DataSet.FieldValues[FMasterFieldNames] := Value;
  end else
    SetKeyValue(Value);
  Repaint;
  Click;
end;

procedure TDBLookupControlEh.SetDataFieldName(const Value: string);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    UpdateDataFields;
  end;
end;

procedure TDBLookupControlEh.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBLookupControlEh.SetKeyFieldName(const Value: string);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TDBLookupControlEh.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TDBLookupControlEh.SetListFieldName(const Value: string);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TDBLookupControlEh.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBLookupControlEh.SetLookupMode(Value: Boolean);
begin
  if FLookupMode <> Value then
    if Value then
    begin
      FMasterFields := GetFieldsProperty(FDataFields[0].DataSet, Self, FDataFields[0].KeyFields);
      FLookupSource.DataSet := FDataFields[0].LookupDataSet;
      FKeyFieldName := FDataFields[0].LookupKeyFields;
      FLookupMode := True;
      FListLink.DataSource := FLookupSource;
    end else
    begin
      FListLink.DataSource := nil;
      FLookupMode := False;
      FKeyFieldName := '';
      FLookupSource.DataSet := nil;
      FMasterFields := FDataFields;
    end;
end;

procedure TDBLookupControlEh.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TDBLookupControlEh.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TDBLookupControlEh.WMKillFocus(var Message: TMessage);
begin
  FHasFocus := False;
  inherited;
  Invalidate;
end;

procedure TDBLookupControlEh.WMSetFocus(var Message: TMessage);
begin
  SearchText := '';
  FHasFocus := True;
  inherited;
  Invalidate;
end;

procedure TDBLookupControlEh.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

function TDBLookupControlEh.GetDataField: TField;
begin
  if Length(FDataFields) = 0
    then Result := nil
    else Result := FDataFields[0];
end;

{ TDBLookupListBoxEh }

constructor TDBLookupListBoxEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csDoubleClicks];
  Width := 121;
  FBorderStyle := bsSingle;
  RowCount := 7;
end;

procedure TDBLookupListBoxEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D
        then ExStyle := ExStyle or WS_EX_CLIENTEDGE
        else Style := Style or WS_BORDER;
end;

procedure TDBLookupListBoxEh.CreateWnd;
begin
  inherited CreateWnd;
  UpdateScrollBar;
end;

function TDBLookupListBoxEh.GetKeyIndex: Integer;
var
  FieldValue: Variant;
begin
  if not VarIsNull(KeyValue) then
    for Result := 0 to FRecordCount - 1 do
    begin
      ListLink.ActiveRecord := Result;
      FieldValue := FListLink.DataSet.FieldValues[FKeyFieldName];//  FKeyField.Value;
      ListLink.ActiveRecord := FRecordIndex;
      if VarEquals(FieldValue, KeyValue) then Exit;
    end;
  Result := -1;
end;

procedure TDBLookupListBoxEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta, KeyIndex: Integer;
begin
  inherited KeyDown(Key, Shift);
  if CanModify then
  begin
    Delta := 0;
    case Key of
      VK_UP, VK_LEFT: Delta := -1;
      VK_DOWN, VK_RIGHT: Delta := 1;
      VK_PRIOR: Delta := 1 - FRowCount;
      VK_NEXT: Delta := FRowCount - 1;
      VK_HOME: Delta := -Maxint;
      VK_END: Delta := Maxint;
    end;
    if Delta <> 0 then
    begin
      SearchText := '';
      if Delta = -Maxint
        then ListLink.DataSet.First
      else if Delta = Maxint
        then ListLink.DataSet.Last
      else
      begin
        KeyIndex := GetKeyIndex;
        if KeyIndex >= 0 then
          ListLink.DataSet.MoveBy(KeyIndex - FRecordIndex)
        else
        begin
          KeyValueChanged;
          Delta := 0;
        end;
        ListLink.DataSet.MoveBy(Delta);
      end;
      SelectCurrent;
    end;
  end;
end;

procedure TDBLookupListBoxEh.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  ProcessSearchKey(Key);
end;

procedure TDBLookupListBoxEh.KeyValueChanged;
begin
  if ListActive and not FLockPosition then
    if not LocateKey then ListLink.DataSet.First;
  if FListField <> nil
    then FSelectedItem := FListField.DisplayText
    else FSelectedItem := '';
end;

procedure TDBLookupListBoxEh.UpdateListFields;
var
  DataSet: TDataSet;
  FKeyFieldName:String;
  ResultField: TField;
  FLookupMode:Boolean;
begin
  try
    inherited UpdateListFields;

    //FKeyField := nil;
    FLookupMode := (Field <> nil) and (Field.FieldKind = fkLookup);
    if FLookupMode
      then FKeyFieldName := Field.LookupKeyFields
      else FKeyFieldName := KeyField;
    if ListLink.Active and (FKeyFieldName <> '') then
    begin
      DataSet := ListLink.DataSet;
      FKeyFields := GetFieldsProperty(DataSet, Self, FKeyFieldName);
      if FLookupMode then
      begin
        ResultField := GetFieldProperty(DataSet, Self, Field.LookupResultField);
        FListField := ResultField;
      end else
      begin
        if (ListFieldIndex >= 0) and (ListFieldIndex < ListFields.Count)
          then FListField := ListFields[ListFieldIndex]
          else FListField := ListFields[0];
      end;
    end;

  finally
    if ListActive
      then KeyValueChanged
      else ListLinkDataChanged;
  end;
end;

procedure TDBLookupListBoxEh.ListLinkDataChanged;
begin
  if ListActive then
  begin
    FRecordIndex := ListLink.ActiveRecord;
    FRecordCount := ListLink.RecordCount;
    FKeySelected := not VarIsNull(KeyValue) or
      not ListLink.DataSet.BOF;
  end else
  begin
    FRecordIndex := 0;
    FRecordCount := 0;
    FKeySelected := False;
  end;
  if HandleAllocated then
  begin
    UpdateScrollBar;
    Invalidate;
  end;
end;

procedure TDBLookupListBoxEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SearchText := '';
    if not FPopup then
    begin
      SetFocus;
      if not HasFocus then Exit;
    end;
    if CanModify then
      if ssDouble in Shift then
      begin
        if FRecordIndex = (Y-FTitleHeight) div GetTextHeight then DblClick;
      end else
      begin
        MouseCapture := True;
        FTracking := True;
        if Y > FTitleHeight then
          SelectItemAt(X, Y);
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDBLookupListBoxEh.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FTracking then
  begin
    SelectItemAt(X, Y);
    FMousePos := Y;
    TimerScroll;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TDBLookupListBoxEh.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FTracking then
  begin
    StopTracking;
    if Y > FTitleHeight then
      SelectItemAt(X, Y);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDBLookupListBoxEh.Paint;
var
  I, J, W, X, TextWidth, TextHeight, LastFieldIndex: Integer;
  S: string;
  R: TRect;
  Selected: Boolean;
  Field: TField;
  AAlignment: TAlignment;
begin
  Canvas.Font := Font;
  TextWidth := Canvas.TextWidth('0');
  TextHeight := Canvas.TextHeight('0');
  LastFieldIndex := ListFields.Count - 1;
  if ShowTitles then  //ShowTitles
  begin
    R.Top := 0;
    R.Bottom := R.Top + FTitleHeight;
    R.Right := 0;
    for J := 0 to LastFieldIndex do
    begin
      Field := ListFields[J];
      if J < LastFieldIndex
        then W := Field.DisplayWidth * TextWidth + 4
        else W := ClientWidth - R.Right;
      S := Field.DisplayLabel;
      AAlignment := taCenter;
      X := (W - Canvas.TextWidth(S)) div 2;
      R.Left := R.Right;
      R.Right := R.Right + W;
      Canvas.Brush.Color := clBtnFace;
      Canvas.TextRect(R, R.Left + X, R.Top, S);
      if J < LastFieldIndex then
      begin
        Canvas.Pen.Color := clGray;
        Canvas.MoveTo(R.Right, R.Top);
        Canvas.LineTo(R.Right, R.Bottom);
        Inc(R.Right);
        if R.Right >= ClientWidth then Break;
      end;
    end;
  end;
  if ColorToRGB(Color) <> ColorToRGB(clBtnFace)
    then Canvas.Pen.Color := clBtnFace
    else Canvas.Pen.Color := clBtnShadow;
  for I := 0 to FRowCount - 1 do
  begin
    if Enabled
      then Canvas.Font.Color := Font.Color
      else Canvas.Font.Color := clGrayText;
    Canvas.Brush.Color := Color;
    Selected := not FKeySelected and (I = 0);
    R.Top := I * TextHeight + FTitleHeight;
    R.Bottom := R.Top + TextHeight;
    if I < FRecordCount then
    begin
      ListLink.ActiveRecord := I;
      if not VarIsNull(KeyValue) and
        VarEquals(FListLink.DataSet.FieldValues[FKeyFieldName], KeyValue) then
      begin
        Canvas.Font.Color := clHighlightText;
        Canvas.Brush.Color := clHighlight;
        Selected := True;
      end;
      R.Right := 0;
      for J := 0 to LastFieldIndex do
      begin
        Field := ListFields[J];
        if J < LastFieldIndex then
          W := Field.DisplayWidth * TextWidth + 4 else
          W := ClientWidth - R.Right;
        S := Field.DisplayText;
        X := 2;
        AAlignment := Field.Alignment;
        if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
        case AAlignment of
          taRightJustify: X := W - Canvas.TextWidth(S) - 3;
          taCenter: X := (W - Canvas.TextWidth(S)) div 2;
        end;
        R.Left := R.Right;
        R.Right := R.Right + W;
        if SysLocale.MiddleEast then TControlCanvas(Canvas).UpdateTextFlags;
        Canvas.TextRect(R, R.Left + X, R.Top, S);
        if J < LastFieldIndex then
        begin
          Canvas.MoveTo(R.Right, R.Top);
          Canvas.LineTo(R.Right, R.Bottom);
          Inc(R.Right);
          if R.Right >= ClientWidth then Break;
        end;
      end;
    end;
    R.Left := 0;
    R.Right := ClientWidth;
    if I >= FRecordCount
      then Canvas.FillRect(R);
    if Selected and (HasFocus or FPopup) then
      Canvas.DrawFocusRect(R);
  end;
  if FRecordCount <> 0 then ListLink.ActiveRecord := FRecordIndex;
end;

procedure TDBLookupListBoxEh.SelectCurrent;
begin
  FLockPosition := True;
  try
    if not VarEquals(FListLink.DataSet.FieldValues[FKeyFieldName],KeyValue) then
      SelectKeyValue(FListLink.DataSet.FieldValues[FKeyFieldName]);
  finally
    FLockPosition := False;
  end;
end;

procedure TDBLookupListBoxEh.SelectItemAt(X, Y: Integer);
var
  Delta: Integer;
begin
  if Y < FTitleHeight then Y := FTitleHeight;
  if Y >= ClientHeight then Y := ClientHeight - 1 ;
  Delta := (Y - FTitleHeight) div GetTextHeight - FRecordIndex;
//  if (Delta <> 0) or (KeyValue = Null) then
//  begin
  ListLink.DataSet.MoveBy(Delta);
  SelectCurrent;
//  end;
end;

procedure TDBLookupListBoxEh.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
    RowCount := RowCount;
  end;
end;

procedure TDBLookupListBoxEh.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := GetTextHeight;
  if ShowTitles then FTitleHeight := TextHeight + 1 else FTitleHeight := 0;
  Rows := (AHeight - BorderSize - FTitleHeight) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  if ListLink.BufferCount <> Rows then
  begin
    ListLink.BufferCount := Rows;
    ListLinkDataChanged;
  end;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize + FTitleHeight);
end;

function TDBLookupListBoxEh.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TDBLookupListBoxEh.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 100 then Value := 100;
  Height := Value * GetTextHeight + GetBorderSize + FTitleHeight;
end;

procedure TDBLookupListBoxEh.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
  end;
end;

procedure TDBLookupListBoxEh.StopTracking;
begin
  if FTracking then
  begin
    StopTimer;
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TDBLookupListBoxEh.TimerScroll;
var
  Delta, Distance, Interval: Integer;
begin
  Delta := 0;
  Distance := 0;
  if FMousePos < 0 then
  begin
    Delta := -1;
    Distance := -FMousePos;
  end;
  if FMousePos >= ClientHeight then
  begin
    Delta := 1;
    Distance := FMousePos - ClientHeight + 1;
  end;
  if Delta = 0
    then StopTimer
  else
  begin
    if ListLink.DataSet.MoveBy(Delta) <> 0 then SelectCurrent;
    Interval := 200 - Distance * 15;
    if Interval < 0 then Interval := 0;
    SetTimer(Handle, 1, Interval, nil);
    FTimerActive := True;
  end;
end;

procedure TDBLookupListBoxEh.UpdateScrollBar;
var
  Pos, Max: Integer;
  Page: Cardinal;
  ScrollInfo: TScrollInfo;
begin
  Pos := 0;
  Max := 0;
  Page := 0;
  if (ListLink.DataSet<> nil) and ListLink.DataSet.IsSequenced then
  begin
    Page := FRowCount;
    Max := ListLink.DataSet.RecordCount-1;
    ListLink.ActiveRecord := 0;
    if ListLink.DataSet.State in [dsInactive, dsBrowse, dsEdit] then
      Pos := ListLink.DataSet.RecNo-1;
    if FRecordCount <> 0 then ListLink.ActiveRecord := FRecordIndex;
  end else
  if FRecordCount = FRowCount then
  begin
    Max := 4;
    if not ListLink.DataSet.BOF then
      if not ListLink.DataSet.EOF then Pos := 2 else Pos := 4;
  end;
  ScrollInfo.cbSize := SizeOf(TScrollInfo);
  ScrollInfo.fMask := SIF_ALL;
  if not GetScrollInfo(Handle, SB_VERT, ScrollInfo) or
    (ScrollInfo.nPos <> Pos) or (ScrollInfo.nMax <> Max) or
    (ScrollInfo.nPage <> Page) or (ScrollInfo.nPos <> Pos) then
  begin
    ScrollInfo.nMin := 0;
    ScrollInfo.nMax := Max;
    ScrollInfo.nPos := Pos;
    ScrollInfo.nPage := Page;
    SetScrollInfo(Handle, SB_VERT, ScrollInfo, True);
  end;
end;

procedure TDBLookupListBoxEh.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    RecreateWnd;
    RowCount := RowCount;
  end;
  inherited;
end;

procedure TDBLookupListBoxEh.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := Height;
end;

procedure TDBLookupListBoxEh.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TDBLookupListBoxEh.WMTimer(var Message: TMessage);
begin
  TimerScroll;
end;

procedure TDBLookupListBoxEh.WMVScroll(var Message: TWMVScroll);
var
  SI: TScrollInfo;
  OldRecNo:Integer;
  OldActiveRec:Integer;
begin
  SearchText := '';
  if ListLink.DataSet = nil then
    Exit;
  with Message, ListLink.DataSet do
    case ScrollCode of
      SB_LINEUP: MoveBy(-FRecordIndex - 1);
      SB_LINEDOWN: MoveBy(FRecordCount - FRecordIndex);
      SB_PAGEUP: MoveBy(-FRecordIndex - FRecordCount + 1);
      SB_PAGEDOWN: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
      SB_THUMBPOSITION:
        begin
          case Pos of
            0: First;
            1: MoveBy(-FRecordIndex - FRecordCount + 1);
            2: Exit;
            3: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
            4: Last;
          end;
        end;
      SB_BOTTOM: Last;
      SB_TOP: First;
      SB_THUMBTRACK:
         if IsSequenced then
         begin
            SI.cbSize := SizeOf(SI);
            SI.fMask := SIF_TRACKPOS;
            GetScrollInfo(Self.Handle, SB_VERT, SI);
            OldActiveRec := ListLink.ActiveRecord;
            ListLink.ActiveRecord := 0;
            OldRecNo := RecNo-1;
            if SI.nTrackPos < OldRecNo then
              MoveBy(SI.nTrackPos-OldRecNo)
            else if SI.nTrackPos > OldRecNo then
              MoveBy(SI.nTrackPos-OldRecNo+ListLink.RecordCount-1)
            else
              ListLink.ActiveRecord := OldActiveRec;
         end;
    end;
end;

function TDBLookupListBoxEh.ExecuteAction(Action: TBasicAction): Boolean;
begin
//  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
//    FDataLink.ExecuteAction(Action);
  Result := inherited ExecuteAction(Action);
  if not Result and (DataSource <> nil) then
    if Action.HandlesTarget(DataSource) then
      Action.ExecuteTarget(DataSource);
end;

function TDBLookupListBoxEh.UpdateAction(Action: TBasicAction): Boolean;
begin
//  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
//    FDataLink.UpdateAction(Action);
  Result := inherited UpdateAction(Action);
  if not Result and (DataSource <> nil) then
    if Action.HandlesTarget(DataSource) then
      Action.UpdateTarget(DataSource);
end;

procedure TDBLookupListBoxEh.SetShowTitles(const Value: Boolean);
begin
  if FShowTitles <> Value then
  begin
    FShowTitles := Value;
    if FShowTitles then FTitleHeight := GetTextHeight + 1 else FTitleHeight := 0;
    //if HandleAllocated then
    Height := RowCount * GetTextHeight + GetBorderSize + FTitleHeight;
  end;
end;

{ TSizeGripEh }

constructor TSizeGripEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := GetSystemMetrics(SM_CXVSCROLL);
  Height := GetSystemMetrics(SM_CYVSCROLL);
  Color := clBtnFace;
  Cursor := crSizeNWSE;
  ControlStyle := ControlStyle + [csCaptureMouse];
  FTriangleWindow := True;
  FPosition := sgpBottomRight;
end;

procedure TSizeGripEh.CreateWnd;
type
  PPoints = ^TPoints;
  TPoints = array[0..0] of TPoint;
var
  Points :array[0..2] of TPoint;
  Region: HRgn;
begin
  inherited CreateWnd;
  if TriangleWindow then
  begin
    if Position = sgpBottomRight then
    begin
      Points[0] := Point(0,Height);
      Points[1] := Point(Width,Height);
      Points[2] := Point(Width,0);
      Cursor := crSizeNWSE;
    end else if Position = sgpBottomLeft then
    begin
      Points[0] := Point(Width,Height);
      Points[1] := Point(0,Height);
      Points[2] := Point(0,0);
      Cursor := crSizeNESW;
    end else if Position = sgpTopLeft then
    begin
      Points[0] := Point(Width-1,0);
      Points[1] := Point(0,0);
      Points[2] := Point(0,Height-1);
      Cursor := crSizeNWSE;
    end else if Position = sgpTopRight then
    begin
      Points[0] := Point(Width,Height-1);
      Points[1] := Point(Width,0);
      Points[2] := Point(1,0);
      Cursor := crSizeNESW;
    end;
    Region:=CreatePolygonRgn(PPoints(@Points)^,3,WINDING);
    SetWindowRgn(Handle, Region, True);
    UpdatePosition;
    //ShowWindow(Handle,SW_SHOW);
  end;
end;

procedure TSizeGripEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseDown(Button,Shift,X,Y);
  FInitScreenMousePos := ClientToScreen(Point(X, Y));
  FParentRect.Right := Parent.Width;
  FParentRect.Bottom := Parent.Height;
  FParentRect.Left := Parent.ClientWidth;
  FParentRect.Top := Parent.ClientHeight;
end;

procedure TSizeGripEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewMousePos:TPoint;
  OldPos:Integer;
  ParentWidthHeight:TPoint;
begin
  inherited MouseMove(Shift,X,Y);

  if (ssLeft in Shift) and MouseCapture and not FInternalMove then
  begin
    NewMousePos := ClientToScreen(Point(X, Y));
    ParentWidthHeight.x := Parent.ClientWidth;
    ParentWidthHeight.y := Parent.ClientHeight;

    if (FOldMouseMovePos.x = NewMousePos.x) and
       (FOldMouseMovePos.y = NewMousePos.y) then
       Exit;

    if Position in [sgpBottomRight,sgpTopRight] then
      Parent.ClientWidth := FParentRect.Left + NewMousePos.x - FInitScreenMousePos.x
    else
    begin
      OldPos := Parent.Width;
      Parent.Width := FParentRect.Right + FInitScreenMousePos.x - NewMousePos.x;
      Parent.Left := Parent.Left + OldPos - Parent.Width;
    end;

    if Position in [sgpBottomRight,sgpBottomLeft] then
      Parent.ClientHeight := FParentRect.Top + NewMousePos.y - FInitScreenMousePos.y
    else
    begin
      OldPos := Parent.{Client}Height;
      Parent.{Client}Height := FParentRect.Bottom + FInitScreenMousePos.y - NewMousePos.y;
      Parent.Top := Parent.Top + OldPos - Parent.{Client}Height;
    end;

    FOldMouseMovePos := NewMousePos;
    if (ParentWidthHeight.x <> Parent.ClientWidth) or
       (ParentWidthHeight.y <> Parent.ClientHeight) then
      ParentResized;
    UpdatePosition;
  end;
end;

procedure TSizeGripEh.Paint;
var i,xi,yi:Integer;
    x1,x2,y1,y2:Integer;
    px,py:PInteger;
begin
  i := 1;
  if Position = sgpBottomRight then
  begin
    xi := 1; yi := 1;
    px := @x1; py := @y2;
    x1 := 0; y1 := Width;
    x2 := Width; y2 := 0;
  end else if Position = sgpBottomLeft then
  begin
    xi := -1; yi := 1;
    px := @x2; py := @y1;
    x1 := 0; y1 := 1;
    x2 := Width-1; y2 := Width;
  end else if Position = sgpTopLeft then
  begin
    xi := -1; yi := -1;
    px := @x1; py := @y2;
    x1 := Width-1; y1 := -1;
    x2 := -1; y2 := Width-1;
  end else //  Position = sgpTopRight
  begin
    xi := 1; yi := -1;
    px := @x2; py := @y1;
    x1 := Width; y1 := Width-1;
    x2 := 0; y2 := -1;
  end;

  with Canvas do
    while i < Width do
    begin
      Pen.Color := clBtnHighlight;
      PolyLine([Point(x1,y1),Point(x2,y2)]);
      Inc(i); Inc(px^,xi); Inc(py^,yi);

      Pen.Color := clBtnShadow;
      PolyLine([Point(x1,y1),Point(x2,y2)]);
      Inc(i); Inc(px^,xi); Inc(py^,yi);
      PolyLine([Point(x1,y1),Point(x2,y2)]);
      Inc(i); Inc(px^,xi); Inc(py^,yi);

      Pen.Color := clBtnFace;
      PolyLine([Point(x1,y1),Point(x2,y2)]);
      Inc(i); Inc(px^,xi); Inc(py^,yi);
    end;
end;

procedure TSizeGripEh.ParentResized;
begin
  if Assigned(FParentResized) then FParentResized(Self);
end;

procedure TSizeGripEh.SetPosition(const Value: TSizeGripPostion);
begin
  if FPosition = Value then Exit;
  FPosition := Value;
  RecreateWnd;
  HandleNeeded;
end;

procedure TSizeGripEh.SetTriangleWindow(const Value: Boolean);
begin
  if FTriangleWindow = Value then Exit;
  FTriangleWindow := Value;
  RecreateWnd;
  HandleNeeded;
end;

procedure TSizeGripEh.UpdatePosition;
begin
  FInternalMove := True;
  case Position of
    sgpBottomRight: MoveWindow(Handle,Parent.ClientWidth-Width,Parent.ClientHeight-Height,Width,Height,True);
    sgpBottomLeft: MoveWindow(Handle,0,Parent.ClientHeight-Height,Width,Height,True);
    sgpTopLeft: MoveWindow(Handle,0,0,Width,Height,True);
    sgpTopRight: MoveWindow(Handle,Parent.ClientWidth-Width,0,Width,Height,True);
  end;
  FInternalMove := False;
end;

procedure TSizeGripEh.WMMove(var Message: TMessage);
begin
  if not FInternalMove then UpdatePosition;
  inherited;
end;

procedure TSizeGripEh.ChangePosition(NewPosition: TSizeGripChangePosition);
begin
  if NewPosition = sgcpToLeft then
  begin
    if Position = sgpTopRight then Position := sgpTopLeft
    else if Position = sgpBottomRight then Position := sgpBottomLeft;
  end else if NewPosition = sgcpToRight then
  begin
    if Position = sgpTopLeft then Position := sgpTopRight
    else if Position = sgpBottomLeft then Position := sgpBottomRight
  end else if NewPosition = sgcpToTop then
  begin
    if Position = sgpBottomRight then Position := sgpTopRight
    else if Position = sgpBottomLeft then Position := sgpTopLeft
  end else if NewPosition = sgcpToBottom then
  begin
    if Position = sgpTopRight then Position := sgpBottomRight
    else if Position = sgpTopLeft then Position := sgpBottomLeft
  end
end;

function TSizeGripEh.GetVisible: Boolean;
begin
  Result := IsWindowVisible(Handle);
end;

procedure TSizeGripEh.SetVisible(const Value: Boolean);
begin
  if Value then
    ShowWindow(Handle,SW_SHOW)
  else
    ShowWindow(Handle,SW_HIDE);
end;

{ TPopupDataListEh }

constructor TPopupDataListEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
  FPopup := True;
  FSizeGrip := TSizeGripEh.Create(Self);
  with FSizeGrip do
  begin
    Parent := Self;
    TriangleWindow := True;
  end;
end;

function TPopupDataListEh.CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if NewWidth < GetSystemMetrics(SM_CXVSCROLL) then
    NewWidth := GetSystemMetrics(SM_CXVSCROLL);
  if NewHeight < GetSystemMetrics(SM_CYVSCROLL) then
    NewHeight := GetSystemMetrics(SM_CYVSCROLL);
end;

procedure TPopupDataListEh.CMSetSizeGripChangePosition(var Message: TMessage);
begin
  FSizeGrip.ChangePosition(TSizeGripChangePosition(Message.WParam));
end;

procedure TPopupDataListEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER or WS_CLIPCHILDREN;
    ExStyle := WS_EX_TOOLWINDOW;
    AddBiDiModeExStyle(ExStyle);
    WindowClass.Style := CS_SAVEBITS or CS_HREDRAW;
  end;
end;

procedure TPopupDataListEh.KeyDown(var Key: Word; Shift: TShiftState);
begin
  FUserKeyValueChanged := True;
  try
    inherited KeyDown(Key,Shift);
  finally
    FUserKeyValueChanged := False;
  end;
end;

procedure TPopupDataListEh.KeyValueChanged;
begin
  inherited KeyValueChanged;
  if Assigned(OnUserKeyValueChange) and FUserKeyValueChanged then
    OnUserKeyValueChange(Self);
end;

procedure TPopupDataListEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FUserKeyValueChanged := True;
  try
    inherited MouseDown(Button,Shift,X,Y);
  finally
    FUserKeyValueChanged := False;
  end;
end;

procedure TPopupDataListEh.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  FUserKeyValueChanged := True;
  try
    inherited MouseMove(Shift,X,Y);
    if ([ssLeft, ssRight, ssMiddle] * Shift = []) and not ReadOnly then
      SelectItemAt(X,Y);
  finally
    FUserKeyValueChanged := False;
  end;
end;

procedure TPopupDataListEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  FUserKeyValueChanged := True;
  try
    inherited MouseUp(Button,Shift,X,Y);
  finally
//    FUserKeyValueChanged := False;
  end;
end;

procedure TPopupDataListEh.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
  //inherited;
end;

procedure TPopupDataListEh.WMMouseActivate(var Message: TMessage);
begin
  Message.Result := MA_NOACTIVATE;
end;

procedure TPopupDataListEh.WMSize(var Message: TWMSize);
begin
  inherited;
  FSizeGrip.UpdatePosition;
  FSizeGripResized := True;
end;

procedure TPopupDataListEh.WMWindowPosChanging(var Message: TWMWindowPosChanging);
begin
  if ComponentState * [csReading, csDestroying] = [] then
    with Message.WindowPos^ do
      if (flags and SWP_NOSIZE = 0) and not CheckNewSize(cx, cy) then
        flags := flags or SWP_NOSIZE;
  inherited;
end;

initialization
  FlatButtonWidth := GetDefaultFlatButtonWidth;
  ButtonsBitmapCache := TButtonsBitmapCache.Create;
finalization
  ButtonsBitmapCache.Free;
end.
