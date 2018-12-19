{***********************************************************************}
{ TToolPanels component                                                 }
{ for Delphi & C++Builder                                               }
{ version 1.0                                                           }
{                                                                       }
{ written by TMS Software                                               }
{            copyright © 2003                                           }
{            Email: info@tmssoftware.com                                }
{            Web: http://www.tmssoftware.com                            }
{                                                                       }
{ The source code is given as is. The author is not responsible         }
{ for any possible damage done due to the use of this code.             }
{ The component can be freely used in any application. The complete     }
{ source code remains property of the author and may not be distributed,}
{ published, given or sold in any form as such. No parts of the source  }
{ code can be included in any other component or application without    }
{ written authorization of the author.                                  }
{***********************************************************************}

unit ToolPanels;

interface

{$R ToolPanels.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, INIFiles, Registry;

type
  TAdvToolPanel = class;
  TAdvToolPanelTab = class;

  TPanelState = (psOpened, psClosed, psDocked);

  TToolPanel = class(TCollectionItem)
  private
    FTag: Integer;
    FPanel: TAdvToolPanel;
    FCaption: string;
    FVisible: Boolean;
    FImageIndex: Integer;
    FState: TPanelState;
    FOpenWidth: Integer;
    procedure SetCaption(const Value: string);
    procedure SetVisible(const Value: Boolean);
    procedure SetImageIndex(const Value: Integer);
    procedure SetState(const Value: TPanelState);
    procedure SetOpenWidth(const Value: Integer);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Panel: TAdvToolPanel read FPanel write FPanel;
  published
    property Tag: Integer read FTag write FTag;
    property Caption: string read FCaption write SetCaption;
    property Visible: Boolean read FVisible write SetVisible;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;
    property State: TPanelState read FState write SetState;
    property OpenWidth: Integer read FOpenWidth write SetOpenWidth;
  end;

  TToolPanels = class(TCollection)
  private
    FOwner: TAdvToolPanelTab;
    function GetItem(Index: Integer): TToolPanel;
    procedure SetItem(Index: Integer; const Value: TToolPanel);
  public
    constructor Create(AOwner: TAdvToolPanelTab);
    function Add: TToolPanel;
    function Insert(index: Integer): TToolPanel;
    property Items[Index: Integer]: TToolPanel read GetItem write SetItem; default;
    property Panel: TAdvToolPanelTab read FOwner;
  end;

  TAdvToolPanel = class(TCustomPanel)
  private
    FImageIndex: Integer;
    FTab: TAdvToolPanelTab;
    FOpenWidth: Integer;
    FMouseDown: Boolean;
    FLocked: Boolean;
    FCloseGlyph: TBitmap;
    FLockedGlyph: TBitmap;
    FUnLockedGlyph: TBitmap;
    FCanSize: Boolean;
    FHidden: Boolean;
    FCLoseHint: string;
    FLockHint: string;
    FUnlockHint: string;
    FActive: Boolean;
    FFocusCaptionColor: TColor;
    FFocusCaptionFontColor: TColor;
    FNoFocusCaptionColor: TColor;
    FNoFocusCaptionFontColor: TColor;
    FDocking: Boolean;
    FShowCaption: Boolean;
    FAllowDocking: Boolean;
    FRestored: Boolean;
    FTabName: string;
    procedure WMEXITSIZEMOVE(var Msg: TMessage); message WM_EXITSIZEMOVE;
    procedure WMENTERSIZEMOVE(var Msg: TMessage); message WM_ENTERSIZEMOVE;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMHintShow(var Msg: TMessage); message CM_HINTSHOW;
    procedure SetLocked(const Value: Boolean);
    function GetCaptionEx: string;
    procedure SetCaptionEx(const Value: string);
    procedure SetImageIndex(const Value: Integer);
    procedure SetHidden(const Value: Boolean);
    function GetIsVisible: Boolean;
    procedure SetFocusCaptionColor(const Value: TColor);
    procedure SetFocusCaptionFontColor(const Value: TColor);
    procedure SetNoFocusCaptionColor(const Value: TColor);
    procedure SetNoFocusCaptionFontColor(const Value: TColor);
    procedure DrawMonoBitmap(ACanvas: TCanvas; X,Y: Integer;ABitmap: TBitmap; FGColor,BkColor: TColor);
    procedure SetDocking(const Value: Boolean);
    procedure SetShowCaption(const Value: Boolean);
    procedure SetOpenWidth(const Value: Integer);
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X,Y:Integer); override;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X,Y:Integer); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    property Restored: Boolean read FRestored write FRestored default False;
    property TabName: string read FTabName write FTabName;
    function HasFocusControl: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure DoEndDock(Target: TObject; X, Y: Integer); override;
    procedure DoStartDock(var DragObject: TDragObject); override;

    property Tab: TAdvToolPanelTab read FTab write FTab;
    property Locked: Boolean read FLocked write SetLocked;
    property Hidden: Boolean read FHidden write SetHidden;
    property Docking: Boolean read FDocking write SetDocking;
    property IsVisible: Boolean read GetIsVisible;
  published
    property Alignment;
    property AllowDocking: Boolean read FAllowDocking write FAllowDocking default True;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderStyle;
    property BorderWidth;
    property Cursor;
    property Hint;
    property PopupMenu;

    property CanSize: Boolean read FCanSize write FCanSize default True;
    property Caption: string read GetCaptionEx write SetCaptionEx;
    property Font;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property FocusCaptionFontColor: TColor read FFocusCaptionFontColor write SetFocusCaptionFontColor;
    property FocusCaptionColor: TColor read FFocusCaptionColor write SetFocusCaptionColor;
    property NoFocusCaptionFontColor: TColor read FNoFocusCaptionFontColor write SetNoFocusCaptionFontColor;
    property NoFocusCaptionColor: TColor read FNoFocusCaptionColor write SetNoFocusCaptionColor;
    property OpenWidth: Integer read FOpenWidth write SetOpenWidth default 150;
    property CloseHint: string read FCloseHint write FCloseHint;
    property LockHint: string read FLockHint write FLockHint;
    property UnlockHint: string read FUnlockHint write FUnlockHint;
    property ShowCaption: Boolean read FShowCaption write SetShowCaption default True;
    property ShowHint;

    property OnClick;
    property OnDblClick;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

  TToolPanelForm = class(TForm)
  private
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TPanelPosition = (ppLeft,ppRight);

  TSlideSpeed = (ssSlow, ssMedium, ssFast);

  TAutoOpenCloseSpeed = (aocSlow, aocMedium, aocFast);

  TTabEvent = procedure(Sender: TObject; Index: Integer; APanel: TAdvToolPanel) of object;

  TPanelPersistLocation = (pplINIFile, pplRegistry);

  TPanelPersistence = class(TPersistent)
  private
    FAutoSave: Boolean;
    FAutoLoad: Boolean;    
    FINIFile: string;
    FLocation: TPanelPersistLocation;
    FRegistryKey: string;
  published
    property AutoLoad: Boolean read FAutoLoad write FAutoLoad default False;
    property AutoSave: Boolean read FAutoSave write FAutoSave default False;
    property INIFile: string read FINIFile write FINIFile;
    property RegistryUserKey: string read FRegistryKey write FRegistryKey;
    property Location: TPanelPersistLocation read FLocation write FLocation default pplINIFile;
  end;

  TAdvToolPanelTab = class(TCustomPanel)
  private
    FPanels: TToolPanels;
    FImages: TImageList;
    FRollInOut: Boolean;
    FRollOutPanel: Integer;
    FRollInCandidate: Integer;
    FTimerID: Integer;
    FTimerCount: Integer;
    FTimerRollIn: Integer;
    FTimerEnable: Boolean;
    FPosition: TPanelPosition;
    FPanelForm: TToolPanelForm;
    FFormWndProc: TWndMethod;
    FDesignViewPanel: Integer;
    FTabColor: TColor;
    FLastMousePos: TPoint;
    FAutoDock: Boolean;
    FAutoOpenCloseSpeed: TAutoOpenCloseSpeed;
    FSlideSpeed: TSlideSpeed;
    FPaintOffset: Integer;
    FUpDown: TBitmap;
    FColorTo: TColor;
    FTabColorTo: TColor;
    FTabBorderColor: TColor;
    FHoverPanel: Integer;
    FMousePanel: Integer;
    FTabHoverColor: TColor;
    FTabHoverColorTo: TColor;
    FTabWidth: Integer;
    FTabGlyph: TBitmap;
    FOnTabLeave: TTabEvent;
    FOnTabEnter: TTabEvent;
    FOnTabRightClick: TTabEvent;
    FOnTabLeftClick: TTabEvent;
    FOnTabSlideIn: TTabEvent;
    FOnTabSlideOut: TTabEvent;
    FPersist: TPanelPersistence;
    FOnTabHide: TTabEvent;
    function GetPanelFromTab(y: Integer): Integer;
    function GetTabSize: Integer;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    procedure WMCommand(var Message: TMessage); message WM_COMMAND;
    procedure WMEraseBkGnd(var Message:TMessage); message WM_ERASEBKGND;
    procedure SetPosition(const Value: TPanelPosition);
    procedure SubclassProc(var Msg: TMessage);
    procedure SetTabColor(const Value: TColor);
    procedure SetAutoDock(const Value: Boolean);
    procedure SetColorTo(const Value: TColor);
    procedure SetTabColorTo(const Value: TColor);
    procedure SetTabBorderColor(const Value: TColor);
    procedure SetTabWidth(const Value: Integer);
    procedure SetTabGlyph(const Value: TBitmap);
  protected
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure Paint; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X,Y:Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure RollIn(APanel: TAdvToolPanel);
    procedure RollOut(APanel: TAdvToolPanel);
    procedure LockChange(APanel: TAdvToolPanel);
    procedure RollInOut(Index: Integer);
    procedure WndProc(var Msg: TMessage); override;
    procedure Resize; override;
    procedure ResetTimer;
    procedure EnableTimer(Enabled: Boolean);
    procedure INISaveState;
    procedure REGSaveState;
    function INIRestoreState: Boolean;
    function REGRestoreState: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdatePanels(Index: Integer);
    procedure Loaded; override;
    procedure CreateWnd; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure DockOver(Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;    
    procedure DockDrop(Source: TDragDockObject; X, Y: Integer); override;
    procedure RemovePanel(APanel: TAdvToolPanel);
    procedure InsertPanel(APanel: TAdvToolPanel);
    procedure UpdatePanel(APanel: TAdvToolPanel);
    procedure UnHidePanel(APanel: TAdvToolPanel);
    procedure UnHidePanels;
    function PanelsInTab: Integer; 
    function CreatePanel: TAdvToolPanel;        
    property Panels: TToolPanels read FPanels write FPanels;
    procedure NextPanel;
    procedure PrevPanel;
    function PanelIndex(APanel: TAdvToolPanel): Integer;
    function PanelByName(AName:string): TAdvToolPanel;
    procedure SaveState;
    procedure RestoreState;
  published
    property Alignment;
    property AutoDock: Boolean read FAutoDock write SetAutoDock default True;
    property AutoOpenCloseSpeed: TAutoOpenCloseSpeed read FAutoOpenCloseSpeed write FAutoOpenCloseSpeed default aocMedium;
    property Color;
    property ColorTo: TColor read FColorTo write SetColorTo default clNone;
    property Hint;
    property Images: TImageList read FImages write FImages;
    property Persist: TPanelPersistence read FPersist write FPersist;
    property Position: TPanelPosition read FPosition write SetPosition;
    property SlideSpeed: TSlideSpeed read FSlideSpeed write FSlideSpeed default ssMedium;
    property TabBorderColor: TColor read FTabBorderColor write SetTabBorderColor default clGray; 
    property TabColor: TColor read FTabColor write SetTabColor default clBtnFace;
    property TabColorTo: TColor read FTabColorTo write SetTabColorTo default clNone;
    property TabHoverColor: TColor read FTabHoverColor write FTabHoverColor default clNone;
    property TabHoverColorTo: TColor read FTabHoverColorTo write FTabHoverColorTo default clNone;
    property TabWidth: Integer read FTabWidth write SetTabWidth default 23;
    property TabGlyph: TBitmap read FTabGlyph write SetTabGlyph;
    property OnDockOver;
    property OnDockDrop;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    property OnTabEnter: TTabEvent read FOnTabEnter write FOnTabEnter;
    property OnTabLeave: TTabEvent read FOnTabLeave write FOnTabLeave;
    property OnTabLeftClick: TTabEvent read FOnTabLeftClick write FOnTabLeftClick;
    property OnTabRightClick: TTabEvent read FOnTabRightClick write FOnTabRightClick;
    property OnTabSlideOut: TTabEvent read FOnTabSlideOut write FOnTabSlideOut;
    property OnTabSlideIn: TTabEvent read FOnTabSlideIn write FOnTabSlideIn;
    property OnTabHide: TTabEvent read FOnTabHide write FOnTabHide;
  end;


implementation

const
  CAPTION_HEIGHT = 20; 

type
  TMonologPalette = packed record
    palVersion: Word;
    palNumEntries: Word;
    palPalEntry: array[0..1] of TPaletteEntry;
  end;

{ TToolPanels }


function TToolPanels.Add: TToolPanel;
begin
  Result := TToolPanel(inherited Add);
end;

constructor TToolPanels.Create(AOwner: TAdvToolPanelTab);
begin
  inherited Create(TToolPanel);
  FOwner := AOwner;
end;

function TToolPanels.GetItem(Index: Integer): TToolPanel;
begin
  Result := TToolPanel(inherited Items[Index]);
end;

function TToolPanels.Insert(Index: Integer): TToolPanel;
begin
  Result := TToolPanel(inherited Insert(Index));
end;

procedure TToolPanels.SetItem(Index: Integer; const Value: TToolPanel);
begin
  inherited Items[Index] := Value;
end;

{ TAdvToolPanelTab }

constructor TAdvToolPanelTab.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPanels := TToolPanels.Create(Self);
  Caption := '';
  ControlStyle := ControlStyle - [csAcceptsControls,csDesignInteractive];
  FRollInOut := False;
  FRollOutPanel := -1;
  FHoverPanel := -1;
  FPosition := ppLeft;
  FTimerEnable := True;
  Align := alLeft;
  FPanelForm := TToolPanelForm.Create(self);
  FPanelForm.BorderStyle := bsNone;
  FPanelForm.Parent := self.Parent;
  FPanelForm.Visible := False;
  Color := clInfoBk;
  FSlideSpeed := ssMedium;
  FAutoOpenCloseSpeed := aocMedium;
  DoubleBuffered := True;
  FPaintOffset := 0;
  FUpDown := TBitmap.Create;
  FUpDown.LoadFromResourceName(Hinstance,'TMS_UPDOWN');
  FColorTo := clNone;
  FTabColor := clBtnFace;
  FTabColorTo := clNone;
  FTabHoverColor := clNone;
  FTabHoverColorTo := clNone;
  FTabBorderColor := clGray;
  FTabWidth := 23;
  FTabGlyph := TBitmap.Create;
  FAutoDock := True;
  DockSite := True;
  FPersist := TPanelPersistence.Create;
end;

procedure TAdvToolPanelTab.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  if Position = ppLeft then
  begin
    if (Msg.XPos <= FTabWidth) and (GetAsyncKeyState(VK_LBUTTON) <> 0) and (GetPanelFromTab(Msg.YPos) >= 0) then
      Msg.Result := 1
    else
      inherited;
  end;
  if Position = ppRight then
  begin
    if (Msg.XPos > Width - FTabWidth) and (GetAsyncKeyState(VK_LBUTTON) <> 0) and (GetPanelFromTab(Msg.YPos) >= 0) then
      Msg.Result := 1
    else
      inherited;
  end;
end;

destructor TAdvToolPanelTab.Destroy;
begin
  FPanels.Free;
  FUpDown.Free;
  FTabGlyph.Free;
  FPanelForm.Destroy;
  FPersist.Free;
  inherited;
end;

function TAdvToolPanelTab.GetTabSize: Integer;
var
  tf: TFont;
  lf: TLogFont;
  r: TRect;
  i,tw: Integer;
begin
  Result := 0;

  r := ClientRect;

  with Canvas do
  begin
    tf := TFont.Create;
    try
      FillChar(lf, SizeOf(lf),0);
      tf.Assign(Font);
      GetObject(tf.Handle, SizeOf(Lf), @Lf);

      lf.lfEscapement := -900;
      lf.lfOrientation := 30;

      tf.Handle := CreateFontIndirect(Lf);
      Font.Assign(tf);

      r.Top := r.Top + 2;
      Result := Result + 2;

      if csDesigning in ComponentState then
      begin
        for i := 1 to ControlCount do
        begin
          tw := TextWidth(TAdvToolPanel(Controls[i - 1]).Caption) + 4;

          if Assigned(Images) and (TAdvToolPanel(Controls[i - 1]).ImageIndex >= 0) then
            tw := tw + 22;

          r.Top := r.Top + tw + 10;
          Result := Result + tw + 10;
        end;
      end
      else
      begin
        for i := 1 to Panels.Count do
        begin
          if Panels[i - 1].Panel.IsVisible then
          begin
            tw := TextWidth(Panels[i - 1].Caption) + 4;

            if Assigned(Images) and (Panels[i - 1].ImageIndex >= 0) then
              tw := tw + 22;

            r.Top := r.Top + tw + 10;
            Result := Result + tw + 10;
          end;
        end;
      end;
    finally
      tf.Free;
    end;
  end;

end;


function TAdvToolPanelTab.GetPanelFromTab(y: Integer): Integer;
var
  tf: TFont;
  lf: TLogFont;
  r: TRect;
  i,tw: Integer;
begin
  Result := -1;

  r := ClientRect;

  if (GetTabSize > Height) and (y > Height - 10) then
    Exit;

  r.Top := r.Top + FPaintOffset;

  with Canvas do
  begin
    tf := TFont.Create;
    try
      FillChar(lf, SizeOf(lf),0);
      tf.Assign(Font);
      GetObject(tf.Handle, SizeOf(Lf), @Lf);

      lf.lfEscapement := -900;
      lf.lfOrientation := 30;

      tf.Handle := CreateFontIndirect(Lf);
      Font.Assign(tf);

      r.Top := r.Top + 2;

      if csDesigning in ComponentState then
      begin
        for i := 1 to ControlCount do
        begin
          tw := TextWidth(TAdvToolPanel(Controls[i - 1]).Caption) + 4;

          if Assigned(Images) and (TAdvToolPanel(Controls[i - 1]).ImageIndex >= 0) then
            tw := tw + 22;

          if (y > r.Top) and (y < r.Top + tw + 10) then
          begin
            Result := i - 1;
            break;
          end;
          r.Top := r.Top + tw + 10;
        end;
      end
      else
      begin
        for i := 1 to Panels.Count do
        begin
          if Panels[i - 1].Panel.IsVisible then
          begin
            tw := TextWidth(Panels[i - 1].Caption) + 4;

            if Assigned(Images) and (Panels[i - 1].ImageIndex >= 0) then
              tw := tw + 22;

            if (y > r.Top) and (y < r.Top + tw + 10) then
            begin
              Result := i - 1;
              break;
            end;
            r.Top := r.Top + tw + 10;
          end;
        end;
      end;
    finally
      tf.Free;
    end;
  end;

end;

procedure TAdvToolPanelTab.UpdatePanels(Index: Integer);
var
  j: Integer;
  LeftPos: Integer;
begin
  if Position = ppLeft then
    LeftPos := FTabWidth
  else
    LeftPos := 0;

  FDesignViewPanel := Index;

  if Index = -1 then
  begin
    if (csDesigning in ComponentState) then
    begin
      for j := 1 to ControlCount do
      begin
        if Controls[j - 1].Width > 0 then
        begin
          Controls[j - 1].Left := LeftPos;
          Controls[j - 1].Width := Width - FTabWidth;
          Controls[j - 1].Top := 0;
          Controls[j - 1].Height := self.Height;
          Controls[j - 1].Visible := True;
        end;
      end;
    end;
  end
  else
    for j := 1 to ControlCount do
    begin
      if (Index = j - 1) then
      begin
        Controls[j - 1].Left := LeftPos;
        Controls[j - 1].Top := 0;
        Controls[j - 1].Width := Width - FTabWidth;
        Controls[j - 1].Height := Height;
        Controls[j - 1].Visible := True;
      end
      else
      begin
        Controls[j - 1].Visible := False;
        Controls[j - 1].Width := 0;
        Controls[j - 1].Height := 0;
      end;
    end;

  if Position = ppRight then
  begin
    if FPanelForm.Visible then
      FPanelForm.Height := Height;
  end;
  Invalidate;
end;

procedure TAdvToolPanelTab.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  i: Integer;
  ts: Integer;
begin
  inherited;

  i := GetPanelFromTab(y);

  if (Button = mbLeft) and Assigned(FOnTabLeftClick) then
    FOnTabLeftClick(Self,i, FPanels[i].Panel);

  if (Button = mbRight) and Assigned(FOnTabRightClick) then
    FOnTabRightClick(Self,i, FPanels[i].Panel);

  if (i >= 0) then
  begin
    if (csDesigning in ComponentState) then
    begin
      UpdatePanels(i);
      Invalidate;
    end
    else
      RollInOut(i);
  end
  else
  begin
    if FRollOutPanel <> -1 then
    begin
      RollIn(FPanels[FRollOutpanel].Panel);
      FRollOutpanel := -1;
    end;
  end;

  ts := GetTabSize;
  
  if (ts > Height) and (y > Height - 10) then
  begin
    if (x < 12) then
    begin
      if (FPaintOffset < 0) then
      begin
        FPaintOffset := FPaintOffset + 10;
        Invalidate;
      end;  
    end;

    if (x > 12) and (x <24) then
    begin
      if (Height - ts < FPaintOffset) then
      begin
        FPaintOffset := FPaintOffset - 10;
        Invalidate;
      end;
    end;
  end;

end;

procedure TAdvToolPanelTab.Notification(AComponent: TComponent;
  AOperation: TOperation);
var
  flg: Boolean;
begin
  flg := False;

  if (AOperation = opRemove) then
  begin
    flg := AComponent is TAdvToolPanel;
    if flg then
      Invalidate;
  end;

  if (AOperation = opRemove) and (AComponent = FImages) then
    FImages := nil;

  inherited;

  if flg then
  begin
    if ControlCount > 0 then
    begin
      UpdatePanels(0);
    end;
  end;
end;

procedure DrawGradient(Canvas: TCanvas; FromColor,ToColor: TColor; Steps: Integer; R: TRect; Direction: Boolean);
var
  diffr,startr,endr: Integer;
  diffg,startg,endg: Integer;
  diffb,startb,endb: Integer;
  rstepr,rstepg,rstepb,rstepw: Real;
  i,stepw: Word;

begin
  if Steps = 0 then
    Steps := 1;

  FromColor := ColorToRGB(FromColor);
  ToColor := ColorToRGB(ToColor);

  startr := (FromColor and $0000FF);
  startg := (FromColor and $00FF00) shr 8;
  startb := (FromColor and $FF0000) shr 16;
  endr := (ToColor and $0000FF);
  endg := (ToColor and $00FF00) shr 8;
  endb := (ToColor and $FF0000) shr 16;

  diffr := endr - startr;
  diffg := endg - startg;
  diffb := endb - startb;

  rstepr := diffr / steps;
  rstepg := diffg / steps;
  rstepb := diffb / steps;

  if Direction then
    rstepw := (R.Right - R.Left) / Steps
  else
    rstepw := (R.Bottom - R.Top) / Steps;

  with Canvas do
  begin
    for i := 0 to steps-1 do
    begin
      endr := startr + Round(rstepr*i);
      endg := startg + Round(rstepg*i);
      endb := startb + Round(rstepb*i);
      stepw := Round(i*rstepw);
      Pen.Color := endr + (endg shl 8) + (endb shl 16);
      Brush.Color := Pen.Color;
      if Direction then
        Rectangle(R.Left + stepw,R.Top,R.Left + stepw + Round(rstepw)+1,R.Bottom)
      else
        Rectangle(R.Left,R.Top + stepw,R.Right,R.Top + stepw + Round(rstepw)+1);
    end;
  end;
end;

procedure DrawTransparentBitmap(hdc: THandle; hBitmap: THandle;  xStart, yStart: Integer;
      width, height, offsx, offsy: Integer; cTransparentColor: TColor);
// The function draws a bitmap with a transparent background.
var
  cColor: TColor;
  bmAndBack, bmAndObject, bmAndMem, bmSave: THandle;
  bmBackOld, bmObjectOld, bmMemOld, bmSaveOld: THandle;
  hdcMem, hdcBack, hdcObject, hdcTemp, hdcSave: THandle;
  ptSize: TPoint;
begin
  hdcTemp := CreateCompatibleDC(hdc);
  SelectObject(hdcTemp, hBitmap);

  ptSize.x := width;
  ptSize.y := height;
  DPtoLP(hdcTemp, ptSize, 1);

  hdcBack   := CreateCompatibleDC(hdc);
  hdcObject := CreateCompatibleDC(hdc);
  hdcMem    := CreateCompatibleDC(hdc);
  hdcSave   := CreateCompatibleDC(hdc);

  bmAndBack   := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);
  bmAndObject := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);

  bmAndMem    := CreateCompatibleBitmap(hdc, ptSize.x, ptSize.y);
  bmSave      := CreateCompatibleBitmap(hdc, ptSize.x, ptSize.y);

  bmBackOld   := SelectObject(hdcBack, bmAndBack);
  bmObjectOld := SelectObject(hdcObject, bmAndObject);
  bmMemOld    := SelectObject(hdcMem, bmAndMem);
  bmSaveOld   := SelectObject(hdcSave, bmSave);

  SetMapMode(hdcTemp, GetMapMode(hdc));

  BitBlt(hdcSave, 0, 0, ptSize.x, ptSize.y, hdcTemp, offsx, offsy, SRCCOPY);

  cColor := SetBkColor(hdcTemp, cTransparentColor);

  BitBlt(hdcObject, 0, 0, ptSize.x, ptSize.y, hdcTemp, offsx, offsy, SRCCOPY);

  SetBkColor(hdcTemp, cColor);

  BitBlt(hdcBack, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, NOTSRCCOPY);

  // take copy of existing canvas
  BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdc, xStart, yStart, SRCCOPY);
  // and existing canvas with copy
  BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, SRCAND);

  BitBlt(hdcTemp, offsx, offsy, ptSize.x, ptSize.y, hdcBack, 0, 0, SRCAND);
  BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcTemp, offsx, offsy, SRCPAINT);
  BitBlt(hdc, xStart, yStart, ptSize.x, ptSize.y, hdcMem, 0, 0, SRCCOPY);
  BitBlt(hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcSave, 0, 0, SRCCOPY);

  DeleteObject(SelectObject(hdcBack, bmBackOld));
  DeleteObject(SelectObject(hdcObject, bmObjectOld));
  DeleteObject(SelectObject(hdcMem, bmMemOld));
  DeleteObject(SelectObject(hdcSave, bmSaveOld));

  DeleteDC(hdcMem);
  DeleteDC(hdcBack);

  DeleteDC(hdcObject);
  DeleteDC(hdcSave);
  DeleteDC(hdcTemp);
