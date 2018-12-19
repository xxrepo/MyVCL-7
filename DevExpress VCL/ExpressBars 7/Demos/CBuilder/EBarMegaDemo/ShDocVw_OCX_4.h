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
#ifndef   __SHDocVw_OCX_h__
#define   __SHDocVw_OCX_h__

#pragma option push -b -w-inl

#include <vcl/utilcls.h>
#if !defined(__UTILCLS_H_VERSION) || (__UTILCLS_H_VERSION < 0x0101)
#error "This file requires an newer version of the header file UTILCLS.H"
#endif

#include <olectl.h>
#include <ocidl.h>
#if !defined(_NO_VCL)   // For Console applications that don't use VCL
#include <vcl/stdvcl.hpp>
#endif  //   _NO_VCL
#include <vcl/ocxproxy.h>

#include "SHDocVw_TLB_4.h"
namespace Shdocvw_tlb
{

// *********************************************************************//
// HelpString: Microsoft Internet Controls
// Version:    1.1
// *********************************************************************//


// *********************************************************************//
// OCX PROXY CLASS DECLARATION
// Control Name     : TWebBrowser_V1
// Help String      : WebBrowser Control
// Default Interface: IWebBrowser
// Def. Intf. Object: TCOMIWebBrowser
// Def. Intf. DISP? : No
// Event   Interface: DWebBrowserEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//

// *********************************************************************//
// Definition of closures to allow VCL handlers to catch OCX events.    //
// *********************************************************************//
typedef void __fastcall (__closure * TWebBrowser_V1BeforeNavigate)(System::TObject * Sender, 
                                                                   BSTR URL/*[in]*/, long Flags, 
                                                                   BSTR TargetFrameName, 
                                                                   void* PostData_which_is_really_a_Ptr_to_TVariant, 
                                                                   BSTR Headers, 
                                                                   void* Cancel_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowser_V1NavigateComplete)(System::TObject * Sender, 
                                                                     BSTR URL/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1StatusTextChange)(System::TObject * Sender, 
                                                                     BSTR Text/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1ProgressChange)(System::TObject * Sender, 
                                                                   long Progress/*[in]*/, 
                                                                   long ProgressMax/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1CommandStateChange)(System::TObject * Sender, 
                                                                       long Command/*[in]*/, 
                                                                       TOLEBOOL Enable/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1NewWindow)(System::TObject * Sender, 
                                                              BSTR URL/*[in]*/, long Flags/*[in]*/, 
                                                              BSTR TargetFrameName/*[in]*/, 
                                                              void* PostData_which_is_really_a_Ptr_to_TVariant, 
                                                              BSTR Headers/*[in]*/, 
                                                              void* Processed_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowser_V1TitleChange)(System::TObject * Sender, 
                                                                BSTR Text/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1FrameBeforeNavigate)(System::TObject * Sender, 
                                                                        BSTR URL/*[in]*/, long Flags, 
                                                                        BSTR TargetFrameName, 
                                                                        void* PostData_which_is_really_a_Ptr_to_TVariant, 
                                                                        BSTR Headers, 
                                                                        void* Cancel_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowser_V1FrameNavigateComplete)(System::TObject * Sender, 
                                                                          BSTR URL/*[in]*/);
typedef void __fastcall (__closure * TWebBrowser_V1FrameNewWindow)(System::TObject * Sender, 
                                                                   BSTR URL/*[in]*/, 
                                                                   long Flags/*[in]*/, 
                                                                   BSTR TargetFrameName/*[in]*/, 
                                                                   void* PostData_which_is_really_a_Ptr_to_TVariant, 
                                                                   BSTR Headers/*[in]*/, 
                                                                   void* Processed_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowser_V1Quit)(System::TObject * Sender, 
                                                         void* Cancel_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowser_V1PropertyChange)(System::TObject * Sender, 
                                                                   BSTR Property/*[in]*/);
//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
// Proxy class to host WebBrowser Control in CBuilder IDE/Applications.
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
class PACKAGE TWebBrowser_V1 : public TOleControl
{
  OVERLOADED_PROP_METHODS;
  static TNoParam  OptParam;
  static GUID      DEF_CTL_INTF;

