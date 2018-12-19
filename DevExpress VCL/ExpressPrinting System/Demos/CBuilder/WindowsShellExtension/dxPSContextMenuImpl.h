// DXPSCONTEXTMENUIMPL.H : Declaration of the TdxPSContextMenuImpl

#ifndef __DXPSCONTEXTMENUIMPL_H_
#define __DXPSCONTEXTMENUIMPL_H_

#include "PrintCapabilities_TLB.h"
#include <shlobj.h>
#include <registry.hpp>
#include "dxPsCore.hpp"
#include "dxPSFileBasedXplorer.hpp"
#include "dxPSPrvwStd.hpp"
#include "dxPSLVLnk.hpp"
#include <ComObj.hpp>

class TdxCustomCommand
{
private:
  UINT FID;
protected:
  virtual __fastcall String MakeHint(const String Source)
    { return DropEndEllipsis(DropAmpersand(Source)); };
  virtual __fastcall String GetCaption(){ return ""; };
  virtual __fastcall String GetHint(){ return MakeHint(Caption); };
  virtual __fastcall int GetImageIndex(){ return -1; };
public:
  TdxCustomCommand(UINT AID){ FID = AID; };
  virtual void Execute(TBasedxReportLink *AReportLink){};
  virtual void MenuItemInfo(TMenuItemInfo &AInfo, UINT AnIDOffset);
  __property String Caption = {read=GetCaption};
  __property String Hint = {read=GetHint};
  __property int ImageIndex = {read=GetImageIndex};
  __property UINT ID = {read=FID, write=FID};
};

class TdxCommandSeparotor : public TdxCustomCommand
{
protected:
  virtual __fastcall String GetCaption(){ return cMenuSeparator; };
  virtual void MenuItemInfo(TMenuItemInfo &AInfo, UINT AnIDOffset);
public:
  TdxCommandSeparotor(UINT AID):TdxCustomCommand(AID){};
};

class TdxPageSetupCommand : public TdxCustomCommand
{
private:
  static String CommandPageSetupCaption;
protected:
  virtual __fastcall String GetCaption(){ return CommandPageSetupCaption; };
  virtual __fastcall int GetImageIndex(){ return 0; };
public:
  TdxPageSetupCommand(UINT AID):TdxCustomCommand(AID){};
  virtual void Execute(TBasedxReportLink *AReportLink)
    { AReportLink->PageSetup(); };
};

String TdxPageSetupCommand::CommandPageSetupCaption = "Page Setup...";

class TdxPreviewCommand : public TdxCustomCommand
{
private:
  static String CommandPreviewCaption;
protected:
  virtual __fastcall String GetCaption(){ return CommandPreviewCaption; };
  virtual __fastcall int GetImageIndex(){ return 1; };
public:
  TdxPreviewCommand(UINT AID):TdxCustomCommand(AID){};
  virtual void Execute(TBasedxReportLink *AReportLink)
    { AReportLink->Preview(true); }
};

String TdxPreviewCommand::CommandPreviewCaption = "Preview...";

class TdxPrintCommand : public TdxCustomCommand
{
private:
  static String CommandPrintCaption;
protected:
  virtual __fastcall String GetCaption(){ return CommandPrintCaption; };
  virtual __fastcall int GetImageIndex(){ return 2; };
public:
  TdxPrintCommand(UINT AID):TdxCustomCommand(AID){};
  virtual void Execute(TBasedxReportLink *AReportLink)
    { AReportLink->Print(true, NULL); }
};

String TdxPrintCommand::CommandPrintCaption = "&Print...";

/////////////////////////////////////////////////////////////////////////////
// TdxPSContextMenuImpl     Implements IdxPSContextMenu, default interface of dxPSContextMenu
// ThreadingModel : Apartment
// Dual Interface : FALSE
// Event Support  : FALSE
// Default ProgID : Project2.dxPSContextMenu
// Description    : Print Capabilities Shell Extension by Developer Express Inc.
/////////////////////////////////////////////////////////////////////////////