end;

procedure StretchTransparentBitmap(hdc: THandle; hBitmap: THandle;  xStart, yStart: Integer;
      width, height, offsx, offsy, bmpw, bmph: Integer; cTransparentColor: TColor);
// The function draws a bitmap with a transparent background.
var
  cColor: TColor;
  bmAndBack, bmAndObject, bmAndMem, bmSave: THandle;
  bmBackOld, bmObjectOld, bmMemOld, bmSaveOld: THandle;
  hdcMem, hdcBack, hdcObject, hdcTemp, hdcSave: THandle;
  ptSize: TPoint;
begin
  hdcTemp := CreateCompatibleDC(hdc);
  SelectObject(hdcTemp, hBitmap);

  ptSize.x := width;
  ptSize.y := height;
  DPtoLP(hdcTemp, ptSize, 1);

  hdcBack   := CreateCompatibleDC(hdc);
  hdcObject := CreateCompatibleDC(hdc);
  hdcMem    := CreateCompatibleDC(hdc);
  hdcSave   := CreateCompatibleDC(hdc);

  bmAndBack   := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);
  bmAndObject := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);

  bmAndMem    := CreateCompatibleBitmap(hdc, ptSize.x, ptSize.y);
  bmSave      := CreateCompatibleBitmap(hdc, ptSize.x, ptSize.y);

  bmBackOld   := SelectObject(hdcBack, bmAndBack);
  bmObjectOld := SelectObject(hdcObject, bmAndObject);
  bmMemOld    := SelectObject(hdcMem, bmAndMem);
  bmSaveOld   := SelectObject(hdcSave, bmSave);

  SetMapMode(hdcTemp, GetMapMode(hdc));

  StretchBlt(hdcSave, 0, 0, ptSize.x, ptSize.y, hdcTemp, offsx, offsy, bmpw,bmph, SRCCOPY);

  cColor := SetBkColor(hdcTemp, cTransparentColor);

  StretchBlt(hdcObject, 0, 0, ptSize.x, ptSize.y, hdcTemp, offsx, offsy, bmpw,bmph, SRCCOPY);

  SetBkColor(hdcTemp, cColor);

  BitBlt(hdcBack, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, NOTSRCCOPY);

  // take copy of existing canvas
  BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdc, xStart, yStart, SRCCOPY);
  // and existing canvas with copy
  BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, SRCAND);
  StretchBlt(hdcTemp, offsx, offsy, bmpw, bmph, hdcback, 0,0, ptsize.x, ptsize.y, SRCAND);
  StretchBlt(hdcMem,0,0,ptSize.X,ptSize.Y, hdctemp,offsx, offsy, bmpw, bmph, SRCPAINT);
  BitBlt(hdc, xStart, yStart, ptSize.x, ptSize.y, hdcMem, 0, 0, SRCCOPY);
  StretchBlt(hdcTemp, offsx, offsy, bmpw, bmph,hdcSave, 0, 0, ptsize.x, ptsize.y, SRCCOPY);

  DeleteObject(SelectObject(hdcBack, bmBackOld));
  DeleteObject(SelectObject(hdcObject, bmObjectOld));
  DeleteObject(SelectObject(hdcMem, bmMemOld));
  DeleteObject(SelectObject(hdcSave, bmSaveOld));

  DeleteDC(hdcMem);
  DeleteDC(hdcBack);

  DeleteDC(hdcObject);
  DeleteDC(hdcSave);
  DeleteDC(hdcTemp);
