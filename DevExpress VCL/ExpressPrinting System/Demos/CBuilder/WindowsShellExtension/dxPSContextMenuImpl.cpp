// DXPSCONTEXTMENUIMPL : Implementation of TdxPSContextMenuImpl (CoClass: dxPSContextMenu, Interface: IdxPSContextMenu)

#include <vcl.h>
#pragma hdrstop

#include "DXPSCONTEXTMENUIMPL.H"
#include "dxPSTVLnk.hpp"
/* Helpers */

bool IsComCtrlHandle(HWND AWnd, const String ANativeClassName)
{
  char Buffer[255];
  GetClassName(AWnd, Buffer, 255);
  return ((String)Buffer).Pos(ANativeClassName) == 1;
}

//TdxCustomCommand

void TdxCustomCommand::MenuItemInfo(TMenuItemInfo &AInfo, UINT AnIDOffset)
{
//  TMenuItemInfo *AInfo = new TMenuItemInfo;
  AInfo.cbSize = sizeof(AInfo) - sizeof(HBITMAP);
  AInfo.fMask = MIIM_DATA | MIIM_ID | MIIM_STATE | MIIM_TYPE;
  AInfo.fType = MFT_STRING;
  AInfo.fState = MFS_ENABLED;
  AInfo.wID = AnIDOffset + ID;
  AInfo.dwTypeData = (Caption + (char)0 + (char)0).c_str();
  AInfo.cch = strlen(AInfo.dwTypeData) + 1;
}

void TdxCommandSeparotor::MenuItemInfo(TMenuItemInfo &AInfo, UINT AnIDOffset)
{

  TdxCustomCommand::MenuItemInfo(AInfo, AnIDOffset);
  AInfo.fType = (AInfo.fType | MFT_SEPARATOR) & ~(MFT_OWNERDRAW | MFT_STRING);
}

/////////////////////////////////////////////////////////////////////////////
// TdxPSContextMenuImpl

TdxPSContextMenuImpl::TdxPSContextMenuImpl()
{
  /*dxPSGlbl.*/IsComCtrlVersion600 = /*dxPSGlbl.*/IsWinXP;
  /*dxPSCore.*/dxPSRegisterPreviewWindow(__classid(TdxfmExplorerPreviewWindow));

  dxPSEngine()->LookAndFeel = pslfFlat;

  FComponentPrinter = new TdxComponentPrinter(NULL);
  InitializeComponentPrinter();

  FExplorer = new TdxPSFileBasedExplorer(NULL);
  FExplorer->RootPath = "C:\\";

  FCommands = new TList();
  CreateCommands();
}

TdxPSContextMenuImpl::~TdxPSContextMenuImpl()
{
  ReleaseCommands();
  delete FCommands;
  delete FExplorer;
  delete FComponentPrinter;
  /*dxPSCore.*/dxPSUnregisterPreviewWindow(__classid(TdxfmExplorerPreviewWindow));
}

TdxCustomCommand* TdxPSContextMenuImpl::GetCommand(int Index)
{
  return (TdxCustomCommand*)FCommands->Items[Index];
}

void TdxPSContextMenuImpl::CreateCommands()
{
  FCommands->Add(new TdxPrintCommand((UINT)FCommands->Count));
  FCommands->Add(new TdxPreviewCommand((UINT)FCommands->Count));
  FCommands->Add(new TdxPageSetupCommand((UINT)FCommands->Count));
  FCommands->Add(new TdxCommandSeparotor((UINT)FCommands->Count));
}

TBasedxReportLink* TdxPSContextMenuImpl::CreateReportLink(HWND AWnd)
{
  TBasedxReportLink* AReportLink;
  IdxPSNativeWin32ControlHandleSupport *NativeHandleSupport;
  if (IsComCtrlHandle(AWnd, WC_TREEVIEW)){
    (TdxNativeTreeViewReportLink*)AReportLink =
      new TdxNativeTreeViewReportLink(NULL);
     InitilaizeReportLinkAsTreeView(AReportLink, AWnd);
  }
  else{
    (TdxExplorerListViewReportLink*)AReportLink =
      new TdxExplorerListViewReportLink(NULL);
    InitilaizeReportLinkAsListView(AReportLink, AWnd);
  }
  AReportLink->ComponentPrinter = ComponentPrinter;
  if (AReportLink->GetInterface(IID_IdxPSNativeWin32ControlHandleSupport, &NativeHandleSupport))
    NativeHandleSupport->NativeHandle = (int)AWnd;
  else{
    delete AReportLink;
    AReportLink = NULL;
  }
  return AReportLink;
}

TdxCustomCommand* TdxPSContextMenuImpl::FindCommandByID(UINT AID)
{
  TdxCustomCommand *Result;
  for (int I = 0; I < CommandCount; I++){
    Result = Commands[I];
    if (Result->ID == AID)
      return Result;
  }
  return NULL;
}

void B(int WH)
{
  HWND H;
  H = (void*)67890;
  *(int*)WH = (int)H;
}

int A()
{
  HWND H;
  H = (void*)12345;
  B((int)&H);
  return (int)H;
}

