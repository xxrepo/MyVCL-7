unit Main;

interface

uses
  Windows, Classes, Controls, ImgList, ActiveX, ComObj, ShlObj, dxPSCore,
  dxPSFileBasedXplorer;

resourcestring
  CommandPageSetupCaption = 'Page Setup...';
  CommandPreviewCaption = 'Preview...';
  CommandPrintCaption = '&Print...';
  
type
  TdxCustomCommandClass = class of TdxCustomCommand;
  
  TdxCustomCommand = class
  private
    FID: UINT;
  protected
    class function MakeHint(const Source: string): string; virtual;
    function MenuItemInfo(AnIDOffset: UINT): TMenuItemInfo; virtual;
  public  
    constructor Create(AID: UINT); virtual;
    
    class function Caption: string; virtual;
    class function Hint: string; virtual;
    class procedure Execute(AReportLink: TBasedxReportLink); virtual;
    class function ImageIndex: Integer; virtual;
    property ID: UINT read FID write FID;
  end;

  TdxCommandSeparotor = class(TdxCustomCommand)
  protected
    function MenuItemInfo(AnIDOffset: UINT): TMenuItemInfo; override;
  public  
    class function Caption: string; override;
  end;
    
  TdxPageSetupCommand = class(TdxCustomCommand)
  public  
    class function Caption: string; override;
    class procedure Execute(AReportLink: TBasedxReportLink); override;
    class function ImageIndex: Integer; override;
  end;

  TdxPreviewCommand = class(TdxCustomCommand)
  public  
    class function Caption: string; override;
    class procedure Execute(AReportLink: TBasedxReportLink); override;
    class function ImageIndex: Integer; override;
  end;

  TdxPrintCommand = class(TdxCustomCommand)
  public  
    class function Caption: string; override;
    class procedure Execute(AReportLink: TBasedxReportLink); override;
    class function ImageIndex: Integer; override;
  end;
  
  TdxPSContextMenu = class(TComObject, IShellExtInit, IContextMenu)
  private
    FCommands: TList;
    FComponentPrinter: TdxComponentPrinter;
    FExplorer: TdxPSFileBasedExplorer;
    function GetCommand(Index: Integer): TdxCustomCommand;
    function GetCommandCount: Integer;
  protected
    function AddCommand(ACommandClass: TdxCustomCommandClass; AMenu: HMENU; 
      AnIndexMenu, idCmdFirst, AID: UINT): TdxCustomCommand; virtual;
    procedure ClearCommands;
    function FindCommandByClass(ACommandClass: TdxCustomCommandClass): TdxCustomCommand;
    function FindCommandByID(AID: UINT): TdxCustomCommand;
    procedure FreeAndNilCommands;

    function CreateReportLink(AWnd: HWND): TBasedxReportLink; virtual;
    procedure InitializeComponentPrinter; virtual;
    procedure InitilaizeReportLinkAsListView(AReportLink: TBasedxReportLink; AWnd: HWND); virtual;
    procedure InitilaizeReportLinkAsTreeView(AReportLink: TBasedxReportLink; AWnd: HWND); virtual;
    function GetFocusedControlHandle: HWND; virtual;
    function GetReportLinkClass(AWnd: HWND): TdxReportLinkClass; virtual;
    { IShellExtInit }
    function IShellExtInit.Initialize = IShellExtInit_Initialize;
    function IShellExtInit_Initialize(pidlFolder: PItemIDList; lpdobj: IDataObject; hKeyProgID: HKEY): HRESULT; stdcall;
    { IContextMenu }
    function GetCommandString(idCmd, uType: UINT; pwReserved: PUINT; pszName: LPSTR; cchMax: UINT): HRESULT; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HRESULT; stdcall;
    function QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HRESULT; stdcall;
  public
    destructor Destroy; override;
    procedure Initialize; override;
    
    property CommandCount: Integer read GetCommandCount;
    property Commands[Index: Integer]: TdxCustomCommand read GetCommand; default;
    property ComponentPrinter: TdxComponentPrinter read FComponentPrinter;
    property Explorer: TdxPSFileBasedExplorer read FExplorer;
  end;