end;

procedure BitmapStretch(bmp:tbitmap; canvas:tcanvas; x,y,height: integer);
var
  mid: integer;
  fillh: integer;
  c: TColor;
begin
  mid := bmp.height div 2;
  fillh := height - bmp.height;
  c := bmp.Canvas.Pixels[0,bmp.Height - 1];
  DrawTransparentBitmap(canvas.handle,bmp.handle,x,y,bmp.Width,bmp.Height div 2,0,0,c);
  StretchTransparentBitmap(canvas.handle,bmp.Handle,x,y+mid,bmp.width,fillh,0,mid -1,bmp.Width,2,c);
  DrawTransparentBitmap(canvas.handle,bmp.handle,x,y+ mid + fillh, bmp.width, bmp.Height div 2,0,mid,c);
end;



procedure TAdvToolPanelTab.Paint;
var
  tf: TFont;
  lf: TLogFont;
  r: TRect;
  i,ih: Integer;
  tw,th,dx,dy: Integer;
  clr,clrto: TColor;
  bmp,tbmp: TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.Width := Width;
  bmp.Height := Height;

  tbmp := TBitmap.Create;

  if not FTabGlyph.Empty then
  begin
    tbmp.Width := FTabGlyph.Width;
    tbmp.Height := FTabGlyph.Height;
  end;

  if Assigned(Images) then
    ih := Images.Height
  else
    ih := 0;  

  r := ClientRect;

  with bmp.Canvas do
  begin
    if (csDesigning in ComponentState) then
    begin
      Brush.Color := Color;
      Pen.Color := Color;
      Rectangle(r);

      if ColorTo <> clNone then
        DrawGradient(bmp.Canvas,Color,ColorTo,16,Rect(r.Left,r.Top,r.Left + FTabWidth,r.Bottom),True)
    end
    else
    begin
      if ColorTo <> clNone then
        DrawGradient(bmp.Canvas,Color,ColorTo,16,r,True)
      else
      begin
        Brush.Color := Color;
        Pen.Color := Color;
        Rectangle(r);
      end;
    end;

    r.Top := r.Top + FPaintOffset;

    // Make sure to use a truetype font!
    Font.Name := 'Tahoma';
    tf := TFont.Create;
    try
      FillChar(lf, SizeOf(lf),0);
      tf.Assign(Font);
      GetObject(tf.Handle, SizeOf(Lf), @Lf);

      lf.lfEscapement := -900;
      lf.lfOrientation := 30;

      tf.Handle := CreateFontIndirect(Lf);
      Font.Assign(tf);

      r.Top := r.Top + 2;

      th := TextWidth('gh');


      if csDesigning in ComponentState then
      begin
        for i := 1 to ControlCount do
        begin
          if Controls[i - 1] is TAdvToolPanel then
          begin
            tw := TextWidth(TAdvToolPanel(Controls[i - 1]).Caption) + 4;

            if Assigned(Images) and (TAdvToolPanel(Controls[i - 1]).ImageIndex >= 0) then
              tw := tw + 22;

            if (FHoverPanel = i - 1) and (TabHoverColor <> clNone) then
            begin
              clr := TabHoverColor;
              clrto := TabHoverColorTo;
            end
            else
            begin
              clr := TabColor;
              clrto := TabColorTo;
            end;

            Brush.Color := clr;
            Pen.Color := TabBorderColor;

            Pen.Width := 1;

            dy := r.Top + 4;
            if Position = ppLeft then
            begin
              if not FTabGlyph.Empty then
              begin
                tbmp.Canvas.Draw(0,0,FTabGlyph);
                BitmapStretch(tbmp,bmp.Canvas,r.Left,r.Top,tw + ih + 8);
              end
              else
              begin
                if FTabColorTo = clNone then
                  Rectangle(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4)
                else
                begin
                  DrawGradient(bmp.Canvas,clr,clrto,16,Rect(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4),True);
                  Brush.Style := bsClear;
                  Pen.Color := TabBorderColor;
                  Rectangle(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4)
                end;
              end;

              dx := r.Left + TabWidth - ((FTabWidth - th) div 2);
            end
            else
            begin
              if not FTabGlyph.Empty then
              begin
                tbmp.Canvas.Draw(0,0,FTabGlyph);
                BitmapStretch(tbmp,bmp.Canvas,r.right - FTabWidth,r.Top,tw + ih + 8);
              end
              else
              begin
                if FTabColorTo = clNone then
                  Rectangle(r.Right - FTabWidth + 4,r.Top,r.Right, r.Top + tw + 4)
                else
                begin
                  DrawGradient(bmp.Canvas,clr,clrto,16,Rect(r.Right - FTabWidth + 4,r.Top,r.Right, r.Top + tw + 4),True);
                  Brush.Style := bsClear;
                  Pen.Color := TabBorderColor;
                  Rectangle(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4)
                end;
              end;
              dx := r.Right + 4 - (FTabWidth - th) div 2;
            end;

            if Assigned(Images) and (TAdvToolPanel(Controls[i - 1]).ImageIndex >= 0) then
            begin
              Images.DrawingStyle := dsTransparent;

              if Position = ppLeft then
                Images.Draw(bmp.Canvas,r.Left + (FTabWidth - Images.Width) div 2,r.Top + 6,TAdvToolPanel(Controls[i - 1]).ImageIndex)
              else
                Images.Draw(bmp.Canvas,r.Right + 1 - Images.Width - ((FTabWidth - Images.Width) div 2),r.Top + 6,TAdvToolPanel(Controls[i - 1]).ImageIndex);
              dy := dy + ih + 4;
            end;

            bmp.Canvas.Brush.Style := bsClear;
            TextOut(dx,dy , TAdvToolPanel(Controls[i - 1]).Caption);

            r.Top := r.Top + tw + 10;
          end;
        end;
      end
      else
      begin
        for i := 1 to Panels.Count do
        begin
          if Panels[i - 1].Panel.IsVisible then
          begin
            tw := TextWidth(Panels[i - 1].Caption) + 4;

            if Assigned(Images) and (Panels[i - 1].ImageIndex >= 0) then
              tw := tw + 22;

            if (FHoverPanel = i - 1) and (TabHoverColor <> clNone) then
            begin
              clr := TabHoverColor;
              clrto := TabHoverColorTo;
            end
            else
            begin
              clr := TabColor;
              clrto := TabColorTo;
            end;

            Brush.Color := clr;
            Pen.Color := TabBorderColor;
            Pen.Width := 1;

            dy := r.Top + 4;
            if Position = ppLeft then
            begin
              if not FTabGlyph.Empty then
              begin
                tbmp.Canvas.Draw(0,0,FTabGlyph);
                BitmapStretch(tbmp,bmp.Canvas,r.Left,r.Top,tw + ih + 8);
              end
              else
              begin
                if FTabColorTo = clNone then
                  Rectangle(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4)
                else
                begin
                  DrawGradient(bmp.Canvas,clr,clrto,16,Rect(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4),True);
                  Brush.Style := bsClear;
                  Pen.Color := TabBorderColor;
                  Rectangle(r.Left,r.Top,r.Left + FTabWidth - 1, r.Top + tw + 4);
                end;
              end;

              dx := r.Left + TabWidth - ((FTabWidth - th) div 2);
            end
            else
            begin
              if not FTabGlyph.Empty then
              begin
                tbmp.Canvas.Draw(0,0,FTabGlyph);
                BitmapStretch(tbmp,bmp.Canvas,r.right - FTabWidth,r.Top,tw + ih + 8);
              end
              else
              begin
                if FTabColorTo = clNone then
                  Rectangle(r.Right - FTabWidth + 2,r.Top,r.Right, r.Top + tw + 4)
                else
                begin
                  DrawGradient(bmp.Canvas,clr,clrto,16,Rect(r.Right - FTabWidth + 2,r.Top,r.Right, r.Top + tw + 4),True);
                  Brush.Style := bsClear;
                  Pen.Color := TabBorderColor;
                  Rectangle(r.Right - FTabWidth + 2,r.Top,r.Right, r.Top + tw + 4);
                end;
              end;

              dx := r.Right + 4 - (FTabWidth - th) div 2;
            end;

            if Assigned(Images) and (Panels[i - 1].ImageIndex >= 0) then
            begin
              Images.DrawingStyle := dsTransparent;

              if Position = ppLeft then
                Images.Draw(bmp.Canvas,r.Left + (FTabWidth - Images.Width) div 2,r.Top + 6,Panels[i - 1].ImageIndex)
              else
                Images.Draw(bmp.Canvas,r.Right + 1 - Images.Width - ((FTabWidth - Images.Width) div 2),r.Top + 6,Panels[i - 1].ImageIndex);
              dy := dy + ih + 4;
            end;

            {
            dr := rect(-20,20,200,200);
            DrawTextEx(Canvas.Handle,'test',4,dr,DT_RIGHT or DT_SINGLELINE,nil);
            }
            TextFlags := TextFlags and not ETO_OPAQUE;

            Brush.Style := bsClear;
            TextOut(dx,dy , Panels[i - 1].Caption);
            r.Top := r.Top + tw + 10;
          end;
        end;
      end;
    finally
      tf.Free;
    end;

    if GetTabSize > Height then
    begin
      Brush.Color := Color;
      Pen.Color := Color;
      Rectangle(r.Left,r.Bottom - 9,r.Right,r.Bottom);
      FUpDown.Transparent := true;
      Draw(r.Left + 1 , r.Bottom - 9,FUpDown);
    end;
  end;

  Canvas.Draw(0,0,bmp);
  bmp.Free;