  // Instance of Closures to expose OCX Events as VCL ones
  //
  TWebBrowser_V1BeforeNavigate   FOnBeforeNavigate;
  TWebBrowser_V1NavigateComplete FOnNavigateComplete;
  TWebBrowser_V1StatusTextChange FOnStatusTextChange;
  TWebBrowser_V1ProgressChange   FOnProgressChange;
  TNotifyEvent                   FOnDownloadComplete;
  TWebBrowser_V1CommandStateChange FOnCommandStateChange;
  TNotifyEvent                   FOnDownloadBegin;
  TWebBrowser_V1NewWindow        FOnNewWindow;
  TWebBrowser_V1TitleChange      FOnTitleChange;
  TWebBrowser_V1FrameBeforeNavigate FOnFrameBeforeNavigate;
  TWebBrowser_V1FrameNavigateComplete FOnFrameNavigateComplete;
  TWebBrowser_V1FrameNewWindow   FOnFrameNewWindow;
  TWebBrowser_V1Quit             FOnQuit;
  TNotifyEvent                   FOnWindowMove;
  TNotifyEvent                   FOnWindowResize;
  TNotifyEvent                   FOnWindowActivate;
  TWebBrowser_V1PropertyChange   FOnPropertyChange;

  // Default Interace of OCX
  //
  TCOMIWebBrowser m_OCXIntf;

  // VCL Property Getters/Setters which delegate to OCX
  //
  LPDISPATCH      __fastcall Get_Application_(void);
  LPDISPATCH      __fastcall Get_Parent(void);
  LPDISPATCH      __fastcall Get_Container(void);
  LPDISPATCH      __fastcall Get_Document(void);

  // Static variables used by all instances of OCX proxy
  //
  static int          EventDispIDs[17];
  static TControlData CControlData;
  static GUID         CTL_DEF_INTF;

  // Method providing access to interface as __property 
  //
  TCOMIWebBrowser __fastcall GetControlInterface(void);

protected:
  void     __fastcall CreateControl  (void);
  void     __fastcall InitControlData(void);

public:
  virtual  __fastcall TWebBrowser_V1(TComponent* AOwner) : TOleControl(AOwner)
  {};
  virtual  __fastcall TWebBrowser_V1(HWND        Parent) : TOleControl(Parent)
  {};

  // OCX methods
  //
  void/*HR*/      __fastcall GoBack(void);
  void/*HR*/      __fastcall GoForward(void);
  void/*HR*/      __fastcall GoHome(void);
  void/*HR*/      __fastcall GoSearch(void);
  void/*HR*/      __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  void/*HR*/      __fastcall Refresh(void);
  void/*HR*/      __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  void/*HR*/      __fastcall Stop(void);

  // OCX properties
  //
  __property _di_IDispatch Application_={ read=GetIDispatchProp, index=200 };
  __property _di_IDispatch Parent={ read=GetIDispatchProp, index=201 };
  __property _di_IDispatch Container={ read=GetIDispatchProp, index=202 };
  __property _di_IDispatch Document={ read=GetIDispatchProp, index=203 };
  __property bool TopLevelContainer={ read=GetWordBoolProp, index=204 };
  __property System::WideString Type={ read=GetWideStringProp, index=205 };
  __property System::WideString LocationName={ read=GetWideStringProp, index=210 };
  __property System::WideString LocationURL={ read=GetWideStringProp, index=211 };
  __property bool Busy={ read=GetWordBoolProp, index=212 };
  __property TCOMIWebBrowser ControlInterface={ read=GetControlInterface };

  // Published properties
  //
__published:

  // Standard/Extended properties
  //
  __property TabStop;
  __property Align;
  __property DragCursor;
  __property DragMode;
  __property ParentShowHint;
  __property PopupMenu;
  __property ShowHint;
  __property TabOrder;
  __property Visible;
  __property OnDragDrop;
  __property OnDragOver;
  __property OnEndDrag;
  __property OnEnter;
  __property OnExit;
  __property OnStartDrag;

  // OCX properties
  //