const
  Class_ContextMenu: TGUID = '{7C0C4704-D0B0-4F14-B63C-09A3FAB63317}';
  ExtensionDescription: string = 'Print Capabilities Shell Extension by Developer Express Inc.';
  ExtensionName: string = 'Print Capabilities Shell Extension';
  
function IsComCtrlHandle(AWnd: HWND; const ANativeClassName: string): Boolean;
  
implementation

uses 
  SysUtils, Graphics, ComServ, ShellAPI, Registry, Messages, CommCtrl, dxPSUtl, 
  dxPSGlbl, dxPSTVLnk, dxPSLVLnk, dxPSEngn, dxPSPrVwStd;

const
  DefaultSortedColumnColor = $00F7F7F7; // was taken from MS Explorer 
   
type
  TdxfmExplorerPreviewWindow = class(TdxfmStdPreview)
  protected
    procedure CreateParams(var AParams: TCreateParams); override;
  end;

  TdxExplorerListViewReportLink = class(TdxNativeListViewReportLink)
  private
    FSortedColumnColor: TColor;
    procedure SetSortedColumnColor(Value: TColor);
  protected
    function GetCellColor(ACol, ARow: Integer): TColor; override;
    function GetCellTransparent(ACol, ARow: Integer): Boolean; override;
    procedure InternalRestoreDefaults; override;
    function IsSortedCell(ACol, ARow: Integer): Boolean; 
  public
    procedure Assign(Source: TPersistent); override;
  published
    property SortedColumnColor: TColor read FSortedColumnColor write SetSortedColumnColor stored DefaultSortedColumnColor;
  end;
  
{ TdxfmExplorerPreviewWindow }

procedure TdxfmExplorerPreviewWindow.CreateParams(var AParams: TCreateParams);
begin
  inherited;
  AParams.Style := AParams.Style and not WS_MINIMIZEBOX;
end;
    
{ TdxExplorerListViewReportLink }  

procedure TdxExplorerListViewReportLink.Assign(Source: TPersistent); 
begin
  if Source is TdxExplorerListViewReportLink then 
    SortedColumnColor := TdxExplorerListViewReportLink(Source).SortedColumnColor;
  inherited;  
end;
    
function TdxExplorerListViewReportLink.GetCellColor(ACol, ARow: Integer): TColor;
begin
  if IsSortedCell(ACol, ARow) and dxPSGlbl.IsComCtrlVersion600 then 
    Result := SortedColumnColor
  else
    Result := inherited GetCellColor(ACol, ARow);
end;

function TdxExplorerListViewReportLink.GetCellTransparent(ACol, ARow: Integer): Boolean;
begin
  if not IsSortedCell(ACol, ARow) or not dxPSGlbl.IsComCtrlVersion600 then 
    Result := inherited GetCellTransparent(ACol, ARow)
  else
    Result := False;
end;

procedure TdxExplorerListViewReportLink.InternalRestoreDefaults;
begin
  inherited;
  SortedColumnColor := DefaultSortedColumnColor;
end;

function TdxExplorerListViewReportLink.IsSortedCell(ACol, ARow: Integer): Boolean; 
begin
  Result := IsReportStyle and not IsHeaderRow(ARow) and (GetColSortOrder(ACol) <> csoNone);
end;
    
procedure TdxExplorerListViewReportLink.SetSortedColumnColor(Value: TColor);
begin
  if FSortedColumnColor <> Value then
  begin
    FSortedColumnColor := Value;
    LinkModified(True);
  end;
end;
    
{ Helpers }
  
function IsComCtrlHandle(AWnd: HWND; const ANativeClassName: string): Boolean;
var
  Buffer: array[Byte] of Char;
begin
  GetClassName(AWnd, Buffer, SizeOf(Buffer));
  Result := Pos(ANativeClassName, Buffer) = 1;
end;
  
{ TdxCustomCommand }
  
constructor TdxCustomCommand.Create(AID: UINT); 
begin
  inherited Create;
  FID := AID;
end;

class function TdxCustomCommand.MakeHint(const Source: string): string;
begin
  Result := DropEndEllipsis(DropAmpersand(Source));
end;

