// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// C++ TLBWRTR : $Revision:   1.96.1.27  $
// File generated on 08.04.1999 11:45:01 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\WINNT\System32\SHDOCVW.DLL
// IID\LCID: {EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (D:\WINNT\System32\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (D:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
#ifndef   __SHDocVw_TLB_h__
#define   __SHDocVw_TLB_h__

#pragma option push -b -w-inl

#include <vcl/utilcls.h>
#if !defined(__UTILCLS_H_VERSION) || (__UTILCLS_H_VERSION < 0x0101)
#error "This file requires an newer version of the header file UTILCLS.H"
#endif

#include <olectl.h>
#include <ocidl.h>
#if defined(USING_ATLVCL) || defined(USING_ATL)
#if !defined(__TLB_NO_EVENT_WRAPPERS)
#include <atl/atlmod.h>
#endif
#endif


// *********************************************************************//
// Forward reference of some VCL types (to avoid including STDVCL.HPP)  //
// *********************************************************************//
namespace Stdvcl {class IStrings; class IStringsDisp;}
using namespace Stdvcl;

namespace Shdocvw_tlb
{

// *********************************************************************//
// HelpString: Microsoft Internet Controls
// Version:    1.1
// *********************************************************************//


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLSID_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
DEFINE_GUID(LIBID_SHDocVw, 0xEAB22AC0, 0x30C1, 0x11CF, 0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B);
DEFINE_GUID(IID_IWebBrowser, 0xEAB22AC1, 0x30C1, 0x11CF, 0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B);
DEFINE_GUID(DIID_DWebBrowserEvents, 0xEAB22AC2, 0x30C1, 0x11CF, 0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B);
DEFINE_GUID(IID_IWebBrowserApp, 0x0002DF05, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46);
DEFINE_GUID(IID_IWebBrowser2, 0xD30C1661, 0xCDAF, 0x11D0, 0x8A, 0x3E, 0x00, 0xC0, 0x4F, 0xC9, 0xE2, 0x6E);
DEFINE_GUID(DIID_DWebBrowserEvents2, 0x34A715A0, 0x6587, 0x11D0, 0x92, 0x4A, 0x00, 0x20, 0xAF, 0xC7, 0xAC, 0x4D);
DEFINE_GUID(CLSID_WebBrowser_V1, 0xEAB22AC3, 0x30C1, 0x11CF, 0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B);
DEFINE_GUID(CLSID_WebBrowser, 0x8856F961, 0x340A, 0x11D0, 0xA9, 0x6B, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2);
DEFINE_GUID(CLSID_InternetExplorer, 0x0002DF01, 0x0000, 0x0000, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46);
DEFINE_GUID(IID_IFolderViewOC, 0x9BA05970, 0xF6A8, 0x11CF, 0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39);
DEFINE_GUID(DIID_DShellFolderViewEvents, 0x62112AA2, 0xEBE4, 0x11CF, 0xA5, 0xFB, 0x00, 0x20, 0xAF, 0xE7, 0x29, 0x2D);
DEFINE_GUID(CLSID_ShellFolderViewOC, 0x9BA05971, 0xF6A8, 0x11CF, 0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39);
DEFINE_GUID(DIID_DShellWindowsEvents, 0xFE4106E0, 0x399A, 0x11D0, 0xA4, 0x8C, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39);
DEFINE_GUID(IID_IShellWindows, 0x85CB6900, 0x4D95, 0x11CF, 0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85);
DEFINE_GUID(CLSID_ShellWindows, 0x9BA05972, 0xF6A8, 0x11CF, 0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39);
DEFINE_GUID(IID_IShellLinkDual, 0x88A05C00, 0xF000, 0x11CE, 0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(CLSID_ShellLinkObject, 0x11219420, 0x1768, 0x11D1, 0x95, 0xBE, 0x00, 0x60, 0x97, 0x97, 0xEA, 0x4F);
DEFINE_GUID(IID_FolderItemVerb, 0x08EC3E00, 0x50B0, 0x11CF, 0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85);
DEFINE_GUID(IID_FolderItemVerbs, 0x1F8352C0, 0x50B0, 0x11CF, 0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85);
DEFINE_GUID(IID_Folder, 0xBBCBDE60, 0xC3FF, 0x11CE, 0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(IID_FolderItems, 0x744129E0, 0xCBE5, 0x11CE, 0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(IID_FolderItem, 0xFAC32C80, 0xCBE4, 0x11CE, 0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(IID_IShellFolderViewDual, 0xE7A1AF80, 0x4D96, 0x11CF, 0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85);
DEFINE_GUID(CLSID_ShellFolderView, 0x62112AA1, 0xEBE4, 0x11CF, 0xA5, 0xFB, 0x00, 0x20, 0xAF, 0xE7, 0x29, 0x2D);
DEFINE_GUID(IID_IShellDispatch, 0xD8F015C0, 0xC278, 0x11CE, 0xA4, 0x9E, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(CLSID_Shell, 0x13709620, 0xC279, 0x11CE, 0xA4, 0x9E, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(CLSID_ShellDispatchInproc, 0x0A89A860, 0xD7B1, 0x11CE, 0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00);
DEFINE_GUID(CLSID_WebViewFolderContents, 0x1820FED0, 0x473E, 0x11D0, 0xA9, 0x6C, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2);
DEFINE_GUID(IID_IShellUIHelper, 0x729FE2F8, 0x1EA8, 0x11D1, 0x8F, 0x85, 0x00, 0xC0, 0x4F, 0xC2, 0xFB, 0xE1);
DEFINE_GUID(CLSID_ShellUIHelper, 0x64AB4BB7, 0x111E, 0x11D1, 0x8F, 0x79, 0x00, 0xC0, 0x4F, 0xC2, 0xFB, 0xE1);

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                  //
// *********************************************************************//
enum      CommandStateChangeConstants;
enum      OLECMDID;
enum      OLECMDF;
enum      OLECMDEXECOPT;
enum      tagREADYSTATE;
enum      ShellWindowTypeConstants;
enum      ShellWindowFindWindowOptions;
enum      ShellFolderViewOptions;
enum      ShellSpecialFolderConstants;
interface DECLSPEC_UUID("{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}") IWebBrowser;
interface DECLSPEC_UUID("{EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}") DWebBrowserEvents;
interface DECLSPEC_UUID("{0002DF05-0000-0000-C000-000000000046}") IWebBrowserApp;
interface DECLSPEC_UUID("{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}") IWebBrowser2;
interface DECLSPEC_UUID("{34A715A0-6587-11D0-924A-0020AFC7AC4D}") DWebBrowserEvents2;
interface DECLSPEC_UUID("{9BA05970-F6A8-11CF-A442-00A0C90A8F39}") IFolderViewOC;
interface DECLSPEC_UUID("{62112AA2-EBE4-11CF-A5FB-0020AFE7292D}") DShellFolderViewEvents;
interface DECLSPEC_UUID("{FE4106E0-399A-11D0-A48C-00A0C90A8F39}") DShellWindowsEvents;
interface DECLSPEC_UUID("{85CB6900-4D95-11CF-960C-0080C7F4EE85}") IShellWindows;
interface DECLSPEC_UUID("{88A05C00-F000-11CE-8350-444553540000}") IShellLinkDual;
interface DECLSPEC_UUID("{08EC3E00-50B0-11CF-960C-0080C7F4EE85}") FolderItemVerb;
interface DECLSPEC_UUID("{1F8352C0-50B0-11CF-960C-0080C7F4EE85}") FolderItemVerbs;
interface DECLSPEC_UUID("{BBCBDE60-C3FF-11CE-8350-444553540000}") Folder;
interface DECLSPEC_UUID("{744129E0-CBE5-11CE-8350-444553540000}") FolderItems;
interface DECLSPEC_UUID("{FAC32C80-CBE4-11CE-8350-444553540000}") FolderItem;
interface DECLSPEC_UUID("{E7A1AF80-4D96-11CF-960C-0080C7F4EE85}") IShellFolderViewDual;
interface DECLSPEC_UUID("{D8F015C0-C278-11CE-A49E-444553540000}") IShellDispatch;
interface DECLSPEC_UUID("{729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}") IShellUIHelper;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
//                                                                      //
// The LIBID_OF_ macro(s) map a LIBID_OF_CoClassName to the GUID of this//
// TypeLibrary. It simplifies the updating of macros when CoClass name  //
// change.                                                              //
// *********************************************************************//
typedef IWebBrowser WebBrowser_V1;
typedef IWebBrowser2 WebBrowser;
typedef IWebBrowser2 InternetExplorer;
typedef IFolderViewOC ShellFolderViewOC;
typedef IShellWindows ShellWindows;
typedef IShellLinkDual ShellLinkObject;
typedef IShellFolderViewDual ShellFolderView;
typedef IShellDispatch Shell;
typedef IUnknown ShellDispatchInproc;
typedef IShellFolderViewDual WebViewFolderContents;
typedef IShellUIHelper ShellUIHelper;

#define LIBID_OF_WebBrowser_V1 (&LIBID_SHDocVw)
#define LIBID_OF_WebBrowser (&LIBID_SHDocVw)
#define LIBID_OF_InternetExplorer (&LIBID_SHDocVw)
#define LIBID_OF_ShellFolderViewOC (&LIBID_SHDocVw)
#define LIBID_OF_ShellWindows (&LIBID_SHDocVw)
#define LIBID_OF_ShellLinkObject (&LIBID_SHDocVw)
#define LIBID_OF_ShellFolderView (&LIBID_SHDocVw)
#define LIBID_OF_Shell (&LIBID_SHDocVw)
#define LIBID_OF_ShellDispatchInproc (&LIBID_SHDocVw)
#define LIBID_OF_WebViewFolderContents (&LIBID_SHDocVw)
#define LIBID_OF_ShellUIHelper (&LIBID_SHDocVw)

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                  //
// *********************************************************************//
typedef enum CommandStateChangeConstants
{
  CSC_UPDATECOMMANDS = 0xFFFFFFFF, 
  CSC_NAVIGATEFORWARD = 1, 
  CSC_NAVIGATEBACK = 2
} CommandStateChangeConstants;

typedef enum OLECMDID
{
  OLECMDID_OPEN = 1, 
  OLECMDID_NEW = 2, 
  OLECMDID_SAVE = 3, 
  OLECMDID_SAVEAS = 4, 
  OLECMDID_SAVECOPYAS = 5, 
  OLECMDID_PRINT = 6, 
  OLECMDID_PRINTPREVIEW = 7, 
  OLECMDID_PAGESETUP = 8, 
  OLECMDID_SPELL = 9, 
  OLECMDID_PROPERTIES = 10, 
  OLECMDID_CUT = 11, 
  OLECMDID_COPY = 12, 
  OLECMDID_PASTE = 13, 
  OLECMDID_PASTESPECIAL = 14, 
  OLECMDID_UNDO = 15, 
  OLECMDID_REDO = 16, 
  OLECMDID_SELECTALL = 17, 
  OLECMDID_CLEARSELECTION = 18, 
  OLECMDID_ZOOM = 19, 
  OLECMDID_GETZOOMRANGE = 20, 
  OLECMDID_UPDATECOMMANDS = 21, 
  OLECMDID_REFRESH = 22, 
  OLECMDID_STOP = 23, 
  OLECMDID_HIDETOOLBARS = 24, 
  OLECMDID_SETPROGRESSMAX = 25, 
  OLECMDID_SETPROGRESSPOS = 26, 
  OLECMDID_SETPROGRESSTEXT = 27, 
  OLECMDID_SETTITLE = 28, 
  OLECMDID_SETDOWNLOADSTATE = 29, 
  OLECMDID_STOPDOWNLOAD = 30, 
  OLECMDID_ONTOOLBARACTIVATED = 31, 
  OLECMDID_FIND = 32, 
  OLECMDID_DELETE = 33, 
  OLECMDID_HTTPEQUIV = 34, 
  OLECMDID_HTTPEQUIV_DONE = 35, 
  OLECMDID_ENABLE_INTERACTION = 36, 
  OLECMDID_ONUNLOAD = 37, 
  OLECMDID_PROPERTYBAG2 = 38, 
  OLECMDID_PREREFRESH = 39
} OLECMDID;

typedef enum OLECMDF
{
  OLECMDF_SUPPORTED = 1, 
  OLECMDF_ENABLED = 2, 
  OLECMDF_LATCHED = 4, 
  OLECMDF_NINCHED = 8
} OLECMDF;

typedef enum OLECMDEXECOPT
{
  OLECMDEXECOPT_DODEFAULT = 0, 
  OLECMDEXECOPT_PROMPTUSER = 1, 
  OLECMDEXECOPT_DONTPROMPTUSER = 2, 
  OLECMDEXECOPT_SHOWHELP = 3
} OLECMDEXECOPT;

typedef enum tagREADYSTATE
{
  READYSTATE_UNINITIALIZED = 0, 
  READYSTATE_LOADING = 1, 
  READYSTATE_LOADED = 2, 
  READYSTATE_INTERACTIVE = 3, 
  READYSTATE_COMPLETE = 4
} tagREADYSTATE;

typedef enum ShellWindowTypeConstants
{
  SWC_EXPLORER = 0, 
  SWC_BROWSER = 1, 
  SWC_3RDPARTY = 2, 
  SWC_CALLBACK = 4
} ShellWindowTypeConstants;

typedef enum ShellWindowFindWindowOptions
{
  SWFO_NEEDDISPATCH = 1, 
  SWFO_INCLUDEPENDING = 2, 
  SWFO_COOKIEPASSED = 4
} ShellWindowFindWindowOptions;

typedef enum ShellFolderViewOptions
{
  SFVVO_SHOWALLOBJECTS = 1, 
  SFVVO_SHOWEXTENSIONS = 2, 
  SFVVO_SHOWCOMPCOLOR = 8, 
  SFVVO_SHOWSYSFILES = 32, 
  SFVVO_WIN95CLASSIC = 64, 
  SFVVO_DOUBLECLICKINWEBVIEW = 128, 
  SFVVO_DESKTOPHTML = 512
} ShellFolderViewOptions;

typedef enum ShellSpecialFolderConstants
{
  ssfDESKTOP = 0, 
  ssfPROGRAMS = 2, 
  ssfCONTROLS = 3, 
  ssfPRINTERS = 4, 
  ssfPERSONAL = 5, 
  ssfFAVORITES = 6, 
  ssfSTARTUP = 7, 
  ssfRECENT = 8, 
  ssfSENDTO = 9, 
  ssfBITBUCKET = 10, 
  ssfSTARTMENU = 11, 
  ssfDESKTOPDIRECTORY = 16, 
  ssfDRIVES = 17, 
  ssfNETWORK = 18, 
  ssfNETHOOD = 19, 
  ssfFONTS = 20, 
  ssfTEMPLATES = 21
} ShellSpecialFolderConstants;

// *********************************************************************//
// Interface: IWebBrowser
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
interface IWebBrowser : public IDispatch
{
public:
  // [100] Navigates to the previous item in the history list.
  virtual HRESULT STDMETHODCALLTYPE GoBack(void) = 0;
  // [101] Navigates to the next item in the history list.
  virtual HRESULT STDMETHODCALLTYPE GoForward(void) = 0;
  // [102] Go home/start page.
  virtual HRESULT STDMETHODCALLTYPE GoHome(void) = 0;
  // [103] Go Search Page.
  virtual HRESULT STDMETHODCALLTYPE GoSearch(void) = 0;
  // [104] Navigates to a URL or file.
  virtual HRESULT STDMETHODCALLTYPE Navigate(BSTR URL/*[in]*/, 
                                             TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                             TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                             TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                             TVariant* Headers/*[in,opt]*/= TNoParam()) = 0;
  // [-550] Refresh the currently viewed page.
  virtual HRESULT STDMETHODCALLTYPE Refresh(void) = 0;
  // [105] Refresh the currently viewed page.
  virtual HRESULT STDMETHODCALLTYPE Refresh2(TVariant* Level/*[in,opt]*/= TNoParam()) = 0;
  // [106] Stops opening a file.
  virtual HRESULT STDMETHODCALLTYPE Stop(void) = 0;
  // [200] Returns the application automation object if accessible, this automation object otherwise..
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/) = 0;
  // [201] Returns the automation object of the container/parent if one exists or this automation object.
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/) = 0;
  // [202] Returns the container/parent automation object, if any.
  virtual HRESULT STDMETHODCALLTYPE get_Container(LPDISPATCH* ppDisp/*[out,retval]*/) = 0;
  // [203] Returns the active Document automation object, if any.
  virtual HRESULT STDMETHODCALLTYPE get_Document(LPDISPATCH* ppDisp/*[out,retval]*/) = 0;
  // [204] Returns True if this is the top level object.
  virtual HRESULT STDMETHODCALLTYPE get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/) = 0;
  // [205] Returns the type of the contained document object.
  virtual HRESULT STDMETHODCALLTYPE get_Type(BSTR* Type/*[out,retval]*/) = 0;
  // [206] The horizontal position (pixels) of the frame window relative to the screen/container.
  virtual HRESULT STDMETHODCALLTYPE get_Left(long* pl/*[out,retval]*/) = 0;
  // [206] The horizontal position (pixels) of the frame window relative to the screen/container.
  virtual HRESULT STDMETHODCALLTYPE set_Left(long pl/*[in]*/) = 0;
  // [207] The vertical position (pixels) of the frame window relative to the screen/container.
  virtual HRESULT STDMETHODCALLTYPE get_Top(long* pl/*[out,retval]*/) = 0;
  // [207] The vertical position (pixels) of the frame window relative to the screen/container.
  virtual HRESULT STDMETHODCALLTYPE set_Top(long pl/*[in]*/) = 0;
  // [208] The horizontal dimension (pixels) of the frame window/object.
  virtual HRESULT STDMETHODCALLTYPE get_Width(long* pl/*[out,retval]*/) = 0;
  // [208] The horizontal dimension (pixels) of the frame window/object.
  virtual HRESULT STDMETHODCALLTYPE set_Width(long pl/*[in]*/) = 0;
  // [209] The vertical dimension (pixels) of the frame window/object.
  virtual HRESULT STDMETHODCALLTYPE get_Height(long* pl/*[out,retval]*/) = 0;
  // [209] The vertical dimension (pixels) of the frame window/object.
  virtual HRESULT STDMETHODCALLTYPE set_Height(long pl/*[in]*/) = 0;
  // [210] Gets the short (UI-friendly) name of the URL/file currently viewed.
  virtual HRESULT STDMETHODCALLTYPE get_LocationName(BSTR* LocationName/*[out,retval]*/) = 0;
  // [211] Gets the full URL/path currently viewed.
  virtual HRESULT STDMETHODCALLTYPE get_LocationURL(BSTR* LocationURL/*[out,retval]*/) = 0;
  // [212] Query to see if something is still in progress.
  virtual HRESULT STDMETHODCALLTYPE get_Busy(TOLEBOOL* pBool/*[out,retval]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppDisp= 0;
    OLECHECK(this->get_Application_(&ppDisp));
    return ppDisp;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppDisp= 0;
    OLECHECK(this->get_Parent(&ppDisp));
    return ppDisp;
  }

  LPDISPATCH __fastcall get_Container(void)
  {
    LPDISPATCH ppDisp= 0;
    OLECHECK(this->get_Container(&ppDisp));
    return ppDisp;
  }

  LPDISPATCH __fastcall get_Document(void)
  {
    LPDISPATCH ppDisp= 0;
    OLECHECK(this->get_Document(&ppDisp));
    return ppDisp;
  }

  TOLEBOOL __fastcall get_TopLevelContainer(void)
  {
    TOLEBOOL pBool;
    OLECHECK(this->get_TopLevelContainer(&pBool));
    return pBool;
  }

  BSTR __fastcall get_Type(void)
  {
    BSTR Type= 0;
    OLECHECK(this->get_Type(&Type));
    return Type;
  }

  long __fastcall get_Left(void)
  {
    long pl;
    OLECHECK(this->get_Left(&pl));
    return pl;
  }

  long __fastcall get_Top(void)
  {
    long pl;
    OLECHECK(this->get_Top(&pl));
    return pl;
  }

  long __fastcall get_Width(void)
  {
    long pl;
    OLECHECK(this->get_Width(&pl));
    return pl;
  }

  long __fastcall get_Height(void)
  {
    long pl;
    OLECHECK(this->get_Height(&pl));
    return pl;
  }

  BSTR __fastcall get_LocationName(void)
  {
    BSTR LocationName= 0;
    OLECHECK(this->get_LocationName(&LocationName));
    return LocationName;
  }

  BSTR __fastcall get_LocationURL(void)
  {
    BSTR LocationURL= 0;
    OLECHECK(this->get_LocationURL(&LocationURL));
    return LocationURL;
  }

  TOLEBOOL __fastcall get_Busy(void)
  {
    TOLEBOOL pBool;
    OLECHECK(this->get_Busy(&pBool));
    return pBool;
  }


  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   LPDISPATCH      Container = {read = get_Container};
  __property   LPDISPATCH      Document = {read = get_Document};
  __property   TOLEBOOL        TopLevelContainer = {read = get_TopLevelContainer};
  __property   BSTR            Type = {read = get_Type};
  __property   long            Left = {read = get_Left, write = set_Left};
  __property   long            Top = {read = get_Top, write = set_Top};
  __property   long            Width = {read = get_Width, write = set_Width};
  __property   long            Height = {read = get_Height, write = set_Height};
  __property   BSTR            LocationName = {read = get_LocationName};
  __property   BSTR            LocationURL = {read = get_LocationURL};
  __property   TOLEBOOL        Busy = {read = get_Busy};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: DWebBrowserEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
interface DWebBrowserEvents : public IDispatch
{
// DispInterfaces have no methods. Their methods and properties are
// accessed via IDispatch::Invoke. See the class DWebBrowserEventsDisp provided
// below for an easy way to access the methods/properties of this
// interface.
};

// *********************************************************************//
// Interface: IWebBrowserApp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0002DF05-0000-0000-C000-000000000046}
// *********************************************************************//
interface IWebBrowserApp : public IWebBrowser
{
public:
  // [300] Exits application and closes the open document.
  virtual HRESULT STDMETHODCALLTYPE Quit(void) = 0;
  // [301] Converts client sizes into window sizes.
  virtual HRESULT STDMETHODCALLTYPE ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/) = 0;
  // [302] Associates vtValue with the name szProperty in the context of the object.
  virtual HRESULT STDMETHODCALLTYPE PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/) = 0;
  // [303] Retrieve the Associated value for the property vtValue in the context of the object.
  virtual HRESULT STDMETHODCALLTYPE GetProperty(BSTR Property/*[in]*/, 
                                                TVariant* pvtValue/*[out,retval]*/) = 0;
  // [0] Returns name of the application.
  virtual HRESULT STDMETHODCALLTYPE get_Name(BSTR* Name/*[out,retval]*/) = 0;
  // [-515] Returns the HWND of the current IE window.
  virtual HRESULT STDMETHODCALLTYPE get_HWND(long* pHWND/*[out,retval]*/) = 0;
  // [400] Returns file specification of the application, including path.
  virtual HRESULT STDMETHODCALLTYPE get_FullName(BSTR* FullName/*[out,retval]*/) = 0;
  // [401] Returns the path to the application.
  virtual HRESULT STDMETHODCALLTYPE get_Path(BSTR* Path/*[out,retval]*/) = 0;
  // [402] Determines whether the application is visible or hidden.
  virtual HRESULT STDMETHODCALLTYPE get_Visible(TOLEBOOL* pBool/*[out,retval]*/) = 0;
  // [402] Determines whether the application is visible or hidden.
  virtual HRESULT STDMETHODCALLTYPE set_Visible(TOLEBOOL pBool/*[in]*/) = 0;
  // [403] Turn on or off the statusbar.
  virtual HRESULT STDMETHODCALLTYPE get_StatusBar(TOLEBOOL* pBool/*[out,retval]*/) = 0;
  // [403] Turn on or off the statusbar.
  virtual HRESULT STDMETHODCALLTYPE set_StatusBar(TOLEBOOL pBool/*[in]*/) = 0;
  // [404] Text of Status window.
  virtual HRESULT STDMETHODCALLTYPE get_StatusText(BSTR* StatusText/*[out,retval]*/) = 0;
  // [404] Text of Status window.
  virtual HRESULT STDMETHODCALLTYPE set_StatusText(BSTR StatusText/*[in]*/) = 0;
  // [405] Controls which toolbar is shown.
  virtual HRESULT STDMETHODCALLTYPE get_ToolBar(int* Value/*[out,retval]*/) = 0;
  // [405] Controls which toolbar is shown.
  virtual HRESULT STDMETHODCALLTYPE set_ToolBar(int Value/*[in]*/) = 0;
  // [406] Controls whether menubar is shown.
  virtual HRESULT STDMETHODCALLTYPE get_MenuBar(TOLEBOOL* Value/*[out,retval]*/) = 0;
  // [406] Controls whether menubar is shown.
  virtual HRESULT STDMETHODCALLTYPE set_MenuBar(TOLEBOOL Value/*[in]*/) = 0;
  // [407] Maximizes window and turns off statusbar, toolbar, menubar, and titlebar.
  virtual HRESULT STDMETHODCALLTYPE get_FullScreen(TOLEBOOL* pbFullScreen/*[out,retval]*/) = 0;
  // [407] Maximizes window and turns off statusbar, toolbar, menubar, and titlebar.
  virtual HRESULT STDMETHODCALLTYPE set_FullScreen(TOLEBOOL pbFullScreen/*[in]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  TVariant __fastcall GetProperty(BSTR Property/*[in]*/)
  {
    TVariant pvtValue;
    OLECHECK(this->GetProperty(Property, &pvtValue));
    return pvtValue;
  }

  BSTR __fastcall get_Name(void)
  {
    BSTR Name= 0;
    OLECHECK(this->get_Name(&Name));
    return Name;
  }

  long __fastcall get_HWND(void)
  {
    long pHWND;
    OLECHECK(this->get_HWND(&pHWND));
    return pHWND;
  }

  BSTR __fastcall get_FullName(void)
  {
    BSTR FullName= 0;
    OLECHECK(this->get_FullName(&FullName));
    return FullName;
  }

  BSTR __fastcall get_Path(void)
  {
    BSTR Path= 0;
    OLECHECK(this->get_Path(&Path));
    return Path;
  }

  TOLEBOOL __fastcall get_Visible(void)
  {
    TOLEBOOL pBool;
    OLECHECK(this->get_Visible(&pBool));
    return pBool;
  }

  TOLEBOOL __fastcall get_StatusBar(void)
  {
    TOLEBOOL pBool;
    OLECHECK(this->get_StatusBar(&pBool));
    return pBool;
  }

  BSTR __fastcall get_StatusText(void)
  {
    BSTR StatusText= 0;
    OLECHECK(this->get_StatusText(&StatusText));
    return StatusText;
  }

  int __fastcall get_ToolBar(void)
  {
    int Value;
    OLECHECK(this->get_ToolBar(&Value));
    return Value;
  }

  TOLEBOOL __fastcall get_MenuBar(void)
  {
    TOLEBOOL Value;
    OLECHECK(this->get_MenuBar(&Value));
    return Value;
  }

  TOLEBOOL __fastcall get_FullScreen(void)
  {
    TOLEBOOL pbFullScreen;
    OLECHECK(this->get_FullScreen(&pbFullScreen));
    return pbFullScreen;
  }


  __property   BSTR            Name = {read = get_Name};
  __property   long            HWND = {read = get_HWND};
  __property   BSTR            FullName = {read = get_FullName};
  __property   BSTR            Path = {read = get_Path};
  __property   TOLEBOOL        Visible = {read = get_Visible, write = set_Visible};
  __property   TOLEBOOL        StatusBar = {read = get_StatusBar, write = set_StatusBar};
  __property   BSTR            StatusText = {read = get_StatusText, write = set_StatusText};
  __property   int             ToolBar = {read = get_ToolBar, write = set_ToolBar};
  __property   TOLEBOOL        MenuBar = {read = get_MenuBar, write = set_MenuBar};
  __property   TOLEBOOL        FullScreen = {read = get_FullScreen, write = set_FullScreen};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: IWebBrowser2
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}
// *********************************************************************//
interface IWebBrowser2 : public IWebBrowserApp
{
public:
  // [500] Navigates to a URL or file or pidl.
  virtual HRESULT STDMETHODCALLTYPE Navigate2(TVariant* URL/*[in]*/, 
                                              TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                              TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                              TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                              TVariant* Headers/*[in,opt]*/= TNoParam()) = 0;
  // [501] IOleCommandTarget::QueryStatus
  virtual HRESULT STDMETHODCALLTYPE QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                                  Shdocvw_tlb::OLECMDF* pcmdf/*[out,retval]*/) = 0;
  // [502] IOleCommandTarget::Exec
  virtual HRESULT STDMETHODCALLTYPE ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                           Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                                           TVariant* pvaIn/*[in,opt]*/= TNoParam(), 
                                           TVariant* pvaOut/*[in,out,opt]*/= TNoParam()) = 0;
  // [503] Set BrowserBar to Clsid
  virtual HRESULT STDMETHODCALLTYPE ShowBrowserBar(TVariant* pvaClsid/*[in]*/, 
                                                   TVariant* pvarShow/*[in,opt]*/= TNoParam(), 
                                                   TVariant* pvarSize/*[in,opt]*/= TNoParam()) = 0;
  virtual HRESULT STDMETHODCALLTYPE get_ReadyState(Shdocvw_tlb::tagREADYSTATE* plReadyState/*[out,retval]*/) = 0; // [-525]
  // [550] Controls if the frame is offline (read from cache)
  virtual HRESULT STDMETHODCALLTYPE get_Offline(TOLEBOOL* pbOffline/*[out,retval]*/) = 0;
  // [550] Controls if the frame is offline (read from cache)
  virtual HRESULT STDMETHODCALLTYPE set_Offline(TOLEBOOL pbOffline/*[in]*/) = 0;
  // [551] Controls if any dialog boxes can be shown
  virtual HRESULT STDMETHODCALLTYPE get_Silent(TOLEBOOL* pbSilent/*[out,retval]*/) = 0;
  // [551] Controls if any dialog boxes can be shown
  virtual HRESULT STDMETHODCALLTYPE set_Silent(TOLEBOOL pbSilent/*[in]*/) = 0;
  // [552] Registers OC as a top-level browser (for target name resolution)
  virtual HRESULT STDMETHODCALLTYPE get_RegisterAsBrowser(TOLEBOOL* pbRegister/*[out,retval]*/) = 0;
  // [552] Registers OC as a top-level browser (for target name resolution)
  virtual HRESULT STDMETHODCALLTYPE set_RegisterAsBrowser(TOLEBOOL pbRegister/*[in]*/) = 0;
  // [553] Registers OC as a drop target for navigation
  virtual HRESULT STDMETHODCALLTYPE get_RegisterAsDropTarget(TOLEBOOL* pbRegister/*[out,retval]*/) = 0;
  // [553] Registers OC as a drop target for navigation
  virtual HRESULT STDMETHODCALLTYPE set_RegisterAsDropTarget(TOLEBOOL pbRegister/*[in]*/) = 0;
  // [554] Controls if the browser is in theater mode
  virtual HRESULT STDMETHODCALLTYPE get_TheaterMode(TOLEBOOL* pbRegister/*[out,retval]*/) = 0;
  // [554] Controls if the browser is in theater mode
  virtual HRESULT STDMETHODCALLTYPE set_TheaterMode(TOLEBOOL pbRegister/*[in]*/) = 0;
  // [555] Controls whether address bar is shown
  virtual HRESULT STDMETHODCALLTYPE get_AddressBar(TOLEBOOL* Value/*[out,retval]*/) = 0;
  // [555] Controls whether address bar is shown
  virtual HRESULT STDMETHODCALLTYPE set_AddressBar(TOLEBOOL Value/*[in]*/) = 0;
  // [556] Controls whether the window is resizable
  virtual HRESULT STDMETHODCALLTYPE get_Resizable(TOLEBOOL* Value/*[out,retval]*/) = 0;
  // [556] Controls whether the window is resizable
  virtual HRESULT STDMETHODCALLTYPE set_Resizable(TOLEBOOL Value/*[in]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  Shdocvw_tlb::OLECMDF __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/)
  {
    Shdocvw_tlb::OLECMDF pcmdf;
    OLECHECK(this->QueryStatusWB(cmdID, &pcmdf));
    return pcmdf;
  }

  Shdocvw_tlb::tagREADYSTATE __fastcall get_ReadyState(void)
  {
    Shdocvw_tlb::tagREADYSTATE plReadyState;
    OLECHECK(this->get_ReadyState(&plReadyState));
    return plReadyState;
  }

  TOLEBOOL __fastcall get_Offline(void)
  {
    TOLEBOOL pbOffline;
    OLECHECK(this->get_Offline(&pbOffline));
    return pbOffline;
  }

  TOLEBOOL __fastcall get_Silent(void)
  {
    TOLEBOOL pbSilent;
    OLECHECK(this->get_Silent(&pbSilent));
    return pbSilent;
  }

  TOLEBOOL __fastcall get_RegisterAsBrowser(void)
  {
    TOLEBOOL pbRegister;
    OLECHECK(this->get_RegisterAsBrowser(&pbRegister));
    return pbRegister;
  }

  TOLEBOOL __fastcall get_RegisterAsDropTarget(void)
  {
    TOLEBOOL pbRegister;
    OLECHECK(this->get_RegisterAsDropTarget(&pbRegister));
    return pbRegister;
  }

  TOLEBOOL __fastcall get_TheaterMode(void)
  {
    TOLEBOOL pbRegister;
    OLECHECK(this->get_TheaterMode(&pbRegister));
    return pbRegister;
  }

  TOLEBOOL __fastcall get_AddressBar(void)
  {
    TOLEBOOL Value;
    OLECHECK(this->get_AddressBar(&Value));
    return Value;
  }

  TOLEBOOL __fastcall get_Resizable(void)
  {
    TOLEBOOL Value;
    OLECHECK(this->get_Resizable(&Value));
    return Value;
  }


  __property   Shdocvw_tlb::tagREADYSTATE ReadyState = {read = get_ReadyState};
  __property   TOLEBOOL        Offline = {read = get_Offline, write = set_Offline};
  __property   TOLEBOOL        Silent = {read = get_Silent, write = set_Silent};
  __property   TOLEBOOL        RegisterAsBrowser = {read = get_RegisterAsBrowser, write = set_RegisterAsBrowser};
  __property   TOLEBOOL        RegisterAsDropTarget = {read = get_RegisterAsDropTarget, write = set_RegisterAsDropTarget};
  __property   TOLEBOOL        TheaterMode = {read = get_TheaterMode, write = set_TheaterMode};
  __property   TOLEBOOL        AddressBar = {read = get_AddressBar, write = set_AddressBar};
  __property   TOLEBOOL        Resizable = {read = get_Resizable, write = set_Resizable};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: DWebBrowserEvents2
// Flags:     (4112) Hidden Dispatchable
// GUID:      {34A715A0-6587-11D0-924A-0020AFC7AC4D}
// *********************************************************************//
interface DWebBrowserEvents2 : public IDispatch
{
// DispInterfaces have no methods. Their methods and properties are
// accessed via IDispatch::Invoke. See the class DWebBrowserEvents2Disp provided
// below for an easy way to access the methods/properties of this
// interface.
};

// *********************************************************************//
// Interface: IFolderViewOC
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9BA05970-F6A8-11CF-A442-00A0C90A8F39}
// *********************************************************************//
interface IFolderViewOC : public IDispatch
{
public:
  // [-1] Set the ShellFolderView object to monitor events of.
  virtual HRESULT STDMETHODCALLTYPE SetFolderView(LPDISPATCH pDisp/*[in]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)



#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: DShellFolderViewEvents
// Flags:     (4096) Dispatchable
// GUID:      {62112AA2-EBE4-11CF-A5FB-0020AFE7292D}
// *********************************************************************//
interface DShellFolderViewEvents : public IDispatch
{
// DispInterfaces have no methods. Their methods and properties are
// accessed via IDispatch::Invoke. See the class DShellFolderViewEventsDisp provided
// below for an easy way to access the methods/properties of this
// interface.
};

// *********************************************************************//
// Interface: DShellWindowsEvents
// Flags:     (4096) Dispatchable
// GUID:      {FE4106E0-399A-11D0-A48C-00A0C90A8F39}
// *********************************************************************//
interface DShellWindowsEvents : public IDispatch
{
// DispInterfaces have no methods. Their methods and properties are
// accessed via IDispatch::Invoke. See the class DShellWindowsEventsDisp provided
// below for an easy way to access the methods/properties of this
// interface.
};

// *********************************************************************//
// Interface: IShellWindows
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85CB6900-4D95-11CF-960C-0080C7F4EE85}
// *********************************************************************//
interface IShellWindows : public IDispatch
{
public:
  // [-1] Get count of open Shell windows
  virtual HRESULT STDMETHODCALLTYPE get_Count(long* Count/*[out,retval]*/) = 0;
  // [0] Return the shell window for the given index
  virtual HRESULT STDMETHODCALLTYPE Item(TVariant index/*[in,opt]*/, 
                                         LPDISPATCH* Folder/*[out,retval]*/) = 0;
  // [-4] Enumerates the figures
  virtual HRESULT STDMETHODCALLTYPE _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/) = 0;
  // [-1] Register a window with the list
  virtual HRESULT STDMETHODCALLTYPE Register(LPDISPATCH pid/*[in]*/, long HWND/*[in]*/, 
                                             int swClass/*[in]*/, long* plCookie/*[out]*/) = 0;
  // [-1] Register a pending open with the list
  virtual HRESULT STDMETHODCALLTYPE RegisterPending(long lThreadId/*[in]*/, 
                                                    TVariant* pvarloc/*[in]*/, 
                                                    TVariant* pvarlocRoot/*[in]*/, 
                                                    int swClass/*[in]*/, long* plCookie/*[out]*/) = 0;
  // [-1] Remove a window from the list
  virtual HRESULT STDMETHODCALLTYPE Revoke(long lCookie/*[in]*/) = 0;
  // [-1] Notifies the new location
  virtual HRESULT STDMETHODCALLTYPE OnNavigate(long lCookie/*[in]*/, TVariant* pvarloc/*[in]*/) = 0;
  // [-1] Notifies the activation
  virtual HRESULT STDMETHODCALLTYPE OnActivated(long lCookie/*[in]*/, TOLEBOOL fActive/*[in]*/) = 0;
  // [-1] Find the window based on the location
  virtual HRESULT STDMETHODCALLTYPE FindWindow(TVariant* pvarloc/*[in]*/, 
                                               TVariant* pvarlocRoot/*[in]*/, int swClass/*[in]*/, 
                                               long* pHWND/*[out]*/, int swfwOptions/*[in]*/, 
                                               LPDISPATCH* ppdispOut/*[out,retval]*/) = 0;
  // [-1] Notifies on creation and frame name set
  virtual HRESULT STDMETHODCALLTYPE OnCreated(long lCookie/*[in]*/, LPUNKNOWN punk/*[in]*/) = 0;
  // [-1] Used by IExplore to register different processes
  virtual HRESULT STDMETHODCALLTYPE ProcessAttachDetach(TOLEBOOL fAttach/*[in]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  long __fastcall get_Count(void)
  {
    long Count;
    OLECHECK(this->get_Count(&Count));
    return Count;
  }

  LPDISPATCH __fastcall Item(TVariant index/*[in,opt]*/= TNoParam())
  {
    LPDISPATCH Folder= 0;
    OLECHECK(this->Item(index, &Folder));
    return Folder;
  }

  LPUNKNOWN __fastcall _NewEnum(void)
  {
    LPUNKNOWN ppunk= 0;
    OLECHECK(this->_NewEnum(&ppunk));
    return ppunk;
  }

  LPDISPATCH __fastcall FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                   int swClass/*[in]*/, long* pHWND/*[out]*/, 
                                   int swfwOptions/*[in]*/)
  {
    LPDISPATCH ppdispOut= 0;
    OLECHECK(this->FindWindow(pvarloc, pvarlocRoot, swClass, pHWND, swfwOptions, &ppdispOut));
    return ppdispOut;
  }


  __property   long            Count = {read = get_Count};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: IShellLinkDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {88A05C00-F000-11CE-8350-444553540000}
// *********************************************************************//
interface IShellLinkDual : public IDispatch
{
public:
  // [-1] Get the path of the link
  virtual HRESULT STDMETHODCALLTYPE get_Path(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get the path of the link
  virtual HRESULT STDMETHODCALLTYPE set_Path(BSTR pbs/*[in]*/) = 0;
  // [-1] Get the description for the link
  virtual HRESULT STDMETHODCALLTYPE get_Description(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get the description for the link
  virtual HRESULT STDMETHODCALLTYPE set_Description(BSTR pbs/*[in]*/) = 0;
  // [-1] Get the working directory for the link
  virtual HRESULT STDMETHODCALLTYPE get_WorkingDirectory(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get the working directory for the link
  virtual HRESULT STDMETHODCALLTYPE set_WorkingDirectory(BSTR pbs/*[in]*/) = 0;
  // [-1] Get the arguments for the link
  virtual HRESULT STDMETHODCALLTYPE get_Arguments(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get the arguments for the link
  virtual HRESULT STDMETHODCALLTYPE set_Arguments(BSTR pbs/*[in]*/) = 0;
  // [-1] Get the Hotkey for the link
  virtual HRESULT STDMETHODCALLTYPE get_Hotkey(int* piHK/*[out,retval]*/) = 0;
  // [-1] Get the Hotkey for the link
  virtual HRESULT STDMETHODCALLTYPE set_Hotkey(int piHK/*[in]*/) = 0;
  // [-1] Get the Show Command for the link
  virtual HRESULT STDMETHODCALLTYPE get_ShowCommand(int* piShowCommand/*[out,retval]*/) = 0;
  // [-1] Get the Show Command for the link
  virtual HRESULT STDMETHODCALLTYPE set_ShowCommand(int piShowCommand/*[in]*/) = 0;
  // [-1] Tell the link to resolve itself
  virtual HRESULT STDMETHODCALLTYPE Resolve(int fFlags/*[in]*/) = 0;
  // [-1] Get the IconLocation for the link
  virtual HRESULT STDMETHODCALLTYPE GetIconLocation(BSTR* pbs/*[out]*/, int* piIcon/*[out,retval]*/) = 0;
  // [-1] Set the IconLocation for the link
  virtual HRESULT STDMETHODCALLTYPE SetIconLocation(BSTR bs/*[in]*/, int iIcon/*[in]*/) = 0;
  // [-1] Tell the link to save the changes
  virtual HRESULT STDMETHODCALLTYPE Save(TVariant vWhere/*[in,opt]*/= TNoParam()) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  BSTR __fastcall get_Path(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Path(&pbs));
    return pbs;
  }

  BSTR __fastcall get_Description(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Description(&pbs));
    return pbs;
  }

  BSTR __fastcall get_WorkingDirectory(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_WorkingDirectory(&pbs));
    return pbs;
  }

  BSTR __fastcall get_Arguments(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Arguments(&pbs));
    return pbs;
  }

  int __fastcall get_Hotkey(void)
  {
    int piHK;
    OLECHECK(this->get_Hotkey(&piHK));
    return piHK;
  }

  int __fastcall get_ShowCommand(void)
  {
    int piShowCommand;
    OLECHECK(this->get_ShowCommand(&piShowCommand));
    return piShowCommand;
  }

  int __fastcall GetIconLocation(BSTR* pbs/*[out]*/)
  {
    int piIcon;
    OLECHECK(this->GetIconLocation(pbs, &piIcon));
    return piIcon;
  }


  __property   BSTR            Path = {read = get_Path, write = set_Path};
  __property   BSTR            Description = {read = get_Description, write = set_Description};
  __property   BSTR            WorkingDirectory = {read = get_WorkingDirectory, write = set_WorkingDirectory};
  __property   BSTR            Arguments = {read = get_Arguments, write = set_Arguments};
  __property   int             Hotkey = {read = get_Hotkey, write = set_Hotkey};
  __property   int             ShowCommand = {read = get_ShowCommand, write = set_ShowCommand};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: FolderItemVerb
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {08EC3E00-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
interface FolderItemVerb : public IDispatch
{
public:
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [0] Get display name for item
  virtual HRESULT STDMETHODCALLTYPE get_Name(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Execute the verb
  virtual HRESULT STDMETHODCALLTYPE DoIt(void) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  BSTR __fastcall get_Name(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Name(&pbs));
    return pbs;
  }


  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   BSTR            Name = {read = get_Name};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: FolderItemVerbs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F8352C0-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
interface FolderItemVerbs : public IDispatch
{
public:
  // [-1] Get count of open folder windows
  virtual HRESULT STDMETHODCALLTYPE get_Count(long* plCount/*[out,retval]*/) = 0;
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Return the specified verb
  virtual HRESULT STDMETHODCALLTYPE Item(TVariant index/*[in,opt]*/, 
                                         Shdocvw_tlb::FolderItemVerb** ppid/*[out,retval]*/) = 0;
  // [-4] Enumerates the figures
  virtual HRESULT STDMETHODCALLTYPE _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  long __fastcall get_Count(void)
  {
    long plCount;
    OLECHECK(this->get_Count(&plCount));
    return plCount;
  }

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  Shdocvw_tlb::FolderItemVerb* __fastcall Item(TVariant index/*[in,opt]*/= TNoParam())
  {
    Shdocvw_tlb::FolderItemVerb* ppid= 0;
    OLECHECK(this->Item(index, &ppid));
    return ppid;
  }

  LPUNKNOWN __fastcall _NewEnum(void)
  {
    LPUNKNOWN ppunk= 0;
    OLECHECK(this->_NewEnum(&ppunk));
    return ppunk;
  }


  __property   long            Count = {read = get_Count};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: Folder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BBCBDE60-C3FF-11CE-8350-444553540000}
// *********************************************************************//
interface Folder : public IDispatch
{
public:
  // [0] Get the display name for the window
  virtual HRESULT STDMETHODCALLTYPE get_Title(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_ParentFolder(Shdocvw_tlb::Folder** ppsf/*[out,retval]*/) = 0;
  // [-1] The collection of Items in folder
  virtual HRESULT STDMETHODCALLTYPE Items(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/) = 0;
  // [-1] Parse the name to get an item.
  virtual HRESULT STDMETHODCALLTYPE ParseName(BSTR bName/*[in]*/, 
                                              Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/) = 0;
  // [-1] Create a new sub folder in this folder.
  virtual HRESULT STDMETHODCALLTYPE NewFolder(BSTR bName/*[in]*/, 
                                              TVariant vOptions/*[in,opt]*/= TNoParam()) = 0;
  // [-1] Move Items to this folder.
  virtual HRESULT STDMETHODCALLTYPE MoveHere(TVariant vItem/*[in]*/, 
                                             TVariant vOptions/*[in,opt]*/= TNoParam()) = 0;
  // [-1] Copy Items to this folder.
  virtual HRESULT STDMETHODCALLTYPE CopyHere(TVariant vItem/*[in]*/, 
                                             TVariant vOptions/*[in,opt]*/= TNoParam()) = 0;
  // [-1] Get the details about an item.
  virtual HRESULT STDMETHODCALLTYPE GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/, 
                                                 BSTR* pbs/*[out,retval]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  BSTR __fastcall get_Title(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Title(&pbs));
    return pbs;
  }

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  Shdocvw_tlb::Folder* __fastcall get_ParentFolder(void)
  {
    Shdocvw_tlb::Folder* ppsf= 0;
    OLECHECK(this->get_ParentFolder(&ppsf));
    return ppsf;
  }

  Shdocvw_tlb::FolderItems* __fastcall Items(void)
  {
    Shdocvw_tlb::FolderItems* ppid= 0;
    OLECHECK(this->Items(&ppid));
    return ppid;
  }

  Shdocvw_tlb::FolderItem* __fastcall ParseName(BSTR bName/*[in]*/)
  {
    Shdocvw_tlb::FolderItem* ppid= 0;
    OLECHECK(this->ParseName(bName, &ppid));
    return ppid;
  }

  BSTR __fastcall GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/)
  {
    BSTR pbs= 0;
    OLECHECK(this->GetDetailsOf(vItem, iColumn, &pbs));
    return pbs;
  }


  __property   BSTR            Title = {read = get_Title};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   Shdocvw_tlb::Folder* ParentFolder = {read = get_ParentFolder};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: FolderItems
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {744129E0-CBE5-11CE-8350-444553540000}
// *********************************************************************//
interface FolderItems : public IDispatch
{
public:
  // [-1] Get count of items in the folder
  virtual HRESULT STDMETHODCALLTYPE get_Count(long* plCount/*[out,retval]*/) = 0;
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Return the figure for the given index
  virtual HRESULT STDMETHODCALLTYPE Item(TVariant index/*[in,opt]*/, 
                                         Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/) = 0;
  // [-4] Enumerates the figures
  virtual HRESULT STDMETHODCALLTYPE _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  long __fastcall get_Count(void)
  {
    long plCount;
    OLECHECK(this->get_Count(&plCount));
    return plCount;
  }

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  Shdocvw_tlb::FolderItem* __fastcall Item(TVariant index/*[in,opt]*/= TNoParam())
  {
    Shdocvw_tlb::FolderItem* ppid= 0;
    OLECHECK(this->Item(index, &ppid));
    return ppid;
  }

  LPUNKNOWN __fastcall _NewEnum(void)
  {
    LPUNKNOWN ppunk= 0;
    OLECHECK(this->_NewEnum(&ppunk));
    return ppunk;
  }


  __property   long            Count = {read = get_Count};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: FolderItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FAC32C80-CBE4-11CE-8350-444553540000}
// *********************************************************************//
interface FolderItem : public IDispatch
{
public:
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [0] Get display name for item
  virtual HRESULT STDMETHODCALLTYPE get_Name(BSTR* pbs/*[out,retval]*/) = 0;
  // [0] Get display name for item
  virtual HRESULT STDMETHODCALLTYPE set_Name(BSTR pbs/*[in]*/) = 0;
  // [-1] Get the pathname to the item
  virtual HRESULT STDMETHODCALLTYPE get_Path(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] If item is link return link object
  virtual HRESULT STDMETHODCALLTYPE get_GetLink(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] If item is a folder return folder object
  virtual HRESULT STDMETHODCALLTYPE get_GetFolder(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Is the item a link?
  virtual HRESULT STDMETHODCALLTYPE get_IsLink(TOLEBOOL* pb/*[out,retval]*/) = 0;
  // [-1] Is the item a Folder?
  virtual HRESULT STDMETHODCALLTYPE get_IsFolder(TOLEBOOL* pb/*[out,retval]*/) = 0;
  // [-1] Is the item a file system object?
  virtual HRESULT STDMETHODCALLTYPE get_IsFileSystem(TOLEBOOL* pb/*[out,retval]*/) = 0;
  // [-1] Is the item browsable?
  virtual HRESULT STDMETHODCALLTYPE get_IsBrowsable(TOLEBOOL* pb/*[out,retval]*/) = 0;
  // [-1] Modification Date?
  virtual HRESULT STDMETHODCALLTYPE get_ModifyDate(DATE* pdt/*[out,retval]*/) = 0;
  // [-1] Modification Date?
  virtual HRESULT STDMETHODCALLTYPE set_ModifyDate(DATE pdt/*[in]*/) = 0;
  // [-1] Size
  virtual HRESULT STDMETHODCALLTYPE get_Size(long* pul/*[out,retval]*/) = 0;
  // [-1] Type
  virtual HRESULT STDMETHODCALLTYPE get_Type(BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Get the list of verbs for the object
  virtual HRESULT STDMETHODCALLTYPE Verbs(Shdocvw_tlb::FolderItemVerbs** ppfic/*[out,retval]*/) = 0;
  // [-1] Execute a command on the item
  virtual HRESULT STDMETHODCALLTYPE InvokeVerb(TVariant vVerb/*[in,opt]*/= TNoParam()) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  BSTR __fastcall get_Name(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Name(&pbs));
    return pbs;
  }

  BSTR __fastcall get_Path(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Path(&pbs));
    return pbs;
  }

  LPDISPATCH __fastcall get_GetLink(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_GetLink(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_GetFolder(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_GetFolder(&ppid));
    return ppid;
  }

  TOLEBOOL __fastcall get_IsLink(void)
  {
    TOLEBOOL pb;
    OLECHECK(this->get_IsLink(&pb));
    return pb;
  }

  TOLEBOOL __fastcall get_IsFolder(void)
  {
    TOLEBOOL pb;
    OLECHECK(this->get_IsFolder(&pb));
    return pb;
  }

  TOLEBOOL __fastcall get_IsFileSystem(void)
  {
    TOLEBOOL pb;
    OLECHECK(this->get_IsFileSystem(&pb));
    return pb;
  }

  TOLEBOOL __fastcall get_IsBrowsable(void)
  {
    TOLEBOOL pb;
    OLECHECK(this->get_IsBrowsable(&pb));
    return pb;
  }

  DATE __fastcall get_ModifyDate(void)
  {
    DATE pdt;
    OLECHECK(this->get_ModifyDate(&pdt));
    return pdt;
  }

  long __fastcall get_Size(void)
  {
    long pul;
    OLECHECK(this->get_Size(&pul));
    return pul;
  }

  BSTR __fastcall get_Type(void)
  {
    BSTR pbs= 0;
    OLECHECK(this->get_Type(&pbs));
    return pbs;
  }

  Shdocvw_tlb::FolderItemVerbs* __fastcall Verbs(void)
  {
    Shdocvw_tlb::FolderItemVerbs* ppfic= 0;
    OLECHECK(this->Verbs(&ppfic));
    return ppfic;
  }


  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   BSTR            Name = {read = get_Name, write = set_Name};
  __property   BSTR            Path = {read = get_Path};
  __property   LPDISPATCH      GetLink = {read = get_GetLink};
  __property   LPDISPATCH      GetFolder = {read = get_GetFolder};
  __property   TOLEBOOL        IsLink = {read = get_IsLink};
  __property   TOLEBOOL        IsFolder = {read = get_IsFolder};
  __property   TOLEBOOL        IsFileSystem = {read = get_IsFileSystem};
  __property   TOLEBOOL        IsBrowsable = {read = get_IsBrowsable};
  __property   DATE            ModifyDate = {read = get_ModifyDate, write = set_ModifyDate};
  __property   long            Size = {read = get_Size};
  __property   BSTR            Type = {read = get_Type};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: IShellFolderViewDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7A1AF80-4D96-11CF-960C-0080C7F4EE85}
// *********************************************************************//
interface IShellFolderViewDual : public IDispatch
{
public:
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get the folder being viewed
  virtual HRESULT STDMETHODCALLTYPE get_Folder_(Shdocvw_tlb::Folder** ppid/*[out,retval]*/) = 0;
  // [-1] The collection of Selected Items in folder
  virtual HRESULT STDMETHODCALLTYPE SelectedItems(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/) = 0;
  // [-1] The currently focused item in the folder
  virtual HRESULT STDMETHODCALLTYPE get_FocusedItem(Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/) = 0;
  // [-1] Select the item
  virtual HRESULT STDMETHODCALLTYPE SelectItem(TVariant* pvfi/*[in]*/, int dwFlags/*[in]*/) = 0;
  // [-1] Show items menu and return command selected
  virtual HRESULT STDMETHODCALLTYPE PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                                  TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/, 
                                                  BSTR* pbs/*[out,retval]*/) = 0;
  // [-1] Returns the scripting automation model.
  virtual HRESULT STDMETHODCALLTYPE get_Script(LPDISPATCH* ppDisp/*[out,retval]*/) = 0;
  // [-1] Returns the view options for showing a folder.
  virtual HRESULT STDMETHODCALLTYPE get_ViewOptions(long* plViewOptions/*[out,retval]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  Shdocvw_tlb::Folder* __fastcall get_Folder_(void)
  {
    Shdocvw_tlb::Folder* ppid= 0;
    OLECHECK(this->get_Folder_(&ppid));
    return ppid;
  }

  Shdocvw_tlb::FolderItems* __fastcall SelectedItems(void)
  {
    Shdocvw_tlb::FolderItems* ppid= 0;
    OLECHECK(this->SelectedItems(&ppid));
    return ppid;
  }

  Shdocvw_tlb::FolderItem* __fastcall get_FocusedItem(void)
  {
    Shdocvw_tlb::FolderItem* ppid= 0;
    OLECHECK(this->get_FocusedItem(&ppid));
    return ppid;
  }

  BSTR __fastcall PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                TVariant vx/*[in,opt]*/= TNoParam(), 
                                TVariant vy/*[in,opt]*/= TNoParam())
  {
    BSTR pbs= 0;
    OLECHECK(this->PopupItemMenu(pfi, vx, vy, &pbs));
    return pbs;
  }

  LPDISPATCH __fastcall get_Script(void)
  {
    LPDISPATCH ppDisp= 0;
    OLECHECK(this->get_Script(&ppDisp));
    return ppDisp;
  }

  long __fastcall get_ViewOptions(void)
  {
    long plViewOptions;
    OLECHECK(this->get_ViewOptions(&plViewOptions));
    return plViewOptions;
  }


  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   Shdocvw_tlb::Folder* Folder_ = {read = get_Folder_};
  __property   Shdocvw_tlb::FolderItem* FocusedItem = {read = get_FocusedItem};
  __property   LPDISPATCH      Script = {read = get_Script};
  __property   long            ViewOptions = {read = get_ViewOptions};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: IShellDispatch
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D8F015C0-C278-11CE-A49E-444553540000}
// *********************************************************************//
interface IShellDispatch : public IDispatch
{
public:
  // [-1] Get Application object
  virtual HRESULT STDMETHODCALLTYPE get_Application_(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Get Parent object
  virtual HRESULT STDMETHODCALLTYPE get_Parent(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Enum the contents of a folder
  virtual HRESULT STDMETHODCALLTYPE NameSpace(TVariant vDir/*[in]*/, 
                                              Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/) = 0;
  // [-1] Browse the name space for a Folder
  virtual HRESULT STDMETHODCALLTYPE BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                                    long Options/*[in]*/, 
                                                    TVariant RootFolder/*[in,opt]*/, 
                                                    Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/) = 0;
  // [-1] The collection of open folder windows
  virtual HRESULT STDMETHODCALLTYPE Windows(LPDISPATCH* ppid/*[out,retval]*/) = 0;
  // [-1] Open a folder
  virtual HRESULT STDMETHODCALLTYPE Open(TVariant vDir/*[in]*/) = 0;
  // [-1] Explore a folder
  virtual HRESULT STDMETHODCALLTYPE Explore(TVariant vDir/*[in]*/) = 0;
  // [-1] Minimize all windows
  virtual HRESULT STDMETHODCALLTYPE MinimizeAll(void) = 0;
  // [-1] Undo Minimize All
  virtual HRESULT STDMETHODCALLTYPE UndoMinimizeALL(void) = 0;
  // [-1] Bring up the file run
  virtual HRESULT STDMETHODCALLTYPE FileRun(void) = 0;
  // [-1] Cascade Windows
  virtual HRESULT STDMETHODCALLTYPE CascadeWindows(void) = 0;
  // [-1] Tile windows vertically
  virtual HRESULT STDMETHODCALLTYPE TileVertically(void) = 0;
  // [-1] Tile windows horizontally
  virtual HRESULT STDMETHODCALLTYPE TileHorizontally(void) = 0;
  // [-1] Exit Windows
  virtual HRESULT STDMETHODCALLTYPE ShutdownWindows(void) = 0;
  // [-1] Suspend the pc
  virtual HRESULT STDMETHODCALLTYPE Suspend(void) = 0;
  // [-1] Eject the pc
  virtual HRESULT STDMETHODCALLTYPE EjectPC(void) = 0;
  // [-1] Bring up the Set time dialog
  virtual HRESULT STDMETHODCALLTYPE SetTime(void) = 0;
  // [-1] Handle Tray properties
  virtual HRESULT STDMETHODCALLTYPE TrayProperties(void) = 0;
  // [-1] Display shell help
  virtual HRESULT STDMETHODCALLTYPE Help(void) = 0;
  // [-1] Find Files
  virtual HRESULT STDMETHODCALLTYPE FindFiles(void) = 0;
  // [-1] Find a computer
  virtual HRESULT STDMETHODCALLTYPE FindComputer(void) = 0;
  // [-1] Refresh the menu
  virtual HRESULT STDMETHODCALLTYPE RefreshMenu(void) = 0;
  // [-1] Run a controlpanelItem
  virtual HRESULT STDMETHODCALLTYPE ControlPanelItem(BSTR szDir/*[in]*/) = 0;

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  LPDISPATCH __fastcall get_Application_(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Application_(&ppid));
    return ppid;
  }

  LPDISPATCH __fastcall get_Parent(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->get_Parent(&ppid));
    return ppid;
  }

  Shdocvw_tlb::Folder* __fastcall NameSpace(TVariant vDir/*[in]*/)
  {
    Shdocvw_tlb::Folder* ppsdf= 0;
    OLECHECK(this->NameSpace(vDir, &ppsdf));
    return ppsdf;
  }

  Shdocvw_tlb::Folder* __fastcall BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                                  long Options/*[in]*/, 
                                                  TVariant RootFolder/*[in,opt]*/= TNoParam())
  {
    Shdocvw_tlb::Folder* ppsdf= 0;
    OLECHECK(this->BrowseForFolder(HWND, Title, Options, RootFolder, &ppsdf));
    return ppsdf;
  }

  LPDISPATCH __fastcall Windows(void)
  {
    LPDISPATCH ppid= 0;
    OLECHECK(this->Windows(&ppid));
    return ppid;
  }


  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};

#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

// *********************************************************************//
// Interface: IShellUIHelper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}
// *********************************************************************//
interface IShellUIHelper : public IDispatch
{
public:
  virtual HRESULT STDMETHODCALLTYPE ResetFirstBootMode(void) = 0; // [1]
  virtual HRESULT STDMETHODCALLTYPE ResetSafeMode(void) = 0; // [2]
  virtual HRESULT STDMETHODCALLTYPE RefreshOfflineDesktop(void) = 0; // [3]
  virtual HRESULT STDMETHODCALLTYPE AddFavorite(BSTR URL/*[in]*/, 
                                                TVariant* Title/*[in,opt]*/= TNoParam()) = 0; // [4]
  virtual HRESULT STDMETHODCALLTYPE AddChannel(BSTR URL/*[in]*/) = 0; // [5]
  virtual HRESULT STDMETHODCALLTYPE AddDesktopComponent(BSTR URL/*[in]*/, BSTR Type/*[in]*/, 
                                                        TVariant* Left/*[in,opt]*/= TNoParam(), 
                                                        TVariant* Top/*[in,opt]*/= TNoParam(), 
                                                        TVariant* Width/*[in,opt]*/= TNoParam(), 
                                                        TVariant* Height/*[in,opt]*/= TNoParam()) = 0; // [6]
  virtual HRESULT STDMETHODCALLTYPE IsSubscribed(BSTR URL/*[in]*/, TOLEBOOL* pBool/*[out,retval]*/) = 0; // [7]

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)

  TOLEBOOL __fastcall IsSubscribed(BSTR URL/*[in]*/)
  {
    TOLEBOOL pBool;
    OLECHECK(this->IsSubscribed(URL, &pBool));
    return pBool;
  }



#endif //   __TLB_NO_INTERFACE_WRAPPERS

};

#if !defined(__TLB_NO_INTERFACE_WRAPPERS)
// *********************************************************************//
// SmartIntf: TCOMIWebBrowser
// Interface: IWebBrowser
// *********************************************************************//
template <class T /* IWebBrowser */ >
class TCOMIWebBrowserT : public TComInterface<IWebBrowser>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIWebBrowserT() {}
  TCOMIWebBrowserT(IWebBrowser *intf, bool addRef = false) : TComInterface<IWebBrowser>(intf, addRef) {}
  TCOMIWebBrowserT(const TCOMIWebBrowserT& src) : TComInterface<IWebBrowser>(src) {}
  TCOMIWebBrowserT& operator=(const TCOMIWebBrowserT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall GoBack(void);
  HRESULT         __fastcall GoForward(void);
  HRESULT         __fastcall GoHome(void);
  HRESULT         __fastcall GoSearch(void);
  HRESULT         __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Refresh(void);
  HRESULT         __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Stop(void);
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Container(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Container(void);
  HRESULT         __fastcall get_Document(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Document(void);
  HRESULT         __fastcall get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TopLevelContainer(void);
  HRESULT         __fastcall get_Type(BSTR* Type/*[out,retval]*/);
  BSTR            __fastcall get_Type(void);
  HRESULT         __fastcall get_Left(long* pl/*[out,retval]*/);
  long            __fastcall get_Left(void);
  HRESULT         __fastcall set_Left(long pl/*[in]*/);
  HRESULT         __fastcall get_Top(long* pl/*[out,retval]*/);
  long            __fastcall get_Top(void);
  HRESULT         __fastcall set_Top(long pl/*[in]*/);
  HRESULT         __fastcall get_Width(long* pl/*[out,retval]*/);
  long            __fastcall get_Width(void);
  HRESULT         __fastcall set_Width(long pl/*[in]*/);
  HRESULT         __fastcall get_Height(long* pl/*[out,retval]*/);
  long            __fastcall get_Height(void);
  HRESULT         __fastcall set_Height(long pl/*[in]*/);
  HRESULT         __fastcall get_LocationName(BSTR* LocationName/*[out,retval]*/);
  BSTR            __fastcall get_LocationName(void);
  HRESULT         __fastcall get_LocationURL(BSTR* LocationURL/*[out,retval]*/);
  BSTR            __fastcall get_LocationURL(void);
  HRESULT         __fastcall get_Busy(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Busy(void);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   LPDISPATCH      Container = {read = get_Container};
  __property   LPDISPATCH      Document = {read = get_Document};
  __property   TOLEBOOL        TopLevelContainer = {read = get_TopLevelContainer};
  __property   BSTR            Type = {read = get_Type};
  __property   long            Left = {read = get_Left, write = set_Left};
  __property   long            Top = {read = get_Top, write = set_Top};
  __property   long            Width = {read = get_Width, write = set_Width};
  __property   long            Height = {read = get_Height, write = set_Height};
  __property   BSTR            LocationName = {read = get_LocationName};
  __property   BSTR            LocationURL = {read = get_LocationURL};
  __property   TOLEBOOL        Busy = {read = get_Busy};
};
typedef TCOMIWebBrowserT<IWebBrowser> TCOMIWebBrowser;

// *********************************************************************//
// DispIntf:  IWebBrowser
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
template<class T>
class IWebBrowserDispT : public TAutoDriver<IWebBrowser>
{
public:
  IWebBrowserDispT(){}

  IWebBrowserDispT(IWebBrowser *pintf)
  {
    TAutoDriver<IWebBrowser>::Bind(pintf);
  }

  IWebBrowserDispT& operator=(IWebBrowser *pintf)
  {
    TAutoDriver<IWebBrowser>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass WebBrowser_V1*/)
  {
    return OLECHECK(Bind(CLSID_WebBrowser_V1));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass WebBrowser_V1*/)
  {
    return BindToActive(CLSID_WebBrowser_V1);
  }

  HRESULT         __fastcall GoBack();
  HRESULT         __fastcall GoForward();
  HRESULT         __fastcall GoHome();
  HRESULT         __fastcall GoSearch();
  HRESULT         __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Refresh();
  HRESULT         __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Stop();
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Container(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Container(void);
  HRESULT         __fastcall get_Document(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Document(void);
  HRESULT         __fastcall get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TopLevelContainer(void);
  HRESULT         __fastcall get_Type(BSTR* Type/*[out,retval]*/);
  BSTR            __fastcall get_Type(void);
  HRESULT         __fastcall get_Left(long* pl/*[out,retval]*/);
  long            __fastcall get_Left(void);
  HRESULT         __fastcall set_Left(long pl/*[in]*/);
  HRESULT         __fastcall get_Top(long* pl/*[out,retval]*/);
  long            __fastcall get_Top(void);
  HRESULT         __fastcall set_Top(long pl/*[in]*/);
  HRESULT         __fastcall get_Width(long* pl/*[out,retval]*/);
  long            __fastcall get_Width(void);
  HRESULT         __fastcall set_Width(long pl/*[in]*/);
  HRESULT         __fastcall get_Height(long* pl/*[out,retval]*/);
  long            __fastcall get_Height(void);
  HRESULT         __fastcall set_Height(long pl/*[in]*/);
  HRESULT         __fastcall get_LocationName(BSTR* LocationName/*[out,retval]*/);
  BSTR            __fastcall get_LocationName(void);
  HRESULT         __fastcall get_LocationURL(BSTR* LocationURL/*[out,retval]*/);
  BSTR            __fastcall get_LocationURL(void);
  HRESULT         __fastcall get_Busy(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Busy(void);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   LPDISPATCH      Container = {read = get_Container};
  __property   LPDISPATCH      Document = {read = get_Document};
  __property   TOLEBOOL        TopLevelContainer = {read = get_TopLevelContainer};
  __property   BSTR            Type = {read = get_Type};
  __property   long            Left = {read = get_Left, write = set_Left};
  __property   long            Top = {read = get_Top, write = set_Top};
  __property   long            Width = {read = get_Width, write = set_Width};
  __property   long            Height = {read = get_Height, write = set_Height};
  __property   BSTR            LocationName = {read = get_LocationName};
  __property   BSTR            LocationURL = {read = get_LocationURL};
  __property   TOLEBOOL        Busy = {read = get_Busy};
};
typedef IWebBrowserDispT<IWebBrowser> IWebBrowserDisp;

// *********************************************************************//
// DispIntf:  DWebBrowserEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
template <class T>
class DWebBrowserEventsDispT : public TAutoDriver<DWebBrowserEvents>
{
public:
  DWebBrowserEventsDispT(){}

  void Attach(LPUNKNOWN punk)
  { m_Dispatch = static_cast<T*>(punk); }

  void            __fastcall BeforeNavigate(BSTR URL/*[in]*/, long Flags, BSTR TargetFrameName, 
                                            TVariant* PostData, BSTR Headers, 
                                            TOLEBOOL* Cancel/*[in,out]*/);
  void            __fastcall NavigateComplete(BSTR URL/*[in]*/);
  void            __fastcall StatusTextChange(BSTR Text/*[in]*/);
  void            __fastcall ProgressChange(long Progress/*[in]*/, long ProgressMax/*[in]*/);
  void            __fastcall DownloadComplete();
  void            __fastcall CommandStateChange(long Command/*[in]*/, TOLEBOOL Enable/*[in]*/);
  void            __fastcall DownloadBegin();
  void            __fastcall NewWindow(BSTR URL/*[in]*/, long Flags/*[in]*/, 
                                       BSTR TargetFrameName/*[in]*/, TVariant* PostData/*[in]*/, 
                                       BSTR Headers/*[in]*/, TOLEBOOL* Processed/*[in,out]*/);
  void            __fastcall TitleChange(BSTR Text/*[in]*/);
  void            __fastcall FrameBeforeNavigate(BSTR URL/*[in]*/, long Flags, BSTR TargetFrameName
                                                 , TVariant* PostData, BSTR Headers, 
                                                 TOLEBOOL* Cancel/*[in,out]*/);
  void            __fastcall FrameNavigateComplete(BSTR URL/*[in]*/);
  void            __fastcall FrameNewWindow(BSTR URL/*[in]*/, long Flags/*[in]*/, 
                                            BSTR TargetFrameName/*[in]*/, TVariant* PostData/*[in]*/
                                            , BSTR Headers/*[in]*/, TOLEBOOL* Processed/*[in,out]*/);
  void            __fastcall Quit(TOLEBOOL* Cancel/*[in,out]*/);
  void            __fastcall WindowMove();
  void            __fastcall WindowResize();
  void            __fastcall WindowActivate();
  void            __fastcall PropertyChange(BSTR Property/*[in]*/);

};
typedef DWebBrowserEventsDispT<DWebBrowserEvents> DWebBrowserEventsDisp;

typedef TComInterface<IWebBrowserApp>  TCOMIWebBrowserApp;

// *********************************************************************//
// DispIntf:  IWebBrowserApp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0002DF05-0000-0000-C000-000000000046}
// *********************************************************************//
template<class T>
class IWebBrowserAppDispT : public TAutoDriver<IWebBrowserApp>
{
public:
  IWebBrowserAppDispT(){}

  IWebBrowserAppDispT(IWebBrowserApp *pintf)
  {
    TAutoDriver<IWebBrowserApp>::Bind(pintf);
  }

  IWebBrowserAppDispT& operator=(IWebBrowserApp *pintf)
  {
    TAutoDriver<IWebBrowserApp>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall Quit();
  HRESULT         __fastcall ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/);
  HRESULT         __fastcall PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/);
  HRESULT         __fastcall GetProperty(BSTR Property/*[in]*/, TVariant* pvtValue/*[out,retval]*/);
  TVariant        __fastcall GetProperty(BSTR Property/*[in]*/);
  HRESULT         __fastcall get_Name(BSTR* Name/*[out,retval]*/);
  BSTR            __fastcall get_Name(void);
  HRESULT         __fastcall get_HWND(long* pHWND/*[out,retval]*/);
  long            __fastcall get_HWND(void);
  HRESULT         __fastcall get_FullName(BSTR* FullName/*[out,retval]*/);
  BSTR            __fastcall get_FullName(void);
  HRESULT         __fastcall get_Path(BSTR* Path/*[out,retval]*/);
  BSTR            __fastcall get_Path(void);
  HRESULT         __fastcall get_Visible(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Visible(void);
  HRESULT         __fastcall set_Visible(TOLEBOOL pBool/*[in]*/);
  HRESULT         __fastcall get_StatusBar(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_StatusBar(void);
  HRESULT         __fastcall set_StatusBar(TOLEBOOL pBool/*[in]*/);
  HRESULT         __fastcall get_StatusText(BSTR* StatusText/*[out,retval]*/);
  BSTR            __fastcall get_StatusText(void);
  HRESULT         __fastcall set_StatusText(BSTR StatusText/*[in]*/);
  HRESULT         __fastcall get_ToolBar(int* Value/*[out,retval]*/);
  int             __fastcall get_ToolBar(void);
  HRESULT         __fastcall set_ToolBar(int Value/*[in]*/);
  HRESULT         __fastcall get_MenuBar(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_MenuBar(void);
  HRESULT         __fastcall set_MenuBar(TOLEBOOL Value/*[in]*/);
  HRESULT         __fastcall get_FullScreen(TOLEBOOL* pbFullScreen/*[out,retval]*/);
  TOLEBOOL        __fastcall get_FullScreen(void);
  HRESULT         __fastcall set_FullScreen(TOLEBOOL pbFullScreen/*[in]*/);
  HRESULT         __fastcall GoBack();
  HRESULT         __fastcall GoForward();
  HRESULT         __fastcall GoHome();
  HRESULT         __fastcall GoSearch();
  HRESULT         __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Refresh();
  HRESULT         __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Stop();
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Container(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Container(void);
  HRESULT         __fastcall get_Document(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Document(void);
  HRESULT         __fastcall get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TopLevelContainer(void);
  HRESULT         __fastcall get_Type(BSTR* Type/*[out,retval]*/);
  BSTR            __fastcall get_Type(void);
  HRESULT         __fastcall get_Left(long* pl/*[out,retval]*/);
  long            __fastcall get_Left(void);
  HRESULT         __fastcall set_Left(long pl/*[in]*/);
  HRESULT         __fastcall get_Top(long* pl/*[out,retval]*/);
  long            __fastcall get_Top(void);
  HRESULT         __fastcall set_Top(long pl/*[in]*/);
  HRESULT         __fastcall get_Width(long* pl/*[out,retval]*/);
  long            __fastcall get_Width(void);
  HRESULT         __fastcall set_Width(long pl/*[in]*/);
  HRESULT         __fastcall get_Height(long* pl/*[out,retval]*/);
  long            __fastcall get_Height(void);
  HRESULT         __fastcall set_Height(long pl/*[in]*/);
  HRESULT         __fastcall get_LocationName(BSTR* LocationName/*[out,retval]*/);
  BSTR            __fastcall get_LocationName(void);
  HRESULT         __fastcall get_LocationURL(BSTR* LocationURL/*[out,retval]*/);
  BSTR            __fastcall get_LocationURL(void);
  HRESULT         __fastcall get_Busy(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Busy(void);

  __property   BSTR            Name = {read = get_Name};
  __property   long            HWND = {read = get_HWND};
  __property   BSTR            FullName = {read = get_FullName};
  __property   BSTR            Path = {read = get_Path};
  __property   TOLEBOOL        Visible = {read = get_Visible, write = set_Visible};
  __property   TOLEBOOL        StatusBar = {read = get_StatusBar, write = set_StatusBar};
  __property   BSTR            StatusText = {read = get_StatusText, write = set_StatusText};
  __property   int             ToolBar = {read = get_ToolBar, write = set_ToolBar};
  __property   TOLEBOOL        MenuBar = {read = get_MenuBar, write = set_MenuBar};
  __property   TOLEBOOL        FullScreen = {read = get_FullScreen, write = set_FullScreen};

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   LPDISPATCH      Container = {read = get_Container};
  __property   LPDISPATCH      Document = {read = get_Document};
  __property   TOLEBOOL        TopLevelContainer = {read = get_TopLevelContainer};
  __property   BSTR            Type = {read = get_Type};
  __property   long            Left = {read = get_Left, write = set_Left};
  __property   long            Top = {read = get_Top, write = set_Top};
  __property   long            Width = {read = get_Width, write = set_Width};
  __property   long            Height = {read = get_Height, write = set_Height};
  __property   BSTR            LocationName = {read = get_LocationName};
  __property   BSTR            LocationURL = {read = get_LocationURL};
  __property   TOLEBOOL        Busy = {read = get_Busy};
};
typedef IWebBrowserAppDispT<IWebBrowserApp> IWebBrowserAppDisp;

// *********************************************************************//
// SmartIntf: TCOMIWebBrowser2
// Interface: IWebBrowser2
// *********************************************************************//
template <class T /* IWebBrowser2 */ >
class TCOMIWebBrowser2T : public TComInterface<IWebBrowser2>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIWebBrowser2T() {}
  TCOMIWebBrowser2T(IWebBrowser2 *intf, bool addRef = false) : TComInterface<IWebBrowser2>(intf, addRef) {}
  TCOMIWebBrowser2T(const TCOMIWebBrowser2T& src) : TComInterface<IWebBrowser2>(src) {}
  TCOMIWebBrowser2T& operator=(const TCOMIWebBrowser2T& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall Navigate2(TVariant* URL/*[in]*/, 
                                       TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                       TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                       TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                       TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                           Shdocvw_tlb::OLECMDF* pcmdf/*[out,retval]*/);
  Shdocvw_tlb::OLECMDF __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/);
  HRESULT         __fastcall ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                    Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                                    TVariant* pvaIn/*[in,opt]*/= TNoParam(), 
                                    TVariant* pvaOut/*[in,out,opt]*/= TNoParam());
  HRESULT         __fastcall ShowBrowserBar(TVariant* pvaClsid/*[in]*/, 
                                            TVariant* pvarShow/*[in,opt]*/= TNoParam(), 
                                            TVariant* pvarSize/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall get_ReadyState(Shdocvw_tlb::tagREADYSTATE* plReadyState/*[out,retval]*/);
  Shdocvw_tlb::tagREADYSTATE __fastcall get_ReadyState(void);
  HRESULT         __fastcall get_Offline(TOLEBOOL* pbOffline/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Offline(void);
  HRESULT         __fastcall set_Offline(TOLEBOOL pbOffline/*[in]*/);
  HRESULT         __fastcall get_Silent(TOLEBOOL* pbSilent/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Silent(void);
  HRESULT         __fastcall set_Silent(TOLEBOOL pbSilent/*[in]*/);
  HRESULT         __fastcall get_RegisterAsBrowser(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_RegisterAsBrowser(void);
  HRESULT         __fastcall set_RegisterAsBrowser(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_RegisterAsDropTarget(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_RegisterAsDropTarget(void);
  HRESULT         __fastcall set_RegisterAsDropTarget(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_TheaterMode(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TheaterMode(void);
  HRESULT         __fastcall set_TheaterMode(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_AddressBar(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_AddressBar(void);
  HRESULT         __fastcall set_AddressBar(TOLEBOOL Value/*[in]*/);
  HRESULT         __fastcall get_Resizable(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Resizable(void);
  HRESULT         __fastcall set_Resizable(TOLEBOOL Value/*[in]*/);

  __property   Shdocvw_tlb::tagREADYSTATE ReadyState = {read = get_ReadyState};
  __property   TOLEBOOL        Offline = {read = get_Offline, write = set_Offline};
  __property   TOLEBOOL        Silent = {read = get_Silent, write = set_Silent};
  __property   TOLEBOOL        RegisterAsBrowser = {read = get_RegisterAsBrowser, write = set_RegisterAsBrowser};
  __property   TOLEBOOL        RegisterAsDropTarget = {read = get_RegisterAsDropTarget, write = set_RegisterAsDropTarget};
  __property   TOLEBOOL        TheaterMode = {read = get_TheaterMode, write = set_TheaterMode};
  __property   TOLEBOOL        AddressBar = {read = get_AddressBar, write = set_AddressBar};
  __property   TOLEBOOL        Resizable = {read = get_Resizable, write = set_Resizable};
};
typedef TCOMIWebBrowser2T<IWebBrowser2> TCOMIWebBrowser2;

// *********************************************************************//
// DispIntf:  IWebBrowser2
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}
// *********************************************************************//
template<class T>
class IWebBrowser2DispT : public TAutoDriver<IWebBrowser2>
{
public:
  IWebBrowser2DispT(){}

  IWebBrowser2DispT(IWebBrowser2 *pintf)
  {
    TAutoDriver<IWebBrowser2>::Bind(pintf);
  }

  IWebBrowser2DispT& operator=(IWebBrowser2 *pintf)
  {
    TAutoDriver<IWebBrowser2>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass WebBrowser*/)
  {
    return OLECHECK(Bind(CLSID_WebBrowser));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass WebBrowser*/)
  {
    return BindToActive(CLSID_WebBrowser);
  }

  HRESULT         __fastcall Navigate2(TVariant* URL/*[in]*/, 
                                       TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                       TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                       TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                       TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                           Shdocvw_tlb::OLECMDF* pcmdf/*[out,retval]*/);
  Shdocvw_tlb::OLECMDF __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/);
  HRESULT         __fastcall ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                    Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                                    TVariant* pvaIn/*[in,opt]*/= TNoParam(), 
                                    TVariant* pvaOut/*[in,out,opt]*/= TNoParam());
  HRESULT         __fastcall ShowBrowserBar(TVariant* pvaClsid/*[in]*/, 
                                            TVariant* pvarShow/*[in,opt]*/= TNoParam(), 
                                            TVariant* pvarSize/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall get_ReadyState(Shdocvw_tlb::tagREADYSTATE* plReadyState/*[out,retval]*/);
  Shdocvw_tlb::tagREADYSTATE __fastcall get_ReadyState(void);
  HRESULT         __fastcall get_Offline(TOLEBOOL* pbOffline/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Offline(void);
  HRESULT         __fastcall set_Offline(TOLEBOOL pbOffline/*[in]*/);
  HRESULT         __fastcall get_Silent(TOLEBOOL* pbSilent/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Silent(void);
  HRESULT         __fastcall set_Silent(TOLEBOOL pbSilent/*[in]*/);
  HRESULT         __fastcall get_RegisterAsBrowser(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_RegisterAsBrowser(void);
  HRESULT         __fastcall set_RegisterAsBrowser(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_RegisterAsDropTarget(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_RegisterAsDropTarget(void);
  HRESULT         __fastcall set_RegisterAsDropTarget(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_TheaterMode(TOLEBOOL* pbRegister/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TheaterMode(void);
  HRESULT         __fastcall set_TheaterMode(TOLEBOOL pbRegister/*[in]*/);
  HRESULT         __fastcall get_AddressBar(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_AddressBar(void);
  HRESULT         __fastcall set_AddressBar(TOLEBOOL Value/*[in]*/);
  HRESULT         __fastcall get_Resizable(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Resizable(void);
  HRESULT         __fastcall set_Resizable(TOLEBOOL Value/*[in]*/);
  HRESULT         __fastcall Quit();
  HRESULT         __fastcall ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/);
  HRESULT         __fastcall PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/);
  HRESULT         __fastcall GetProperty(BSTR Property/*[in]*/, TVariant* pvtValue/*[out,retval]*/);
  TVariant        __fastcall GetProperty(BSTR Property/*[in]*/);
  HRESULT         __fastcall get_Name(BSTR* Name/*[out,retval]*/);
  BSTR            __fastcall get_Name(void);
  HRESULT         __fastcall get_HWND(long* pHWND/*[out,retval]*/);
  long            __fastcall get_HWND(void);
  HRESULT         __fastcall get_FullName(BSTR* FullName/*[out,retval]*/);
  BSTR            __fastcall get_FullName(void);
  HRESULT         __fastcall get_Path(BSTR* Path/*[out,retval]*/);
  BSTR            __fastcall get_Path(void);
  HRESULT         __fastcall get_Visible(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Visible(void);
  HRESULT         __fastcall set_Visible(TOLEBOOL pBool/*[in]*/);
  HRESULT         __fastcall get_StatusBar(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_StatusBar(void);
  HRESULT         __fastcall set_StatusBar(TOLEBOOL pBool/*[in]*/);
  HRESULT         __fastcall get_StatusText(BSTR* StatusText/*[out,retval]*/);
  BSTR            __fastcall get_StatusText(void);
  HRESULT         __fastcall set_StatusText(BSTR StatusText/*[in]*/);
  HRESULT         __fastcall get_ToolBar(int* Value/*[out,retval]*/);
  int             __fastcall get_ToolBar(void);
  HRESULT         __fastcall set_ToolBar(int Value/*[in]*/);
  HRESULT         __fastcall get_MenuBar(TOLEBOOL* Value/*[out,retval]*/);
  TOLEBOOL        __fastcall get_MenuBar(void);
  HRESULT         __fastcall set_MenuBar(TOLEBOOL Value/*[in]*/);
  HRESULT         __fastcall get_FullScreen(TOLEBOOL* pbFullScreen/*[out,retval]*/);
  TOLEBOOL        __fastcall get_FullScreen(void);
  HRESULT         __fastcall set_FullScreen(TOLEBOOL pbFullScreen/*[in]*/);
  HRESULT         __fastcall GoBack();
  HRESULT         __fastcall GoForward();
  HRESULT         __fastcall GoHome();
  HRESULT         __fastcall GoSearch();
  HRESULT         __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Refresh();
  HRESULT         __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Stop();
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Container(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Container(void);
  HRESULT         __fastcall get_Document(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Document(void);
  HRESULT         __fastcall get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_TopLevelContainer(void);
  HRESULT         __fastcall get_Type(BSTR* Type/*[out,retval]*/);
  BSTR            __fastcall get_Type(void);
  HRESULT         __fastcall get_Left(long* pl/*[out,retval]*/);
  long            __fastcall get_Left(void);
  HRESULT         __fastcall set_Left(long pl/*[in]*/);
  HRESULT         __fastcall get_Top(long* pl/*[out,retval]*/);
  long            __fastcall get_Top(void);
  HRESULT         __fastcall set_Top(long pl/*[in]*/);
  HRESULT         __fastcall get_Width(long* pl/*[out,retval]*/);
  long            __fastcall get_Width(void);
  HRESULT         __fastcall set_Width(long pl/*[in]*/);
  HRESULT         __fastcall get_Height(long* pl/*[out,retval]*/);
  long            __fastcall get_Height(void);
  HRESULT         __fastcall set_Height(long pl/*[in]*/);
  HRESULT         __fastcall get_LocationName(BSTR* LocationName/*[out,retval]*/);
  BSTR            __fastcall get_LocationName(void);
  HRESULT         __fastcall get_LocationURL(BSTR* LocationURL/*[out,retval]*/);
  BSTR            __fastcall get_LocationURL(void);
  HRESULT         __fastcall get_Busy(TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall get_Busy(void);

  __property   Shdocvw_tlb::tagREADYSTATE ReadyState = {read = get_ReadyState};
  __property   TOLEBOOL        Offline = {read = get_Offline, write = set_Offline};
  __property   TOLEBOOL        Silent = {read = get_Silent, write = set_Silent};
  __property   TOLEBOOL        RegisterAsBrowser = {read = get_RegisterAsBrowser, write = set_RegisterAsBrowser};
  __property   TOLEBOOL        RegisterAsDropTarget = {read = get_RegisterAsDropTarget, write = set_RegisterAsDropTarget};
  __property   TOLEBOOL        TheaterMode = {read = get_TheaterMode, write = set_TheaterMode};
  __property   TOLEBOOL        AddressBar = {read = get_AddressBar, write = set_AddressBar};
  __property   TOLEBOOL        Resizable = {read = get_Resizable, write = set_Resizable};

  __property   BSTR            Name = {read = get_Name};
  __property   long            HWND = {read = get_HWND};
  __property   BSTR            FullName = {read = get_FullName};
  __property   BSTR            Path = {read = get_Path};
  __property   TOLEBOOL        Visible = {read = get_Visible, write = set_Visible};
  __property   TOLEBOOL        StatusBar = {read = get_StatusBar, write = set_StatusBar};
  __property   BSTR            StatusText = {read = get_StatusText, write = set_StatusText};
  __property   int             ToolBar = {read = get_ToolBar, write = set_ToolBar};
  __property   TOLEBOOL        MenuBar = {read = get_MenuBar, write = set_MenuBar};
  __property   TOLEBOOL        FullScreen = {read = get_FullScreen, write = set_FullScreen};

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   LPDISPATCH      Container = {read = get_Container};
  __property   LPDISPATCH      Document = {read = get_Document};
  __property   TOLEBOOL        TopLevelContainer = {read = get_TopLevelContainer};
  __property   BSTR            Type = {read = get_Type};
  __property   long            Left = {read = get_Left, write = set_Left};
  __property   long            Top = {read = get_Top, write = set_Top};
  __property   long            Width = {read = get_Width, write = set_Width};
  __property   long            Height = {read = get_Height, write = set_Height};
  __property   BSTR            LocationName = {read = get_LocationName};
  __property   BSTR            LocationURL = {read = get_LocationURL};
  __property   TOLEBOOL        Busy = {read = get_Busy};
};
typedef IWebBrowser2DispT<IWebBrowser2> IWebBrowser2Disp;

// *********************************************************************//
// DispIntf:  DWebBrowserEvents2
// Flags:     (4112) Hidden Dispatchable
// GUID:      {34A715A0-6587-11D0-924A-0020AFC7AC4D}
// *********************************************************************//
template <class T>
class DWebBrowserEvents2DispT : public TAutoDriver<DWebBrowserEvents2>
{
public:
  DWebBrowserEvents2DispT(){}

  void Attach(LPUNKNOWN punk)
  { m_Dispatch = static_cast<T*>(punk); }

  void            __fastcall StatusTextChange(BSTR Text/*[in]*/);
  void            __fastcall ProgressChange(long Progress/*[in]*/, long ProgressMax/*[in]*/);
  void            __fastcall CommandStateChange(long Command/*[in]*/, TOLEBOOL Enable/*[in]*/);
  void            __fastcall DownloadBegin();
  void            __fastcall DownloadComplete();
  void            __fastcall TitleChange(BSTR Text/*[in]*/);
  void            __fastcall PropertyChange(BSTR szProperty/*[in]*/);
  void            __fastcall BeforeNavigate2(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/, 
                                             TVariant* Flags/*[in]*/, 
                                             TVariant* TargetFrameName/*[in]*/, 
                                             TVariant* PostData/*[in]*/, TVariant* Headers/*[in]*/, 
                                             TOLEBOOL* Cancel/*[in,out]*/);
  void            __fastcall NewWindow2(LPDISPATCH* ppDisp/*[in,out]*/, TOLEBOOL* Cancel/*[in,out]*/);
  void            __fastcall NavigateComplete2(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/);
  void            __fastcall DocumentComplete(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/);
  void            __fastcall OnQuit();
  void            __fastcall OnVisible(TOLEBOOL Visible/*[in]*/);
  void            __fastcall OnToolBar(TOLEBOOL ToolBar/*[in]*/);
  void            __fastcall OnMenuBar(TOLEBOOL MenuBar/*[in]*/);
  void            __fastcall OnStatusBar(TOLEBOOL StatusBar/*[in]*/);
  void            __fastcall OnFullScreen(TOLEBOOL FullScreen/*[in]*/);
  void            __fastcall OnTheaterMode(TOLEBOOL TheaterMode/*[in]*/);

};
typedef DWebBrowserEvents2DispT<DWebBrowserEvents2> DWebBrowserEvents2Disp;

// *********************************************************************//
// SmartIntf: TCOMIFolderViewOC
// Interface: IFolderViewOC
// *********************************************************************//
template <class T /* IFolderViewOC */ >
class TCOMIFolderViewOCT : public TComInterface<IFolderViewOC>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIFolderViewOCT() {}
  TCOMIFolderViewOCT(IFolderViewOC *intf, bool addRef = false) : TComInterface<IFolderViewOC>(intf, addRef) {}
  TCOMIFolderViewOCT(const TCOMIFolderViewOCT& src) : TComInterface<IFolderViewOC>(src) {}
  TCOMIFolderViewOCT& operator=(const TCOMIFolderViewOCT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall SetFolderView(LPDISPATCH pDisp/*[in]*/);

};
typedef TCOMIFolderViewOCT<IFolderViewOC> TCOMIFolderViewOC;

// *********************************************************************//
// DispIntf:  IFolderViewOC
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9BA05970-F6A8-11CF-A442-00A0C90A8F39}
// *********************************************************************//
template<class T>
class IFolderViewOCDispT : public TAutoDriver<IFolderViewOC>
{
public:
  IFolderViewOCDispT(){}

  IFolderViewOCDispT(IFolderViewOC *pintf)
  {
    TAutoDriver<IFolderViewOC>::Bind(pintf);
  }

  IFolderViewOCDispT& operator=(IFolderViewOC *pintf)
  {
    TAutoDriver<IFolderViewOC>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass ShellFolderViewOC*/)
  {
    return OLECHECK(Bind(CLSID_ShellFolderViewOC));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass ShellFolderViewOC*/)
  {
    return BindToActive(CLSID_ShellFolderViewOC);
  }

  HRESULT         __fastcall SetFolderView(LPDISPATCH pDisp/*[in]*/);

};
typedef IFolderViewOCDispT<IFolderViewOC> IFolderViewOCDisp;

// *********************************************************************//
// DispIntf:  DShellFolderViewEvents
// Flags:     (4096) Dispatchable
// GUID:      {62112AA2-EBE4-11CF-A5FB-0020AFE7292D}
// *********************************************************************//
template <class T>
class DShellFolderViewEventsDispT : public TAutoDriver<DShellFolderViewEvents>
{
public:
  DShellFolderViewEventsDispT(){}

  void Attach(LPUNKNOWN punk)
  { m_Dispatch = static_cast<T*>(punk); }

  void            __fastcall SelectionChanged();

};
typedef DShellFolderViewEventsDispT<DShellFolderViewEvents> DShellFolderViewEventsDisp;

// *********************************************************************//
// DispIntf:  DShellWindowsEvents
// Flags:     (4096) Dispatchable
// GUID:      {FE4106E0-399A-11D0-A48C-00A0C90A8F39}
// *********************************************************************//
template <class T>
class DShellWindowsEventsDispT : public TAutoDriver<DShellWindowsEvents>
{
public:
  DShellWindowsEventsDispT(){}

  void Attach(LPUNKNOWN punk)
  { m_Dispatch = static_cast<T*>(punk); }

  void            __fastcall WindowRegistered(long lCookie/*[in]*/);
  void            __fastcall WindowRevoked(long lCookie/*[in]*/);

};
typedef DShellWindowsEventsDispT<DShellWindowsEvents> DShellWindowsEventsDisp;

// *********************************************************************//
// SmartIntf: TCOMIShellWindows
// Interface: IShellWindows
// *********************************************************************//
template <class T /* IShellWindows */ >
class TCOMIShellWindowsT : public TComInterface<IShellWindows>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIShellWindowsT() {}
  TCOMIShellWindowsT(IShellWindows *intf, bool addRef = false) : TComInterface<IShellWindows>(intf, addRef) {}
  TCOMIShellWindowsT(const TCOMIShellWindowsT& src) : TComInterface<IShellWindows>(src) {}
  TCOMIShellWindowsT& operator=(const TCOMIShellWindowsT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall get_Count(long* Count/*[out,retval]*/);
  long            __fastcall get_Count(void);
  HRESULT         __fastcall Item(TVariant index/*[in,opt]*/, LPDISPATCH* Folder/*[out,retval]*/);
  LPDISPATCH      __fastcall Item(TVariant index/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/);
  LPUNKNOWN       __fastcall _NewEnum(void);
  HRESULT         __fastcall Register(LPDISPATCH pid/*[in]*/, long HWND/*[in]*/, int swClass/*[in]*/, 
                                      long* plCookie/*[out]*/);
  HRESULT         __fastcall RegisterPending(long lThreadId/*[in]*/, TVariant* pvarloc/*[in]*/, 
                                             TVariant* pvarlocRoot/*[in]*/, int swClass/*[in]*/, 
                                             long* plCookie/*[out]*/);
  HRESULT         __fastcall Revoke(long lCookie/*[in]*/);
  HRESULT         __fastcall OnNavigate(long lCookie/*[in]*/, TVariant* pvarloc/*[in]*/);
  HRESULT         __fastcall OnActivated(long lCookie/*[in]*/, TOLEBOOL fActive/*[in]*/);
  HRESULT         __fastcall FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                        int swClass/*[in]*/, long* pHWND/*[out]*/, 
                                        int swfwOptions/*[in]*/, 
                                        LPDISPATCH* ppdispOut/*[out,retval]*/);
  LPDISPATCH      __fastcall FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                        int swClass/*[in]*/, long* pHWND/*[out]*/, 
                                        int swfwOptions/*[in]*/);
  HRESULT         __fastcall OnCreated(long lCookie/*[in]*/, LPUNKNOWN punk/*[in]*/);
  HRESULT         __fastcall ProcessAttachDetach(TOLEBOOL fAttach/*[in]*/);

  __property   long            Count = {read = get_Count};
};
typedef TCOMIShellWindowsT<IShellWindows> TCOMIShellWindows;

// *********************************************************************//
// DispIntf:  IShellWindows
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85CB6900-4D95-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template<class T>
class IShellWindowsDispT : public TAutoDriver<IShellWindows>
{
public:
  IShellWindowsDispT(){}

  IShellWindowsDispT(IShellWindows *pintf)
  {
    TAutoDriver<IShellWindows>::Bind(pintf);
  }

  IShellWindowsDispT& operator=(IShellWindows *pintf)
  {
    TAutoDriver<IShellWindows>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass ShellWindows*/)
  {
    return OLECHECK(Bind(CLSID_ShellWindows));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass ShellWindows*/)
  {
    return BindToActive(CLSID_ShellWindows);
  }

  HRESULT         __fastcall get_Count(long* Count/*[out,retval]*/);
  long            __fastcall get_Count(void);
  HRESULT         __fastcall Item(TVariant index/*[in,opt]*/, LPDISPATCH* Folder/*[out,retval]*/);
  LPDISPATCH      __fastcall Item(TVariant index/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/);
  LPUNKNOWN       __fastcall _NewEnum(void);
  HRESULT         __fastcall Register(LPDISPATCH pid/*[in]*/, long HWND/*[in]*/, int swClass/*[in]*/
                                      , long* plCookie/*[out]*/);
  HRESULT         __fastcall RegisterPending(long lThreadId/*[in]*/, TVariant* pvarloc/*[in]*/, 
                                             TVariant* pvarlocRoot/*[in]*/, int swClass/*[in]*/, 
                                             long* plCookie/*[out]*/);
  HRESULT         __fastcall Revoke(long lCookie/*[in]*/);
  HRESULT         __fastcall OnNavigate(long lCookie/*[in]*/, TVariant* pvarloc/*[in]*/);
  HRESULT         __fastcall OnActivated(long lCookie/*[in]*/, TOLEBOOL fActive/*[in]*/);
  HRESULT         __fastcall FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                        int swClass/*[in]*/, long* pHWND/*[out]*/, 
                                        int swfwOptions/*[in]*/, 
                                        LPDISPATCH* ppdispOut/*[out,retval]*/);
  LPDISPATCH      __fastcall FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                        int swClass/*[in]*/, long* pHWND/*[out]*/, 
                                        int swfwOptions/*[in]*/);
  HRESULT         __fastcall OnCreated(long lCookie/*[in]*/, LPUNKNOWN punk/*[in]*/);
  HRESULT         __fastcall ProcessAttachDetach(TOLEBOOL fAttach/*[in]*/);

  __property   long            Count = {read = get_Count};
};
typedef IShellWindowsDispT<IShellWindows> IShellWindowsDisp;

// *********************************************************************//
// SmartIntf: TCOMIShellLinkDual
// Interface: IShellLinkDual
// *********************************************************************//
template <class T /* IShellLinkDual */ >
class TCOMIShellLinkDualT : public TComInterface<IShellLinkDual>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIShellLinkDualT() {}
  TCOMIShellLinkDualT(IShellLinkDual *intf, bool addRef = false) : TComInterface<IShellLinkDual>(intf, addRef) {}
  TCOMIShellLinkDualT(const TCOMIShellLinkDualT& src) : TComInterface<IShellLinkDual>(src) {}
  TCOMIShellLinkDualT& operator=(const TCOMIShellLinkDualT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall get_Path(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Path(void);
  HRESULT         __fastcall set_Path(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Description(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Description(void);
  HRESULT         __fastcall set_Description(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_WorkingDirectory(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_WorkingDirectory(void);
  HRESULT         __fastcall set_WorkingDirectory(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Arguments(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Arguments(void);
  HRESULT         __fastcall set_Arguments(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Hotkey(int* piHK/*[out,retval]*/);
  int             __fastcall get_Hotkey(void);
  HRESULT         __fastcall set_Hotkey(int piHK/*[in]*/);
  HRESULT         __fastcall get_ShowCommand(int* piShowCommand/*[out,retval]*/);
  int             __fastcall get_ShowCommand(void);
  HRESULT         __fastcall set_ShowCommand(int piShowCommand/*[in]*/);
  HRESULT         __fastcall Resolve(int fFlags/*[in]*/);
  HRESULT         __fastcall GetIconLocation(BSTR* pbs/*[out]*/, int* piIcon/*[out,retval]*/);
  int             __fastcall GetIconLocation(BSTR* pbs/*[out]*/);
  HRESULT         __fastcall SetIconLocation(BSTR bs/*[in]*/, int iIcon/*[in]*/);
  HRESULT         __fastcall Save(TVariant vWhere/*[in,opt]*/= TNoParam());

  __property   BSTR            Path = {read = get_Path, write = set_Path};
  __property   BSTR            Description = {read = get_Description, write = set_Description};
  __property   BSTR            WorkingDirectory = {read = get_WorkingDirectory, write = set_WorkingDirectory};
  __property   BSTR            Arguments = {read = get_Arguments, write = set_Arguments};
  __property   int             Hotkey = {read = get_Hotkey, write = set_Hotkey};
  __property   int             ShowCommand = {read = get_ShowCommand, write = set_ShowCommand};
};
typedef TCOMIShellLinkDualT<IShellLinkDual> TCOMIShellLinkDual;

// *********************************************************************//
// DispIntf:  IShellLinkDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {88A05C00-F000-11CE-8350-444553540000}
// *********************************************************************//
template<class T>
class IShellLinkDualDispT : public TAutoDriver<IShellLinkDual>
{
public:
  IShellLinkDualDispT(){}

  IShellLinkDualDispT(IShellLinkDual *pintf)
  {
    TAutoDriver<IShellLinkDual>::Bind(pintf);
  }

  IShellLinkDualDispT& operator=(IShellLinkDual *pintf)
  {
    TAutoDriver<IShellLinkDual>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass ShellLinkObject*/)
  {
    return OLECHECK(Bind(CLSID_ShellLinkObject));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass ShellLinkObject*/)
  {
    return BindToActive(CLSID_ShellLinkObject);
  }

  HRESULT         __fastcall get_Path(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Path(void);
  HRESULT         __fastcall set_Path(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Description(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Description(void);
  HRESULT         __fastcall set_Description(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_WorkingDirectory(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_WorkingDirectory(void);
  HRESULT         __fastcall set_WorkingDirectory(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Arguments(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Arguments(void);
  HRESULT         __fastcall set_Arguments(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Hotkey(int* piHK/*[out,retval]*/);
  int             __fastcall get_Hotkey(void);
  HRESULT         __fastcall set_Hotkey(int piHK/*[in]*/);
  HRESULT         __fastcall get_ShowCommand(int* piShowCommand/*[out,retval]*/);
  int             __fastcall get_ShowCommand(void);
  HRESULT         __fastcall set_ShowCommand(int piShowCommand/*[in]*/);
  HRESULT         __fastcall Resolve(int fFlags/*[in]*/);
  HRESULT         __fastcall GetIconLocation(BSTR* pbs/*[out]*/, int* piIcon/*[out,retval]*/);
  int             __fastcall GetIconLocation(BSTR* pbs/*[out]*/);
  HRESULT         __fastcall SetIconLocation(BSTR bs/*[in]*/, int iIcon/*[in]*/);
  HRESULT         __fastcall Save(TVariant vWhere/*[in,opt]*/= TNoParam());

  __property   BSTR            Path = {read = get_Path, write = set_Path};
  __property   BSTR            Description = {read = get_Description, write = set_Description};
  __property   BSTR            WorkingDirectory = {read = get_WorkingDirectory, write = set_WorkingDirectory};
  __property   BSTR            Arguments = {read = get_Arguments, write = set_Arguments};
  __property   int             Hotkey = {read = get_Hotkey, write = set_Hotkey};
  __property   int             ShowCommand = {read = get_ShowCommand, write = set_ShowCommand};
};
typedef IShellLinkDualDispT<IShellLinkDual> IShellLinkDualDisp;

typedef TComInterface<FolderItemVerb>  TCOMFolderItemVerb;

// *********************************************************************//
// DispIntf:  FolderItemVerb
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {08EC3E00-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template<class T>
class FolderItemVerbDispT : public TAutoDriver<FolderItemVerb>
{
public:
  FolderItemVerbDispT(){}

  FolderItemVerbDispT(FolderItemVerb *pintf)
  {
    TAutoDriver<FolderItemVerb>::Bind(pintf);
  }

  FolderItemVerbDispT& operator=(FolderItemVerb *pintf)
  {
    TAutoDriver<FolderItemVerb>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Name(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Name(void);
  HRESULT         __fastcall DoIt();

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   BSTR            Name = {read = get_Name};
};
typedef FolderItemVerbDispT<FolderItemVerb> FolderItemVerbDisp;

typedef TComInterface<FolderItemVerbs>  TCOMFolderItemVerbs;

// *********************************************************************//
// DispIntf:  FolderItemVerbs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F8352C0-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template<class T>
class FolderItemVerbsDispT : public TAutoDriver<FolderItemVerbs>
{
public:
  FolderItemVerbsDispT(){}

  FolderItemVerbsDispT(FolderItemVerbs *pintf)
  {
    TAutoDriver<FolderItemVerbs>::Bind(pintf);
  }

  FolderItemVerbsDispT& operator=(FolderItemVerbs *pintf)
  {
    TAutoDriver<FolderItemVerbs>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall get_Count(long* plCount/*[out,retval]*/);
  long            __fastcall get_Count(void);
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall Item(TVariant index/*[in,opt]*/, 
                                  Shdocvw_tlb::FolderItemVerb** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItemVerb* __fastcall Item(TVariant index/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/);
  LPUNKNOWN       __fastcall _NewEnum(void);

  __property   long            Count = {read = get_Count};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
};
typedef FolderItemVerbsDispT<FolderItemVerbs> FolderItemVerbsDisp;

typedef TComInterface<Folder>  TCOMFolder;

// *********************************************************************//
// DispIntf:  Folder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BBCBDE60-C3FF-11CE-8350-444553540000}
// *********************************************************************//
template<class T>
class FolderDispT : public TAutoDriver<Folder>
{
public:
  FolderDispT(){}

  FolderDispT(Folder *pintf)
  {
    TAutoDriver<Folder>::Bind(pintf);
  }

  FolderDispT& operator=(Folder *pintf)
  {
    TAutoDriver<Folder>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall get_Title(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Title(void);
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_ParentFolder(Shdocvw_tlb::Folder** ppsf/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall get_ParentFolder(void);
  HRESULT         __fastcall Items(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItems* __fastcall Items(void);
  HRESULT         __fastcall ParseName(BSTR bName/*[in]*/, 
                                       Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItem* __fastcall ParseName(BSTR bName/*[in]*/);
  HRESULT         __fastcall NewFolder(BSTR bName/*[in]*/, TVariant vOptions/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall MoveHere(TVariant vItem/*[in]*/, 
                                      TVariant vOptions/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall CopyHere(TVariant vItem/*[in]*/, 
                                      TVariant vOptions/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/, 
                                          BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/);

  __property   BSTR            Title = {read = get_Title};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   Shdocvw_tlb::Folder* ParentFolder = {read = get_ParentFolder};
};
typedef FolderDispT<Folder> FolderDisp;

typedef TComInterface<FolderItems>  TCOMFolderItems;

// *********************************************************************//
// DispIntf:  FolderItems
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {744129E0-CBE5-11CE-8350-444553540000}
// *********************************************************************//
template<class T>
class FolderItemsDispT : public TAutoDriver<FolderItems>
{
public:
  FolderItemsDispT(){}

  FolderItemsDispT(FolderItems *pintf)
  {
    TAutoDriver<FolderItems>::Bind(pintf);
  }

  FolderItemsDispT& operator=(FolderItems *pintf)
  {
    TAutoDriver<FolderItems>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall get_Count(long* plCount/*[out,retval]*/);
  long            __fastcall get_Count(void);
  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall Item(TVariant index/*[in,opt]*/, 
                                  Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItem* __fastcall Item(TVariant index/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall _NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/);
  LPUNKNOWN       __fastcall _NewEnum(void);

  __property   long            Count = {read = get_Count};
  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
};
typedef FolderItemsDispT<FolderItems> FolderItemsDisp;

typedef TComInterface<FolderItem>  TCOMFolderItem;

// *********************************************************************//
// DispIntf:  FolderItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FAC32C80-CBE4-11CE-8350-444553540000}
// *********************************************************************//
template<class T>
class FolderItemDispT : public TAutoDriver<FolderItem>
{
public:
  FolderItemDispT(){}

  FolderItemDispT(FolderItem *pintf)
  {
    TAutoDriver<FolderItem>::Bind(pintf);
  }

  FolderItemDispT& operator=(FolderItem *pintf)
  {
    TAutoDriver<FolderItem>::Bind(pintf);
    return *this;
  }

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Name(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Name(void);
  HRESULT         __fastcall set_Name(BSTR pbs/*[in]*/);
  HRESULT         __fastcall get_Path(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Path(void);
  HRESULT         __fastcall get_GetLink(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_GetLink(void);
  HRESULT         __fastcall get_GetFolder(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_GetFolder(void);
  HRESULT         __fastcall get_IsLink(TOLEBOOL* pb/*[out,retval]*/);
  TOLEBOOL        __fastcall get_IsLink(void);
  HRESULT         __fastcall get_IsFolder(TOLEBOOL* pb/*[out,retval]*/);
  TOLEBOOL        __fastcall get_IsFolder(void);
  HRESULT         __fastcall get_IsFileSystem(TOLEBOOL* pb/*[out,retval]*/);
  TOLEBOOL        __fastcall get_IsFileSystem(void);
  HRESULT         __fastcall get_IsBrowsable(TOLEBOOL* pb/*[out,retval]*/);
  TOLEBOOL        __fastcall get_IsBrowsable(void);
  HRESULT         __fastcall get_ModifyDate(DATE* pdt/*[out,retval]*/);
  DATE            __fastcall get_ModifyDate(void);
  HRESULT         __fastcall set_ModifyDate(DATE pdt/*[in]*/);
  HRESULT         __fastcall get_Size(long* pul/*[out,retval]*/);
  long            __fastcall get_Size(void);
  HRESULT         __fastcall get_Type(BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall get_Type(void);
  HRESULT         __fastcall Verbs(Shdocvw_tlb::FolderItemVerbs** ppfic/*[out,retval]*/);
  Shdocvw_tlb::FolderItemVerbs* __fastcall Verbs(void);
  HRESULT         __fastcall InvokeVerb(TVariant vVerb/*[in,opt]*/= TNoParam());

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   BSTR            Name = {read = get_Name, write = set_Name};
  __property   BSTR            Path = {read = get_Path};
  __property   LPDISPATCH      GetLink = {read = get_GetLink};
  __property   LPDISPATCH      GetFolder = {read = get_GetFolder};
  __property   TOLEBOOL        IsLink = {read = get_IsLink};
  __property   TOLEBOOL        IsFolder = {read = get_IsFolder};
  __property   TOLEBOOL        IsFileSystem = {read = get_IsFileSystem};
  __property   TOLEBOOL        IsBrowsable = {read = get_IsBrowsable};
  __property   DATE            ModifyDate = {read = get_ModifyDate, write = set_ModifyDate};
  __property   long            Size = {read = get_Size};
  __property   BSTR            Type = {read = get_Type};
};
typedef FolderItemDispT<FolderItem> FolderItemDisp;

// *********************************************************************//
// SmartIntf: TCOMIShellFolderViewDual
// Interface: IShellFolderViewDual
// *********************************************************************//
template <class T /* IShellFolderViewDual */ >
class TCOMIShellFolderViewDualT : public TComInterface<IShellFolderViewDual>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIShellFolderViewDualT() {}
  TCOMIShellFolderViewDualT(IShellFolderViewDual *intf, bool addRef = false) : TComInterface<IShellFolderViewDual>(intf, addRef) {}
  TCOMIShellFolderViewDualT(const TCOMIShellFolderViewDualT& src) : TComInterface<IShellFolderViewDual>(src) {}
  TCOMIShellFolderViewDualT& operator=(const TCOMIShellFolderViewDualT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Folder_(Shdocvw_tlb::Folder** ppid/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall get_Folder_(void);
  HRESULT         __fastcall SelectedItems(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItems* __fastcall SelectedItems(void);
  HRESULT         __fastcall get_FocusedItem(Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItem* __fastcall get_FocusedItem(void);
  HRESULT         __fastcall SelectItem(TVariant* pvfi/*[in]*/, int dwFlags/*[in]*/);
  HRESULT         __fastcall PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                           TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/, 
                                           BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                           TVariant vx/*[in,opt]*/= TNoParam(), 
                                           TVariant vy/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall get_Script(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Script(void);
  HRESULT         __fastcall get_ViewOptions(long* plViewOptions/*[out,retval]*/);
  long            __fastcall get_ViewOptions(void);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   Shdocvw_tlb::Folder* Folder_ = {read = get_Folder_};
  __property   Shdocvw_tlb::FolderItem* FocusedItem = {read = get_FocusedItem};
  __property   LPDISPATCH      Script = {read = get_Script};
  __property   long            ViewOptions = {read = get_ViewOptions};
};
typedef TCOMIShellFolderViewDualT<IShellFolderViewDual> TCOMIShellFolderViewDual;

// *********************************************************************//
// DispIntf:  IShellFolderViewDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7A1AF80-4D96-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template<class T>
class IShellFolderViewDualDispT : public TAutoDriver<IShellFolderViewDual>
{
public:
  IShellFolderViewDualDispT(){}

  IShellFolderViewDualDispT(IShellFolderViewDual *pintf)
  {
    TAutoDriver<IShellFolderViewDual>::Bind(pintf);
  }

  IShellFolderViewDualDispT& operator=(IShellFolderViewDual *pintf)
  {
    TAutoDriver<IShellFolderViewDual>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass ShellFolderView*/)
  {
    return OLECHECK(Bind(CLSID_ShellFolderView));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass ShellFolderView*/)
  {
    return BindToActive(CLSID_ShellFolderView);
  }

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall get_Folder_(Shdocvw_tlb::Folder** ppid/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall get_Folder_(void);
  HRESULT         __fastcall SelectedItems(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItems* __fastcall SelectedItems(void);
  HRESULT         __fastcall get_FocusedItem(Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/);
  Shdocvw_tlb::FolderItem* __fastcall get_FocusedItem(void);
  HRESULT         __fastcall SelectItem(TVariant* pvfi/*[in]*/, int dwFlags/*[in]*/);
  HRESULT         __fastcall PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                           TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/, 
                                           BSTR* pbs/*[out,retval]*/);
  BSTR            __fastcall PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                           TVariant vx/*[in,opt]*/= TNoParam(), 
                                           TVariant vy/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall get_Script(LPDISPATCH* ppDisp/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Script(void);
  HRESULT         __fastcall get_ViewOptions(long* plViewOptions/*[out,retval]*/);
  long            __fastcall get_ViewOptions(void);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
  __property   Shdocvw_tlb::Folder* Folder_ = {read = get_Folder_};
  __property   Shdocvw_tlb::FolderItem* FocusedItem = {read = get_FocusedItem};
  __property   LPDISPATCH      Script = {read = get_Script};
  __property   long            ViewOptions = {read = get_ViewOptions};
};
typedef IShellFolderViewDualDispT<IShellFolderViewDual> IShellFolderViewDualDisp;

// *********************************************************************//
// SmartIntf: TCOMIShellDispatch
// Interface: IShellDispatch
// *********************************************************************//
template <class T /* IShellDispatch */ >
class TCOMIShellDispatchT : public TComInterface<IShellDispatch>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIShellDispatchT() {}
  TCOMIShellDispatchT(IShellDispatch *intf, bool addRef = false) : TComInterface<IShellDispatch>(intf, addRef) {}
  TCOMIShellDispatchT(const TCOMIShellDispatchT& src) : TComInterface<IShellDispatch>(src) {}
  TCOMIShellDispatchT& operator=(const TCOMIShellDispatchT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall NameSpace(TVariant vDir/*[in]*/, 
                                       Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall NameSpace(TVariant vDir/*[in]*/);
  HRESULT         __fastcall BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                             long Options/*[in]*/, TVariant RootFolder/*[in,opt]*/, 
                                             Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                                  long Options/*[in]*/, 
                                                  TVariant RootFolder/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Windows(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall Windows(void);
  HRESULT         __fastcall Open(TVariant vDir/*[in]*/);
  HRESULT         __fastcall Explore(TVariant vDir/*[in]*/);
  HRESULT         __fastcall MinimizeAll(void);
  HRESULT         __fastcall UndoMinimizeALL(void);
  HRESULT         __fastcall FileRun(void);
  HRESULT         __fastcall CascadeWindows(void);
  HRESULT         __fastcall TileVertically(void);
  HRESULT         __fastcall TileHorizontally(void);
  HRESULT         __fastcall ShutdownWindows(void);
  HRESULT         __fastcall Suspend(void);
  HRESULT         __fastcall EjectPC(void);
  HRESULT         __fastcall SetTime(void);
  HRESULT         __fastcall TrayProperties(void);
  HRESULT         __fastcall Help(void);
  HRESULT         __fastcall FindFiles(void);
  HRESULT         __fastcall FindComputer(void);
  HRESULT         __fastcall RefreshMenu(void);
  HRESULT         __fastcall ControlPanelItem(BSTR szDir/*[in]*/);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
};
typedef TCOMIShellDispatchT<IShellDispatch> TCOMIShellDispatch;

// *********************************************************************//
// DispIntf:  IShellDispatch
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D8F015C0-C278-11CE-A49E-444553540000}
// *********************************************************************//
template<class T>
class IShellDispatchDispT : public TAutoDriver<IShellDispatch>
{
public:
  IShellDispatchDispT(){}

  IShellDispatchDispT(IShellDispatch *pintf)
  {
    TAutoDriver<IShellDispatch>::Bind(pintf);
  }

  IShellDispatchDispT& operator=(IShellDispatch *pintf)
  {
    TAutoDriver<IShellDispatch>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass Shell*/)
  {
    return OLECHECK(Bind(CLSID_Shell));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass Shell*/)
  {
    return BindToActive(CLSID_Shell);
  }

  HRESULT         __fastcall get_Application_(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Application_(void);
  HRESULT         __fastcall get_Parent(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall get_Parent(void);
  HRESULT         __fastcall NameSpace(TVariant vDir/*[in]*/, 
                                       Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall NameSpace(TVariant vDir/*[in]*/);
  HRESULT         __fastcall BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                             long Options/*[in]*/, TVariant RootFolder/*[in,opt]*/, 
                                             Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/);
  Shdocvw_tlb::Folder* __fastcall BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, 
                                                  long Options/*[in]*/, 
                                                  TVariant RootFolder/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall Windows(LPDISPATCH* ppid/*[out,retval]*/);
  LPDISPATCH      __fastcall Windows(void);
  HRESULT         __fastcall Open(TVariant vDir/*[in]*/);
  HRESULT         __fastcall Explore(TVariant vDir/*[in]*/);
  HRESULT         __fastcall MinimizeAll();
  HRESULT         __fastcall UndoMinimizeALL();
  HRESULT         __fastcall FileRun();
  HRESULT         __fastcall CascadeWindows();
  HRESULT         __fastcall TileVertically();
  HRESULT         __fastcall TileHorizontally();
  HRESULT         __fastcall ShutdownWindows();
  HRESULT         __fastcall Suspend();
  HRESULT         __fastcall EjectPC();
  HRESULT         __fastcall SetTime();
  HRESULT         __fastcall TrayProperties();
  HRESULT         __fastcall Help();
  HRESULT         __fastcall FindFiles();
  HRESULT         __fastcall FindComputer();
  HRESULT         __fastcall RefreshMenu();
  HRESULT         __fastcall ControlPanelItem(BSTR szDir/*[in]*/);

  __property   LPDISPATCH      Application_ = {read = get_Application_};
  __property   LPDISPATCH      Parent = {read = get_Parent};
};
typedef IShellDispatchDispT<IShellDispatch> IShellDispatchDisp;

// *********************************************************************//
// SmartIntf: TCOMIShellUIHelper
// Interface: IShellUIHelper
// *********************************************************************//
template <class T /* IShellUIHelper */ >
class TCOMIShellUIHelperT : public TComInterface<IShellUIHelper>, public TComInterfaceBase<IUnknown>
{
public:
  TCOMIShellUIHelperT() {}
  TCOMIShellUIHelperT(IShellUIHelper *intf, bool addRef = false) : TComInterface<IShellUIHelper>(intf, addRef) {}
  TCOMIShellUIHelperT(const TCOMIShellUIHelperT& src) : TComInterface<IShellUIHelper>(src) {}
  TCOMIShellUIHelperT& operator=(const TCOMIShellUIHelperT& src) { Bind(src, true); return *this;}

  HRESULT         __fastcall ResetFirstBootMode(void);
  HRESULT         __fastcall ResetSafeMode(void);
  HRESULT         __fastcall RefreshOfflineDesktop(void);
  HRESULT         __fastcall AddFavorite(BSTR URL/*[in]*/, TVariant* Title/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall AddChannel(BSTR URL/*[in]*/);
  HRESULT         __fastcall AddDesktopComponent(BSTR URL/*[in]*/, BSTR Type/*[in]*/, 
                                                 TVariant* Left/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Top/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Width/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Height/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall IsSubscribed(BSTR URL/*[in]*/, TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall IsSubscribed(BSTR URL/*[in]*/);

};
typedef TCOMIShellUIHelperT<IShellUIHelper> TCOMIShellUIHelper;

// *********************************************************************//
// DispIntf:  IShellUIHelper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}
// *********************************************************************//
template<class T>
class IShellUIHelperDispT : public TAutoDriver<IShellUIHelper>
{
public:
  IShellUIHelperDispT(){}

  IShellUIHelperDispT(IShellUIHelper *pintf)
  {
    TAutoDriver<IShellUIHelper>::Bind(pintf);
  }

  IShellUIHelperDispT& operator=(IShellUIHelper *pintf)
  {
    TAutoDriver<IShellUIHelper>::Bind(pintf);
    return *this;
  }

  HRESULT BindDefault(/*Binds to new instance of CoClass ShellUIHelper*/)
  {
    return OLECHECK(Bind(CLSID_ShellUIHelper));
  }

  HRESULT BindRunning(/*Binds to a running instance of CoClass ShellUIHelper*/)
  {
    return BindToActive(CLSID_ShellUIHelper);
  }

  HRESULT         __fastcall ResetFirstBootMode();
  HRESULT         __fastcall ResetSafeMode();
  HRESULT         __fastcall RefreshOfflineDesktop();
  HRESULT         __fastcall AddFavorite(BSTR URL/*[in]*/, TVariant* Title/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall AddChannel(BSTR URL/*[in]*/);
  HRESULT         __fastcall AddDesktopComponent(BSTR URL/*[in]*/, BSTR Type/*[in]*/, 
                                                 TVariant* Left/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Top/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Width/*[in,opt]*/= TNoParam(), 
                                                 TVariant* Height/*[in,opt]*/= TNoParam());
  HRESULT         __fastcall IsSubscribed(BSTR URL/*[in]*/, TOLEBOOL* pBool/*[out,retval]*/);
  TOLEBOOL        __fastcall IsSubscribed(BSTR URL/*[in]*/);

};
typedef IShellUIHelperDispT<IShellUIHelper> IShellUIHelperDisp;

// *********************************************************************//
// SmartIntf: TCOMIWebBrowser
// Interface: IWebBrowser
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::GoBack(void)
{
  return (*this)->GoBack();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::GoForward(void)
{
  return (*this)->GoForward();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::GoHome(void)
{
  return (*this)->GoHome();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::GoSearch(void)
{
  return (*this)->GoSearch();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                              TVariant* TargetFrameName/*[in,opt]*/, TVariant* PostData/*[in,opt]*/, 
                              TVariant* Headers/*[in,opt]*/)
{
  return (*this)->Navigate(URL, Flags, TargetFrameName, PostData, Headers);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::Refresh(void)
{
  return (*this)->Refresh();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::Refresh2(TVariant* Level/*[in,opt]*/)
{
  return (*this)->Refresh2(Level);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::Stop(void)
{
  return (*this)->Stop();
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  return (*this)->get_Application_(ppDisp);
}

template <class T> LPDISPATCH __fastcall
TCOMIWebBrowserT<T>::get_Application_(void)
{
  LPDISPATCH ppDisp= 0;
  OLECHECK(this->get_Application_(&ppDisp));
  return ppDisp;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  return (*this)->get_Parent(ppDisp);
}

template <class T> LPDISPATCH __fastcall
TCOMIWebBrowserT<T>::get_Parent(void)
{
  LPDISPATCH ppDisp= 0;
  OLECHECK(this->get_Parent(&ppDisp));
  return ppDisp;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Container(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  return (*this)->get_Container(ppDisp);
}

template <class T> LPDISPATCH __fastcall
TCOMIWebBrowserT<T>::get_Container(void)
{
  LPDISPATCH ppDisp= 0;
  OLECHECK(this->get_Container(&ppDisp));
  return ppDisp;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Document(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  return (*this)->get_Document(ppDisp);
}

template <class T> LPDISPATCH __fastcall
TCOMIWebBrowserT<T>::get_Document(void)
{
  LPDISPATCH ppDisp= 0;
  OLECHECK(this->get_Document(&ppDisp));
  return ppDisp;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/)
{
  return (*this)->get_TopLevelContainer(pBool);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowserT<T>::get_TopLevelContainer(void)
{
  TOLEBOOL pBool;
  OLECHECK(this->get_TopLevelContainer(&pBool));
  return pBool;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Type(BSTR* Type/*[out,retval]*/)
{
  return (*this)->get_Type(Type);
}

template <class T> BSTR __fastcall
TCOMIWebBrowserT<T>::get_Type(void)
{
  BSTR Type= 0;
  OLECHECK(this->get_Type(&Type));
  return Type;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Left(long* pl/*[out,retval]*/)
{
  return (*this)->get_Left(pl);
}

template <class T> long __fastcall
TCOMIWebBrowserT<T>::get_Left(void)
{
  long pl;
  OLECHECK(this->get_Left(&pl));
  return pl;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::set_Left(long pl/*[in]*/)
{
  return (*this)->set_Left(pl);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Top(long* pl/*[out,retval]*/)
{
  return (*this)->get_Top(pl);
}

template <class T> long __fastcall
TCOMIWebBrowserT<T>::get_Top(void)
{
  long pl;
  OLECHECK(this->get_Top(&pl));
  return pl;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::set_Top(long pl/*[in]*/)
{
  return (*this)->set_Top(pl);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Width(long* pl/*[out,retval]*/)
{
  return (*this)->get_Width(pl);
}

template <class T> long __fastcall
TCOMIWebBrowserT<T>::get_Width(void)
{
  long pl;
  OLECHECK(this->get_Width(&pl));
  return pl;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::set_Width(long pl/*[in]*/)
{
  return (*this)->set_Width(pl);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Height(long* pl/*[out,retval]*/)
{
  return (*this)->get_Height(pl);
}

template <class T> long __fastcall
TCOMIWebBrowserT<T>::get_Height(void)
{
  long pl;
  OLECHECK(this->get_Height(&pl));
  return pl;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::set_Height(long pl/*[in]*/)
{
  return (*this)->set_Height(pl);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_LocationName(BSTR* LocationName/*[out,retval]*/)
{
  return (*this)->get_LocationName(LocationName);
}

template <class T> BSTR __fastcall
TCOMIWebBrowserT<T>::get_LocationName(void)
{
  BSTR LocationName= 0;
  OLECHECK(this->get_LocationName(&LocationName));
  return LocationName;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_LocationURL(BSTR* LocationURL/*[out,retval]*/)
{
  return (*this)->get_LocationURL(LocationURL);
}

template <class T> BSTR __fastcall
TCOMIWebBrowserT<T>::get_LocationURL(void)
{
  BSTR LocationURL= 0;
  OLECHECK(this->get_LocationURL(&LocationURL));
  return LocationURL;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowserT<T>::get_Busy(TOLEBOOL* pBool/*[out,retval]*/)
{
  return (*this)->get_Busy(pBool);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowserT<T>::get_Busy(void)
{
  TOLEBOOL pBool;
  OLECHECK(this->get_Busy(&pBool));
  return pBool;
}

// *********************************************************************//
// DispIntf:  IWebBrowser
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::GoBack()
{
  static _TDispID _dispid(*this, OLETEXT("GoBack"), DISPID(100));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::GoForward()
{
  static _TDispID _dispid(*this, OLETEXT("GoForward"), DISPID(101));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::GoHome()
{
  static _TDispID _dispid(*this, OLETEXT("GoHome"), DISPID(102));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::GoSearch()
{
  static _TDispID _dispid(*this, OLETEXT("GoSearch"), DISPID(103));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                              TVariant* TargetFrameName/*[in,opt]*/, TVariant* PostData/*[in,opt]*/
                              , TVariant* Headers/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Navigate"), DISPID(104));
  TAutoArgs<5> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_VARIANT:1]*/;
  _args[3] = TargetFrameName /*[VT_VARIANT:1]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::Refresh()
{
  static _TDispID _dispid(*this, OLETEXT("Refresh"), DISPID(-550));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::Refresh2(TVariant* Level/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Refresh2"), DISPID(105));
  TAutoArgs<1> _args;
  _args[1] = Level /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::Stop()
{
  static _TDispID _dispid(*this, OLETEXT("Stop"), DISPID(106));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(200));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserDispT<T>::get_Application_(void)
{
  LPDISPATCH ppDisp;
  this->get_Application_(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(201));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserDispT<T>::get_Parent(void)
{
  LPDISPATCH ppDisp;
  this->get_Parent(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Container(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Container"), DISPID(202));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserDispT<T>::get_Container(void)
{
  LPDISPATCH ppDisp;
  this->get_Container(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Document(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Document"), DISPID(203));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserDispT<T>::get_Document(void)
{
  LPDISPATCH ppDisp;
  this->get_Document(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("TopLevelContainer"), DISPID(204));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserDispT<T>::get_TopLevelContainer(void)
{
  TOLEBOOL pBool;
  this->get_TopLevelContainer(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Type(BSTR* Type/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Type"), DISPID(205));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Type /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserDispT<T>::get_Type(void)
{
  BSTR Type;
  this->get_Type(&Type);
  return Type;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Left(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserDispT<T>::get_Left(void)
{
  long pl;
  this->get_Left(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::set_Left(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Top(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserDispT<T>::get_Top(void)
{
  long pl;
  this->get_Top(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::set_Top(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Width(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserDispT<T>::get_Width(void)
{
  long pl;
  this->get_Width(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::set_Width(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Height(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserDispT<T>::get_Height(void)
{
  long pl;
  this->get_Height(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::set_Height(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_LocationName(BSTR* LocationName/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationName"), DISPID(210));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationName /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserDispT<T>::get_LocationName(void)
{
  BSTR LocationName;
  this->get_LocationName(&LocationName);
  return LocationName;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_LocationURL(BSTR* LocationURL/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationURL"), DISPID(211));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationURL /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserDispT<T>::get_LocationURL(void)
{
  BSTR LocationURL;
  this->get_LocationURL(&LocationURL);
  return LocationURL;
}

template <class T> HRESULT __fastcall
IWebBrowserDispT<T>::get_Busy(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Busy"), DISPID(212));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserDispT<T>::get_Busy(void)
{
  TOLEBOOL pBool;
  this->get_Busy(&pBool);
  return pBool;
}

// *********************************************************************//
// DispIntf:  DWebBrowserEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {EAB22AC2-30C1-11CF-A7EB-0000C05BAE0B}
// *********************************************************************//
template <class T> void __fastcall
DWebBrowserEventsDispT<T>::BeforeNavigate(BSTR URL/*[in]*/, long Flags, BSTR TargetFrameName, 
                                          TVariant* PostData, BSTR Headers, 
                                          TOLEBOOL* Cancel/*[in,out]*/)
{
  static _TDispID _dispid(/* BeforeNavigate */ DISPID(100));
  TAutoArgs<6> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_I4:0]*/;
  _args[3] = TargetFrameName /*[VT_BSTR:0]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_BSTR:0]*/;
  _args[6] = Cancel /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::NavigateComplete(BSTR URL/*[in]*/)
{
  static _TDispID _dispid(/* NavigateComplete */ DISPID(101));
  TAutoArgs<1> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::StatusTextChange(BSTR Text/*[in]*/)
{
  static _TDispID _dispid(/* StatusTextChange */ DISPID(102));
  TAutoArgs<1> _args;
  _args[1] = Text /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::ProgressChange(long Progress/*[in]*/, long ProgressMax/*[in]*/)
{
  static _TDispID _dispid(/* ProgressChange */ DISPID(108));
  TAutoArgs<2> _args;
  _args[1] = Progress /*[VT_I4:0]*/;
  _args[2] = ProgressMax /*[VT_I4:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::DownloadComplete()
{
  static _TDispID _dispid(/* DownloadComplete */ DISPID(104));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::CommandStateChange(long Command/*[in]*/, TOLEBOOL Enable/*[in]*/)
{
  static _TDispID _dispid(/* CommandStateChange */ DISPID(105));
  TAutoArgs<2> _args;
  _args[1] = Command /*[VT_I4:0]*/;
  _args[2] = Enable /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::DownloadBegin()
{
  static _TDispID _dispid(/* DownloadBegin */ DISPID(106));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::NewWindow(BSTR URL/*[in]*/, long Flags/*[in]*/, 
                                     BSTR TargetFrameName/*[in]*/, TVariant* PostData/*[in]*/, 
                                     BSTR Headers/*[in]*/, TOLEBOOL* Processed/*[in,out]*/)
{
  static _TDispID _dispid(/* NewWindow */ DISPID(107));
  TAutoArgs<6> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_I4:0]*/;
  _args[3] = TargetFrameName /*[VT_BSTR:0]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_BSTR:0]*/;
  _args[6] = Processed /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::TitleChange(BSTR Text/*[in]*/)
{
  static _TDispID _dispid(/* TitleChange */ DISPID(113));
  TAutoArgs<1> _args;
  _args[1] = Text /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::FrameBeforeNavigate(BSTR URL/*[in]*/, long Flags, BSTR TargetFrameName, 
                                               TVariant* PostData, BSTR Headers, 
                                               TOLEBOOL* Cancel/*[in,out]*/)
{
  static _TDispID _dispid(/* FrameBeforeNavigate */ DISPID(200));
  TAutoArgs<6> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_I4:0]*/;
  _args[3] = TargetFrameName /*[VT_BSTR:0]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_BSTR:0]*/;
  _args[6] = Cancel /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::FrameNavigateComplete(BSTR URL/*[in]*/)
{
  static _TDispID _dispid(/* FrameNavigateComplete */ DISPID(201));
  TAutoArgs<1> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::FrameNewWindow(BSTR URL/*[in]*/, long Flags/*[in]*/, 
                                          BSTR TargetFrameName/*[in]*/, TVariant* PostData/*[in]*/, 
                                          BSTR Headers/*[in]*/, TOLEBOOL* Processed/*[in,out]*/)
{
  static _TDispID _dispid(/* FrameNewWindow */ DISPID(204));
  TAutoArgs<6> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_I4:0]*/;
  _args[3] = TargetFrameName /*[VT_BSTR:0]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_BSTR:0]*/;
  _args[6] = Processed /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::Quit(TOLEBOOL* Cancel/*[in,out]*/)
{
  static _TDispID _dispid(/* Quit */ DISPID(103));
  TAutoArgs<1> _args;
  _args[1] = Cancel /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::WindowMove()
{
  static _TDispID _dispid(/* WindowMove */ DISPID(109));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::WindowResize()
{
  static _TDispID _dispid(/* WindowResize */ DISPID(110));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::WindowActivate()
{
  static _TDispID _dispid(/* WindowActivate */ DISPID(111));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEventsDispT<T>::PropertyChange(BSTR Property/*[in]*/)
{
  static _TDispID _dispid(/* PropertyChange */ DISPID(112));
  TAutoArgs<1> _args;
  _args[1] = Property /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

// *********************************************************************//
// DispIntf:  IWebBrowserApp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0002DF05-0000-0000-C000-000000000046}
// *********************************************************************//
template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::Quit()
{
  static _TDispID _dispid(*this, OLETEXT("Quit"), DISPID(300));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ClientToWindow"), DISPID(301));
  TAutoArgs<2> _args;
  _args[1] = pcx /*[VT_INT:1]*/;
  _args[2] = pcy /*[VT_INT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("PutProperty"), DISPID(302));
  TAutoArgs<2> _args;
  _args[1] = Property /*[VT_BSTR:0]*/;
  _args[2] = vtValue /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::GetProperty(BSTR Property/*[in]*/, TVariant* pvtValue/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetProperty"), DISPID(303));
  TAutoArgs<1> _args;
  _args[1] = Property /*[VT_BSTR:0]*/;
  return OutRetValSetterPtr(pvtValue /*[VT_VARIANT:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> TVariant __fastcall
IWebBrowserAppDispT<T>::GetProperty(BSTR Property/*[in]*/)
{
  TVariant pvtValue;
  this->GetProperty(Property, &pvtValue);
  return pvtValue;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Name(BSTR* Name/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Name"), DISPID(0));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Name /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_Name(void)
{
  BSTR Name;
  this->get_Name(&Name);
  return Name;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_HWND(long* pHWND/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("HWND"), DISPID(-515));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pHWND /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserAppDispT<T>::get_HWND(void)
{
  long pHWND;
  this->get_HWND(&pHWND);
  return pHWND;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_FullName(BSTR* FullName/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullName"), DISPID(400));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(FullName /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_FullName(void)
{
  BSTR FullName;
  this->get_FullName(&FullName);
  return FullName;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Path(BSTR* Path/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Path"), DISPID(401));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Path /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_Path(void)
{
  BSTR Path;
  this->get_Path(&Path);
  return Path;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Visible(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Visible"), DISPID(402));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_Visible(void)
{
  TOLEBOOL pBool;
  this->get_Visible(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_Visible(TOLEBOOL pBool/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Visible"), DISPID(402));
  TAutoArgs<1> _args;
  _args[1] = pBool /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_StatusBar(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusBar"), DISPID(403));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_StatusBar(void)
{
  TOLEBOOL pBool;
  this->get_StatusBar(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_StatusBar(TOLEBOOL pBool/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusBar"), DISPID(403));
  TAutoArgs<1> _args;
  _args[1] = pBool /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_StatusText(BSTR* StatusText/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusText"), DISPID(404));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(StatusText /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_StatusText(void)
{
  BSTR StatusText;
  this->get_StatusText(&StatusText);
  return StatusText;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_StatusText(BSTR StatusText/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusText"), DISPID(404));
  TAutoArgs<1> _args;
  _args[1] = StatusText /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_ToolBar(int* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ToolBar"), DISPID(405));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_INT:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> int __fastcall
IWebBrowserAppDispT<T>::get_ToolBar(void)
{
  int Value;
  this->get_ToolBar(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_ToolBar(int Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ToolBar"), DISPID(405));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_INT:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_MenuBar(TOLEBOOL* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("MenuBar"), DISPID(406));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_MenuBar(void)
{
  TOLEBOOL Value;
  this->get_MenuBar(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_MenuBar(TOLEBOOL Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("MenuBar"), DISPID(406));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_FullScreen(TOLEBOOL* pbFullScreen/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullScreen"), DISPID(407));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbFullScreen /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_FullScreen(void)
{
  TOLEBOOL pbFullScreen;
  this->get_FullScreen(&pbFullScreen);
  return pbFullScreen;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_FullScreen(TOLEBOOL pbFullScreen/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullScreen"), DISPID(407));
  TAutoArgs<1> _args;
  _args[1] = pbFullScreen /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::GoBack()
{
  static _TDispID _dispid(*this, OLETEXT("GoBack"), DISPID(100));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::GoForward()
{
  static _TDispID _dispid(*this, OLETEXT("GoForward"), DISPID(101));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::GoHome()
{
  static _TDispID _dispid(*this, OLETEXT("GoHome"), DISPID(102));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::GoSearch()
{
  static _TDispID _dispid(*this, OLETEXT("GoSearch"), DISPID(103));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                                 TVariant* TargetFrameName/*[in,opt]*/, 
                                 TVariant* PostData/*[in,opt]*/, TVariant* Headers/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Navigate"), DISPID(104));
  TAutoArgs<5> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_VARIANT:1]*/;
  _args[3] = TargetFrameName /*[VT_VARIANT:1]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::Refresh()
{
  static _TDispID _dispid(*this, OLETEXT("Refresh"), DISPID(-550));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::Refresh2(TVariant* Level/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Refresh2"), DISPID(105));
  TAutoArgs<1> _args;
  _args[1] = Level /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::Stop()
{
  static _TDispID _dispid(*this, OLETEXT("Stop"), DISPID(106));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(200));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserAppDispT<T>::get_Application_(void)
{
  LPDISPATCH ppDisp;
  this->get_Application_(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(201));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserAppDispT<T>::get_Parent(void)
{
  LPDISPATCH ppDisp;
  this->get_Parent(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Container(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Container"), DISPID(202));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserAppDispT<T>::get_Container(void)
{
  LPDISPATCH ppDisp;
  this->get_Container(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Document(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Document"), DISPID(203));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowserAppDispT<T>::get_Document(void)
{
  LPDISPATCH ppDisp;
  this->get_Document(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("TopLevelContainer"), DISPID(204));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_TopLevelContainer(void)
{
  TOLEBOOL pBool;
  this->get_TopLevelContainer(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Type(BSTR* Type/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Type"), DISPID(205));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Type /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_Type(void)
{
  BSTR Type;
  this->get_Type(&Type);
  return Type;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Left(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserAppDispT<T>::get_Left(void)
{
  long pl;
  this->get_Left(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_Left(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Top(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserAppDispT<T>::get_Top(void)
{
  long pl;
  this->get_Top(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_Top(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Width(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserAppDispT<T>::get_Width(void)
{
  long pl;
  this->get_Width(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_Width(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Height(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowserAppDispT<T>::get_Height(void)
{
  long pl;
  this->get_Height(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::set_Height(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_LocationName(BSTR* LocationName/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationName"), DISPID(210));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationName /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_LocationName(void)
{
  BSTR LocationName;
  this->get_LocationName(&LocationName);
  return LocationName;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_LocationURL(BSTR* LocationURL/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationURL"), DISPID(211));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationURL /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowserAppDispT<T>::get_LocationURL(void)
{
  BSTR LocationURL;
  this->get_LocationURL(&LocationURL);
  return LocationURL;
}

template <class T> HRESULT __fastcall
IWebBrowserAppDispT<T>::get_Busy(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Busy"), DISPID(212));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowserAppDispT<T>::get_Busy(void)
{
  TOLEBOOL pBool;
  this->get_Busy(&pBool);
  return pBool;
}

// *********************************************************************//
// SmartIntf: TCOMIWebBrowser2
// Interface: IWebBrowser2
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::Navigate2(TVariant* URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                                TVariant* TargetFrameName/*[in,opt]*/, 
                                TVariant* PostData/*[in,opt]*/, TVariant* Headers/*[in,opt]*/)
{
  return (*this)->Navigate2(URL, Flags, TargetFrameName, PostData, Headers);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                    Shdocvw_tlb::OLECMDF* pcmdf/*[out,retval]*/)
{
  return (*this)->QueryStatusWB(cmdID, pcmdf);
}

template <class T> Shdocvw_tlb::OLECMDF __fastcall
TCOMIWebBrowser2T<T>::QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/)
{
  Shdocvw_tlb::OLECMDF pcmdf;
  OLECHECK(this->QueryStatusWB(cmdID, &pcmdf));
  return pcmdf;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                             Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                             TVariant* pvaIn/*[in,opt]*/, TVariant* pvaOut/*[in,out,opt]*/)
{
  return (*this)->ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::ShowBrowserBar(TVariant* pvaClsid/*[in]*/, TVariant* pvarShow/*[in,opt]*/, 
                                     TVariant* pvarSize/*[in,opt]*/)
{
  return (*this)->ShowBrowserBar(pvaClsid, pvarShow, pvarSize);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_ReadyState(Shdocvw_tlb::tagREADYSTATE* plReadyState/*[out,retval]*/)
{
  return (*this)->get_ReadyState(plReadyState);
}

template <class T> Shdocvw_tlb::tagREADYSTATE __fastcall
TCOMIWebBrowser2T<T>::get_ReadyState(void)
{
  Shdocvw_tlb::tagREADYSTATE plReadyState;
  OLECHECK(this->get_ReadyState(&plReadyState));
  return plReadyState;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_Offline(TOLEBOOL* pbOffline/*[out,retval]*/)
{
  return (*this)->get_Offline(pbOffline);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_Offline(void)
{
  TOLEBOOL pbOffline;
  OLECHECK(this->get_Offline(&pbOffline));
  return pbOffline;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_Offline(TOLEBOOL pbOffline/*[in]*/)
{
  return (*this)->set_Offline(pbOffline);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_Silent(TOLEBOOL* pbSilent/*[out,retval]*/)
{
  return (*this)->get_Silent(pbSilent);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_Silent(void)
{
  TOLEBOOL pbSilent;
  OLECHECK(this->get_Silent(&pbSilent));
  return pbSilent;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_Silent(TOLEBOOL pbSilent/*[in]*/)
{
  return (*this)->set_Silent(pbSilent);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_RegisterAsBrowser(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  return (*this)->get_RegisterAsBrowser(pbRegister);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_RegisterAsBrowser(void)
{
  TOLEBOOL pbRegister;
  OLECHECK(this->get_RegisterAsBrowser(&pbRegister));
  return pbRegister;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_RegisterAsBrowser(TOLEBOOL pbRegister/*[in]*/)
{
  return (*this)->set_RegisterAsBrowser(pbRegister);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_RegisterAsDropTarget(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  return (*this)->get_RegisterAsDropTarget(pbRegister);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_RegisterAsDropTarget(void)
{
  TOLEBOOL pbRegister;
  OLECHECK(this->get_RegisterAsDropTarget(&pbRegister));
  return pbRegister;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_RegisterAsDropTarget(TOLEBOOL pbRegister/*[in]*/)
{
  return (*this)->set_RegisterAsDropTarget(pbRegister);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_TheaterMode(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  return (*this)->get_TheaterMode(pbRegister);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_TheaterMode(void)
{
  TOLEBOOL pbRegister;
  OLECHECK(this->get_TheaterMode(&pbRegister));
  return pbRegister;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_TheaterMode(TOLEBOOL pbRegister/*[in]*/)
{
  return (*this)->set_TheaterMode(pbRegister);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_AddressBar(TOLEBOOL* Value/*[out,retval]*/)
{
  return (*this)->get_AddressBar(Value);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_AddressBar(void)
{
  TOLEBOOL Value;
  OLECHECK(this->get_AddressBar(&Value));
  return Value;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_AddressBar(TOLEBOOL Value/*[in]*/)
{
  return (*this)->set_AddressBar(Value);
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::get_Resizable(TOLEBOOL* Value/*[out,retval]*/)
{
  return (*this)->get_Resizable(Value);
}

template <class T> TOLEBOOL __fastcall
TCOMIWebBrowser2T<T>::get_Resizable(void)
{
  TOLEBOOL Value;
  OLECHECK(this->get_Resizable(&Value));
  return Value;
}

template <class T> HRESULT __fastcall
TCOMIWebBrowser2T<T>::set_Resizable(TOLEBOOL Value/*[in]*/)
{
  return (*this)->set_Resizable(Value);
}

// *********************************************************************//
// DispIntf:  IWebBrowser2
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}
// *********************************************************************//
template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Navigate2(TVariant* URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                                TVariant* TargetFrameName/*[in,opt]*/, 
                                TVariant* PostData/*[in,opt]*/, TVariant* Headers/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Navigate2"), DISPID(500));
  TAutoArgs<5> _args;
  _args[1] = URL /*[VT_VARIANT:1]*/;
  _args[2] = Flags /*[VT_VARIANT:1]*/;
  _args[3] = TargetFrameName /*[VT_VARIANT:1]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                    Shdocvw_tlb::OLECMDF* pcmdf/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("QueryStatusWB"), DISPID(501));
  TAutoArgs<1> _args;
  _args[1] = (int)cmdID /*[VT_USERDEFINED:0]*/;
  return OutRetValSetterPtr((int*)pcmdf /*[VT_USERDEFINED:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::OLECMDF __fastcall
IWebBrowser2DispT<T>::QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/)
{
  Shdocvw_tlb::OLECMDF pcmdf;
  this->QueryStatusWB(cmdID, &pcmdf);
  return pcmdf;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                             Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                             TVariant* pvaIn/*[in,opt]*/, TVariant* pvaOut/*[in,out,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ExecWB"), DISPID(502));
  TAutoArgs<4> _args;
  _args[1] = (int)cmdID /*[VT_USERDEFINED:0]*/;
  _args[2] = (int)cmdexecopt /*[VT_USERDEFINED:0]*/;
  _args[3] = pvaIn /*[VT_VARIANT:1]*/;
  _args[4] = pvaOut /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::ShowBrowserBar(TVariant* pvaClsid/*[in]*/, TVariant* pvarShow/*[in,opt]*/, 
                                     TVariant* pvarSize/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ShowBrowserBar"), DISPID(503));
  TAutoArgs<3> _args;
  _args[1] = pvaClsid /*[VT_VARIANT:1]*/;
  _args[2] = pvarShow /*[VT_VARIANT:1]*/;
  _args[3] = pvarSize /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_ReadyState(Shdocvw_tlb::tagREADYSTATE* plReadyState/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ReadyState"), DISPID(-525));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((int*)plReadyState /*[VT_USERDEFINED:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> Shdocvw_tlb::tagREADYSTATE __fastcall
IWebBrowser2DispT<T>::get_ReadyState(void)
{
  Shdocvw_tlb::tagREADYSTATE plReadyState;
  this->get_ReadyState(&plReadyState);
  return plReadyState;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Offline(TOLEBOOL* pbOffline/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Offline"), DISPID(550));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbOffline /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_Offline(void)
{
  TOLEBOOL pbOffline;
  this->get_Offline(&pbOffline);
  return pbOffline;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Offline(TOLEBOOL pbOffline/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Offline"), DISPID(550));
  TAutoArgs<1> _args;
  _args[1] = pbOffline /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Silent(TOLEBOOL* pbSilent/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Silent"), DISPID(551));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbSilent /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_Silent(void)
{
  TOLEBOOL pbSilent;
  this->get_Silent(&pbSilent);
  return pbSilent;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Silent(TOLEBOOL pbSilent/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Silent"), DISPID(551));
  TAutoArgs<1> _args;
  _args[1] = pbSilent /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_RegisterAsBrowser(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("RegisterAsBrowser"), DISPID(552));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbRegister /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_RegisterAsBrowser(void)
{
  TOLEBOOL pbRegister;
  this->get_RegisterAsBrowser(&pbRegister);
  return pbRegister;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_RegisterAsBrowser(TOLEBOOL pbRegister/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("RegisterAsBrowser"), DISPID(552));
  TAutoArgs<1> _args;
  _args[1] = pbRegister /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_RegisterAsDropTarget(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("RegisterAsDropTarget"), DISPID(553));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbRegister /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_RegisterAsDropTarget(void)
{
  TOLEBOOL pbRegister;
  this->get_RegisterAsDropTarget(&pbRegister);
  return pbRegister;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_RegisterAsDropTarget(TOLEBOOL pbRegister/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("RegisterAsDropTarget"), DISPID(553));
  TAutoArgs<1> _args;
  _args[1] = pbRegister /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_TheaterMode(TOLEBOOL* pbRegister/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("TheaterMode"), DISPID(554));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbRegister /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_TheaterMode(void)
{
  TOLEBOOL pbRegister;
  this->get_TheaterMode(&pbRegister);
  return pbRegister;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_TheaterMode(TOLEBOOL pbRegister/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("TheaterMode"), DISPID(554));
  TAutoArgs<1> _args;
  _args[1] = pbRegister /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_AddressBar(TOLEBOOL* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("AddressBar"), DISPID(555));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_AddressBar(void)
{
  TOLEBOOL Value;
  this->get_AddressBar(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_AddressBar(TOLEBOOL Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("AddressBar"), DISPID(555));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Resizable(TOLEBOOL* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Resizable"), DISPID(556));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_Resizable(void)
{
  TOLEBOOL Value;
  this->get_Resizable(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Resizable(TOLEBOOL Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Resizable"), DISPID(556));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Quit()
{
  static _TDispID _dispid(*this, OLETEXT("Quit"), DISPID(300));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ClientToWindow"), DISPID(301));
  TAutoArgs<2> _args;
  _args[1] = pcx /*[VT_INT:1]*/;
  _args[2] = pcy /*[VT_INT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("PutProperty"), DISPID(302));
  TAutoArgs<2> _args;
  _args[1] = Property /*[VT_BSTR:0]*/;
  _args[2] = vtValue /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::GetProperty(BSTR Property/*[in]*/, TVariant* pvtValue/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetProperty"), DISPID(303));
  TAutoArgs<1> _args;
  _args[1] = Property /*[VT_BSTR:0]*/;
  return OutRetValSetterPtr(pvtValue /*[VT_VARIANT:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> TVariant __fastcall
IWebBrowser2DispT<T>::GetProperty(BSTR Property/*[in]*/)
{
  TVariant pvtValue;
  this->GetProperty(Property, &pvtValue);
  return pvtValue;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Name(BSTR* Name/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Name"), DISPID(0));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Name /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_Name(void)
{
  BSTR Name;
  this->get_Name(&Name);
  return Name;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_HWND(long* pHWND/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("HWND"), DISPID(-515));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pHWND /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowser2DispT<T>::get_HWND(void)
{
  long pHWND;
  this->get_HWND(&pHWND);
  return pHWND;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_FullName(BSTR* FullName/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullName"), DISPID(400));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(FullName /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_FullName(void)
{
  BSTR FullName;
  this->get_FullName(&FullName);
  return FullName;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Path(BSTR* Path/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Path"), DISPID(401));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Path /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_Path(void)
{
  BSTR Path;
  this->get_Path(&Path);
  return Path;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Visible(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Visible"), DISPID(402));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_Visible(void)
{
  TOLEBOOL pBool;
  this->get_Visible(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Visible(TOLEBOOL pBool/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Visible"), DISPID(402));
  TAutoArgs<1> _args;
  _args[1] = pBool /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_StatusBar(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusBar"), DISPID(403));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_StatusBar(void)
{
  TOLEBOOL pBool;
  this->get_StatusBar(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_StatusBar(TOLEBOOL pBool/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusBar"), DISPID(403));
  TAutoArgs<1> _args;
  _args[1] = pBool /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_StatusText(BSTR* StatusText/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusText"), DISPID(404));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(StatusText /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_StatusText(void)
{
  BSTR StatusText;
  this->get_StatusText(&StatusText);
  return StatusText;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_StatusText(BSTR StatusText/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("StatusText"), DISPID(404));
  TAutoArgs<1> _args;
  _args[1] = StatusText /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_ToolBar(int* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ToolBar"), DISPID(405));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_INT:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> int __fastcall
IWebBrowser2DispT<T>::get_ToolBar(void)
{
  int Value;
  this->get_ToolBar(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_ToolBar(int Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ToolBar"), DISPID(405));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_INT:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_MenuBar(TOLEBOOL* Value/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("MenuBar"), DISPID(406));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Value /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_MenuBar(void)
{
  TOLEBOOL Value;
  this->get_MenuBar(&Value);
  return Value;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_MenuBar(TOLEBOOL Value/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("MenuBar"), DISPID(406));
  TAutoArgs<1> _args;
  _args[1] = Value /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_FullScreen(TOLEBOOL* pbFullScreen/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullScreen"), DISPID(407));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbFullScreen /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_FullScreen(void)
{
  TOLEBOOL pbFullScreen;
  this->get_FullScreen(&pbFullScreen);
  return pbFullScreen;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_FullScreen(TOLEBOOL pbFullScreen/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FullScreen"), DISPID(407));
  TAutoArgs<1> _args;
  _args[1] = pbFullScreen /*[VT_BOOL:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::GoBack()
{
  static _TDispID _dispid(*this, OLETEXT("GoBack"), DISPID(100));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::GoForward()
{
  static _TDispID _dispid(*this, OLETEXT("GoForward"), DISPID(101));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::GoHome()
{
  static _TDispID _dispid(*this, OLETEXT("GoHome"), DISPID(102));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::GoSearch()
{
  static _TDispID _dispid(*this, OLETEXT("GoSearch"), DISPID(103));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/, 
                               TVariant* TargetFrameName/*[in,opt]*/, TVariant* PostData/*[in,opt]*/
                               , TVariant* Headers/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Navigate"), DISPID(104));
  TAutoArgs<5> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Flags /*[VT_VARIANT:1]*/;
  _args[3] = TargetFrameName /*[VT_VARIANT:1]*/;
  _args[4] = PostData /*[VT_VARIANT:1]*/;
  _args[5] = Headers /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Refresh()
{
  static _TDispID _dispid(*this, OLETEXT("Refresh"), DISPID(-550));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Refresh2(TVariant* Level/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Refresh2"), DISPID(105));
  TAutoArgs<1> _args;
  _args[1] = Level /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::Stop()
{
  static _TDispID _dispid(*this, OLETEXT("Stop"), DISPID(106));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Application_(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(200));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowser2DispT<T>::get_Application_(void)
{
  LPDISPATCH ppDisp;
  this->get_Application_(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Parent(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(201));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowser2DispT<T>::get_Parent(void)
{
  LPDISPATCH ppDisp;
  this->get_Parent(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Container(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Container"), DISPID(202));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowser2DispT<T>::get_Container(void)
{
  LPDISPATCH ppDisp;
  this->get_Container(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Document(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Document"), DISPID(203));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IWebBrowser2DispT<T>::get_Document(void)
{
  LPDISPATCH ppDisp;
  this->get_Document(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_TopLevelContainer(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("TopLevelContainer"), DISPID(204));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_TopLevelContainer(void)
{
  TOLEBOOL pBool;
  this->get_TopLevelContainer(&pBool);
  return pBool;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Type(BSTR* Type/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Type"), DISPID(205));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Type /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_Type(void)
{
  BSTR Type;
  this->get_Type(&Type);
  return Type;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Left(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowser2DispT<T>::get_Left(void)
{
  long pl;
  this->get_Left(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Left(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Left"), DISPID(206));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Top(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowser2DispT<T>::get_Top(void)
{
  long pl;
  this->get_Top(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Top(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Top"), DISPID(207));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Width(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowser2DispT<T>::get_Width(void)
{
  long pl;
  this->get_Width(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Width(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Width"), DISPID(208));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Height(long* pl/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pl /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IWebBrowser2DispT<T>::get_Height(void)
{
  long pl;
  this->get_Height(&pl);
  return pl;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::set_Height(long pl/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Height"), DISPID(209));
  TAutoArgs<1> _args;
  _args[1] = pl /*[VT_I4:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_LocationName(BSTR* LocationName/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationName"), DISPID(210));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationName /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_LocationName(void)
{
  BSTR LocationName;
  this->get_LocationName(&LocationName);
  return LocationName;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_LocationURL(BSTR* LocationURL/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("LocationURL"), DISPID(211));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(LocationURL /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IWebBrowser2DispT<T>::get_LocationURL(void)
{
  BSTR LocationURL;
  this->get_LocationURL(&LocationURL);
  return LocationURL;
}

template <class T> HRESULT __fastcall
IWebBrowser2DispT<T>::get_Busy(TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Busy"), DISPID(212));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IWebBrowser2DispT<T>::get_Busy(void)
{
  TOLEBOOL pBool;
  this->get_Busy(&pBool);
  return pBool;
}

// *********************************************************************//
// DispIntf:  DWebBrowserEvents2
// Flags:     (4112) Hidden Dispatchable
// GUID:      {34A715A0-6587-11D0-924A-0020AFC7AC4D}
// *********************************************************************//
template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::StatusTextChange(BSTR Text/*[in]*/)
{
  static _TDispID _dispid(/* StatusTextChange */ DISPID(102));
  TAutoArgs<1> _args;
  _args[1] = Text /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::ProgressChange(long Progress/*[in]*/, long ProgressMax/*[in]*/)
{
  static _TDispID _dispid(/* ProgressChange */ DISPID(108));
  TAutoArgs<2> _args;
  _args[1] = Progress /*[VT_I4:0]*/;
  _args[2] = ProgressMax /*[VT_I4:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::CommandStateChange(long Command/*[in]*/, TOLEBOOL Enable/*[in]*/)
{
  static _TDispID _dispid(/* CommandStateChange */ DISPID(105));
  TAutoArgs<2> _args;
  _args[1] = Command /*[VT_I4:0]*/;
  _args[2] = Enable /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::DownloadBegin()
{
  static _TDispID _dispid(/* DownloadBegin */ DISPID(106));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::DownloadComplete()
{
  static _TDispID _dispid(/* DownloadComplete */ DISPID(104));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::TitleChange(BSTR Text/*[in]*/)
{
  static _TDispID _dispid(/* TitleChange */ DISPID(113));
  TAutoArgs<1> _args;
  _args[1] = Text /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::PropertyChange(BSTR szProperty/*[in]*/)
{
  static _TDispID _dispid(/* PropertyChange */ DISPID(112));
  TAutoArgs<1> _args;
  _args[1] = szProperty /*[VT_BSTR:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::BeforeNavigate2(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/, 
                                            TVariant* Flags/*[in]*/, 
                                            TVariant* TargetFrameName/*[in]*/, 
                                            TVariant* PostData/*[in]*/, TVariant* Headers/*[in]*/, 
                                            TOLEBOOL* Cancel/*[in,out]*/)
{
  static _TDispID _dispid(/* BeforeNavigate2 */ DISPID(250));
  TAutoArgs<7> _args;
  _args[1] = pDisp /*[VT_DISPATCH:0]*/;
  _args[2] = URL /*[VT_VARIANT:1]*/;
  _args[3] = Flags /*[VT_VARIANT:1]*/;
  _args[4] = TargetFrameName /*[VT_VARIANT:1]*/;
  _args[5] = PostData /*[VT_VARIANT:1]*/;
  _args[6] = Headers /*[VT_VARIANT:1]*/;
  _args[7] = Cancel /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::NewWindow2(LPDISPATCH* ppDisp/*[in,out]*/, TOLEBOOL* Cancel/*[in,out]*/)
{
  static _TDispID _dispid(/* NewWindow2 */ DISPID(251));
  TAutoArgs<2> _args;
  _args[1] = ppDisp /*[VT_DISPATCH:1]*/;
  _args[2] = Cancel /*[VT_BOOL:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::NavigateComplete2(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/)
{
  static _TDispID _dispid(/* NavigateComplete2 */ DISPID(252));
  TAutoArgs<2> _args;
  _args[1] = pDisp /*[VT_DISPATCH:0]*/;
  _args[2] = URL /*[VT_VARIANT:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::DocumentComplete(LPDISPATCH pDisp/*[in]*/, TVariant* URL/*[in]*/)
{
  static _TDispID _dispid(/* DocumentComplete */ DISPID(259));
  TAutoArgs<2> _args;
  _args[1] = pDisp /*[VT_DISPATCH:0]*/;
  _args[2] = URL /*[VT_VARIANT:1]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnQuit()
{
  static _TDispID _dispid(/* OnQuit */ DISPID(253));
  OleProcedure(_dispid);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnVisible(TOLEBOOL Visible/*[in]*/)
{
  static _TDispID _dispid(/* OnVisible */ DISPID(254));
  TAutoArgs<1> _args;
  _args[1] = Visible /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnToolBar(TOLEBOOL ToolBar/*[in]*/)
{
  static _TDispID _dispid(/* OnToolBar */ DISPID(255));
  TAutoArgs<1> _args;
  _args[1] = ToolBar /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnMenuBar(TOLEBOOL MenuBar/*[in]*/)
{
  static _TDispID _dispid(/* OnMenuBar */ DISPID(256));
  TAutoArgs<1> _args;
  _args[1] = MenuBar /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnStatusBar(TOLEBOOL StatusBar/*[in]*/)
{
  static _TDispID _dispid(/* OnStatusBar */ DISPID(257));
  TAutoArgs<1> _args;
  _args[1] = StatusBar /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnFullScreen(TOLEBOOL FullScreen/*[in]*/)
{
  static _TDispID _dispid(/* OnFullScreen */ DISPID(258));
  TAutoArgs<1> _args;
  _args[1] = FullScreen /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DWebBrowserEvents2DispT<T>::OnTheaterMode(TOLEBOOL TheaterMode/*[in]*/)
{
  static _TDispID _dispid(/* OnTheaterMode */ DISPID(260));
  TAutoArgs<1> _args;
  _args[1] = TheaterMode /*[VT_BOOL:0]*/;
  OleProcedure(_dispid, _args);
}

// *********************************************************************//
// SmartIntf: TCOMIFolderViewOC
// Interface: IFolderViewOC
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIFolderViewOCT<T>::SetFolderView(LPDISPATCH pDisp/*[in]*/)
{
  return (*this)->SetFolderView(pDisp);
}

// *********************************************************************//
// DispIntf:  IFolderViewOC
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9BA05970-F6A8-11CF-A442-00A0C90A8F39}
// *********************************************************************//
template <class T> HRESULT __fastcall
IFolderViewOCDispT<T>::SetFolderView(LPDISPATCH pDisp/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("SetFolderView"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<1> _args;
  _args[1] = pDisp /*[VT_DISPATCH:0]*/;
  return OleFunction(_dispid, _args);
}

// *********************************************************************//
// DispIntf:  DShellFolderViewEvents
// Flags:     (4096) Dispatchable
// GUID:      {62112AA2-EBE4-11CF-A5FB-0020AFE7292D}
// *********************************************************************//
template <class T> void __fastcall
DShellFolderViewEventsDispT<T>::SelectionChanged()
{
  static _TDispID _dispid(/* SelectionChanged */ DISPID(200));
  OleProcedure(_dispid);
}

// *********************************************************************//
// DispIntf:  DShellWindowsEvents
// Flags:     (4096) Dispatchable
// GUID:      {FE4106E0-399A-11D0-A48C-00A0C90A8F39}
// *********************************************************************//
template <class T> void __fastcall
DShellWindowsEventsDispT<T>::WindowRegistered(long lCookie/*[in]*/)
{
  static _TDispID _dispid(/* WindowRegistered */ DISPID(200));
  TAutoArgs<1> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  OleProcedure(_dispid, _args);
}

template <class T> void __fastcall
DShellWindowsEventsDispT<T>::WindowRevoked(long lCookie/*[in]*/)
{
  static _TDispID _dispid(/* WindowRevoked */ DISPID(201));
  TAutoArgs<1> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  OleProcedure(_dispid, _args);
}

// *********************************************************************//
// SmartIntf: TCOMIShellWindows
// Interface: IShellWindows
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::get_Count(long* Count/*[out,retval]*/)
{
  return (*this)->get_Count(Count);
}

template <class T> long __fastcall
TCOMIShellWindowsT<T>::get_Count(void)
{
  long Count;
  OLECHECK(this->get_Count(&Count));
  return Count;
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::Item(TVariant index/*[in,opt]*/, LPDISPATCH* Folder/*[out,retval]*/)
{
  return (*this)->Item(index, Folder);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellWindowsT<T>::Item(TVariant index/*[in,opt]*/)
{
  LPDISPATCH Folder= 0;
  OLECHECK(this->Item(index, &Folder));
  return Folder;
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::_NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/)
{
  return (*this)->_NewEnum(ppunk);
}

template <class T> LPUNKNOWN __fastcall
TCOMIShellWindowsT<T>::_NewEnum(void)
{
  LPUNKNOWN ppunk= 0;
  OLECHECK(this->_NewEnum(&ppunk));
  return ppunk;
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::Register(LPDISPATCH pid/*[in]*/, long HWND/*[in]*/, int swClass/*[in]*/, 
                                long* plCookie/*[out]*/)
{
  return (*this)->Register(pid, HWND, swClass, plCookie);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::RegisterPending(long lThreadId/*[in]*/, TVariant* pvarloc/*[in]*/, 
                                       TVariant* pvarlocRoot/*[in]*/, int swClass/*[in]*/, 
                                       long* plCookie/*[out]*/)
{
  return (*this)->RegisterPending(lThreadId, pvarloc, pvarlocRoot, swClass, plCookie);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::Revoke(long lCookie/*[in]*/)
{
  return (*this)->Revoke(lCookie);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::OnNavigate(long lCookie/*[in]*/, TVariant* pvarloc/*[in]*/)
{
  return (*this)->OnNavigate(lCookie, pvarloc);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::OnActivated(long lCookie/*[in]*/, TOLEBOOL fActive/*[in]*/)
{
  return (*this)->OnActivated(lCookie, fActive);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                  int swClass/*[in]*/, long* pHWND/*[out]*/, int swfwOptions/*[in]*/, 
                                  LPDISPATCH* ppdispOut/*[out,retval]*/)
{
  return (*this)->FindWindow(pvarloc, pvarlocRoot, swClass, pHWND, swfwOptions, ppdispOut);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellWindowsT<T>::FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                  int swClass/*[in]*/, long* pHWND/*[out]*/, int swfwOptions/*[in]*/)
{
  LPDISPATCH ppdispOut= 0;
  OLECHECK(this->FindWindow(pvarloc, pvarlocRoot, swClass, pHWND, swfwOptions, &ppdispOut));
  return ppdispOut;
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::OnCreated(long lCookie/*[in]*/, LPUNKNOWN punk/*[in]*/)
{
  return (*this)->OnCreated(lCookie, punk);
}

template <class T> HRESULT __fastcall
TCOMIShellWindowsT<T>::ProcessAttachDetach(TOLEBOOL fAttach/*[in]*/)
{
  return (*this)->ProcessAttachDetach(fAttach);
}

// *********************************************************************//
// DispIntf:  IShellWindows
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {85CB6900-4D95-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::get_Count(long* Count/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Count"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(Count /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IShellWindowsDispT<T>::get_Count(void)
{
  long Count;
  this->get_Count(&Count);
  return Count;
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::Item(TVariant index/*[in,opt]*/, LPDISPATCH* Folder/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Item"), DISPID(0));
  TAutoArgs<1> _args;
  _args[1] = index /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr(Folder /*[VT_DISPATCH:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellWindowsDispT<T>::Item(TVariant index/*[in,opt]*/)
{
  LPDISPATCH Folder;
  this->Item(index, &Folder);
  return Folder;
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::_NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("_NewEnum"), DISPID(-4));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppunk /*[VT_UNKNOWN:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPUNKNOWN __fastcall
IShellWindowsDispT<T>::_NewEnum(void)
{
  LPUNKNOWN ppunk;
  this->_NewEnum(&ppunk);
  return ppunk;
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::Register(LPDISPATCH pid/*[in]*/, long HWND/*[in]*/, int swClass/*[in]*/, 
                                long* plCookie/*[out]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Register"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<4> _args;
  _args[1] = pid /*[VT_DISPATCH:0]*/;
  _args[2] = HWND /*[VT_I4:0]*/;
  _args[3] = swClass /*[VT_INT:0]*/;
  _args[4] = plCookie /*[VT_I4:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::RegisterPending(long lThreadId/*[in]*/, TVariant* pvarloc/*[in]*/, 
                                       TVariant* pvarlocRoot/*[in]*/, int swClass/*[in]*/, 
                                       long* plCookie/*[out]*/)
{
  static _TDispID _dispid(*this, OLETEXT("RegisterPending"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<5> _args;
  _args[1] = lThreadId /*[VT_I4:0]*/;
  _args[2] = pvarloc /*[VT_VARIANT:1]*/;
  _args[3] = pvarlocRoot /*[VT_VARIANT:1]*/;
  _args[4] = swClass /*[VT_INT:0]*/;
  _args[5] = plCookie /*[VT_I4:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::Revoke(long lCookie/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Revoke"), DISPID(DISPID_UNKNOWN/*[1610743813]*/));
  TAutoArgs<1> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::OnNavigate(long lCookie/*[in]*/, TVariant* pvarloc/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("OnNavigate"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<2> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  _args[2] = pvarloc /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::OnActivated(long lCookie/*[in]*/, TOLEBOOL fActive/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("OnActivated"), DISPID(DISPID_UNKNOWN/*[1610743815]*/));
  TAutoArgs<2> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  _args[2] = fActive /*[VT_BOOL:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                  int swClass/*[in]*/, long* pHWND/*[out]*/, int swfwOptions/*[in]*/
                                  , LPDISPATCH* ppdispOut/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FindWindow"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<5> _args;
  _args[1] = pvarloc /*[VT_VARIANT:1]*/;
  _args[2] = pvarlocRoot /*[VT_VARIANT:1]*/;
  _args[3] = swClass /*[VT_INT:0]*/;
  _args[4] = pHWND /*[VT_I4:1]*/;
  _args[5] = swfwOptions /*[VT_INT:0]*/;
  return OutRetValSetterPtr(ppdispOut /*[VT_DISPATCH:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellWindowsDispT<T>::FindWindow(TVariant* pvarloc/*[in]*/, TVariant* pvarlocRoot/*[in]*/, 
                                  int swClass/*[in]*/, long* pHWND/*[out]*/, int swfwOptions/*[in]*/)
{
  LPDISPATCH ppdispOut;
  this->FindWindow(pvarloc, pvarlocRoot, swClass, pHWND, swfwOptions, &ppdispOut);
  return ppdispOut;
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::OnCreated(long lCookie/*[in]*/, LPUNKNOWN punk/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("OnCreated"), DISPID(DISPID_UNKNOWN/*[1610743817]*/));
  TAutoArgs<2> _args;
  _args[1] = lCookie /*[VT_I4:0]*/;
  _args[2] = punk /*[VT_UNKNOWN:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellWindowsDispT<T>::ProcessAttachDetach(TOLEBOOL fAttach/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ProcessAttachDetach"), DISPID(DISPID_UNKNOWN/*[1610743818]*/));
  TAutoArgs<1> _args;
  _args[1] = fAttach /*[VT_BOOL:0]*/;
  return OleFunction(_dispid, _args);
}

// *********************************************************************//
// SmartIntf: TCOMIShellLinkDual
// Interface: IShellLinkDual
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_Path(BSTR* pbs/*[out,retval]*/)
{
  return (*this)->get_Path(pbs);
}

template <class T> BSTR __fastcall
TCOMIShellLinkDualT<T>::get_Path(void)
{
  BSTR pbs= 0;
  OLECHECK(this->get_Path(&pbs));
  return pbs;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_Path(BSTR pbs/*[in]*/)
{
  return (*this)->set_Path(pbs);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_Description(BSTR* pbs/*[out,retval]*/)
{
  return (*this)->get_Description(pbs);
}

template <class T> BSTR __fastcall
TCOMIShellLinkDualT<T>::get_Description(void)
{
  BSTR pbs= 0;
  OLECHECK(this->get_Description(&pbs));
  return pbs;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_Description(BSTR pbs/*[in]*/)
{
  return (*this)->set_Description(pbs);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_WorkingDirectory(BSTR* pbs/*[out,retval]*/)
{
  return (*this)->get_WorkingDirectory(pbs);
}

template <class T> BSTR __fastcall
TCOMIShellLinkDualT<T>::get_WorkingDirectory(void)
{
  BSTR pbs= 0;
  OLECHECK(this->get_WorkingDirectory(&pbs));
  return pbs;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_WorkingDirectory(BSTR pbs/*[in]*/)
{
  return (*this)->set_WorkingDirectory(pbs);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_Arguments(BSTR* pbs/*[out,retval]*/)
{
  return (*this)->get_Arguments(pbs);
}

template <class T> BSTR __fastcall
TCOMIShellLinkDualT<T>::get_Arguments(void)
{
  BSTR pbs= 0;
  OLECHECK(this->get_Arguments(&pbs));
  return pbs;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_Arguments(BSTR pbs/*[in]*/)
{
  return (*this)->set_Arguments(pbs);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_Hotkey(int* piHK/*[out,retval]*/)
{
  return (*this)->get_Hotkey(piHK);
}

template <class T> int __fastcall
TCOMIShellLinkDualT<T>::get_Hotkey(void)
{
  int piHK;
  OLECHECK(this->get_Hotkey(&piHK));
  return piHK;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_Hotkey(int piHK/*[in]*/)
{
  return (*this)->set_Hotkey(piHK);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::get_ShowCommand(int* piShowCommand/*[out,retval]*/)
{
  return (*this)->get_ShowCommand(piShowCommand);
}

template <class T> int __fastcall
TCOMIShellLinkDualT<T>::get_ShowCommand(void)
{
  int piShowCommand;
  OLECHECK(this->get_ShowCommand(&piShowCommand));
  return piShowCommand;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::set_ShowCommand(int piShowCommand/*[in]*/)
{
  return (*this)->set_ShowCommand(piShowCommand);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::Resolve(int fFlags/*[in]*/)
{
  return (*this)->Resolve(fFlags);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::GetIconLocation(BSTR* pbs/*[out]*/, int* piIcon/*[out,retval]*/)
{
  return (*this)->GetIconLocation(pbs, piIcon);
}

template <class T> int __fastcall
TCOMIShellLinkDualT<T>::GetIconLocation(BSTR* pbs/*[out]*/)
{
  int piIcon;
  OLECHECK(this->GetIconLocation(pbs, &piIcon));
  return piIcon;
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::SetIconLocation(BSTR bs/*[in]*/, int iIcon/*[in]*/)
{
  return (*this)->SetIconLocation(bs, iIcon);
}

template <class T> HRESULT __fastcall
TCOMIShellLinkDualT<T>::Save(TVariant vWhere/*[in,opt]*/)
{
  return (*this)->Save(vWhere);
}

// *********************************************************************//
// DispIntf:  IShellLinkDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {88A05C00-F000-11CE-8350-444553540000}
// *********************************************************************//
template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_Path(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Path"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IShellLinkDualDispT<T>::get_Path(void)
{
  BSTR pbs;
  this->get_Path(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_Path(BSTR pbs/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Path"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_Description(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Description"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IShellLinkDualDispT<T>::get_Description(void)
{
  BSTR pbs;
  this->get_Description(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_Description(BSTR pbs/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Description"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_WorkingDirectory(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("WorkingDirectory"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IShellLinkDualDispT<T>::get_WorkingDirectory(void)
{
  BSTR pbs;
  this->get_WorkingDirectory(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_WorkingDirectory(BSTR pbs/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("WorkingDirectory"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_Arguments(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Arguments"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
IShellLinkDualDispT<T>::get_Arguments(void)
{
  BSTR pbs;
  this->get_Arguments(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_Arguments(BSTR pbs/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Arguments"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_Hotkey(int* piHK/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Hotkey"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(piHK /*[VT_INT:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> int __fastcall
IShellLinkDualDispT<T>::get_Hotkey(void)
{
  int piHK;
  this->get_Hotkey(&piHK);
  return piHK;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_Hotkey(int piHK/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Hotkey"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<1> _args;
  _args[1] = piHK /*[VT_INT:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::get_ShowCommand(int* piShowCommand/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ShowCommand"), DISPID(DISPID_UNKNOWN/*[1610743818]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(piShowCommand /*[VT_INT:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> int __fastcall
IShellLinkDualDispT<T>::get_ShowCommand(void)
{
  int piShowCommand;
  this->get_ShowCommand(&piShowCommand);
  return piShowCommand;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::set_ShowCommand(int piShowCommand/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ShowCommand"), DISPID(DISPID_UNKNOWN/*[1610743818]*/));
  TAutoArgs<1> _args;
  _args[1] = piShowCommand /*[VT_INT:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::Resolve(int fFlags/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Resolve"), DISPID(DISPID_UNKNOWN/*[1610743820]*/));
  TAutoArgs<1> _args;
  _args[1] = fFlags /*[VT_INT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::GetIconLocation(BSTR* pbs/*[out]*/, int* piIcon/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetIconLocation"), DISPID(DISPID_UNKNOWN/*[1610743821]*/));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:1]*/;
  return OutRetValSetterPtr(piIcon /*[VT_INT:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> int __fastcall
IShellLinkDualDispT<T>::GetIconLocation(BSTR* pbs/*[out]*/)
{
  int piIcon;
  this->GetIconLocation(pbs, &piIcon);
  return piIcon;
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::SetIconLocation(BSTR bs/*[in]*/, int iIcon/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("SetIconLocation"), DISPID(DISPID_UNKNOWN/*[1610743822]*/));
  TAutoArgs<2> _args;
  _args[1] = bs /*[VT_BSTR:0]*/;
  _args[2] = iIcon /*[VT_INT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellLinkDualDispT<T>::Save(TVariant vWhere/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Save"), DISPID(DISPID_UNKNOWN/*[1610743823]*/));
  TAutoArgs<1> _args;
  _args[1] = vWhere /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

// *********************************************************************//
// DispIntf:  FolderItemVerb
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {08EC3E00-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template <class T> HRESULT __fastcall
FolderItemVerbDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemVerbDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemVerbDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemVerbDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemVerbDispT<T>::get_Name(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Name"), DISPID(0));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderItemVerbDispT<T>::get_Name(void)
{
  BSTR pbs;
  this->get_Name(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
FolderItemVerbDispT<T>::DoIt()
{
  static _TDispID _dispid(*this, OLETEXT("DoIt"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  return OleFunction(_dispid);
}

// *********************************************************************//
// DispIntf:  FolderItemVerbs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F8352C0-50B0-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template <class T> HRESULT __fastcall
FolderItemVerbsDispT<T>::get_Count(long* plCount/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Count"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(plCount /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
FolderItemVerbsDispT<T>::get_Count(void)
{
  long plCount;
  this->get_Count(&plCount);
  return plCount;
}

template <class T> HRESULT __fastcall
FolderItemVerbsDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemVerbsDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemVerbsDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemVerbsDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemVerbsDispT<T>::Item(TVariant index/*[in,opt]*/, 
                              Shdocvw_tlb::FolderItemVerb** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Item"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<1> _args;
  _args[1] = index /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItemVerb* __fastcall
FolderItemVerbsDispT<T>::Item(TVariant index/*[in,opt]*/)
{
  Shdocvw_tlb::FolderItemVerb* ppid;
  this->Item(index, &ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemVerbsDispT<T>::_NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("_NewEnum"), DISPID(-4));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppunk /*[VT_UNKNOWN:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPUNKNOWN __fastcall
FolderItemVerbsDispT<T>::_NewEnum(void)
{
  LPUNKNOWN ppunk;
  this->_NewEnum(&ppunk);
  return ppunk;
}

// *********************************************************************//
// DispIntf:  Folder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BBCBDE60-C3FF-11CE-8350-444553540000}
// *********************************************************************//
template <class T> HRESULT __fastcall
FolderDispT<T>::get_Title(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Title"), DISPID(0));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderDispT<T>::get_Title(void)
{
  BSTR pbs;
  this->get_Title(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::get_ParentFolder(Shdocvw_tlb::Folder** ppsf/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ParentFolder"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppsf /*[VT_USERDEFINED:2]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> Shdocvw_tlb::Folder* __fastcall
FolderDispT<T>::get_ParentFolder(void)
{
  Shdocvw_tlb::Folder* ppsf;
  this->get_ParentFolder(&ppsf);
  return ppsf;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::Items(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Items"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItems* __fastcall
FolderDispT<T>::Items(void)
{
  Shdocvw_tlb::FolderItems* ppid;
  this->Items(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::ParseName(BSTR bName/*[in]*/, Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ParseName"), DISPID(DISPID_UNKNOWN/*[1610743813]*/));
  TAutoArgs<1> _args;
  _args[1] = bName /*[VT_BSTR:0]*/;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItem* __fastcall
FolderDispT<T>::ParseName(BSTR bName/*[in]*/)
{
  Shdocvw_tlb::FolderItem* ppid;
  this->ParseName(bName, &ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderDispT<T>::NewFolder(BSTR bName/*[in]*/, TVariant vOptions/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("NewFolder"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<2> _args;
  _args[1] = bName /*[VT_BSTR:0]*/;
  _args[2] = vOptions /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
FolderDispT<T>::MoveHere(TVariant vItem/*[in]*/, TVariant vOptions/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("MoveHere"), DISPID(DISPID_UNKNOWN/*[1610743815]*/));
  TAutoArgs<2> _args;
  _args[1] = vItem /*[VT_VARIANT:0]*/;
  _args[2] = vOptions /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
FolderDispT<T>::CopyHere(TVariant vItem/*[in]*/, TVariant vOptions/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("CopyHere"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<2> _args;
  _args[1] = vItem /*[VT_VARIANT:0]*/;
  _args[2] = vOptions /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
FolderDispT<T>::GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/, BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetDetailsOf"), DISPID(DISPID_UNKNOWN/*[1610743817]*/));
  TAutoArgs<2> _args;
  _args[1] = vItem /*[VT_VARIANT:0]*/;
  _args[2] = iColumn /*[VT_INT:0]*/;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderDispT<T>::GetDetailsOf(TVariant vItem/*[in]*/, int iColumn/*[in]*/)
{
  BSTR pbs;
  this->GetDetailsOf(vItem, iColumn, &pbs);
  return pbs;
}

// *********************************************************************//
// DispIntf:  FolderItems
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {744129E0-CBE5-11CE-8350-444553540000}
// *********************************************************************//
template <class T> HRESULT __fastcall
FolderItemsDispT<T>::get_Count(long* plCount/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Count"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(plCount /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
FolderItemsDispT<T>::get_Count(void)
{
  long plCount;
  this->get_Count(&plCount);
  return plCount;
}

template <class T> HRESULT __fastcall
FolderItemsDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemsDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemsDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemsDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemsDispT<T>::Item(TVariant index/*[in,opt]*/, Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Item"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<1> _args;
  _args[1] = index /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItem* __fastcall
FolderItemsDispT<T>::Item(TVariant index/*[in,opt]*/)
{
  Shdocvw_tlb::FolderItem* ppid;
  this->Item(index, &ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemsDispT<T>::_NewEnum(LPUNKNOWN* ppunk/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("_NewEnum"), DISPID(-4));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppunk /*[VT_UNKNOWN:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPUNKNOWN __fastcall
FolderItemsDispT<T>::_NewEnum(void)
{
  LPUNKNOWN ppunk;
  this->_NewEnum(&ppunk);
  return ppunk;
}

// *********************************************************************//
// DispIntf:  FolderItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FAC32C80-CBE4-11CE-8350-444553540000}
// *********************************************************************//
template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Name(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Name"), DISPID(0));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderItemDispT<T>::get_Name(void)
{
  BSTR pbs;
  this->get_Name(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::set_Name(BSTR pbs/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Name"), DISPID(0));
  TAutoArgs<1> _args;
  _args[1] = pbs /*[VT_BSTR:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Path(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Path"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderItemDispT<T>::get_Path(void)
{
  BSTR pbs;
  this->get_Path(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_GetLink(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetLink"), DISPID(DISPID_UNKNOWN/*[1610743813]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemDispT<T>::get_GetLink(void)
{
  LPDISPATCH ppid;
  this->get_GetLink(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_GetFolder(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("GetFolder"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
FolderItemDispT<T>::get_GetFolder(void)
{
  LPDISPATCH ppid;
  this->get_GetFolder(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_IsLink(TOLEBOOL* pb/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("IsLink"), DISPID(DISPID_UNKNOWN/*[1610743815]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pb /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
FolderItemDispT<T>::get_IsLink(void)
{
  TOLEBOOL pb;
  this->get_IsLink(&pb);
  return pb;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_IsFolder(TOLEBOOL* pb/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("IsFolder"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pb /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
FolderItemDispT<T>::get_IsFolder(void)
{
  TOLEBOOL pb;
  this->get_IsFolder(&pb);
  return pb;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_IsFileSystem(TOLEBOOL* pb/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("IsFileSystem"), DISPID(DISPID_UNKNOWN/*[1610743817]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pb /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
FolderItemDispT<T>::get_IsFileSystem(void)
{
  TOLEBOOL pb;
  this->get_IsFileSystem(&pb);
  return pb;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_IsBrowsable(TOLEBOOL* pb/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("IsBrowsable"), DISPID(DISPID_UNKNOWN/*[1610743818]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pb /*[VT_BOOL:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
FolderItemDispT<T>::get_IsBrowsable(void)
{
  TOLEBOOL pb;
  this->get_IsBrowsable(&pb);
  return pb;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_ModifyDate(DATE* pdt/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ModifyDate"), DISPID(DISPID_UNKNOWN/*[1610743819]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pdt /*[VT_DATE:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> DATE __fastcall
FolderItemDispT<T>::get_ModifyDate(void)
{
  DATE pdt;
  this->get_ModifyDate(&pdt);
  return pdt;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::set_ModifyDate(DATE pdt/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ModifyDate"), DISPID(DISPID_UNKNOWN/*[1610743819]*/));
  TAutoArgs<1> _args;
  _args[1] = pdt /*[VT_DATE:0]*/;
  return OlePropertyPut(_dispid, _args);
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Size(long* pul/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Size"), DISPID(DISPID_UNKNOWN/*[1610743821]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pul /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
FolderItemDispT<T>::get_Size(void)
{
  long pul;
  this->get_Size(&pul);
  return pul;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::get_Type(BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Type"), DISPID(DISPID_UNKNOWN/*[1610743822]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> BSTR __fastcall
FolderItemDispT<T>::get_Type(void)
{
  BSTR pbs;
  this->get_Type(&pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::Verbs(Shdocvw_tlb::FolderItemVerbs** ppfic/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Verbs"), DISPID(DISPID_UNKNOWN/*[1610743823]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppfic /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItemVerbs* __fastcall
FolderItemDispT<T>::Verbs(void)
{
  Shdocvw_tlb::FolderItemVerbs* ppfic;
  this->Verbs(&ppfic);
  return ppfic;
}

template <class T> HRESULT __fastcall
FolderItemDispT<T>::InvokeVerb(TVariant vVerb/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("InvokeVerb"), DISPID(DISPID_UNKNOWN/*[1610743824]*/));
  TAutoArgs<1> _args;
  _args[1] = vVerb /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

// *********************************************************************//
// SmartIntf: TCOMIShellFolderViewDual
// Interface: IShellFolderViewDual
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  return (*this)->get_Application_(ppid);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellFolderViewDualT<T>::get_Application_(void)
{
  LPDISPATCH ppid= 0;
  OLECHECK(this->get_Application_(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  return (*this)->get_Parent(ppid);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellFolderViewDualT<T>::get_Parent(void)
{
  LPDISPATCH ppid= 0;
  OLECHECK(this->get_Parent(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_Folder_(Shdocvw_tlb::Folder** ppid/*[out,retval]*/)
{
  return (*this)->get_Folder_(ppid);
}

template <class T> Shdocvw_tlb::Folder* __fastcall
TCOMIShellFolderViewDualT<T>::get_Folder_(void)
{
  Shdocvw_tlb::Folder* ppid= 0;
  OLECHECK(this->get_Folder_(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::SelectedItems(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/)
{
  return (*this)->SelectedItems(ppid);
}

template <class T> Shdocvw_tlb::FolderItems* __fastcall
TCOMIShellFolderViewDualT<T>::SelectedItems(void)
{
  Shdocvw_tlb::FolderItems* ppid= 0;
  OLECHECK(this->SelectedItems(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_FocusedItem(Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/)
{
  return (*this)->get_FocusedItem(ppid);
}

template <class T> Shdocvw_tlb::FolderItem* __fastcall
TCOMIShellFolderViewDualT<T>::get_FocusedItem(void)
{
  Shdocvw_tlb::FolderItem* ppid= 0;
  OLECHECK(this->get_FocusedItem(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::SelectItem(TVariant* pvfi/*[in]*/, int dwFlags/*[in]*/)
{
  return (*this)->SelectItem(pvfi, dwFlags);
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                            TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/, 
                                            BSTR* pbs/*[out,retval]*/)
{
  return (*this)->PopupItemMenu(pfi, vx, vy, pbs);
}

template <class T> BSTR __fastcall
TCOMIShellFolderViewDualT<T>::PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                            TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/)
{
  BSTR pbs= 0;
  OLECHECK(this->PopupItemMenu(pfi, vx, vy, &pbs));
  return pbs;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_Script(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  return (*this)->get_Script(ppDisp);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellFolderViewDualT<T>::get_Script(void)
{
  LPDISPATCH ppDisp= 0;
  OLECHECK(this->get_Script(&ppDisp));
  return ppDisp;
}

template <class T> HRESULT __fastcall
TCOMIShellFolderViewDualT<T>::get_ViewOptions(long* plViewOptions/*[out,retval]*/)
{
  return (*this)->get_ViewOptions(plViewOptions);
}

template <class T> long __fastcall
TCOMIShellFolderViewDualT<T>::get_ViewOptions(void)
{
  long plViewOptions;
  OLECHECK(this->get_ViewOptions(&plViewOptions));
  return plViewOptions;
}

// *********************************************************************//
// DispIntf:  IShellFolderViewDual
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7A1AF80-4D96-11CF-960C-0080C7F4EE85}
// *********************************************************************//
template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellFolderViewDualDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellFolderViewDualDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_Folder_(Shdocvw_tlb::Folder** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Folder"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> Shdocvw_tlb::Folder* __fastcall
IShellFolderViewDualDispT<T>::get_Folder_(void)
{
  Shdocvw_tlb::Folder* ppid;
  this->get_Folder_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::SelectedItems(Shdocvw_tlb::FolderItems** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("SelectedItems"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItems* __fastcall
IShellFolderViewDualDispT<T>::SelectedItems(void)
{
  Shdocvw_tlb::FolderItems* ppid;
  this->SelectedItems(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_FocusedItem(Shdocvw_tlb::FolderItem** ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("FocusedItem"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr((LPDISPATCH*)ppid /*[VT_USERDEFINED:2]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> Shdocvw_tlb::FolderItem* __fastcall
IShellFolderViewDualDispT<T>::get_FocusedItem(void)
{
  Shdocvw_tlb::FolderItem* ppid;
  this->get_FocusedItem(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::SelectItem(TVariant* pvfi/*[in]*/, int dwFlags/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("SelectItem"), DISPID(DISPID_UNKNOWN/*[1610743813]*/));
  TAutoArgs<2> _args;
  _args[1] = pvfi /*[VT_VARIANT:1]*/;
  _args[2] = dwFlags /*[VT_INT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                            TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/, 
                                            BSTR* pbs/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("PopupItemMenu"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<3> _args;
  _args[1] = (LPDISPATCH)pfi /*[VT_USERDEFINED:1]*/;
  _args[2] = vx /*[VT_VARIANT:0]*/;
  _args[3] = vy /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr(pbs /*[VT_BSTR:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> BSTR __fastcall
IShellFolderViewDualDispT<T>::PopupItemMenu(Shdocvw_tlb::FolderItem* pfi/*[in]*/, 
                                            TVariant vx/*[in,opt]*/, TVariant vy/*[in,opt]*/)
{
  BSTR pbs;
  this->PopupItemMenu(pfi, vx, vy, &pbs);
  return pbs;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_Script(LPDISPATCH* ppDisp/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Script"), DISPID(DISPID_UNKNOWN/*[1610743815]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppDisp /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellFolderViewDualDispT<T>::get_Script(void)
{
  LPDISPATCH ppDisp;
  this->get_Script(&ppDisp);
  return ppDisp;
}

template <class T> HRESULT __fastcall
IShellFolderViewDualDispT<T>::get_ViewOptions(long* plViewOptions/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ViewOptions"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(plViewOptions /*[VT_I4:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> long __fastcall
IShellFolderViewDualDispT<T>::get_ViewOptions(void)
{
  long plViewOptions;
  this->get_ViewOptions(&plViewOptions);
  return plViewOptions;
}

// *********************************************************************//
// SmartIntf: TCOMIShellDispatch
// Interface: IShellDispatch
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  return (*this)->get_Application_(ppid);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellDispatchT<T>::get_Application_(void)
{
  LPDISPATCH ppid= 0;
  OLECHECK(this->get_Application_(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  return (*this)->get_Parent(ppid);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellDispatchT<T>::get_Parent(void)
{
  LPDISPATCH ppid= 0;
  OLECHECK(this->get_Parent(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::NameSpace(TVariant vDir/*[in]*/, Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/)
{
  return (*this)->NameSpace(vDir, ppsdf);
}

template <class T> Shdocvw_tlb::Folder* __fastcall
TCOMIShellDispatchT<T>::NameSpace(TVariant vDir/*[in]*/)
{
  Shdocvw_tlb::Folder* ppsdf= 0;
  OLECHECK(this->NameSpace(vDir, &ppsdf));
  return ppsdf;
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, long Options/*[in]*/, 
                                        TVariant RootFolder/*[in,opt]*/, 
                                        Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/)
{
  return (*this)->BrowseForFolder(HWND, Title, Options, RootFolder, ppsdf);
}

template <class T> Shdocvw_tlb::Folder* __fastcall
TCOMIShellDispatchT<T>::BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, long Options/*[in]*/, 
                                        TVariant RootFolder/*[in,opt]*/)
{
  Shdocvw_tlb::Folder* ppsdf= 0;
  OLECHECK(this->BrowseForFolder(HWND, Title, Options, RootFolder, &ppsdf));
  return ppsdf;
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::Windows(LPDISPATCH* ppid/*[out,retval]*/)
{
  return (*this)->Windows(ppid);
}

template <class T> LPDISPATCH __fastcall
TCOMIShellDispatchT<T>::Windows(void)
{
  LPDISPATCH ppid= 0;
  OLECHECK(this->Windows(&ppid));
  return ppid;
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::Open(TVariant vDir/*[in]*/)
{
  return (*this)->Open(vDir);
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::Explore(TVariant vDir/*[in]*/)
{
  return (*this)->Explore(vDir);
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::MinimizeAll(void)
{
  return (*this)->MinimizeAll();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::UndoMinimizeALL(void)
{
  return (*this)->UndoMinimizeALL();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::FileRun(void)
{
  return (*this)->FileRun();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::CascadeWindows(void)
{
  return (*this)->CascadeWindows();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::TileVertically(void)
{
  return (*this)->TileVertically();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::TileHorizontally(void)
{
  return (*this)->TileHorizontally();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::ShutdownWindows(void)
{
  return (*this)->ShutdownWindows();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::Suspend(void)
{
  return (*this)->Suspend();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::EjectPC(void)
{
  return (*this)->EjectPC();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::SetTime(void)
{
  return (*this)->SetTime();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::TrayProperties(void)
{
  return (*this)->TrayProperties();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::Help(void)
{
  return (*this)->Help();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::FindFiles(void)
{
  return (*this)->FindFiles();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::FindComputer(void)
{
  return (*this)->FindComputer();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::RefreshMenu(void)
{
  return (*this)->RefreshMenu();
}

template <class T> HRESULT __fastcall
TCOMIShellDispatchT<T>::ControlPanelItem(BSTR szDir/*[in]*/)
{
  return (*this)->ControlPanelItem(szDir);
}

// *********************************************************************//
// DispIntf:  IShellDispatch
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D8F015C0-C278-11CE-A49E-444553540000}
// *********************************************************************//
template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::get_Application_(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Application"), DISPID(DISPID_UNKNOWN/*[1610743808]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellDispatchDispT<T>::get_Application_(void)
{
  LPDISPATCH ppid;
  this->get_Application_(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::get_Parent(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Parent"), DISPID(DISPID_UNKNOWN/*[1610743809]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OlePropertyGet(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellDispatchDispT<T>::get_Parent(void)
{
  LPDISPATCH ppid;
  this->get_Parent(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::NameSpace(TVariant vDir/*[in]*/, Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("NameSpace"), DISPID(DISPID_UNKNOWN/*[1610743810]*/));
  TAutoArgs<1> _args;
  _args[1] = vDir /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr((LPDISPATCH*)ppsdf /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::Folder* __fastcall
IShellDispatchDispT<T>::NameSpace(TVariant vDir/*[in]*/)
{
  Shdocvw_tlb::Folder* ppsdf;
  this->NameSpace(vDir, &ppsdf);
  return ppsdf;
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, long Options/*[in]*/
                                        , TVariant RootFolder/*[in,opt]*/, 
                                        Shdocvw_tlb::Folder** ppsdf/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("BrowseForFolder"), DISPID(DISPID_UNKNOWN/*[1610743811]*/));
  TAutoArgs<4> _args;
  _args[1] = HWND /*[VT_I4:0]*/;
  _args[2] = Title /*[VT_BSTR:0]*/;
  _args[3] = Options /*[VT_I4:0]*/;
  _args[4] = RootFolder /*[VT_VARIANT:0]*/;
  return OutRetValSetterPtr((LPDISPATCH*)ppsdf /*[VT_USERDEFINED:2]*/, _args, OleFunction(_dispid, _args));
}

template <class T> Shdocvw_tlb::Folder* __fastcall
IShellDispatchDispT<T>::BrowseForFolder(long HWND/*[in]*/, BSTR Title/*[in]*/, long Options/*[in]*/, 
                                        TVariant RootFolder/*[in,opt]*/)
{
  Shdocvw_tlb::Folder* ppsdf;
  this->BrowseForFolder(HWND, Title, Options, RootFolder, &ppsdf);
  return ppsdf;
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::Windows(LPDISPATCH* ppid/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Windows"), DISPID(DISPID_UNKNOWN/*[1610743812]*/));
  TAutoArgs<0> _args;
  return OutRetValSetterPtr(ppid /*[VT_DISPATCH:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> LPDISPATCH __fastcall
IShellDispatchDispT<T>::Windows(void)
{
  LPDISPATCH ppid;
  this->Windows(&ppid);
  return ppid;
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::Open(TVariant vDir/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Open"), DISPID(DISPID_UNKNOWN/*[1610743813]*/));
  TAutoArgs<1> _args;
  _args[1] = vDir /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::Explore(TVariant vDir/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("Explore"), DISPID(DISPID_UNKNOWN/*[1610743814]*/));
  TAutoArgs<1> _args;
  _args[1] = vDir /*[VT_VARIANT:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::MinimizeAll()
{
  static _TDispID _dispid(*this, OLETEXT("MinimizeAll"), DISPID(DISPID_UNKNOWN/*[1610743815]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::UndoMinimizeALL()
{
  static _TDispID _dispid(*this, OLETEXT("UndoMinimizeALL"), DISPID(DISPID_UNKNOWN/*[1610743816]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::FileRun()
{
  static _TDispID _dispid(*this, OLETEXT("FileRun"), DISPID(DISPID_UNKNOWN/*[1610743817]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::CascadeWindows()
{
  static _TDispID _dispid(*this, OLETEXT("CascadeWindows"), DISPID(DISPID_UNKNOWN/*[1610743818]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::TileVertically()
{
  static _TDispID _dispid(*this, OLETEXT("TileVertically"), DISPID(DISPID_UNKNOWN/*[1610743819]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::TileHorizontally()
{
  static _TDispID _dispid(*this, OLETEXT("TileHorizontally"), DISPID(DISPID_UNKNOWN/*[1610743820]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::ShutdownWindows()
{
  static _TDispID _dispid(*this, OLETEXT("ShutdownWindows"), DISPID(DISPID_UNKNOWN/*[1610743821]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::Suspend()
{
  static _TDispID _dispid(*this, OLETEXT("Suspend"), DISPID(DISPID_UNKNOWN/*[1610743822]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::EjectPC()
{
  static _TDispID _dispid(*this, OLETEXT("EjectPC"), DISPID(DISPID_UNKNOWN/*[1610743823]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::SetTime()
{
  static _TDispID _dispid(*this, OLETEXT("SetTime"), DISPID(DISPID_UNKNOWN/*[1610743824]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::TrayProperties()
{
  static _TDispID _dispid(*this, OLETEXT("TrayProperties"), DISPID(DISPID_UNKNOWN/*[1610743825]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::Help()
{
  static _TDispID _dispid(*this, OLETEXT("Help"), DISPID(DISPID_UNKNOWN/*[1610743826]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::FindFiles()
{
  static _TDispID _dispid(*this, OLETEXT("FindFiles"), DISPID(DISPID_UNKNOWN/*[1610743827]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::FindComputer()
{
  static _TDispID _dispid(*this, OLETEXT("FindComputer"), DISPID(DISPID_UNKNOWN/*[1610743828]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::RefreshMenu()
{
  static _TDispID _dispid(*this, OLETEXT("RefreshMenu"), DISPID(DISPID_UNKNOWN/*[1610743829]*/));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellDispatchDispT<T>::ControlPanelItem(BSTR szDir/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("ControlPanelItem"), DISPID(DISPID_UNKNOWN/*[1610743830]*/));
  TAutoArgs<1> _args;
  _args[1] = szDir /*[VT_BSTR:0]*/;
  return OleFunction(_dispid, _args);
}

// *********************************************************************//
// SmartIntf: TCOMIShellUIHelper
// Interface: IShellUIHelper
// *********************************************************************//
template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::ResetFirstBootMode(void)
{
  return (*this)->ResetFirstBootMode();
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::ResetSafeMode(void)
{
  return (*this)->ResetSafeMode();
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::RefreshOfflineDesktop(void)
{
  return (*this)->RefreshOfflineDesktop();
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::AddFavorite(BSTR URL/*[in]*/, TVariant* Title/*[in,opt]*/)
{
  return (*this)->AddFavorite(URL, Title);
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::AddChannel(BSTR URL/*[in]*/)
{
  return (*this)->AddChannel(URL);
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::AddDesktopComponent(BSTR URL/*[in]*/, BSTR Type/*[in]*/, 
                                            TVariant* Left/*[in,opt]*/, TVariant* Top/*[in,opt]*/, 
                                            TVariant* Width/*[in,opt]*/, 
                                            TVariant* Height/*[in,opt]*/)
{
  return (*this)->AddDesktopComponent(URL, Type, Left, Top, Width, Height);
}

template <class T> HRESULT __fastcall
TCOMIShellUIHelperT<T>::IsSubscribed(BSTR URL/*[in]*/, TOLEBOOL* pBool/*[out,retval]*/)
{
  return (*this)->IsSubscribed(URL, pBool);
}

template <class T> TOLEBOOL __fastcall
TCOMIShellUIHelperT<T>::IsSubscribed(BSTR URL/*[in]*/)
{
  TOLEBOOL pBool;
  OLECHECK(this->IsSubscribed(URL, &pBool));
  return pBool;
}

// *********************************************************************//
// DispIntf:  IShellUIHelper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {729FE2F8-1EA8-11D1-8F85-00C04FC2FBE1}
// *********************************************************************//
template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::ResetFirstBootMode()
{
  static _TDispID _dispid(*this, OLETEXT("ResetFirstBootMode"), DISPID(1));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::ResetSafeMode()
{
  static _TDispID _dispid(*this, OLETEXT("ResetSafeMode"), DISPID(2));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::RefreshOfflineDesktop()
{
  static _TDispID _dispid(*this, OLETEXT("RefreshOfflineDesktop"), DISPID(3));
  return OleFunction(_dispid);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::AddFavorite(BSTR URL/*[in]*/, TVariant* Title/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("AddFavorite"), DISPID(4));
  TAutoArgs<2> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Title /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::AddChannel(BSTR URL/*[in]*/)
{
  static _TDispID _dispid(*this, OLETEXT("AddChannel"), DISPID(5));
  TAutoArgs<1> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::AddDesktopComponent(BSTR URL/*[in]*/, BSTR Type/*[in]*/, 
                                            TVariant* Left/*[in,opt]*/, TVariant* Top/*[in,opt]*/, 
                                            TVariant* Width/*[in,opt]*/, 
                                            TVariant* Height/*[in,opt]*/)
{
  static _TDispID _dispid(*this, OLETEXT("AddDesktopComponent"), DISPID(6));
  TAutoArgs<6> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  _args[2] = Type /*[VT_BSTR:0]*/;
  _args[3] = Left /*[VT_VARIANT:1]*/;
  _args[4] = Top /*[VT_VARIANT:1]*/;
  _args[5] = Width /*[VT_VARIANT:1]*/;
  _args[6] = Height /*[VT_VARIANT:1]*/;
  return OleFunction(_dispid, _args);
}

template <class T> HRESULT __fastcall
IShellUIHelperDispT<T>::IsSubscribed(BSTR URL/*[in]*/, TOLEBOOL* pBool/*[out,retval]*/)
{
  static _TDispID _dispid(*this, OLETEXT("IsSubscribed"), DISPID(7));
  TAutoArgs<1> _args;
  _args[1] = URL /*[VT_BSTR:0]*/;
  return OutRetValSetterPtr(pBool /*[VT_BOOL:1]*/, _args, OleFunction(_dispid, _args));
}

template <class T> TOLEBOOL __fastcall
IShellUIHelperDispT<T>::IsSubscribed(BSTR URL/*[in]*/)
{
  TOLEBOOL pBool;
  this->IsSubscribed(URL, &pBool);
  return pBool;
}

// *********************************************************************//
// The following typedefs expose classes (named CoCoClassName) that     //
// provide static Create() and CreateRemote(LPWSTR machineName) methods //
// for creating an instance of an exposed object. These functions can   //
// be used by client wishing to automate CoClasses exposed by this      //
// typelibrary.                                                         //
// *********************************************************************//

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : InternetExplorer
// Interface: TCOMIWebBrowser2
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIWebBrowser2, IWebBrowser2, &CLSID_InternetExplorer, &IID_IWebBrowser2> CoInternetExplorer;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : ShellWindows
// Interface: TCOMIShellWindows
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellWindows, IShellWindows, &CLSID_ShellWindows, &IID_IShellWindows> CoShellWindows;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : ShellLinkObject
// Interface: TCOMIShellLinkDual
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellLinkDual, IShellLinkDual, &CLSID_ShellLinkObject, &IID_IShellLinkDual> CoShellLinkObject;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : ShellFolderView
// Interface: TCOMIShellFolderViewDual
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellFolderViewDual, IShellFolderViewDual, &CLSID_ShellFolderView, &IID_IShellFolderViewDual> CoShellFolderView;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : Shell
// Interface: TCOMIShellDispatch
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellDispatch, IShellDispatch, &CLSID_Shell, &IID_IShellDispatch> CoShell;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : ShellDispatchInproc
// Interface: TCOMIUnknown
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIUnknown, IUnknown, &CLSID_ShellDispatchInproc, &IID_IUnknown> CoShellDispatchInproc;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : WebViewFolderContents
// Interface: TCOMIShellFolderViewDual
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellFolderViewDual, IShellFolderViewDual, &CLSID_WebViewFolderContents, &IID_IShellFolderViewDual> CoWebViewFolderContents;

// *********************************************************************//
// COCLASS DEFAULT INTERFACE CREATOR
// CoClass  : ShellUIHelper
// Interface: TCOMIShellUIHelper
// *********************************************************************//
typedef TCoClassCreatorT<TCOMIShellUIHelper, IShellUIHelper, &CLSID_ShellUIHelper, &IID_IShellUIHelper> CoShellUIHelper;
#endif  //   __TLB_NO_INTERFACE_WRAPPERS


#if !defined(__TLB_NO_EVENT_WRAPPERS) && defined(USING_ATLVCL)
// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : WebBrowser_V1
// Event Interface : DWebBrowserEvents
// *********************************************************************//
template <class T>
class TEvents_WebBrowser_V1 : public IConnectionPointImpl<T,
                                                 &DIID_DWebBrowserEvents,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_BeforeNavigate(BSTR URL, long Flags, BSTR TargetFrameName, TVariant* PostData, 
                                      BSTR Headers, TOLEBOOL* Cancel);
  void            Fire_NavigateComplete(BSTR URL);
  void            Fire_StatusTextChange(BSTR Text);
  void            Fire_ProgressChange(long Progress, long ProgressMax);
  void            Fire_DownloadComplete(void);
  void            Fire_CommandStateChange(long Command, TOLEBOOL Enable);
  void            Fire_DownloadBegin(void);
  void            Fire_NewWindow(BSTR URL, long Flags, BSTR TargetFrameName, TVariant* PostData, 
                                 BSTR Headers, TOLEBOOL* Processed);
  void            Fire_TitleChange(BSTR Text);
  void            Fire_FrameBeforeNavigate(BSTR URL, long Flags, BSTR TargetFrameName, 
                                           TVariant* PostData, BSTR Headers, TOLEBOOL* Cancel);
  void            Fire_FrameNavigateComplete(BSTR URL);
  void            Fire_FrameNewWindow(BSTR URL, long Flags, BSTR TargetFrameName, TVariant* PostData, 
                                      BSTR Headers, TOLEBOOL* Processed);
  void            Fire_Quit(TOLEBOOL* Cancel);
  void            Fire_WindowMove(void);
  void            Fire_WindowResize(void);
  void            Fire_WindowActivate(void);
  void            Fire_PropertyChange(BSTR Property);
protected:
  DWebBrowserEventsDisp m_EventIntfObj;
};

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_BeforeNavigate(BSTR URL, long Flags, BSTR TargetFrameName, 
                                              TVariant* PostData, BSTR Headers, TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.BeforeNavigate(URL, Flags, TargetFrameName, PostData, Headers, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_NavigateComplete(BSTR URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NavigateComplete(URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_StatusTextChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.StatusTextChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_ProgressChange(long Progress, long ProgressMax)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.ProgressChange(Progress, ProgressMax);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_DownloadComplete(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadComplete();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_CommandStateChange(long Command, TOLEBOOL Enable)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.CommandStateChange(Command, Enable);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_DownloadBegin(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadBegin();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_NewWindow(BSTR URL, long Flags, BSTR TargetFrameName, 
                                         TVariant* PostData, BSTR Headers, TOLEBOOL* Processed)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NewWindow(URL, Flags, TargetFrameName, PostData, Headers, Processed);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_TitleChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.TitleChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_FrameBeforeNavigate(BSTR URL, long Flags, BSTR TargetFrameName, 
                                                   TVariant* PostData, BSTR Headers, 
                                                   TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.FrameBeforeNavigate(URL, Flags, TargetFrameName, PostData, Headers, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_FrameNavigateComplete(BSTR URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.FrameNavigateComplete(URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_FrameNewWindow(BSTR URL, long Flags, BSTR TargetFrameName, 
                                              TVariant* PostData, BSTR Headers, TOLEBOOL* Processed)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.FrameNewWindow(URL, Flags, TargetFrameName, PostData, Headers, Processed);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_Quit(TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.Quit(Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_WindowMove(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.WindowMove();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_WindowResize(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.WindowResize();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_WindowActivate(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.WindowActivate();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser_V1<T>::Fire_PropertyChange(BSTR Property)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.PropertyChange(Property);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : WebBrowser
// Event Interface : DWebBrowserEvents2
// *********************************************************************//
template <class T>
class TEvents_WebBrowser : public IConnectionPointImpl<T,
                                                 &DIID_DWebBrowserEvents2,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_StatusTextChange(BSTR Text);
  void            Fire_ProgressChange(long Progress, long ProgressMax);
  void            Fire_CommandStateChange(long Command, TOLEBOOL Enable);
  void            Fire_DownloadBegin(void);
  void            Fire_DownloadComplete(void);
  void            Fire_TitleChange(BSTR Text);
  void            Fire_PropertyChange(BSTR szProperty);
  void            Fire_BeforeNavigate2(LPDISPATCH pDisp, TVariant* URL, TVariant* Flags, 
                                       TVariant* TargetFrameName, TVariant* PostData, 
                                       TVariant* Headers, TOLEBOOL* Cancel);
  void            Fire_NewWindow2(LPDISPATCH* ppDisp, TOLEBOOL* Cancel);
  void            Fire_NavigateComplete2(LPDISPATCH pDisp, TVariant* URL);
  void            Fire_DocumentComplete(LPDISPATCH pDisp, TVariant* URL);
  void            Fire_OnQuit(void);
  void            Fire_OnVisible(TOLEBOOL Visible);
  void            Fire_OnToolBar(TOLEBOOL ToolBar);
  void            Fire_OnMenuBar(TOLEBOOL MenuBar);
  void            Fire_OnStatusBar(TOLEBOOL StatusBar);
  void            Fire_OnFullScreen(TOLEBOOL FullScreen);
  void            Fire_OnTheaterMode(TOLEBOOL TheaterMode);
protected:
  DWebBrowserEvents2Disp m_EventIntfObj;
};

template <class T> void
TEvents_WebBrowser<T>::Fire_StatusTextChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.StatusTextChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_ProgressChange(long Progress, long ProgressMax)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.ProgressChange(Progress, ProgressMax);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_CommandStateChange(long Command, TOLEBOOL Enable)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.CommandStateChange(Command, Enable);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_DownloadBegin(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadBegin();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_DownloadComplete(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadComplete();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_TitleChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.TitleChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_PropertyChange(BSTR szProperty)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.PropertyChange(szProperty);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_BeforeNavigate2(LPDISPATCH pDisp, TVariant* URL, TVariant* Flags, 
                                            TVariant* TargetFrameName, TVariant* PostData, 
                                            TVariant* Headers, TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.BeforeNavigate2(pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_NewWindow2(LPDISPATCH* ppDisp, TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NewWindow2(ppDisp, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_NavigateComplete2(LPDISPATCH pDisp, TVariant* URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NavigateComplete2(pDisp, URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_DocumentComplete(LPDISPATCH pDisp, TVariant* URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DocumentComplete(pDisp, URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnQuit(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnQuit();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnVisible(TOLEBOOL Visible)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnVisible(Visible);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnToolBar(TOLEBOOL ToolBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnToolBar(ToolBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnMenuBar(TOLEBOOL MenuBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnMenuBar(MenuBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnStatusBar(TOLEBOOL StatusBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnStatusBar(StatusBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnFullScreen(TOLEBOOL FullScreen)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnFullScreen(FullScreen);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_WebBrowser<T>::Fire_OnTheaterMode(TOLEBOOL TheaterMode)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnTheaterMode(TheaterMode);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : InternetExplorer
// Event Interface : DWebBrowserEvents2
// *********************************************************************//
template <class T>
class TEvents_InternetExplorer : public IConnectionPointImpl<T,
                                                 &DIID_DWebBrowserEvents2,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_StatusTextChange(BSTR Text);
  void            Fire_ProgressChange(long Progress, long ProgressMax);
  void            Fire_CommandStateChange(long Command, TOLEBOOL Enable);
  void            Fire_DownloadBegin(void);
  void            Fire_DownloadComplete(void);
  void            Fire_TitleChange(BSTR Text);
  void            Fire_PropertyChange(BSTR szProperty);
  void            Fire_BeforeNavigate2(LPDISPATCH pDisp, TVariant* URL, TVariant* Flags, 
                                       TVariant* TargetFrameName, TVariant* PostData, 
                                       TVariant* Headers, TOLEBOOL* Cancel);
  void            Fire_NewWindow2(LPDISPATCH* ppDisp, TOLEBOOL* Cancel);
  void            Fire_NavigateComplete2(LPDISPATCH pDisp, TVariant* URL);
  void            Fire_DocumentComplete(LPDISPATCH pDisp, TVariant* URL);
  void            Fire_OnQuit(void);
  void            Fire_OnVisible(TOLEBOOL Visible);
  void            Fire_OnToolBar(TOLEBOOL ToolBar);
  void            Fire_OnMenuBar(TOLEBOOL MenuBar);
  void            Fire_OnStatusBar(TOLEBOOL StatusBar);
  void            Fire_OnFullScreen(TOLEBOOL FullScreen);
  void            Fire_OnTheaterMode(TOLEBOOL TheaterMode);
protected:
  DWebBrowserEvents2Disp m_EventIntfObj;
};

template <class T> void
TEvents_InternetExplorer<T>::Fire_StatusTextChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.StatusTextChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_ProgressChange(long Progress, long ProgressMax)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.ProgressChange(Progress, ProgressMax);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_CommandStateChange(long Command, TOLEBOOL Enable)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.CommandStateChange(Command, Enable);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_DownloadBegin(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadBegin();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_DownloadComplete(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DownloadComplete();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_TitleChange(BSTR Text)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.TitleChange(Text);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_PropertyChange(BSTR szProperty)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.PropertyChange(szProperty);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_BeforeNavigate2(LPDISPATCH pDisp, TVariant* URL, TVariant* Flags, 
                                                  TVariant* TargetFrameName, TVariant* PostData, 
                                                  TVariant* Headers, TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.BeforeNavigate2(pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_NewWindow2(LPDISPATCH* ppDisp, TOLEBOOL* Cancel)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NewWindow2(ppDisp, Cancel);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_NavigateComplete2(LPDISPATCH pDisp, TVariant* URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.NavigateComplete2(pDisp, URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_DocumentComplete(LPDISPATCH pDisp, TVariant* URL)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.DocumentComplete(pDisp, URL);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnQuit(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnQuit();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnVisible(TOLEBOOL Visible)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnVisible(Visible);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnToolBar(TOLEBOOL ToolBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnToolBar(ToolBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnMenuBar(TOLEBOOL MenuBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnMenuBar(MenuBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnStatusBar(TOLEBOOL StatusBar)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnStatusBar(StatusBar);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnFullScreen(TOLEBOOL FullScreen)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnFullScreen(FullScreen);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_InternetExplorer<T>::Fire_OnTheaterMode(TOLEBOOL TheaterMode)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.OnTheaterMode(TheaterMode);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : ShellFolderViewOC
// Event Interface : DShellFolderViewEvents
// *********************************************************************//
template <class T>
class TEvents_ShellFolderViewOC : public IConnectionPointImpl<T,
                                                 &DIID_DShellFolderViewEvents,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_SelectionChanged(void);
protected:
  DShellFolderViewEventsDisp m_EventIntfObj;
};

template <class T> void
TEvents_ShellFolderViewOC<T>::Fire_SelectionChanged(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.SelectionChanged();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : ShellWindows
// Event Interface : DShellWindowsEvents
// *********************************************************************//
template <class T>
class TEvents_ShellWindows : public IConnectionPointImpl<T,
                                                 &DIID_DShellWindowsEvents,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_WindowRegistered(long lCookie);
  void            Fire_WindowRevoked(long lCookie);
protected:
  DShellWindowsEventsDisp m_EventIntfObj;
};

template <class T> void
TEvents_ShellWindows<T>::Fire_WindowRegistered(long lCookie)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.WindowRegistered(lCookie);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

template <class T> void
TEvents_ShellWindows<T>::Fire_WindowRevoked(long lCookie)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.WindowRevoked(lCookie);
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : ShellFolderView
// Event Interface : DShellFolderViewEvents
// *********************************************************************//
template <class T>
class TEvents_ShellFolderView : public IConnectionPointImpl<T,
                                                 &DIID_DShellFolderViewEvents,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_SelectionChanged(void);
protected:
  DShellFolderViewEventsDisp m_EventIntfObj;
};

template <class T> void
TEvents_ShellFolderView<T>::Fire_SelectionChanged(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.SelectionChanged();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

// *********************************************************************//
// CONNECTIONPOINT/EVENT PROXY
// CoClass         : WebViewFolderContents
// Event Interface : DShellFolderViewEvents
// *********************************************************************//
template <class T>
class TEvents_WebViewFolderContents : public IConnectionPointImpl<T,
                                                 &DIID_DShellFolderViewEvents,
                                                 CComUnkArray<CONNECTIONPOINT_ARRAY_SIZE> >
{
public:
  void            Fire_SelectionChanged(void);
protected:
  DShellFolderViewEventsDisp m_EventIntfObj;
};

template <class T> void
TEvents_WebViewFolderContents<T>::Fire_SelectionChanged(void)
{
  T * pT = (T*)this;
  pT->Lock();
  IUnknown ** pp = m_vec.begin();
  while (pp < m_vec.end())
  {
    if (*pp != NULL)
    {
      m_EventIntfObj.Attach(*pp);
      m_EventIntfObj.SelectionChanged();
      m_EventIntfObj.Attach(0);
    }
    pp++;
  }
  pT->Unlock();
}

#endif  //   __TLB_NO_EVENT_WRAPPERS

};     // namespace Shdocvw_tlb

#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using  namespace Shdocvw_tlb;
#endif

#pragma option pop

#endif // __SHDocVw_TLB_h__