  // OCX Events
  //
  __property TWebBrowser_V1BeforeNavigate OnBeforeNavigate={ read=FOnBeforeNavigate, write=FOnBeforeNavigate };
  __property TWebBrowser_V1NavigateComplete OnNavigateComplete={ read=FOnNavigateComplete, write=FOnNavigateComplete };
  __property TWebBrowser_V1StatusTextChange OnStatusTextChange={ read=FOnStatusTextChange, write=FOnStatusTextChange };
  __property TWebBrowser_V1ProgressChange OnProgressChange={ read=FOnProgressChange, write=FOnProgressChange };
  __property TNotifyEvent OnDownloadComplete={ read=FOnDownloadComplete, write=FOnDownloadComplete };
  __property TWebBrowser_V1CommandStateChange OnCommandStateChange={ read=FOnCommandStateChange, write=FOnCommandStateChange };
  __property TNotifyEvent OnDownloadBegin={ read=FOnDownloadBegin, write=FOnDownloadBegin };
  __property TWebBrowser_V1NewWindow OnNewWindow={ read=FOnNewWindow, write=FOnNewWindow };
  __property TWebBrowser_V1TitleChange OnTitleChange={ read=FOnTitleChange, write=FOnTitleChange };
  __property TWebBrowser_V1FrameBeforeNavigate OnFrameBeforeNavigate={ read=FOnFrameBeforeNavigate, write=FOnFrameBeforeNavigate };
  __property TWebBrowser_V1FrameNavigateComplete OnFrameNavigateComplete={ read=FOnFrameNavigateComplete, write=FOnFrameNavigateComplete };
  __property TWebBrowser_V1FrameNewWindow OnFrameNewWindow={ read=FOnFrameNewWindow, write=FOnFrameNewWindow };
  __property TWebBrowser_V1Quit OnQuit={ read=FOnQuit, write=FOnQuit };
  __property TNotifyEvent OnWindowMove={ read=FOnWindowMove, write=FOnWindowMove };
  __property TNotifyEvent OnWindowResize={ read=FOnWindowResize, write=FOnWindowResize };
  __property TNotifyEvent OnWindowActivate={ read=FOnWindowActivate, write=FOnWindowActivate };
  __property TWebBrowser_V1PropertyChange OnPropertyChange={ read=FOnPropertyChange, write=FOnPropertyChange };
};
typedef TWebBrowser_V1  TWebBrowser_V1Proxy;


// *********************************************************************//
// OCX PROXY CLASS DECLARATION
// Control Name     : TWebBrowser
// Help String      : WebBrowser Control
// Default Interface: IWebBrowser2
// Def. Intf. Object: IWebBrowser2Disp
// Def. Intf. DISP? : No
// Event   Interface: DWebBrowserEvents2
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//

// *********************************************************************//
// Definition of closures to allow VCL handlers to catch OCX events.    //
// *********************************************************************//
typedef void __fastcall (__closure * TWebBrowserStatusTextChange)(System::TObject * Sender, 
                                                                  BSTR Text/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserProgressChange)(System::TObject * Sender, 
                                                                long Progress/*[in]*/, 
                                                                long ProgressMax/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserCommandStateChange)(System::TObject * Sender, 
                                                                    long Command/*[in]*/, 
                                                                    TOLEBOOL Enable/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserTitleChange)(System::TObject * Sender, 
                                                             BSTR Text/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserPropertyChange)(System::TObject * Sender, 
                                                                BSTR szProperty/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserBeforeNavigate2)(System::TObject * Sender, 
                                                                 LPDISPATCH pDisp/*[in]*/, 
                                                                 void* URL_which_is_really_a_Ptr_to_TVariant, 
                                                                 void* Flags_which_is_really_a_Ptr_to_TVariant, 
                                                                 void* TargetFrameName_which_is_really_a_Ptr_to_TVariant, 
                                                                 void* PostData_which_is_really_a_Ptr_to_TVariant, 
                                                                 void* Headers_which_is_really_a_Ptr_to_TVariant, 
                                                                 void* Cancel_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowserNewWindow2)(System::TObject * Sender, 
                                                            void* ppDisp_which_is_really_a_Ptr_to_LPDISPATCH, 
                                                            void* Cancel_which_is_really_a_Ptr_to_TOLEBOOL);
typedef void __fastcall (__closure * TWebBrowserNavigateComplete2)(System::TObject * Sender, 
                                                                   LPDISPATCH pDisp/*[in]*/, 
                                                                   void* URL_which_is_really_a_Ptr_to_TVariant);
typedef void __fastcall (__closure * TWebBrowserDocumentComplete)(System::TObject * Sender, 
                                                                  LPDISPATCH pDisp/*[in]*/, 
                                                                  void* URL_which_is_really_a_Ptr_to_TVariant);
typedef void __fastcall (__closure * TWebBrowserOnVisible)(System::TObject * Sender, 
                                                           TOLEBOOL Visible/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserOnToolBar)(System::TObject * Sender, 
                                                           TOLEBOOL ToolBar/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserOnMenuBar)(System::TObject * Sender, 
                                                           TOLEBOOL MenuBar/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserOnStatusBar)(System::TObject * Sender, 
                                                             TOLEBOOL StatusBar/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserOnFullScreen)(System::TObject * Sender, 
                                                              TOLEBOOL FullScreen/*[in]*/);
typedef void __fastcall (__closure * TWebBrowserOnTheaterMode)(System::TObject * Sender, 
                                                               TOLEBOOL TheaterMode/*[in]*/);
//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
// Proxy class to host WebBrowser Control in CBuilder IDE/Applications.
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
class PACKAGE TWebBrowser : public TOleControl
{
  OVERLOADED_PROP_METHODS;
  static TNoParam  OptParam;
  static GUID      DEF_CTL_INTF;