end;


procedure TAdvToolPanelTab.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    // start hooking panels to parent
    while ControlCount > 0 do
    begin
      with Panels.Add do
      begin
        Caption := TAdvToolPanel(Controls[0]).Caption;
        ImageIndex := TAdvToolPanel(Controls[0]).ImageIndex;
        Panel := TAdvToolPanel(Controls[0]);
        OpenWidth := TAdvToolPanel(Controls[0]).OpenWidth;
      end;

      Controls[0].Visible := False;
      TAdvToolPanel(Controls[0]).Tab := self;
      Controls[0].Parent := self.Parent;
    end;
    Width := FTabWidth;
    case AutoOpenCloseSpeed of
    aocSlow: FTimerID := SetTimer(Handle,500,500,nil);
    aocMedium: FTimerID := SetTimer(Handle,500,200,nil);
    aocFast: FTimerID := SetTimer(Handle,500,75,nil);
    end;
    SetZOrder(true);
  end;

  if Persist.AutoLoad and not (csDesigning in ComponentState) then
    RestoreState;
end;

procedure TAdvToolPanelTab.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  i,tp: Integer;

begin
  inherited;

  if (csDesigning in ComponentState) then
    Exit;

  tp := GetPanelFromTab(y);

  if (tp <> FMousePanel) then
  begin
    if (FMousePanel >= 0) then
      if Assigned(FOnTabLeave) then
        FOnTabLeave(Self, FMousePanel, Panels[FMousePanel].Panel);

    FMousePanel := tp;
    if (FMousePanel >= 0) then
      if Assigned(FOnTabEnter) then
        FOnTabEnter(Self, FMousePanel, Panels[FMousePanel].Panel);
  end;

  if (FHoverPanel <> tp) and (FTabHoverColor <> clNone) then
  begin
    FHoverPanel := tp;
    Invalidate;
  end;

  if (X > Width - FTabWidth) and not FRollInOut and
    not ((FLastMousePos.X = X) and (FLastMousePos.Y = Y)) then
  begin
    i := GetPanelFromTab(y);
    if (i <> FRollInCandidate) then
    begin
      FRollInCandidate := i;
      FTimerRollIn := 0;
    end;
  end
  else
    FRollInCandidate := -1;
  FLastMousePos := Point(X,Y);
end;

procedure TAdvToolPanelTab.RollIn(APanel: TAdvToolPanel);
var
  t: Cardinal;
  delay: Cardinal;
begin
  if Assigned(FOnTabSlideIn) then
    FOnTabSlideIn(Self,PanelIndex(APanel),APanel);

  case FSlideSpeed of
  ssSlow: delay := 18;
  ssMedium: delay := 9;
  ssFast: delay := 3;
  else
    delay := 9;
  end;

  SetZOrder(True);
  if Position = ppLeft then
  begin
    while APanel.Left > -APanel.Width do
    begin
      t := GetTickCount;
      while (GetTickCount - t) < delay do
        if ((GetTickCount  - t) mod 3) =0 then
          Application.ProcessMessages;

      APanel.Left := APanel.Left - 15;
    end;
  end
  else
  begin
    if FPanelForm.Width > 0 then
      APanel.OpenWidth := FPanelForm.Width;

    {$IFDEF TMSDEBUG}
    outputdebugstring(pchar('rollin:'+inttostr(apanel.OpenWidth)));
    {$ENDIF}

    while FPanelForm.Width > 0 do
    begin
      t := GetTickCount;
      while (GetTickCount - t) < delay do
        if ((GetTickCount  - t) mod 3) =0 then
          Application.ProcessMessages;

      if FPanelForm.Width > 15 then
      begin
        FPanelForm.Width := FPanelForm.Width - 15;
        FPanelForm.Left := FPanelForm.Left + 15;
      end
      else
      begin
        FPanelForm.Width := 0;
        FPanelForm.Left := Left;
      end;
    end;
    APanel.Visible := False;
    SetActiveWindow(self.Parent.Handle);
  end;
end;

procedure TAdvToolPanelTab.RollOut(APanel: TAdvToolPanel);
var
  t: Cardinal;
  delay: Cardinal;
begin
  if Assigned(FOnTabSlideOut) then
    FOnTabSlideOut(Self,PanelIndex(APanel),APanel);

  case FSlideSpeed of
  ssSlow: delay := 18;
  ssMedium: delay := 9;
  ssFast: delay := 3
  else
    delay := 9;
  end;

  if Position = ppLeft then
  begin
    while APanel.Left < FTabWidth do
    begin
      t := GetTickCount;
      while (GetTickCount - t) < delay do
        if ((GetTickCount  - t) mod 3) =0 then
          Application.ProcessMessages;

      if APanel.Left + 15 < FTabWidth then
        APanel.Left := APanel.Left + 15
      else
        APanel.Left := FTabWidth;
    end;
  end
  else
  begin
    {$IFDEF TMSDEBUG}
    outputdebugstring(pchar('rollout:'+inttostr(apanel.OpenWidth)+':'+inttostr(fpanelform.Width)));
    {$ENDIF}

    APanel.Align := alNone;
    APanel.Width := APanel.OpenWidth;
    APanel.Anchors := [];

    APanel.Left := 2;
    APanel.Top := 0;
    APanel.Height := Height;

    while FPanelForm.Width < APanel.OpenWidth do
    begin
      t := GetTickCount;
      while (GetTickCount - t) < delay do
        if ((GetTickCount  - t) mod 3) =0 then
          Application.ProcessMessages;

      if FPanelForm.Width + 15 < APanel.OpenWidth then
      begin
        FPanelForm.Left := FPanelForm.Left - 15;
        FPanelForm.Width := FPanelForm.Width + 15;
      end
      else
      begin
        FPanelForm.Left := FPanelForm.Left - (APanel.OpenWidth - APanel.Width) + 2;
        FPanelForm.Width := APanel.OpenWidth;
      end;

      // final panel positioning
      APanel.Left := 2;
      APanel.Width := FPanelForm.Width - 2; // size panel with form
      APanel.Anchors := [akLeft,akTop,akRight,akBottom];
    end;
    SetActiveWindow(self.Parent.Handle);
  end;
end;


procedure TAdvToolPanelTab.WMTimer(var Message: TWMTimer);
var
  pt,ptp: TPoint;
  InPanel: Boolean;
  OutTab: Boolean;
  i: Integer;
begin
  inherited;

  GetCursorPos(pt);
  pt := ScreenToClient(pt);

  if (FRollInCandidate >= 0) and (pt.X > Width - FTabWidth) and (pt.X < Width) then
  begin
    if (FTimerRollin >= 2) and not FRollInOut then
    begin
      i := GetPanelFromTab(pt.Y);
      if i = FRollInCandidate then
      begin
        FRollInOut := True;
        FRollInCandidate := -1;
        RollInOut(i);
        FRollInOut := False;
      end
      else
        FRollInCandidate := -1;
    end
    else
      inc(FTimerRollin);
  end;

  if not FTimerEnable then
    Exit;

  Inc(FTimerCount);

  if (FRollOutPanel <> -1) then
  begin
    GetCursorPos(ptp);
    ptp := Panels[FRollOutPanel].Panel.ScreenToClient(ptp);
    InPanel := PtInRect(Panels[FRollOutPanel].Panel.ClientRect,ptp);

    if not InPanel then
      InPanel :=  (FRollOutPanel = GetPanelFromTab(pt.Y)) and (pt.X < Width) and (pt.X >= 0);

    if not InPanel then
      InPanel := Panels[FRollOutPanel].Panel.HasFocusControl;
  end
  else
    InPanel := False;

  OutTab := (pt.X < FTabWidth) and (GetPanelFromTab(pt.y) = -1);

  if (FRollOutPanel <> -1) and (OutTab or not InPanel) then
  begin
    if (FTimerCount = 10) then
    begin
      if Position = ppLeft then
      begin
        Panels[FRollOutPanel].OpenWidth := Panels[FRollOutPanel].Panel.Width;
        Panels[FRollOutPanel].Panel.OpenWidth := Panels[FRollOutPanel].Panel.Width;
      end;
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('timer rollin: '+inttostr(Panels[FRollOutPanel].OpenWidth)));
      {$ENDIF}

      if not Panels[FRollOutPanel].Panel.Floating then
      begin
        FRollInOut := True;
        FRollInCandidate := -1;
        RollIn(Panels[FRollOutPanel].Panel);
        FRollInOut := False;
        FRollOutPanel := -1;
        FTimerCount := 0;
      end;
    end;
  end
  else
    FTimerCount := 0;