class ATL_NO_VTABLE TdxPSContextMenuImpl :
  public CComObjectRootEx<CComSingleThreadModel>,
  public CComCoClass<TdxPSContextMenuImpl, &CLSID_dxPSContextMenu>,
  public IShellExtInit,
  public IContextMenu,
  DUALINTERFACE_IMPL(dxPSContextMenu, IdxPSContextMenu)
{
private:
  TList *FCommands;
  TdxComponentPrinter *FComponentPrinter;
  TdxPSFileBasedExplorer *FExplorer;
  TdxCustomCommand* GetCommand(int Index);
  int GetCommandCount();
  static IID IID_IdxPSNativeWin32ControlHandleSupport;
protected:
  void CreateCommands();
  TBasedxReportLink* CreateReportLink(HWND AWnd);
  TdxCustomCommand* FindCommandByID(UINT AID);
  HWND GetFocusedControlHandle();
  void InitializeComponentPrinter();
  void InitilaizeReportLinkAsListView(TBasedxReportLink *AReportLink, HWND AWnd);
  void InitilaizeReportLinkAsTreeView(TBasedxReportLink *AReportLink, HWND AWnd);
  void ReleaseCommands();
public:
  TdxPSContextMenuImpl();
  ~TdxPSContextMenuImpl();

// IShellExtInit method
  STDMETHODIMP Initialize(LPCITEMIDLIST,LPDATAOBJECT,HKEY);

// IContextMenu
  STDMETHODIMP GetCommandString(UINT, UINT, UINT*, LPSTR, UINT);
  STDMETHODIMP InvokeCommand(LPCMINVOKECOMMANDINFO);
  STDMETHODIMP QueryContextMenu(HMENU, UINT, UINT, UINT, UINT);

  __property int CommandCount = {read=GetCommandCount};
  __property TdxCustomCommand *Commands[int Index] = {read=GetCommand};
  __property TdxComponentPrinter *ComponentPrinter = {read=FComponentPrinter};
  __property TdxPSFileBasedExplorer *Explorer = {read=FExplorer};
public:
  // Data used when registering Object
  //
  DECLARE_THREADING_MODEL(otApartment);
  DECLARE_PROGID("PrintCapabilities.dxPSContextMenu");
  DECLARE_DESCRIPTION("Print Capabilities Shell Extension by Developer Express Inc.");

  // Function invoked to (un)register object
  //
  static void ApprovalExtension(const String AClassID, bool AnApproved)
  {
    const String ApprovalKey =
      "Software\\Microsoft\\Windows\\CurrentVersion\\Shell Extensions\\Approved";
    const String AExtensionDescription =
      "Print Capabilities Shell Extension by Developer Express Inc.";

    TRegistry *Registry = new TRegistry();
    __try{
      Registry->RootKey = HKEY_LOCAL_MACHINE;
      if (AnApproved)
      {
        if (Registry->OpenKey(ApprovalKey, true))
          Registry->WriteString(AClassID, AExtensionDescription);
      }
      else
        if (Registry->KeyExists(ApprovalKey))
          Registry->DeleteKey(ApprovalKey);
    }
    __finally{
      delete Registry;
    }
  }

  static HRESULT WINAPI UpdateRegistry(BOOL bRegister)
  {
    const String ADirectory =
      "Directory\\ShellEx\\ContextMenuHandlers\\PrintCapabilities";
    const String ADirectoryBackground =
      "Directory\\Background\\ShellEx\\ContextMenuHandlers\\PrintCapabilities";
    const String ADrive =
      "Drive\\ShellEx\\ContextMenuHandlers\\PrintCapabilities";
    const String AFolder = "Folder\\ShellEx\\ContextMenuHandlers\\PrintCapabilities";

    String ClassID = Comobj::GUIDToString(CLSID_dxPSContextMenu);
    if (bRegister)
    {
      CreateRegKey(ADirectory, "", ClassID);
      CreateRegKey(ADirectoryBackground, "", ClassID);
      CreateRegKey(ADrive, "", ClassID);
      CreateRegKey(AFolder, "", "");

      if (Win32Platform == VER_PLATFORM_WIN32_NT)
        ApprovalExtension(ClassID, true);
    }
    else
    {
      if (Win32Platform == VER_PLATFORM_WIN32_NT)
        ApprovalExtension(ClassID, false);

      DeleteRegKey(AFolder);
      DeleteRegKey(ADrive);
      DeleteRegKey(ADirectoryBackground);
      DeleteRegKey(ADirectory);
    }

    TTypedComServerRegistrarT<TdxPSContextMenuImpl>
    regObj(GetObjectCLSID(), GetProgID(), GetDescription());
    return regObj.UpdateRegistry(bRegister);
  }
BEGIN_COM_MAP(TdxPSContextMenuImpl)
  COM_INTERFACE_ENTRY(IShellExtInit)
  COM_INTERFACE_ENTRY(IContextMenu)
  DUALINTERFACE_ENTRY(IdxPSContextMenu)
END_COM_MAP()
};

IID TdxPSContextMenuImpl::IID_IdxPSNativeWin32ControlHandleSupport =
  Comobj::StringToGUID("{4B649281-A283-4CAC-98D4-08E779A7F9C8}");

class TdxfmExplorerPreviewWindow : public TdxfmStdPreview
{
protected:
  virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
};

class TdxExplorerListViewReportLink : public TdxNativeListViewReportLink
{
private:
  TColor FSortedColumnColor;
  void __fastcall SetSortedColumnColor(TColor Value);
  static const TColor DefaultSortedColumnColor = 0x00F7F7F7; // was taken from MS Explorer
protected:
  virtual Graphics::TColor __fastcall GetCellColor(int ACol, int ARow);
  virtual bool __fastcall GetCellTransparent(int ACol, int ARow);
  virtual void __fastcall InternalRestoreDefaults(void);
  bool IsSortedCell(int ACol, int ARow);

public:
  inline __fastcall virtual TdxExplorerListViewReportLink
    (Classes::TComponent* AOwner) : TdxNativeListViewReportLink(AOwner) { }
  virtual void __fastcall Assign(Classes::TPersistent* Source);
__published:
  __property TColor SortedColumnColor = {read=FSortedColumnColor,
    write=SetSortedColumnColor, default=DefaultSortedColumnColor};
};

#endif //__DXPSCONTEXTMENUIMPL_H_