  // Instance of Closures to expose OCX Events as VCL ones
  //
  TWebBrowserStatusTextChange    FOnStatusTextChange;
  TWebBrowserProgressChange      FOnProgressChange;
  TWebBrowserCommandStateChange  FOnCommandStateChange;
  TNotifyEvent                   FOnDownloadBegin;
  TNotifyEvent                   FOnDownloadComplete;
  TWebBrowserTitleChange         FOnTitleChange;
  TWebBrowserPropertyChange      FOnPropertyChange;
  TWebBrowserBeforeNavigate2     FOnBeforeNavigate2;
  TWebBrowserNewWindow2          FOnNewWindow2;
  TWebBrowserNavigateComplete2   FOnNavigateComplete2;
  TWebBrowserDocumentComplete    FOnDocumentComplete;
  TNotifyEvent                   FOnQuit;
  TWebBrowserOnVisible           FOnVisible;
  TWebBrowserOnToolBar           FOnToolBar;
  TWebBrowserOnMenuBar           FOnMenuBar;
  TWebBrowserOnStatusBar         FOnStatusBar;
  TWebBrowserOnFullScreen        FOnFullScreen;
  TWebBrowserOnTheaterMode       FOnTheaterMode;

  // Default Interace of OCX
  //
  IWebBrowser2Disp m_OCXIntf;

  // VCL Property Getters/Setters which delegate to OCX
  //
  LPDISPATCH      __fastcall Get_Application_(void);
  LPDISPATCH      __fastcall Get_Parent(void);
  LPDISPATCH      __fastcall Get_Container(void);
  LPDISPATCH      __fastcall Get_Document(void);

  // Static variables used by all instances of OCX proxy
  //
  static int          EventDispIDs[18];
  static TControlData CControlData;
  static GUID         CTL_DEF_INTF;

  // Method providing access to interface as __property 
  //
  IWebBrowser2Disp __fastcall GetControlInterface(void);

protected:
  void     __fastcall CreateControl  (void);
  void     __fastcall InitControlData(void);

public:
  virtual  __fastcall TWebBrowser(TComponent* AOwner) : TOleControl(AOwner)
  {};
  virtual  __fastcall TWebBrowser(HWND        Parent) : TOleControl(Parent)
  {};