end;

procedure TAdvToolPanelTab.WndProc(var Msg: TMessage);
begin
  if (Msg.Msg = WM_DESTROY) then
  begin
    KillTimer(Handle,FTimerID);
  end;
  inherited;
end;

procedure TAdvToolPanelTab.Resize;
begin
  inherited;
  UpdatePanels(-1);
end;

procedure TAdvToolPanelTab.SetPosition(const Value: TPanelPosition);
begin
  FPosition := Value;
  if FPosition = ppLeft then
    Align := alLeft
  else
    Align := alRight;
  UpdatePanels(-1);
end;

procedure TAdvToolPanelTab.ResetTimer;
begin
  FTimerCount := 0;
end;

procedure TAdvToolPanelTab.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
var
  j: Integer;
  OldLeft: Integer;
begin
  OldLeft := Left;
  inherited SetBounds(ALeft,ATop,AWidth,AHeight);

  if not Assigned(Panels) then
    Exit;

  if not (csLoading in ComponentState) and
     not (csDesigning in ComponentState) then
  begin
    for j := 1 to Panels.Count do
    begin
      if Panels[j - 1].Panel.Visible then
        Panels[j - 1].Panel.Height := AHeight;
    end;

    if (Position = ppRight) and (FPanelForm.Visible) then
    begin
      FPanelForm.Left := FPanelForm.Left + (ALeft - OldLeft);
    end;
  end;
end;

procedure TAdvToolPanelTab.EnableTimer(Enabled: Boolean);
begin
  FTimerEnable := Enabled;
end;

procedure TAdvToolPanelTab.RollInOut(Index: Integer);
var
  j: Integer;
  pt: TPoint;
begin
  for j := 1 to Panels.Count do
  begin
    if (Panels[j - 1].Panel.Visible) and (j - 1 <> Index)
      and not Panels[j - 1].Panel.Locked and not Panels[j - 1].Panel.Floating then
    begin
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('rollinout:'+inttostr(Panels[j - 1].Panel.Width)+':'+inttostr(Panels[j - 1].OpenWidth)));
      {$ENDIF}
      Panels[j - 1].OpenWidth := Panels[j - 1].Panel.Width;
      RollIn(Panels[j - 1].Panel);
      Panels[j - 1].Panel.Visible := False;
    end;
  end;

  for j := 1 to Panels.Count do
  begin
    if (j - 1 = Index) and (Index <> FRollOutPanel) then
    begin
      if Position = ppLeft then
      begin
        Panels[j - 1].Panel.Align := alNone;
        Panels[j - 1].Panel.Height := 0;
        Panels[j - 1].Panel.Visible := True;
        Panels[j - 1].Panel.Height := Height;
        Panels[j - 1].Panel.Top := Top;
        Panels[j - 1].Panel.Left := -Panels[j - 1].OpenWidth;
        Panels[j - 1].Panel.Width := Panels[j - 1].OpenWidth;
        {$IFDEF TMSDEBUG}
        outputdebugstring(pchar('rollout:'+inttostr(Panels[j - 1].OpenWidth)+':'+inttostr(Panels[j - 1].Panel.Left)));
        {$ENDIF}
        RollOut(Panels[j - 1].Panel);
        FRollOutPanel := Index;
      end
      else
      begin
        {$IFDEF TMSDEBUG}
        outputdebugstring(pchar('rollout:'+inttostr(height)));
        {$ENDIF}
        pt := Point(Left,Top);
        pt := Parent.ClientToScreen(pt);
        Panels[j - 1].Panel.Parent := FPanelForm;
        Panels[j - 1].Panel.Left := 2;
        Panels[j - 1].Panel.Top := 0;
        Panels[j - 1].Panel.Anchors := [akLeft,akTop,akRight,akBottom];

        Panels[j - 1].Panel.Width := 0;
        Panels[j - 1].Panel.Height := Height;

        FPanelForm.Top := pt.Y;
        FPanelForm.Left := pt.X;
        FPanelForm.Width := 0;
        FPanelForm.Height := Height;

        Panels[j - 1].Panel.Visible := True;

        FPanelForm.Visible := True;
        FPanelForm.BringToFront;
        SetWindowPos(FPanelForm.Handle,HWND_TOPMOST	,0,0,0,0,SWP_NOMOVE	 or SWP_NOSIZE);
        SetActiveWindow(Parent.Handle);
        RollOut(Panels[j - 1].Panel);
        FRollOutPanel := Index;
      end;
    end;
  end;
end;

procedure TAdvToolPanelTab.LockChange(APanel: TAdvToolPanel);
var
  i: Integer;
  pt: TPoint;
  pw: Integer;
begin
  pw := APanel.Width;

  if PanelsInTab = 0 then
    Width := 2
  else
    Width := FTabWidth;

  if Position = ppLeft then
  begin
    if APanel.Locked then
    begin
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('lock:'+apanel.Caption+':'+inttostr(apanel.Left)+':'+inttostr(apanel.OpenWidth)));
      {$ENDIF}
      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked and (Panels[i - 1].Panel <> APanel) then
        begin
          {$IFDEF TMSDEBUG}
          outputdebugstring(pchar(panels[i - 1].panel.Caption+':'+inttostr(Panels[i - 1].Panel.Left)+':'+inttostr(apanel.openwidth)));
          {$ENDIF}
          Panels[i - 1].Panel.Left := Panels[i - 1].Panel.Left + APanel.OpenWidth;
        end;
      end;
      APanel.Align := alLeft;
      APanel.Width := APanel.OpenWidth;
      APanel.SendToBack;
      RemovePanel(nil);
      FRollOutPanel := -1
    end
    else
    begin
      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked and (Panels[i - 1].Panel <> APanel) then
        begin
          if APanel.Left < Panels[i - 1].Panel.Left then
            Panels[i - 1].Panel.Left := Panels[i - 1].Panel.Left - APanel.Width;
        end;
      end;

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel = APanel then
        begin
          FRollOutPanel := i - 1;
          Break;
        end;
      end;
      RemovePanel(nil);
      APanel.Align := alNone;
      APanel.Left := FTabWidth;
      APanel.SetZOrder(true);
    end;
  end
  else
  begin
    if APanel.Locked then
    begin
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('lock new panel at : '+inttostr(apanel.Left)));
      {$ENDIF}

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked and (Panels[i - 1].Panel <> APanel) then
        begin
          Panels[i - 1].Panel.Left := Panels[i - 1].Panel.Left - APanel.Width;
        end;
      end;

      APanel.Align := alRight;
      APanel.Parent := self.Parent;

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked then
          Panels[i - 1].Panel.Width := Panels[i - 1].Panel.OpenWidth;
      end;

      APanel.SendToBack;
      FPanelForm.Hide;

      FRollOutPanel := -1
    end
    else
    begin
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('unlock new panel at : '+inttostr(apanel.Left)));
      {$ENDIF}

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked and (Panels[i - 1].Panel <> APanel) then
        begin
          if APanel.Left > Panels[i - 1].Panel.Left then
            Panels[i - 1].Panel.Left := Panels[i - 1].Panel.Left + APanel.OpenWidth;
        end;
      end;

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel = APanel then
        begin
          FRollOutPanel := i - 1;
          break;
        end;
      end;

      for i := 1 to Panels.Count do
      begin
        if Panels[i - 1].Panel.Locked then
        begin
          {$IFDEF TMSDEBUG}
          outputdebugstring(pchar('restore:'+inttostr(Panels[i - 1].Panel.OpenWidth)));
          {$ENDIF}
          Panels[i - 1].Panel.Width := Panels[i - 1].Panel.OpenWidth;
        end;
      end;

      APanel.OpenWidth := pw + 2;
      pt := Point(Left,Top);
      pt := Parent.ClientToScreen(pt);

      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('should not be here:'+inttostr(apanel.openwidth)));
      {$ENDIF}

      FPanelForm.Width := 0;
      APanel.Parent := FPanelForm;
      APanel.Align := alNone;
      APanel.Left := 2;
      APanel.Top := 0;
      APanel.Height := Height;
      APanel.Width := APanel.OpenWidth - 2;
      APanel.Anchors := [akLeft,akTop,akRight,akBottom];
      FPanelForm.Left := pt.X - APanel.OpenWidth;
      FPanelForm.Top := pt.Y;
      FPanelForm.Height := Height;
      FPanelForm.Width := APanel.OpenWidth;
      FPanelForm.Visible := True;
      SetWindowPos(FPanelForm.Handle,HWND_TOPMOST	,0,0,0,0,SWP_NOMOVE	 or SWP_NOSIZE);
    end;
    SetActiveWindow(Parent.Handle);
  end;
  Invalidate;
end;

procedure TAdvToolPanelTab.WMCommand(var Message: TMessage);
begin
  inherited;
end;

procedure TAdvToolPanelTab.SubclassProc(var Msg: TMessage);
var
  pt: TPoint;
begin
  FFormWndProc(Msg);

  if (Msg.Msg = WM_CLOSE) then
  begin
    if Persist.AutoSave and not (csDesigning in ComponentState) then
      SaveState;
  end;

  if (Msg.Msg = WM_MOVING) and (Position = ppRight) and (FRollOutPanel <> -1) then
  begin
    pt := Point(Left,Top);
    pt := Parent.ClientToScreen(pt);
    FPanelForm.Left := pt.X - FPanelForm.Width;
    FPanelForm.Top := pt.Y;
    SetActiveWindow(self.Parent.Handle);
  end;

  if (Msg.Msg = WM_SYSCOMMAND) and
     ((Msg.WParam = SC_MAXIMIZE) or (Msg.WParam = SC_MINIMIZE) or
      (Msg.WParam = SC_RESTORE) or (Msg.WParam = 61458) or (Msg.WParam = 61490) or (Msg.WParam = 61730)) and
     (Position = ppRight) and (FRollOutPanel <> -1) then
  begin
    pt := Point(Left,Top);
    pt := Parent.ClientToScreen(pt);
    FPanelForm.Left := pt.X - FPanelForm.Width;
    FPanelForm.Top := pt.Y;
    FPanelForm.Height := Height;
    SetActiveWindow(self.Parent.Handle);
  end;
end;

procedure TAdvToolPanelTab.CreateWnd;
begin
  inherited;
  FFormWndProc := self.Parent.WindowProc;
  self.Parent.WindowProc := SubClassProc;
end;

procedure TAdvToolPanelTab.NextPanel;
begin
  if FDesignViewPanel = -1 then
    FDesignViewPanel := 0;
    
  if csDesigning in ComponentState then
  begin
    if FDesignViewPanel + 1 < ControlCount then
    begin
      inc(FDesignViewPanel);
      UpdatePanels(FDesignViewPanel);
    end;
  end
  else
  begin
    if FDesignViewPanel + 1 < Panels.Count then
    begin
      inc(FDesignViewPanel);
      UpdatePanels(FDesignViewPanel);
    end;
  end;
end;

procedure TAdvToolPanelTab.PrevPanel;
begin
  if FDesignViewPanel = -1 then
    FDesignViewPanel := 0;

  if csDesigning in ComponentState then
  begin
    if (FDesignViewPanel > 0) then
    begin
      dec(FDesignViewPanel);
      if FDesignViewPanel < ControlCount then
        UpdatePanels(FDesignViewPanel);
    end;
  end
  else
  begin
    if (FDesignViewPanel > 0) then
    begin
      dec(FDesignViewPanel);
      if FDesignViewPanel < Panels.Count then
        UpdatePanels(FDesignViewPanel);
    end;
  end;  
end;