function TdxCustomCommand.MenuItemInfo(AnIDOffset: UINT): TMenuItemInfo;
begin
  FillChar(Result, SizeOf(Result), 0);
  with Result do
  begin
    cbSize := SizeOf(Result) - SizeOf(HBITMAP);
    fMask := MIIM_DATA or MIIM_ID or MIIM_STATE or MIIM_TYPE;
    fType := {MFT_OWNERDRAW;// or }MFT_STRING;
    fState := MFS_ENABLED;
    wID := AnIDOffset + ID;
    dwItemData := ImageIndex;
    dwTypeData := PChar(Caption + #0 + #0);
    cch := StrLen(dwTypeData) + 1;
  end;
end;
    
class function TdxCustomCommand.Caption: string;
begin
  Result := '';
end;

class function TdxCustomCommand.Hint: string; 
begin
  Result := MakeHint(Caption);
end;

class procedure TdxCustomCommand.Execute(AReportLink: TBasedxReportLink);
begin
end;

class function TdxCustomCommand.ImageIndex: Integer;
begin
  Result := -1;
end;

{ TdxCommandSeparotor }

class function TdxCommandSeparotor.Caption: string;
begin
  Result := cMenuSeparator;
end;

function TdxCommandSeparotor.MenuItemInfo(AnIDOffset: UINT): TMenuItemInfo;
begin
  Result := inherited MenuItemInfo(AnIDOffset);
  Result.fType := Result.fType or MFT_SEPARATOR and not (MFT_OWNERDRAW or MFT_STRING);
end;

{ TdxPageSetupCommand }

class function TdxPageSetupCommand.Caption: string;
begin
  Result := CommandPageSetupCaption;
end;

class procedure TdxPageSetupCommand.Execute(AReportLink: TBasedxReportLink);
begin
  AReportLink.PageSetup;
end;                               

class function TdxPageSetupCommand.ImageIndex: Integer;
begin
  Result := 0;
end;

{ TdxPreviewCommand }

class function TdxPreviewCommand.Caption: string;
begin
  Result := CommandPreviewCaption;
end;

class procedure TdxPreviewCommand.Execute(AReportLink: TBasedxReportLink);
begin
  AReportLink.Preview(True);
end;

class function TdxPreviewCommand.ImageIndex: Integer;
begin
  Result := 1;
end;

{ TdxPrintCommand }

class function TdxPrintCommand.Caption: string;
begin
  Result := CommandPrintCaption;
end;

class procedure TdxPrintCommand.Execute(AReportLink: TBasedxReportLink);
begin
  AReportLink.Print(True, nil);
end;
  
class function TdxPrintCommand.ImageIndex: Integer;
begin
  Result := 2;
end;
  
{ TdxPSContextMenu }

destructor TdxPSContextMenu.Destroy;
begin
  FreeAndNilCommands;
  FreeAndNil(FExplorer);
  FreeAndNil(FComponentPrinter);
  inherited;
end;
  
procedure TdxPSContextMenu.Initialize;
begin
  inherited;
  dxPSEngine.LookAndFeel := pslfFlat;

  FComponentPrinter := TdxComponentPrinter.Create(nil);
  InitializeComponentPrinter;

  FExplorer := TdxPSFileBasedExplorer.Create(nil);
  FExplorer.RootPath := 'C:\';
  //ComponentPrinter.Explorer := Explorer;

  FCommands := TList.Create;
end;

function TdxPSContextMenu.AddCommand(ACommandClass: TdxCustomCommandClass; AMenu: HMENU; 
  AnIndexMenu, idCmdFirst, AID: UINT): TdxCustomCommand;
begin
  Result := FindCommandByClass(ACommandClass);
  if Result = nil then 
  begin
    Result := ACommandClass.Create(AID);
    FCommands.Add(Result);
  end
  else
    Result.ID := AID;
    
  InsertMenuItem(AMenu, AnIndexMenu, True, Result.MenuItemInfo(idCmdFirst));
end;

procedure TdxPSContextMenu.ClearCommands;
var
  I: Integer;
begin
  for I := 0 to CommandCount - 1 do
    Commands[I].Free;
  FCommands.Clear;  
end;

function TdxPSContextMenu.FindCommandByClass(ACommandClass: TdxCustomCommandClass): TdxCustomCommand;
var
  I: Integer;
begin
  for I := 0 to CommandCount - 1 do
  begin
    Result := Commands[I];
    if Result.ClassType = ACommandClass then Exit;
  end;
  Result := nil;
end;

function TdxPSContextMenu.FindCommandByID(AID: UINT): TdxCustomCommand;
var
  I: Integer;
begin
  for I := 0 to CommandCount - 1 do
  begin
    Result := Commands[I];
    if Result.ID = AID then Exit;
  end;
  Result := nil;
end;
  
procedure TdxPSContextMenu.FreeAndNilCommands;
begin
  ClearCommands;
  FreeAndNil(FCommands);  
end;
  
function TdxPSContextMenu.CreateReportLink(AWnd: HWND): TBasedxReportLink;
var
  NativeHandleSupport: IdxPSNativeWin32ControlHandleSupport;
begin
  Result := GetReportLinkClass(AWnd).Create(nil);
  Result.ComponentPrinter := ComponentPrinter;
  if Result.GetInterface(IdxPSNativeWin32ControlHandleSupport, NativeHandleSupport) then
  begin
    NativeHandleSupport.NativeHandle := AWnd;
    if Result is TdxNativeListViewReportLink then 
      InitilaizeReportLinkAsListView(Result, AWnd)
    else
      InitilaizeReportLinkAsTreeView(Result, AWnd);
  end
  else  
    FreeAndNil(Result);
end;

procedure TdxPSContextMenu.InitializeComponentPrinter;
begin
  with ComponentPrinter do
  begin
//    PreviewOptions.VisibleOptions := PreviewOptions.VisibleOptions - 
  end;
end;

procedure TdxPSContextMenu.InitilaizeReportLinkAsListView(AReportLink: TBasedxReportLink; AWnd: HWND);
begin
  with TdxExplorerListViewReportLink(AReportLink) do 
  begin
    Effects3D := True;
    EndEllipsis := True;
    Font.Name := 'Tahoma';
    GridLineColor := clBtnFace;
    HeaderFont.Name := 'Tahoma';
    HeaderFont.Style := [];
    HeadersOnEveryPage := True;
    IncludeHeaders := True;
    OnlySelected := ListView_GetSelectedCount(AWnd) > 1;
    Options := [];
  end;
end;

procedure TdxPSContextMenu.InitilaizeReportLinkAsTreeView(AReportLink: TBasedxReportLink; AWnd: HWND);
begin
  with TdxNativeTreeViewReportLink(AReportLink) do 
  begin
    Font.Name := 'Tahoma';
    GridLineColor := clBtnFace;
    if IsComCtrlVersion600 then 
      Options := Options - [tvpoTreeLines] + [tvpoButtons];
  end;
end;
  
function EnumFunc(AWnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  Found: Boolean;
begin
  Found := (IsComCtrlHandle(AWnd, WC_TREEVIEW) or IsComCtrlHandle(AWnd, WC_LISTVIEW)) and (GetFocus = AWnd);
  if Found then 
    PInteger(lParam)^ := AWnd;
  Result := not Found;
end;

function TdxPSContextMenu.GetFocusedControlHandle: HWND;
begin
  Result := GetForegroundWindow;
  if Result <> 0 then 
    EnumChildWindows(Result, @EnumFunc, Integer(@Result));
end;

function TdxPSContextMenu.GetReportLinkClass(AWnd: HWND): TdxReportLinkClass;
const
  LinkClasses: array[Boolean] of TdxReportLinkClass = (TdxExplorerListViewReportLink, TdxNativeTreeViewReportLink);
begin
  Result := LinkClasses[IsComCtrlHandle(AWnd, WC_TREEVIEW)];
end;

// IShellExtInit
function TdxPSContextMenu.IShellExtInit_Initialize(pidlFolder: PItemIDList; lpdobj: IDataObject;
  hKeyProgID: HKEY): HRESULT;
begin
  Result := NOERROR;
end;

// IContextMenu
function TdxPSContextMenu.GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
  pszName: LPSTR; cchMax: UINT): HRESULT;
var
  Command: TdxCustomCommand;  
begin
  Command := FindCommandByID(idCmd);
  if Command <> nil then
  begin
    if uType = GCS_HELPTEXT then
      StrPCopy(pszName, Command.Hint);
    Result := NOERROR;  
  end
  else
    Result := E_INVALIDARG;
end;

function TdxPSContextMenu.InvokeCommand(var lpici: TCMInvokeCommandInfo): HRESULT;
var
  Command: TdxCustomCommand;
  Wnd: HWND;
  ReportLink: TBasedxReportLink;
begin
  Result := E_FAIL;

  Command := FindCommandByID(LoWord(lpici.lpVerb));
  if Command <> nil then 
  begin
    Wnd := GetFocusedControlHandle;
    if Wnd <> 0 then 
    begin
      ReportLink := CreateReportLink(Wnd);
      if ReportLink <> nil then 
      try
        try
          Command.Execute(ReportLink);
        except  
          Exit;
        end;
      finally
        ReportLink.Free;
      end;
    end;  
  end;
  
  Result := NOERROR;
end;

function TdxPSContextMenu.QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult;
begin
  if ((uFlags and $0000000F) = CMF_NORMAL) or ((uFlags and CMF_EXPLORE) <> 0) then 
  try         
    AddCommand(TdxPrintCommand, Menu, indexMenu, idCmdFirst, 0);
    AddCommand(TdxPreviewCommand, Menu, indexMenu, idCmdFirst, 1);
    AddCommand(TdxPageSetupCommand, Menu, indexMenu, idCmdFirst, 2);    
    AddCommand(TdxCommandSeparotor, Menu, indexMenu, idCmdFirst, 3);
  except
    ClearCommands;
  end;
  Result := ActiveX.MakeResult(SEVERITY_SUCCESS, 0, CommandCount);
end;

function TdxPSContextMenu.GetCommand(Index: Integer): TdxCustomCommand;
begin
  Result := FCommands[Index];
end;

function TdxPSContextMenu.GetCommandCount: Integer;
begin
  Result := FCommands.Count;
end;

type
  TdxPSContextMenuFactory = class(TComObjectFactory)
  public
    procedure UpdateRegistry(Register: Boolean); override;
  end;

procedure TdxPSContextMenuFactory.UpdateRegistry(Register: Boolean);

  procedure ApprovalExtension(const AClassID: string; AnApproved: Boolean);
  const
    ApprovalKey = 'Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved';
  var
    Registry: TRegistry;
  begin
    Registry := TRegistry.Create;
    with Registry do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if AnApproved then 
      begin
        if OpenKey(ApprovalKey, True) then 
          WriteString(AClassID, ExtensionDescription);
      end
      else
        if KeyExists(ApprovalKey) then 
          DeleteKey(ApprovalKey);
    finally
      Free;
    end;
  end;

const
  Directory = 'Directory\ShellEx\ContextMenuHandlers\PrintCapabilities';
  DirectoryBackground = 'Directory\Background\ShellEx\ContextMenuHandlers\PrintCapabilities';
  Drive = 'Drive\ShellEx\ContextMenuHandlers\PrintCapabilities';
  Folder = 'Folder\ShellEx\PrintCapabilities';
var
  ClassID: string;
begin
  if Register then 
  begin
    ClassID := GUIDToString(Class_ContextMenu);
    
    CreateRegKey(Directory, '', ClassID);
    CreateRegKey(DirectoryBackground, '', ClassID);
    CreateRegKey(Drive, '', ClassID);
    CreateRegKey(Folder, '', '');

    if Win32Platform = VER_PLATFORM_WIN32_NT then ApprovalExtension(ClassID, True);
  end
  else 
  begin
    if Win32Platform = VER_PLATFORM_WIN32_NT then ApprovalExtension(ClassID, False);

    DeleteRegKey(Folder);
    DeleteRegKey(Drive);
    DeleteRegKey(DirectoryBackground);
    DeleteRegKey(Directory);
  end;
  inherited;
end;

initialization
  TdxPSContextMenuFactory.Create(ComServer, TdxPSContextMenu, Class_ContextMenu,
    '', ExtensionDescription, ciMultiInstance, tmApartment);

  dxPSCore.dxPSRegisterPreviewWindow(TdxfmExplorerPreviewWindow);
  
finalization
  dxPSCore.dxPSUnregisterPreviewWindow(TdxfmExplorerPreviewWindow);

end. 