  // OCX methods
  //
  void/*HR*/      __fastcall GoBack(void);
  void/*HR*/      __fastcall GoForward(void);
  void/*HR*/      __fastcall GoHome(void);
  void/*HR*/      __fastcall GoSearch(void);
  void/*HR*/      __fastcall Navigate(BSTR URL/*[in]*/, TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                      TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                      TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                      TVariant* Headers/*[in,opt]*/= TNoParam());
  void/*HR*/      __fastcall Refresh(void);
  void/*HR*/      __fastcall Refresh2(TVariant* Level/*[in,opt]*/= TNoParam());
  void/*HR*/      __fastcall Stop(void);
  void/*HR*/      __fastcall Quit(void);
  void/*HR*/      __fastcall ClientToWindow(int* pcx/*[in,out]*/, int* pcy/*[in,out]*/);
  void/*HR*/      __fastcall PutProperty(BSTR Property/*[in]*/, TVariant vtValue/*[in]*/);
  TVariant        __fastcall GetProperty(BSTR Property/*[in]*/);
  void/*HR*/      __fastcall Navigate2(TVariant* URL/*[in]*/, 
                                       TVariant* Flags/*[in,opt]*/= TNoParam(), 
                                       TVariant* TargetFrameName/*[in,opt]*/= TNoParam(), 
                                       TVariant* PostData/*[in,opt]*/= TNoParam(), 
                                       TVariant* Headers/*[in,opt]*/= TNoParam());
  Shdocvw_tlb::OLECMDF __fastcall QueryStatusWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/);
  void/*HR*/      __fastcall ExecWB(Shdocvw_tlb::OLECMDID cmdID/*[in]*/, 
                                    Shdocvw_tlb::OLECMDEXECOPT cmdexecopt/*[in]*/, 
                                    TVariant* pvaIn/*[in,opt]*/= TNoParam(), 
                                    TVariant* pvaOut/*[in,out,opt]*/= TNoParam());
  void/*HR*/      __fastcall ShowBrowserBar(TVariant* pvaClsid/*[in]*/, 
                                            TVariant* pvarShow/*[in,opt]*/= TNoParam(), 
                                            TVariant* pvarSize/*[in,opt]*/= TNoParam());

  // OCX properties
  //
  __property _di_IDispatch Application_={ read=GetIDispatchProp, index=200 };
  __property _di_IDispatch Parent={ read=GetIDispatchProp, index=201 };
  __property _di_IDispatch Container={ read=GetIDispatchProp, index=202 };
  __property _di_IDispatch Document={ read=GetIDispatchProp, index=203 };
  __property bool TopLevelContainer={ read=GetWordBoolProp, index=204 };
  __property System::WideString Type={ read=GetWideStringProp, index=205 };
  __property System::WideString LocationName={ read=GetWideStringProp, index=210 };
  __property System::WideString LocationURL={ read=GetWideStringProp, index=211 };
  __property bool Busy={ read=GetWordBoolProp, index=212 };
  __property System::WideString Name={ read=GetWideStringProp, index=0 };
  __property int HWND={ read=GetIntegerProp, index=-515 };
  __property System::WideString FullName={ read=GetWideStringProp, index=400 };
  __property System::WideString Path={ read=GetWideStringProp, index=401 };
  __property TOleEnum ReadyState={ read=GetTOleEnumProp, index=-525 };
  __property IWebBrowser2Disp ControlInterface={ read=GetControlInterface };

  // Published properties
  //
__published:

  // Standard/Extended properties
  //
  __property TabStop;
  __property Align;
  __property DragCursor;
  __property DragMode;
  __property ParentShowHint;
  __property PopupMenu;
  __property ShowHint;
  __property TabOrder;
  __property OnDragDrop;
  __property OnDragOver;
  __property OnEndDrag;
  __property OnEnter;
  __property OnExit;
  __property OnStartDrag;

  // OCX properties
  //
  __property bool Visible={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=402 };
  __property bool StatusBar={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=403 };
  __property System::WideString StatusText={ read=GetWideStringProp, write=SetWideStringProp, stored=false, index=404 };
  __property int ToolBar={ read=GetIntegerProp, write=SetIntegerProp, stored=false, index=405 };
  __property bool MenuBar={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=406 };
  __property bool FullScreen={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=407 };
  __property bool Offline={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=550 };
  __property bool Silent={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=551 };
  __property bool RegisterAsBrowser={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=552 };
  __property bool RegisterAsDropTarget={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=553 };
  __property bool TheaterMode={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=554 };
  __property bool AddressBar={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=555 };
  __property bool Resizable={ read=GetWordBoolProp, write=SetWordBoolProp, stored=false, index=556 };