procedure TAdvToolPanelTab.SetTabColor(const Value: TColor);
begin
  FTabColor := Value;
  Invalidate;
end;

procedure TAdvToolPanelTab.SetAutoDock(const Value: Boolean);
begin
  FAutoDock := Value;
  DockSite := FAutoDock;
end;

procedure TAdvToolPanelTab.DockDrop(Source: TDragDockObject; X,
  Y: Integer);
var
  s: string;
  ow: Integer;
begin
  {$IFDEF TMSDEBUG}
  outputdebugstring(pchar('dock drop'));
  {$ENDIF}

  if Source.Control is TAdvToolPanel then
  begin
    with Source.Control as TAdvToolPanel do
    begin
      Tab.RemovePanel(TAdvToolPanel(Source.Control));
      InsertPanel(TAdvToolPanel(Source.Control));
      FActive := False;
      Docking := False;

      DragKind := dkDrag;
      DragMode := dmManual;
      ow := OpenWidth;

      {$IFDEF TMSDEBUG}
      // get width of the control
      outputdebugstring(pchar('width of docked control:'+inttostr(ow)));
      {$ENDIF}

      Tab := self;
      if Position = ppLeft then
      begin
        Parent := Self.Parent;
        Left := FTabWidth;
        Align := alLeft;
        Top := self.Top+10;
      end
      else
      begin
        {$IFDEF TMSDEBUG}
        outputdebugstring('set right alignment');
        {$ENDIF}
        Left := self.Left - OpenWidth - 1;
        Width := OpenWidth;
        Align := alRight;
        Parent := Self.Parent;
      end;
      s := self.Parent.ClassName;

      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar(s+':'+inttostr(openwidth)));
      outputdebugstring(pchar('dock width change: '+inttostr(ow)));
      {$ENDIF}
      
      OpenWidth := ow;
      Locked := True;
      OpenWidth := ow;
      Width := ow;
    end;
  end;
end;

procedure TAdvToolPanelTab.DockOver(Source: TDragDockObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
  pt: TPoint;
begin
  inherited;

  Accept := Source.Control is TAdvToolPanel;

  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    if Position = ppLeft then
    begin
      ARect.TopLeft := ClientToScreen(Point(0,0));
      ARect.BottomRight := ClientToScreen(Point(100, Height));
    end
    else
    begin
      pt := ClientToScreen(Point(0,0));
      pt.X := pt.X - 100 + Width;
      ARect.TopLeft := pt;
      ARect.BottomRight := ClientToScreen(Point(Width, Height));
    end;
    Source.DockRect := ARect;
  end;
end;

procedure TAdvToolPanelTab.UpdatePanel(APanel: TAdvToolPanel);
var
  i: Integer;
begin
  for i := 1 to Panels.Count do
  begin
    if Panels[i - 1].Panel = APanel then
    begin
      Panels[i - 1].Caption := APanel.Caption;
      Panels[i - 1].ImageIndex := APanel.ImageIndex;
      Panels[i - 1].OpenWidth := APanel.OpenWidth;
    end;
  end;
  Invalidate;
end;


procedure TAdvToolPanelTab.InsertPanel(APanel: TAdvToolPanel);
begin
  with Panels.Add do
  begin
    Caption := APanel.Caption;
    ImageIndex := APanel.ImageIndex;
    Panel := APanel;
    OpenWidth := APanel.OpenWidth;
  end;
end;

procedure TAdvToolPanelTab.RemovePanel(APanel: TAdvToolPanel);
var
  i,j: Integer;
begin
  j := -1;
  // find panel to be removed
  for i := 1 to Panels.Count do
  begin
    if Panels[i - 1].Panel = APanel then
    begin
       j := i - 1;
       Break;
    end;
  end;

  // remove the panel from the collection
  if (j <> -1) then
    Panels[i - 1].Free;

  // reorganize remaining panels
  for i := 1 to Panels.Count do
  begin
    if Panels[i - 1].Panel.Locked then
    begin
      {$IFDEF TMSDEBUG}
      outputdebugstring(pchar('restore orig width:'+inttostr(Panels[i - 1].Panel.OpenWidth)));
      {$ENDIF}
      Panels[i - 1].Panel.Width := Panels[i - 1].Panel.OpenWidth;
    end;
  end;

  // make sure right panel tab is rightmost control
  if Position = ppRight then
    Left := Parent.Width;
end;

function TAdvToolPanelTab.CreatePanel: TAdvToolPanel;
begin
  Result := TAdvToolPanel.Create(Self.Parent);
  Result.Tab := Self;
  Result.Parent := self.Parent;
  Result.Visible := False;
  InsertPanel(Result);
end;

procedure TAdvToolPanelTab.UnHidePanel(APanel: TAdvToolPanel);
begin
  if APanel.Floating then
    APanel.Visible := True
  else
  begin
    if APanel.Locked then
    begin
      APanel.Hidden := False;
      APanel.Locked := False;
      APanel.Visible := True;
    end
    else
    begin
      APanel.Hidden := False;
    end;
  end;
end;

function TAdvToolPanelTab.PanelsInTab: Integer;
var
  i,j: Integer;
begin
  j := 0;
  for i := 1 to Panels.Count do
  begin
    if not Panels[i - 1].Panel.Locked and not Panels[i - 1].Panel.Floating then
      inc(j);
  end;
  Result := j;
end;

procedure TAdvToolPanelTab.UnHidePanels;
var
  i: Integer;
begin
  for i := 1 to Panels.Count do
  begin
    if Panels[i - 1].Panel.Floating then
    begin
      Panels[i - 1].Panel.Visible := True;
      if i - 1 = FRollOutPanel then
        FRollOutPanel := -1;
    end
    else
    begin
      if Panels[i - 1].Panel.Locked then
      begin
        Panels[i - 1].Panel.Hidden := False;
        {$IFDEF TMSDEBUG}
        outputdebugstring(pchar('unhide:'+inttostr(Panels[i - 1].Panel.OpenWidth)+':'+inttostr(Panels[i - 1].Panel.Width)));
        {$ENDIF}
        
        //Panels[i - 1].Panel.Locked := False;

        Panels[i - 1].Panel.Visible := True;

        Panels[i - 1].Panel.Width := Panels[i - 1].Panel.OpenWidth;

        if Position = ppLeft then
          Panels[i - 1].Panel.Left := Width
        else
          Panels[i - 1].Panel.Left := Left - Panels[i - 1].Panel.OpenWidth;

        if i - 1 = FRollOutPanel then
          FRollOutPanel := -1;
      end
      else
      begin
        if Panels[i - 1].Panel.Hidden then
          Panels[i - 1].Panel.Hidden := False;
      end;
    end;
  end;
  Invalidate;
end;

procedure TAdvToolPanelTab.SetColorTo(const Value: TColor);
begin
  FColorTo := Value;
  Invalidate;
end;

procedure TAdvToolPanelTab.SetTabColorTo(const Value: TColor);
begin
  FTabColorTo := Value;
  Invalidate;
end;

procedure TAdvToolPanelTab.SetTabBorderColor(const Value: TColor);
begin
  FTabBorderColor := Value;
  Invalidate;
end;

procedure TAdvToolPanelTab.CMMouseLeave(var Message: TMessage);
begin
  if FMousePanel >= 0 then
    if Assigned(FOnTabLeave) then
      FOnTabLeave(Self,FMousePanel,Panels[FMousePanel].Panel);

  FMousePanel := -1;
  FHoverPanel := -1;
  Invalidate;
end;

procedure TAdvToolPanelTab.WMEraseBkGnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TAdvToolPanelTab.SetTabWidth(const Value: Integer);
begin
  FTabWidth := Value;
  Invalidate;
  if (csDesigning in ComponentState) then
    UpdatePanels(-1);
end;

procedure TAdvToolPanelTab.SetTabGlyph(const Value: TBitmap);
begin
  showmessage('here1');
  FTabGlyph.Assign(Value);
  showmessage('here2');
  Invalidate;
end;

function TAdvToolPanelTab.PanelIndex(APanel: TAdvToolPanel): Integer;
var
  i: integer;
begin
  Result := -1;

  for i := 1 to FPanels.Count do
    if FPanels[i - 1].Panel = APanel then
    begin
      Result := i - 1;
      Break;
    end;
end;


function TAdvToolPanelTab.PanelByName(AName: string): TAdvToolPanel;
var
  i: Integer;
begin
  Result := nil;
  for i := 1 to Panels.Count do
  begin
    if Panels[i - 1].Panel.Name = AName then
    begin
      Result := Panels[i - 1].Panel;
      Break;
    end;
  end;
end;

procedure TAdvToolPanelTab.INISaveState;
var
  i: integer;
  INIFile: TINIFile;
  pnl: string;

begin
  if Persist.INIFile = '' then
    Exit;

  INIFIle := TINIFile.Create(Persist.INIFile);

  inifile.writeinteger(Name + 'PANELS','COUNT',Panels.Count);

  for i := 1 to Panels.Count do
  begin
    pnl := Name + 'PANEL'+inttostr(i);

    inifile.writestring(pnl,'NAME',Panels[i- 1].Panel.Name);
    inifile.WriteInteger(pnl,'OPENWIDTH',Panels[i - 1].OpenWidth);
    
    if Panels[i - 1].Panel.Locked then
      inifile.WriteInteger(pnl,'LOCKED',1)
    else
      inifile.WriteInteger(pnl,'LOCKED',0);

    if Panels[i - 1].Panel.Hidden then
      inifile.WriteInteger(pnl,'HIDDEN',1)
    else
      inifile.WriteInteger(pnl,'HIDDEN',0);

    if Panels[i - 1].Panel.Docking then
      inifile.WriteInteger(pnl,'DOCKED',1)
    else
      inifile.WriteInteger(pnl,'DOCKED',0);

    if Panels[i - 1].Panel.Visible then
      inifile.WriteInteger(pnl,'VISIBLE',1)
    else
      inifile.WriteInteger(pnl,'VISIBLE',0);

    if Assigned(Panels[i - 1].Panel.Tab) then
      inifile.WriteString(pnl,'TAB',Panels[i - 1].Panel.Tab.Name);

    if Panels[i - 1].Panel.Floating then
    begin
      inifile.WriteInteger(pnl,'LEFT',Panels[i- 1].Panel.Parent.Left);
      inifile.WriteInteger(pnl,'TOP',Panels[i- 1].Panel.Parent.Top);
      inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.Parent.Width);
      inifile.WriteInteger(pnl,'HEIGHT',Panels[i- 1].Panel.Parent.Height);
    end
    else
    begin
      inifile.WriteInteger(pnl,'LEFT',Panels[i- 1].Panel.Left);
      inifile.WriteInteger(pnl,'TOP',Panels[i- 1].Panel.Top);
      if Panels[i - 1].Panel.Locked then
        inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.Width)
      else
        inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.OpenWidth);
    end;
  end;

  INIFile.Free;
end;

function TAdvToolPanelTab.INIRestoreState: Boolean;
var
  i,j,k: integer;
  INIFile: TINIFile;
  pnl,name: string;
  APanel: TAdvToolPanel;
  r: TRect;
  vis,lck: Boolean;