BOOL __stdcall EnumFunc(HWND AWnd, LPARAM lParam)
{
  bool Found =
    (GetFocus() == AWnd);
  if (Found)
    *(int*)lParam = (int)AWnd;
  return !Found;
}

HWND TdxPSContextMenuImpl::GetFocusedControlHandle()
{
  HWND Result = GetForegroundWindow();
  if (Result != 0)
    EnumChildWindows(Result, (WNDENUMPROC)EnumFunc, (Integer)&Result);
  return Result;
}

void TdxPSContextMenuImpl::InitializeComponentPrinter()
{

}

void TdxPSContextMenuImpl::InitilaizeReportLinkAsListView(
  TBasedxReportLink *AReportLink, HWND AWnd)
{
  TdxExplorerListViewReportLink *ALink = (TdxExplorerListViewReportLink*)AReportLink;
  ALink->Effects3D = true;
  ALink->EndEllipsis = true;
  ALink->Font->Name = "Tahoma";
  ALink->GridLineColor = clBtnFace;
  ALink->HeaderFont->Name = "Tahoma";
  ALink->HeaderFont->Style = TFontStyles();
  ALink->HeadersOnEveryPage = true;
  ALink->IncludeHeaders = true;
  ALink->OnlySelected = ListView_GetSelectedCount(AWnd) > 1;
  ALink->Options = TdxListViewPaintOptions();
}

void TdxPSContextMenuImpl::InitilaizeReportLinkAsTreeView(
  TBasedxReportLink *AReportLink, HWND AWnd)
{
  TdxNativeTreeViewReportLink *ALink = (TdxNativeTreeViewReportLink*)AReportLink;
    ALink->Font->Name = "Tahoma";
    ALink->GridLineColor = clBtnFace;
    if (IsComCtrlVersion600)
    {
      ALink->Options = ALink->Options>>tvpoTreeLines;
      ALink->Options = ALink->Options<<tvpoButtons;
    }  
}

void TdxPSContextMenuImpl::ReleaseCommands()
{
  while (FCommands->Count != 0){
    delete (TdxCustomCommand*)FCommands->Items[0];
    FCommands->Delete(0);
  }
}

STDMETHODIMP TdxPSContextMenuImpl::Initialize(LPCITEMIDLIST pidlFolder,
   LPDATAOBJECT lpdobj, HKEY hkeyProgID)
{
  return NOERROR;
//   HDROP hDrop;
   //HRESULT hResult;
//   FORMATETC fmtEtc;
//   STGMEDIUM medium;


           /*
   fmtEtc.cfFormat = CF_HDROP;
   fmtEtc.ptd = NULL;
   fmtEtc.dwAspect = DVASPECT_CONTENT;
   fmtEtc.lindex = -1;
   fmtEtc.tymed = TYMED_HGLOBAL;

   medium.tymed = TYMED_HGLOBAL;

   // Get the CF_HDROP data
   if((hResult = lpdobj->GetData(&fmtEtc,&medium)) < 0)
      return E_INVALIDARG;

   if((hDrop = (HDROP)GlobalLock(medium.hGlobal))==NULL)
      return E_INVALIDARG;

   // Get the name of the file
   if(DragQueryFile(hDrop,0,FileName,MAX_PATH) == 0)
      hResult = E_INVALIDARG;
   else
      hResult = S_OK;
   // Clean up
   GlobalUnlock(medium.hGlobal);
   ReleaseStgMedium(&medium);

   return hResult;    */

};

STDMETHODIMP TdxPSContextMenuImpl::GetCommandString(UINT idCmd, UINT uFlags, UINT *pwReserved,
   LPSTR pszName, UINT cchMax )
{
  TdxCustomCommand *Command = FindCommandByID(idCmd);
  if (Command != NULL){
    if (uFlags == GCS_HELPTEXT)
      StrPCopy(pszName, Command->Hint);
    return NOERROR;
  }
  else
    return E_INVALIDARG;
/*   HRESULT hResult;
   USES_CONVERSION;
   // Check idCmd, it must be 0 or 1 for the first and second menu items we added
   if (idCmd > 1)
      return E_INVALIDARG;
   // Why switch when I check only one case, there are others like GCS_VERB
   // that uFlags can represent, easier to add other cases later
   switch(uFlags)
   {
      case GCS_HELPTEXT:
      {
         /*
         If you are in the Windows Explorer and you right-click a file which this
         object is working on, you will see the help message in the Explorer status
         bar on the bottom left.
         */
/*         LPCTSTR HelpMessage;

         // Since you have two menu items we need two help messages
         if(idCmd == 0)
            HelpMessage = _T("I am a helpfull message.");
         if(idCmd == 1)
            HelpMessage = _T("Thanks for the help.");

         // We can handle either ASCII and Unicode text.
         if (uFlags & GCS_UNICODE )
            // Cast to LPWSTR and handle Unicode text
            lstrcpynW((LPWSTR)pszName,T2CW(HelpMessage),cchMax);
         else
            // Handle ANSI text
            lstrcpynA(pszName,T2CA(HelpMessage),cchMax);
         hResult = S_OK;
      }
      break;
   }
   return hResult;*/
};