  // OCX Events
  //
  __property TWebBrowserStatusTextChange OnStatusTextChange={ read=FOnStatusTextChange, write=FOnStatusTextChange };
  __property TWebBrowserProgressChange OnProgressChange={ read=FOnProgressChange, write=FOnProgressChange };
  __property TWebBrowserCommandStateChange OnCommandStateChange={ read=FOnCommandStateChange, write=FOnCommandStateChange };
  __property TNotifyEvent OnDownloadBegin={ read=FOnDownloadBegin, write=FOnDownloadBegin };
  __property TNotifyEvent OnDownloadComplete={ read=FOnDownloadComplete, write=FOnDownloadComplete };
  __property TWebBrowserTitleChange OnTitleChange={ read=FOnTitleChange, write=FOnTitleChange };
  __property TWebBrowserPropertyChange OnPropertyChange={ read=FOnPropertyChange, write=FOnPropertyChange };
  __property TWebBrowserBeforeNavigate2 OnBeforeNavigate2={ read=FOnBeforeNavigate2, write=FOnBeforeNavigate2 };
  __property TWebBrowserNewWindow2 OnNewWindow2={ read=FOnNewWindow2, write=FOnNewWindow2 };
  __property TWebBrowserNavigateComplete2 OnNavigateComplete2={ read=FOnNavigateComplete2, write=FOnNavigateComplete2 };
  __property TWebBrowserDocumentComplete OnDocumentComplete={ read=FOnDocumentComplete, write=FOnDocumentComplete };
  __property TNotifyEvent OnQuit={ read=FOnQuit, write=FOnQuit };
  __property TWebBrowserOnVisible OnVisible={ read=FOnVisible, write=FOnVisible };
  __property TWebBrowserOnToolBar OnToolBar={ read=FOnToolBar, write=FOnToolBar };
  __property TWebBrowserOnMenuBar OnMenuBar={ read=FOnMenuBar, write=FOnMenuBar };
  __property TWebBrowserOnStatusBar OnStatusBar={ read=FOnStatusBar, write=FOnStatusBar };
  __property TWebBrowserOnFullScreen OnFullScreen={ read=FOnFullScreen, write=FOnFullScreen };
  __property TWebBrowserOnTheaterMode OnTheaterMode={ read=FOnTheaterMode, write=FOnTheaterMode };
};
typedef TWebBrowser  TWebBrowserProxy;


// *********************************************************************//
// OCX PROXY CLASS DECLARATION
// Control Name     : TShellFolderViewOC
// Help String      : Shell Folder View Events Router.
// Default Interface: IFolderViewOC
// Def. Intf. Object: TCOMIFolderViewOC
// Def. Intf. DISP? : No
// Event   Interface: DShellFolderViewEvents
// TypeFlags        : (18) CanCreate Hidden
// *********************************************************************//

// *********************************************************************//
// Definition of closures to allow VCL handlers to catch OCX events.    //
// *********************************************************************//
//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
// Proxy class to host Shell Folder View Events Router. in CBuilder IDE/Applications.
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
class PACKAGE TShellFolderViewOC : public TOleControl
{
  OVERLOADED_PROP_METHODS;
  static TNoParam  OptParam;
  static GUID      DEF_CTL_INTF;

  // Instance of Closures to expose OCX Events as VCL ones
  //
  TNotifyEvent                   FOnSelectionChanged;

  // Default Interace of OCX
  //
  TCOMIFolderViewOC m_OCXIntf;

  // VCL Property Getters/Setters which delegate to OCX
  //

  // Static variables used by all instances of OCX proxy
  //
  static int          EventDispIDs[1];
  static TControlData CControlData;
  static GUID         CTL_DEF_INTF;

  // Method providing access to interface as __property 
  //
  TCOMIFolderViewOC __fastcall GetControlInterface(void);

protected:
  void     __fastcall CreateControl  (void);
  void     __fastcall InitControlData(void);

public:
  virtual  __fastcall TShellFolderViewOC(TComponent* AOwner) : TOleControl(AOwner)
  {};
  virtual  __fastcall TShellFolderViewOC(HWND        Parent) : TOleControl(Parent)
  {};

  // OCX methods
  //
  void/*HR*/      __fastcall SetFolderView(LPDISPATCH pDisp/*[in]*/);

  // OCX properties
  //
  __property TCOMIFolderViewOC ControlInterface={ read=GetControlInterface };

  // Published properties
  //
__published:

  // Standard/Extended properties
  //

  // OCX properties
  //

  // OCX Events
  //
  __property TNotifyEvent OnSelectionChanged={ read=FOnSelectionChanged, write=FOnSelectionChanged };
};
typedef TShellFolderViewOC  TShellFolderViewOCProxy;

};     // namespace Shdocvw_tlb

#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using  namespace Shdocvw_tlb;
#endif

#pragma option pop

#endif // __SHDocVw_OCX_h__