begin
  Result := False;
  
  if Persist.INIFile = '' then
    Exit;

  INIFIle := TINIFile.Create(Persist.INIFile);

  i := INIFile.ReadInteger(self.Name + 'PANELS','COUNT',0);

  if i = 0 then
    Exit;

  FRollOutPanel := -1;

  for j := 1 to i do
  begin
    pnl := self.Name + 'PANEL'+inttostr(j);

    name := INIFile.ReadString(pnl,'NAME','');

    APanel := PanelByName(name);

    if Assigned(APanel) and not APanel.Restored then
    begin
      APanel.Restored := True;
      k := PanelIndex(APanel);
      Panels[k].OpenWidth := inifile.ReadInteger(pnl,'OPENWIDTH',0);

      APanel.Docking := inifile.ReadInteger(pnl,'DOCKED',0) = 1;
      vis := inifile.ReadInteger(pnl,'VISIBLE',0) = 1;
      APanel.Hidden := inifile.ReadInteger(pnl,'HIDDEN',0) = 1;
      lck := inifile.ReadInteger(pnl,'LOCKED',0) = 1;

      if lck then
        APanel.OpenWidth := inifile.ReadInteger(pnl,'WIDTH',0)
      else
        APanel.OpenWidth := inifile.ReadInteger(pnl,'OPENWIDTH',0);

      if lck and (APanel.Locked <> lck) and not APanel.Hidden and not APanel.Docking then
      begin
        if Position = ppLeft then
          APanel.Left := FTabWidth;

        APanel.Align := alNone;
        APanel.Top := Top;
        APanel.Height := Height;
        APanel.Width := APanel.OpenWidth;
        APanel.Visible := True;
        APanel.Locked := True;
      end;

      if not lck and (APanel.Locked <> lck) and not APanel.Hidden and not APanel.Docking then
      begin
        APanel.Locked := False;
        APanel.Visible := False;
      end;

      if APanel.Docking and vis then
      begin
        r.Left := inifile.ReadInteger(pnl,'LEFT',0);
        r.Right := r.Left + inifile.ReadInteger(pnl,'WIDTH',0);
        r.Top := inifile.ReadInteger(pnl,'TOP',0);
        r.Bottom := r.Top + inifile.ReadInteger(pnl,'HEIGHT',0);
        APanel.ManualFloat(r);
      end;
    end;
  end;

  if PanelsInTab = 0 then
    Width := 2
  else
    Width := FTabWidth;

  FRollOutPanel := -1;
  INIFile.Free;
  Result := True;
end;


procedure TAdvToolPanelTab.RestoreState;
var
 flg: Boolean;
 i: Integer;
 pnl: TAdvToolPanel;

begin
  if Persist.Location = pplINIFile then
    flg := INIRestoreState
  else
    flg := REGRestoreState;

  if not flg then
    Exit;  

  flg := false;

  for i := 1 to Parent.ControlCount do
  begin
    if Parent.Controls[i - 1] is TAdvToolPanel then
    begin
      pnl := TAdvToolPanel(Parent.Controls[i - 1]);
      if not pnl.Restored then
      begin
        if Assigned(pnl.Tab) then
        begin
          pnl.Tab.RemovePanel(pnl);
        end;
        InsertPanel(pnl);
        pnl.Tab := self;
        flg := true;
      end;
    end;
  end;

  if flg then
  begin
    if Persist.Location = pplINIFile then
      INIRestoreState
    else
      REGRestoreState;

    for i := 1 to Parent.ControlCount do
    begin
      if (Parent.Controls[i - 1] is TAdvToolPanelTab) and (Parent.Controls[i - 1] <> Self) then
      begin
        TAdvToolPanelTab(Parent.Controls[i - 1]).RestoreState;
      end;
    end;

  end;
end;

procedure TAdvToolPanelTab.SaveState;
begin
  if Persist.Location = pplINIFile then
    INISaveState
  else
    REGSaveState;
end;

function TAdvToolPanelTab.REGRestoreState: Boolean;
var
  i,j,k: integer;
  INIFile: TRegINIFile;
  pnl,name: string;
  APanel: TAdvToolPanel;
  r: TRect;
  vis,lck: Boolean;
begin
  Result := False;
  
  if Persist.RegistryUserKey = '' then
    Exit;

  INIFIle := TRegINIFile.Create(Persist.RegistryUserKey);

  i := INIFile.ReadInteger(Self.Name + 'PANELS','COUNT',0);

  if i = 0 then
    Exit;

  FRollOutPanel := -1;

  for j := 1 to i do
  begin
    pnl := Self.Name + 'PANEL' + IntToStr(j);

    name := INIFile.ReadString(pnl,'NAME','');

    APanel := PanelByName(name);

    if Assigned(APanel) then
    begin
      k := PanelIndex(APanel);
      Panels[k].OpenWidth := inifile.ReadInteger(pnl,'OPENWIDTH',0);


      APanel.Docking := inifile.ReadInteger(pnl,'DOCKED',0) = 1;
      vis := inifile.ReadInteger(pnl,'VISIBLE',0) = 1;
      APanel.Hidden := inifile.ReadInteger(pnl,'HIDDEN',0) = 1;
      lck := inifile.ReadInteger(pnl,'LOCKED',0) = 1;

      if lck then
        APanel.OpenWidth := inifile.ReadInteger(pnl,'WIDTH',0)
      else
        APanel.OpenWidth := inifile.ReadInteger(pnl,'OPENWIDTH',0);

      if lck and (APanel.Locked <> lck) and not APanel.Hidden and not APanel.Docking then
      begin
        if Position = ppLeft then
          APanel.Left := FTabWidth;

        APanel.Align := alNone;
        APanel.Top := Top;
        APanel.Height := Height;
        APanel.Width := APanel.OpenWidth;
        APanel.Visible := True;
        APanel.Locked := True;
      end;

      if not lck and (APanel.Locked <> lck) and not APanel.Hidden and not APanel.Docking then
      begin
        APanel.Locked := False;
        APanel.Visible := False;
      end;

      if APanel.Docking and vis then
      begin
        r.Left := inifile.ReadInteger(pnl,'LEFT',0);
        r.Right := r.Left + inifile.ReadInteger(pnl,'WIDTH',0);
        r.Top := inifile.ReadInteger(pnl,'TOP',0);
        r.Bottom := r.Top + inifile.ReadInteger(pnl,'HEIGHT',0);
        APanel.ManualFloat(r);
      end;

    end;
  end;

  if PanelsInTab = 0 then
    Width := 2
  else
    Width := FTabWidth;

  FRollOutPanel := -1;
  INIFile.Free;
  Result := True;
end;

procedure TAdvToolPanelTab.REGSaveState;
var
  i: integer;
  INIFile: TRegINIFile;
  pnl: string;
begin
  if Persist.RegistryUserKey = '' then
    Exit;

  INIFIle := TRegINIFile.Create(Persist.RegistryUserKey);

  inifile.writeinteger(Name + 'PANELS','COUNT',Panels.Count);
  for i := 1 to Panels.Count do
  begin
    pnl := Name + 'PANEL' + IntToStr(i);
    inifile.writestring(pnl,'NAME',Panels[i- 1].Panel.Name);
    inifile.WriteInteger(pnl,'OPENWIDTH',Panels[i - 1].OpenWidth);
    if Panels[i - 1].Panel.Locked then
      inifile.WriteInteger(pnl,'LOCKED',1)
    else
      inifile.WriteInteger(pnl,'LOCKED',0);

    if Panels[i - 1].Panel.Hidden then
      inifile.WriteInteger(pnl,'HIDDEN',1)
    else
      inifile.WriteInteger(pnl,'HIDDEN',0);

    if Panels[i - 1].Panel.Docking then
      inifile.WriteInteger(pnl,'DOCKED',1)
    else
      inifile.WriteInteger(pnl,'DOCKED',0);

    if Panels[i - 1].Panel.Visible then
      inifile.WriteInteger(pnl,'VISIBLE',1)
    else
      inifile.WriteInteger(pnl,'VISIBLE',0);

    if Panels[i - 1].Panel.Floating then
    begin
      inifile.WriteInteger(pnl,'LEFT',Panels[i- 1].Panel.Parent.Left);
      inifile.WriteInteger(pnl,'TOP',Panels[i- 1].Panel.Parent.Top);
      inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.Parent.Width);
      inifile.WriteInteger(pnl,'HEIGHT',Panels[i- 1].Panel.Parent.Height);
    end
    else
    begin
      inifile.WriteInteger(pnl,'LEFT',Panels[i- 1].Panel.Left);
      inifile.WriteInteger(pnl,'TOP',Panels[i- 1].Panel.Top);
      if Panels[i - 1].Panel.Locked then
        inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.Width)
      else
        inifile.WriteInteger(pnl,'WIDTH',Panels[i- 1].Panel.OpenWidth);
    end;
  end;

  INIFile.Free;
end;

{ TToolPanel }

constructor TToolPanel.Create(Collection: TCollection);
begin
  inherited;
end;

destructor TToolPanel.Destroy;
begin
  inherited;
end;

procedure TToolPanel.SetCaption(const Value: string);
begin
  FCaption := Value;
end;

procedure TToolPanel.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
end;

procedure TToolPanel.SetOpenWidth(const Value: Integer);
begin
  if Value > 0 then
    FOpenWidth := Value;
end;

procedure TToolPanel.SetState(const Value: TPanelState);
begin
  FState := Value;
end;

procedure TToolPanel.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

{ TAdvToolPanel }

procedure TAdvToolPanel.AlignControls(AControl: TControl; var Rect: TRect);
begin
  if ShowCaption then
  begin
    if Rect.Top < CAPTION_HEIGHT then
      Rect.Top := CAPTION_HEIGHT;
  end;
  inherited;
end;

procedure TAdvToolPanel.CMHintShow(var Msg: TMessage);
var
  CanShow: Boolean;
  hi: PHintInfo;
  r,r1,r2: TRect;
begin
  CanShow := True;
  hi := PHintInfo(Msg.LParam);

  r := ClientRect;
  r2 := Rect(r.Right - 42,r.Top + 2, r.Right - 23, r.Top + 21);
  r1 := Rect(r.Right - 21,r.Top + 2, r.Right - 5, r.Top + 21);

  if PtInRect(r1,hi.CursorPos) then
  begin
    hi.HintStr := CloseHint;
  end;

  if PtInRect(r2,hi.CursorPos) then
  begin
    if Locked then
      hi.HintStr := UnlockHint
    else
      hi.HintStr := LockHint;
  end;

  Msg.Result := Ord(Not CanShow);
end;

procedure TAdvToolPanel.CMMouseLeave(var Message: TMessage);
var
  r: TRect;
begin
  FMouseDown := false;
  r := ClientRect;
  r := Rect(r.Right - 42, r.Top, r.Right , r.Top + 21);
  InvalidateRect(Handle,@r,false);
end;

constructor TAdvToolPanel.Create(AOwner: TComponent);
begin
  inherited;
  FOpenWidth := 150;
  FCanSize := True;
  FLocked := False;
  FHidden := False;
  FAllowDocking := True;
  FImageIndex := -1;
  FCloseGlyph := TBitmap.Create;
  FLockedGlyph := TBitmap.Create;
  FUnlockedGlyph := TBitmap.Create;
  FTab := nil;

  FLockedGlyph.LoadFromResourceName(Hinstance,'TMS_LOCKPIN');
  FUnlockedGlyph.LoadFromResourceName(Hinstance,'TMS_UNLOCKPIN');
  FCloseGlyph.LoadFromResourceName(Hinstance,'TMS_CLOSEBTN');
  TabStop := True;
  FShowCaption := True;
  FCloseHint := 'Close panel';
  FLockHint := 'Lock panel';
  FUnlockHint := 'Unlock panel';
  FFocusCaptionFontColor := clCaptionText;
  FFocusCaptionColor := clActiveCaption;
  FNoFocusCaptionFontColor := clWindowText;
  FNoFocusCaptionColor := clBtnFace;
  DoubleBuffered := True;
  DragKind := dkDock;
  DragMode := dmManual;
end;

procedure TAdvToolPanel.CreateParams(var Params: TCreateParams);
begin
  inherited;
end;

procedure TAdvToolPanel.CreateWnd;
begin
  inherited;
end;

destructor TAdvToolPanel.Destroy;
begin
  FCloseGlyph.Free;
  FLockedGlyph.Free;
  FUnlockedGlyph.Free;
  inherited;
end;

procedure TAdvToolPanel.DoEndDock(Target: TObject; X, Y: Integer);
begin
  inherited;
  {$IFDEF TMSDEBUG}
  outputdebugstring('do end dock');
  {$ENDIF}
  Tab.RemovePanel(nil);
  DragMode := dmManual;
end;

procedure TAdvToolPanel.DoEnter;
begin
  inherited;
  FActive := True;
  Invalidate;
end;

procedure TAdvToolPanel.DoExit;
begin
  inherited;
  FActive := False;
  Invalidate;
end;

procedure TAdvToolPanel.DoStartDock(var DragObject: TDragObject);
var
  pt: TPoint;