STDMETHODIMP TdxPSContextMenuImpl::QueryContextMenu(HMENU hmenu, UINT indexMenu, UINT idFirstCmd,
   UINT idLastCmd, UINT uFlags)
{
  if (((uFlags & 0x0000000F) == CMF_NORMAL) || ((uFlags & CMF_EXPLORE) != 0)){
    for (int I = 0; I < FCommands->Count; I++)
    {
      TMenuItemInfo AInfo;
      ((TdxCustomCommand*)FCommands->Items[I])->MenuItemInfo(AInfo, idFirstCmd);
      InsertMenuItem(hmenu, indexMenu, true, &AInfo);
    }
  }
  return MAKE_HRESULT(SEVERITY_SUCCESS,FACILITY_NULL, CommandCount);
/*   UINT cmd = idFirstCmd;
   //  Make sure we do nothing if default is in uFlags.
   if (uFlags & CMF_DEFAULTONLY)
      return MAKE_HRESULT(SEVERITY_SUCCESS,FACILITY_NULL,0);

   InsertMenu (hmenu,indexMenu,MF_BYPOSITION,cmd++,"Add File to Source Control");
   indexMenu++;
   InsertMenu (hmenu,indexMenu,MF_BYPOSITION,cmd++,"Open in Source Control");

   */
};

STDMETHODIMP TdxPSContextMenuImpl::InvokeCommand(LPCMINVOKECOMMANDINFO pCmdInfo)
{
  TdxCustomCommand *Command = FindCommandByID(LOWORD(pCmdInfo->lpVerb));
  if (Command != NULL){
    HWND Wnd = GetFocusedControlHandle();
    if (Wnd != 0){
      TBasedxReportLink *AReportLink = CreateReportLink(Wnd);
      if (AReportLink != NULL)
      __try{
        __try{
          Command->Execute(AReportLink);
        }
        catch(...){
          return E_FAIL;
        }
      }
      __finally{
        delete AReportLink;
      }
    }
  }

  return NOERROR;

/*   HRESULT hResult;
   WORD cmdId;
   // We want to identify items using IDs and not Verbs.
   // So if lpVerb is pointing at a string, lets use the ID.
   if(HIWORD(pCmdInfo->lpVerb)==0)
      cmdId = LOWORD(pCmdInfo->lpVerb);

   if(cmdId > 1)
      return E_INVALIDARG;

   switch(cmdId)
   {
   case 0:
   case 1:
      {
	   // Find out which item was clicked and call the correct method
//         AnsiString Operation = cmdId ? "Open in Source Control" : "Add File to Source Control";
  /*       if(Operation == "Add File to Source Control")
            AddFileToSourceControl(pCmdInfo);
         else
            OpenFileInSourceControl();*/
/*         hResult = S_OK;
      }
      break;
   default:
      hResult = E_INVALIDARG;
      break;
   }

   return hResult;*/
}

int TdxPSContextMenuImpl::GetCommandCount()
{
  return FCommands->Count;
}

/* TdxfmExplorerPreviewWindow */
void __fastcall TdxfmExplorerPreviewWindow::CreateParams(
  Controls::TCreateParams &Params)
{
  TdxfmStdPreview::CreateParams(Params);
  Params.Style = Params.Style & ~WS_MINIMIZEBOX;
}

/* TdxExplorerListViewReportLink */

void __fastcall TdxExplorerListViewReportLink::Assign(Classes::TPersistent* Source)
{
  if (dynamic_cast<TdxExplorerListViewReportLink*>(Source) != 0)
    SortedColumnColor = ((TdxExplorerListViewReportLink*)Source)->SortedColumnColor;
  TdxNativeListViewReportLink::Assign(Source);
}

Graphics::TColor __fastcall TdxExplorerListViewReportLink::GetCellColor(int ACol, int ARow)
{
  if (IsSortedCell(ACol, ARow) && IsComCtrlVersion600)
    return SortedColumnColor;
  else
    return TdxNativeListViewReportLink::GetCellColor(ACol, ARow);
}

bool __fastcall TdxExplorerListViewReportLink::GetCellTransparent(int ACol, int ARow)
{
  if (!IsSortedCell(ACol, ARow) || !IsComCtrlVersion600)
    return TdxNativeListViewReportLink::GetCellTransparent(ACol, ARow);
  else
    return false;
}

void __fastcall TdxExplorerListViewReportLink::InternalRestoreDefaults(void)
{
  TdxNativeListViewReportLink::InternalRestoreDefaults();
  SortedColumnColor = DefaultSortedColumnColor;
}

bool TdxExplorerListViewReportLink::IsSortedCell(int ACol, int ARow)
{
  return IsReportStyle() && !IsHeaderRow(ARow) && (GetColSortOrder(ACol) != csoNone);
}

void __fastcall TdxExplorerListViewReportLink::SetSortedColumnColor(TColor Value)
{
  if (FSortedColumnColor != Value)
  {
    FSortedColumnColor = Value;
    LinkModified(true);
  }
}