begin
  {$IFDEF TMSDEBUG}
  outputdebugstring(pchar('start dock ow change:'+inttostr(width)));
  {$ENDIF}
  OpenWidth := Width;
  inherited;
  Docking := true;

  GetCursorPos(pt);
  pt := ScreenToClient(pt);

  if not ((pt.Y < CAPTION_HEIGHT) and (pt.X < Width - 40)) then
    CancelDrag;
end;

procedure TAdvToolPanel.DrawMonoBitmap(ACanvas: TCanvas; X,Y: Integer; ABitmap: TBitmap; FGColor,
  BkColor: TColor);
var
  bmp: TBitmap;
  i,j: Integer;
begin
  bmp := TBitmap.Create;
  bmp.Width := 16;
  bmp.Height := 16;
  bmp.Canvas.Draw(0,0,ABitmap);

  for i := 0 to 15 do
    for j := 0 to 15 do
    begin
      if bmp.Canvas.Pixels[i,j] = clWhite then
        bmp.Canvas.Pixels[i,j] := BKColor
      else
        bmp.Canvas.Pixels[i,j] := FGColor;
    end;

  ACanvas.Draw(X,Y,bmp);
  bmp.Free;
end;

function TAdvToolPanel.GetCaptionEx: string;
begin
  Result := inherited Caption;
end;

function TAdvToolPanel.GetIsVisible: Boolean;
begin
  Result := not Locked and not Hidden and not Docking;
end;

function TAdvToolPanel.HasFocusControl: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 1 to ControlCount do
  begin
    if Controls[i - 1] is TWinControl then
    begin
      if GetFocus = (Controls[i - 1] as TWinControl).Handle then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

procedure TAdvToolPanel.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  r: TRect;
begin
  inherited;
  FMouseDown := true;

  SetFocus;
  r := ClientRect;
  r := Rect(r.Right - 42,r.Top, r.Right, r.Top + 21);
  if PtInRect(r,Point(X,Y)) then
    InvalidateRect(Handle,@r,false);
end;

procedure TAdvToolPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  r: TRect;
begin
  inherited;

  if FMouseDown and Assigned(FTab) then
  begin
    if Locked and Tab.AutoDock and AllowDocking and (Y < CAPTION_HEIGHT) then
    begin
      DragKind := dkDock;
      DragMode := dmAutomatic;
    end;
  end;

  r := ClientRect;
  r := Rect(r.Right - 42, r.Top, r.Right, r.Top + 21);

  if PtInRect(r,Point(X,Y)) then
    InvalidateRect(Handle,@r,false);
end;

procedure TAdvToolPanel.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  r: TRect;  
begin
  inherited;

  if not (csDesigning in ComponentState) then
  begin
    if FMouseDown and Assigned(FTab) then
    begin
      OpenWidth := Width;
      FMouseDown := false;
      InvalidateRect(Handle,@r,false);

      r := ClientRect;
      r := Rect(r.Right - 16 - 4, r.Top + 2, r.Right - 5, r.Top + 2 + 16);

      if PtInRect(r,Point(X,Y)) then
      begin
        if Assigned(Tab.OnTabHide) then
          Tab.OnTabHide(Tab,Tab.PanelIndex(Self),Self);
          
        if Parent = Tab.FPanelForm then
          Tab.FPanelForm.Hide;
        Hidden := True;
        Tab.UpdatePanels(-1);
        Exit;
      end;

      r := ClientRect;
      r := Rect(r.Right - 40, r.Top + 2, r.Right - 16 - 5, r.Top + 2 + 16);
      if PtInRect(r,Point(X,Y)) then
        Locked := not Locked;
    end;
  end;
end;



procedure TAdvToolPanel.Paint;
var
  CaptionHeight : integer;
  r: TRect;
  fr: TRect;
  pt: TPoint;
  FGColor,BkColor:TColor;
begin
  inherited;

  if Floating then
    Exit;
  if not FShowCaption then
    Exit;

  CaptionHeight := CAPTION_HEIGHT;
  GetCursorPos(pt);
  pt := ScreenToClient(pt);

  with Canvas do
  begin
    r := ClientRect;

    Brush.Color := Color;
    Rectangle(r);

    r := Rect(r.Left, r.Top ,r.Right -1,r.Top + CaptionHeight);

    InflateRect(r,-1,-1);

    if FActive then
    begin
      Brush.Color := FFocusCaptionColor;
      Pen.Color := FFocusCaptionColor;
      BKColor := FFocusCaptionColor;
      FGColor := FFocusCaptionFontColor;
      FillRect(r);
    end
    else
    begin
      BKColor := FNoFocusCaptionColor;
      FGColor := FNoFocusCaptionFontColor;
      Brush.Color := FNoFocusCaptionColor;
      FillRect(r);
      Pen.Color := clGray;
      Pen.Width := 1;
      RoundRect(r.Left ,r.Top ,r.Right,r.top + CaptionHeight,3,3);
    end;

    if not FCloseGlyph.Empty then
    begin
      fr := Rect(r.Right - FCloseGlyph.Width - 4, r.Top + 2, r.Right - 6,r.Top + FCloseGlyph.Height);
      InflateRect(fr,1,1);
      DrawMonoBitmap(Canvas,r.Right - FCloseGlyph.Width - 5,r.Top + 2,FCloseGlyph,FGColor,BKColor);

      if PtInRect(fr,pt) then
      begin
        if FMouseDown then
          Frame3D(Canvas,fr,clGray,clWhite,1)
        else
          Frame3D(Canvas,fr,clWhite,clGray,1);
      end;
      r.Right := r.Right - FCloseGlyph.Width -5;
    end;


    if Locked and not FLockedGlyph.Empty then
    begin
      DrawMonoBitmap(Canvas,r.Right - FLockedGlyph.Width,r.Top + 2,FLockedGlyph,FGColor,BKColor);
    end
    else
     if not FUnlockedGlyph.Empty then
     begin
       DrawMonoBitmap(Canvas,r.Right - FUnlockedGlyph.Width,r.Top + 2,FUnlockedGlyph,FGColor,BKColor);
     end;

    fr := Rect(r.Right - FLockedGlyph.Width - 2, r.Top + 2, r.Right - 1,r.Top + FLockedGlyph.Height);
    InflateRect(fr,1,1);
    if PtInRect(fr,pt) then
    begin
      if FMouseDown then
        Frame3D(Canvas,fr,clGray,clWhite,1)
      else
        Frame3D(Canvas,fr,clWhite,clGray,1);
    end;

    r := ClientRect;
    r := Rect(r.Left + 4,r.Top + 4 , r.Right - 32 - 5, r.Top + CaptionHeight -2);

    if FActive then
      Font.Color := FFocusCaptionFontColor
    else
      Font.Color := FNoFocusCaptionFontColor;
    DrawText(Handle,Pchar(Caption),Length(Caption),r,DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS);
  end;

end;

procedure TAdvToolPanel.Resize;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    if Assigned(Tab) then
      Tab.ResetTimer;
end;


procedure TAdvToolPanel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  tw: Integer;
begin
  if (csDesigning in ComponentState) then
  begin
    if Parent is TAdvToolPanelTab then
    begin
      tw := TAdvToolPanelTab(Parent).TabWidth;
      if TAdvToolPanelTab(Parent).Position = ppLeft then
      begin
        if (ALeft <> tw) and (AWidth > 0) then
          inherited SetBounds(tw,0,TAdvToolPanelTab(Parent).Width - tw,
            TAdvToolPanelTab(Parent).Height)
        else
          inherited SetBounds(ALeft,ATop,AWidth,AHeight);
      end
      else
      begin
        if (ALeft <> 0) and (AWidth > 0) then
          inherited SetBounds(0,0,TAdvToolPanelTab(Parent).Width - tw,
            TAdvToolPanelTab(Parent).Height)
        else
          inherited SetBounds(ALeft,ATop,AWidth,AHeight);
      end;
    end
    else
      inherited SetBounds(ALeft,ATop,AWidth,AHeight);
  end
  else
    inherited SetBounds(ALeft,ATop,AWidth,AHeight);
end;


procedure TAdvToolPanel.SetCaptionEx(const Value: string);
begin
  inherited Caption := Value;
  Parent.Repaint;
  Width := Width + 1;
  Width := Width - 1;
  if Assigned(Tab) then
    Tab.UpdatePanel(Self);
end;

procedure TAdvToolPanel.SetDocking(const Value: Boolean);
begin
  FDocking := Value;
  if Assigned(Tab) then
    Tab.Invalidate;
end;

procedure TAdvToolPanel.SetFocusCaptionColor(const Value: TColor);
begin
  FFocusCaptionColor := Value;
  Invalidate;
end;

procedure TAdvToolPanel.SetFocusCaptionFontColor(const Value: TColor);
begin
  FFocusCaptionFontColor := Value;
  Invalidate;  
end;

procedure TAdvToolPanel.SetHidden(const Value: Boolean);
begin
  FHidden := Value;
  Visible := False;
  if Assigned(Tab) then
    Tab.UpdatePanels(-1);
end;

procedure TAdvToolPanel.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
  Parent.Repaint;
  Width := Width + 1;
  Width := Width - 1;
  if Assigned(Tab) then
    Tab.UpdatePanel(Self);
end;

procedure TAdvToolPanel.SetLocked(const Value: Boolean);
var
  r: TRect;
begin
  FLocked := Value;
  RecreateWnd;
  r := ClientRect;
  r := Rect(r.Right - 42, r.Top, r.Right, r.Top + 21);
  InvalidateRect(Handle,@r,False);
  if Assigned(Tab) then
    Tab.LockChange(self);
end;

procedure TAdvToolPanel.SetNoFocusCaptionColor(const Value: TColor);
begin
  FNoFocusCaptionColor := Value;
  Invalidate;
end;

procedure TAdvToolPanel.SetNoFocusCaptionFontColor(const Value: TColor);
begin
  FNoFocusCaptionFontColor := Value;
  Invalidate;
end;

procedure TAdvToolPanel.SetOpenWidth(const Value: Integer);
begin
  FOpenWidth := Value;
  {$IFDEF TMSDEBUG}
  outputdebugstring(pchar('panelwidth set openwidth:'+inttostr(value)+':'+inttostr(width)));
  {$ENDIF}
end;

procedure TAdvToolPanel.SetShowCaption(const Value: Boolean);
begin
  FShowCaption := Value;
  Invalidate;
end;

procedure TAdvToolPanel.WMENTERSIZEMOVE(var Msg: TMessage);
begin
  inherited;
  if Assigned(Tab) then
    Tab.EnableTimer(False);
end;

procedure TAdvToolPanel.WMEraseBkGnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TAdvToolPanel.WMEXITSIZEMOVE(var Msg: TMessage);
begin
  inherited;
  if Assigned(Tab) then
    Tab.EnableTimer(True);
end;


procedure TAdvToolPanel.WMNCHitTest(var Msg: TWMNCHitTest);
var
  pt: TPoint;
begin
  inherited;

  if (csDesigning in ComponentState) then
    Exit;

  if not Assigned(Tab) then
    Exit;

  if not Locked then
    Tab.ResetTimer;

  pt := ScreenToClient(point(Msg.XPos,Msg.YPos));

  if (Tab.Position = ppLeft) and (CanSize) then
    if (pt.X >= Width - 2) and (pt.X < Width + 1) then
    begin
      Msg.Result := HTRIGHT;
    end;

  if (Tab.Position = ppRight) and (CanSize) and Locked then
    if (pt.X <= 2) and (pt.X >= 0) then
    begin
      Msg.Result := HTLEFT;
    end;
end;

{ TToolPanelForm }

constructor TToolPanelForm.Create(AOwner: TComponent);
begin
  CreateNew(AOwner);
end;

procedure TToolPanelForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
end;

procedure TToolPanelForm.WMNCHitTest(var Msg: TWMNCHitTest);
var
  pt: TPoint;
begin
  pt := ScreenToClient(Point(Msg.Xpos,Msg.Ypos));
  if pt.X < 2 then
  begin
    Msg.Result := HTLEFT;
  end;
end;

end.
