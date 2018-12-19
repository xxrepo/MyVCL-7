//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DockingMegaDemoMain.h"
#include "DockingMegaDemoAbout.h"
#include "EBarsDemoRating.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxBar"
#pragma link "dxDockControl"
#pragma link "dxDockPanel"
#pragma link "dxBarExtItems"
#pragma link "dxsbar"
#pragma resource "*.dfm"
TDockingMegaDemoMainForm *DockingMegaDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TDockingMegaDemoMainForm::TDockingMegaDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::FormShow(TObject *Sender)
{
  DockControl = dsHost;
  UpdateSolutionTV();
  UpdateClassViewTV();
  ComboBox1->Align = alClient;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::CheckSite(TdxCustomDockControl* AControl, TTreeNode* ANode)
{
  String ANodeName;
  if (AControl->Name != "")
    ANodeName = AControl->Name;
  else ANodeName = AControl->ClassName();
  TTreeNode* AChild = tvSolutionExplorer->Items->AddChildObject(ANode, ANodeName, AControl);
  AChild->StateIndex = AControl->ImageIndex;
  for (int i=0; i < AControl->ChildCount; i++)
    CheckSite(AControl->Children[i], AChild);
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::UpdateSolutionTV()
{
  if (!tvSolutionExplorer->HandleAllocated()) return;
  tvSolutionExplorer->Items->BeginUpdate();
  try {
    tvSolutionExplorer->Items->Clear();
    CheckSite(dsHost, NULL);
    tvSolutionExplorer->FullExpand();
  }
  __finally {
    tvSolutionExplorer->Items->EndUpdate();
  }
  tvSolutionExplorer->Selected = NULL;
  for (int i=0; i < tvSolutionExplorer->Items->Count; i++)
    if (((TdxCustomDockControl*)tvSolutionExplorer->Items->Item[i]->Data) == DockControl)
      tvSolutionExplorer->Selected = tvSolutionExplorer->Items->Item[i];
  UpdateProperties();
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::UpdateClassViewTV()
{
  if (!tvClassView->HandleAllocated()) return;
  TTreeNode* ANode;
  tvClassView->Items->BeginUpdate();
  try {
    tvClassView->Items->Clear();
    ANode = tvClassView->Items->AddChild(NULL, "TdxCustomDockControl");
    ANode = tvClassView->Items->AddChild(ANode, "TdxCustomDockSite");
    tvClassView->Items->AddChild(ANode, "TdxLayoutDockSite");
    ANode = tvClassView->Items->AddChild(ANode, "TdxContainerDockSite");
    tvClassView->Items->AddChild(ANode, "TdxTabContainerDockSite");
    ANode = tvClassView->Items->AddChild(ANode, "TdxSideContainerDockSite");
    tvClassView->Items->AddChild(ANode, "TdxHorizContainerDockSite");
    tvClassView->Items->AddChild(ANode, "TdxVertContainerDockSite");
    tvClassView->Items->AddChild(tvClassView->Items->Item[1], "TdxFloatDockSite");
    tvClassView->Items->AddChild(tvClassView->Items->Item[1], "TdxDockSite");
    tvClassView->Items->AddChild(tvClassView->Items->Item[0], "TdxDockPanel");
    tvClassView->FullExpand();
  }
  __finally {
    tvClassView->Items->EndUpdate();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::MakeVisible(TdxDockPanel* AControl)
{
  if (AControl == NULL) return;
  if (!AControl->Visible)
    AControl->Visible = true;
  dxDockingController()->ActiveDockControl = AControl;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonPageClick(TObject *Sender)
{
  switch (((TComponent*)Sender)->Tag) {
    case 0: MakeVisible(dpStartPage); break;
    case 1: MakeVisible(dpSolutionExplorer); break;
    case 2: MakeVisible(dpClassView); break;
    case 3: MakeVisible(dpProperties); break;
    case 4: MakeVisible(dpToolbox); break;
    case 5: MakeVisible(dpCallStack); break;
    case 6: MakeVisible(dpOutput); break;
    case 7: MakeVisible(dpWatch); break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TDockingMegaDemoMainForm::dxBarButtonLoadClick(TObject *Sender)
{
  if (OpenDialog1->Execute())
    dxDockingManager1->LoadLayoutFromIniFile(OpenDialog1->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonSaveClick(TObject *Sender)
{
  if (SaveDialog1->Execute())
    dxDockingManager1->SaveLayoutToIniFile(SaveDialog1->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonColorClick(TObject *Sender)
{
  ColorDialog1->Color = dxDockingManager1->Color;
  if (ColorDialog1->Execute())
    dxDockingManager1->Color = ColorDialog1->Color;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonFontClick(TObject *Sender)
{
  FontDialog1->Font = dxDockingManager1->Font;
  if (FontDialog1->Execute())
    dxDockingManager1->Font = FontDialog1->Font;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonStandardViewClick(TObject *Sender)
{
  dxDockingManager1->ViewStyle = vsStandard;
  BarManager->Style = bmsStandard;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonNETViewClick(TObject *Sender)
{
  dxDockingManager1->ViewStyle = vsNET;
  BarManager->Style = bmsFlat;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonOffice11ViewClick(TObject *Sender)
{
  dxDockingManager1->ViewStyle = vsOffice11;
  BarManager->Style = bmsOffice11;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonXPViewClick(TObject *Sender)
{
  dxDockingManager1->ViewStyle = vsXP;
  BarManager->Style = bmsXP;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::frStartPage1Label1Click(TObject *Sender)
{
  dxBarButtonLoadClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::frStartPage1Label2Click(TObject *Sender)
{
  dxBarButtonSaveClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonExitClick(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------


void __fastcall TDockingMegaDemoMainForm::dxBarButtonDockableClick(TObject *Sender)
{
  if (FPopupMenuDockControl != NULL) {
    FPopupMenuDockControl->Dockable = ((TdxBarButton*)Sender)->Down;
    FPopupMenuDockControl = NULL;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonHideClick(TObject *Sender)
{
  if (FPopupMenuDockControl != NULL) {
    FPopupMenuDockControl->Visible = false;
    FPopupMenuDockControl = NULL;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonFloatingClick(TObject *Sender)
{
  TPoint pt;
  if ((FPopupMenuDockControl != NULL) && (FPopupMenuDockControl->DockState != dsFloating)) {
    GetCursorPos(&pt);
    FPopupMenuDockControl->MakeFloating(pt.x, pt. y);
    FPopupMenuDockControl = NULL;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonAutoHideClick(TObject *Sender)
{
  if (FPopupMenuDockControl != NULL) {
    FPopupMenuDockControl->AutoHide = ((TdxBarButton*)Sender)->Down;
    FPopupMenuDockControl = NULL;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dpContextPopup(TObject *Sender, const TPoint &MousePos, bool &Handled)
{
  TPoint pt;
  GetCursorPos(&pt);
  TdxCustomDockControl* AControl = dxDockingController()->GetDockControlAtPos(pt);
  if (AControl != NULL) {
    FPopupMenuDockControl = AControl;
    dxBarButtonDockable->Down = FPopupMenuDockControl->Dockable;
    dxBarButtonFloating->Down = FPopupMenuDockControl->FloatDockSite != NULL;
    dxBarButtonAutoHide->Enabled = FPopupMenuDockControl->CanAutoHide();
    dxBarButtonAutoHide->Down = FPopupMenuDockControl->AutoHide;
    dxBarPopupMenu1->PopupFromCursorPos();
    Handled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::UpdateProperties()
{
  if ((FDockControl != NULL) && !FDockControl->ComponentState.Contains(csDestroying)) {
    cbManagerColor->Enabled = true;
    cbManagerColor->Checked = FDockControl->ManagerColor;
    cbManagerFont->Enabled = true;
    cbManagerFont->Checked = FDockControl->ManagerFont;
    eCaption->Enabled = true;
    eCaption->Text = FDockControl->Caption;
    cbShowCaption->Enabled = true;
    cbShowCaption->Checked = FDockControl->ShowCaption;
    cbShowCloseButton->Enabled = true;
    cbShowCloseButton->Checked = FDockControl->CaptionButtons.Contains(cbClose);
    cbShowMaxButton->Enabled = true;
    cbShowMaxButton->Checked = FDockControl->CaptionButtons.Contains(cbMaximize);
    cbShowHideButton->Enabled = true;
    cbShowHideButton->Checked = FDockControl->CaptionButtons.Contains(cbHide);

    cbAllowDockLeft->Enabled = true;
    cbAllowDockLeft->Checked = FDockControl->AllowDock.Contains(dtLeft);
    cbAllowDockTop->Enabled = true;
    cbAllowDockTop->Checked = FDockControl->AllowDock.Contains(dtTop);
    cbAllowDockRight->Enabled = true;
    cbAllowDockRight->Checked = FDockControl->AllowDock.Contains(dtRight);
    cbAllowDockBottom->Enabled = true;
    cbAllowDockBottom->Checked = FDockControl->AllowDock.Contains(dtBottom);
    cbAllowDockClient->Enabled = true;
    cbAllowDockClient->Checked = FDockControl->AllowDock.Contains(dtClient);
    cbAllowFloating->Enabled = true;
    cbAllowFloating->Checked = FDockControl->AllowFloating;
    cbAllowDockClientsLeft->Enabled = true;
    cbAllowDockClientsLeft->Checked = FDockControl->AllowDockClients.Contains(dtLeft);
    cbAllowDockClientsTop->Enabled = true;
    cbAllowDockClientsTop->Checked = FDockControl->AllowDockClients.Contains(dtTop);
    cbAllowDockClientsRight->Enabled = true;
    cbAllowDockClientsRight->Checked = FDockControl->AllowDockClients.Contains(dtRight);
    cbAllowDockClientsBottom->Enabled = true;
    cbAllowDockClientsBottom->Checked = FDockControl->AllowDockClients.Contains(dtBottom);
    cbAllowDockClientsClient->Enabled = true;
    cbAllowDockClientsClient->Checked = FDockControl->AllowDockClients.Contains(dtClient);

    if (dynamic_cast<TdxTabContainerDockSite*>(FDockControl)) {
      cbTabsOnTop->Enabled = true;
      cbTabsOnTop->Checked = ((TdxTabContainerDockSite*)FDockControl)->TabsPosition == Dxdockcontrol::tctpTop;
      cbTabsScrollable->Enabled = true;
      cbTabsScrollable->Checked = ((TdxTabContainerDockSite*)FDockControl)->TabsScroll;}
    else {
      cbTabsOnTop->Enabled = false;
      cbTabsScrollable->Enabled = false;
    };
    btnApply->Enabled = true;
    btnCancel->Enabled = true;
  }
  else DisableProperties();
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::ApplyProperties()
{
  TdxDockingTypes ADockTypes;
  if ((FDockControl == NULL) || (FDockControl->ComponentState.Contains(csDestroying))) return;

  FDockControl->ManagerColor = cbManagerColor->Checked;
  FDockControl->ManagerFont = cbManagerFont->Checked;
  FDockControl->Caption = eCaption->Text;
  FDockControl->ShowCaption = cbShowCaption->Checked;
  FDockControl->CaptionButtons.Clear();
  if (cbShowCloseButton->Checked)
    FDockControl->CaptionButtons = FDockControl->CaptionButtons + (TdxCaptionButtons() << cbClose);
  if (cbShowMaxButton->Checked)
    FDockControl->CaptionButtons = FDockControl->CaptionButtons + (TdxCaptionButtons() << cbMaximize);
  if (cbShowHideButton->Checked)
    FDockControl->CaptionButtons = FDockControl->CaptionButtons + (TdxCaptionButtons() << cbHide);

  ADockTypes.Clear();
  if (cbAllowDockLeft->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtLeft);
  if (cbAllowDockTop->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtTop);
  if (cbAllowDockRight->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtRight);
  if (cbAllowDockBottom->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtBottom);
  if (cbAllowDockClient->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtClient);
  FDockControl->AllowDock = ADockTypes;

  FDockControl->AllowFloating = cbAllowFloating->Checked;

  ADockTypes.Clear();
  if (cbAllowDockClientsLeft->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtLeft);
  if (cbAllowDockClientsTop->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtTop);
  if (cbAllowDockClientsRight->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtRight);
  if (cbAllowDockClientsBottom->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtBottom);
  if (cbAllowDockClientsClient->Checked) ADockTypes = ADockTypes + (TdxDockingTypes() << dtClient);
  FDockControl->AllowDockClients = ADockTypes;

  if(dynamic_cast<TdxTabContainerDockSite*>(FDockControl)) {
    if( cbTabsOnTop->Checked)
      ((TdxTabContainerDockSite*)FDockControl)->TabsPosition = Dxdockcontrol::tctpTop;
    else ((TdxTabContainerDockSite*)FDockControl)->TabsPosition = Dxdockcontrol::tctpBottom;
    ((TdxTabContainerDockSite*)FDockControl)->TabsScroll = cbTabsScrollable->Checked;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::DisableProperties()
{
  cbManagerColor->Checked = false;
  cbManagerColor->Enabled = false;
  cbManagerFont->Checked = false;
  cbManagerFont->Enabled = false;
  eCaption->Text = "";
  eCaption->Enabled = false;
  cbShowCaption->Checked = false;
  cbShowCaption->Enabled = false;
  cbShowCloseButton->Checked = false;
  cbShowCloseButton->Enabled = false;
  cbShowMaxButton->Checked = false;
  cbShowMaxButton->Enabled = false;
  cbShowHideButton->Checked = false;
  cbShowHideButton->Enabled = false;
  cbAllowDockLeft->Checked = false;
  cbAllowDockLeft->Enabled = false;
  cbAllowDockTop->Checked = false;
  cbAllowDockTop->Enabled = false;
  cbAllowDockRight->Checked = false;
  cbAllowDockRight->Enabled = false;
  cbAllowDockBottom->Checked = false;
  cbAllowDockBottom->Enabled = false;
  cbAllowDockClient->Checked = false;
  cbAllowDockClient->Enabled = false;
  cbAllowFloating->Checked = false;
  cbAllowFloating->Enabled = false;
  cbAllowDockClientsLeft->Checked = false;
  cbAllowDockClientsLeft->Enabled = false;
  cbAllowDockClientsTop->Checked = false;
  cbAllowDockClientsTop->Enabled = false;
  cbAllowDockClientsRight->Checked = false;
  cbAllowDockClientsRight->Enabled = false;
  cbAllowDockClientsBottom->Checked = false;
  cbAllowDockClientsBottom->Enabled = false;
  cbAllowDockClientsClient->Checked = false;
  cbAllowDockClientsClient->Enabled = false;
  cbTabsOnTop->Checked = false;
  cbTabsOnTop->Enabled = false;
  cbTabsScrollable->Checked = false;
  cbTabsScrollable->Enabled = false;
  btnApply->Enabled = false;
  btnCancel->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::SetDockControl(TdxCustomDockControl* Value)
{
  if (FDockControl != Value) {
    FDockControl = Value;
    UpdateProperties();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::btnApplyClick(TObject *Sender)
{
  ApplyProperties();
  UpdateProperties();
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::btnCancelClick(TObject *Sender)
{
  UpdateProperties();
}
//---------------------------------------------------------------------------


void __fastcall TDockingMegaDemoMainForm::tvSolutionExplorerChange(
      TObject *Sender, TTreeNode *Node)
{
  TTreeNode* ANode = tvSolutionExplorer->Selected;
  if (ANode != NULL)
    DockControl = ((TdxCustomDockControl*)ANode->Data);
  else DockControl = dsHost;
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxDockingManager1LayoutChanged(
      TdxCustomDockControl *Sender)
{
  UpdateSolutionTV();
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonStartPageClick(
      TObject *Sender)
{
  if (dpStartPage != NULL) {
    if (!dpStartPage->Visible)
      dpStartPage->Visible = true;
    dxDockingController()->ActiveDockControl = dpStartPage;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonSolutionExplorerClick(
      TObject *Sender)
{
  if (dpSolutionExplorer != NULL) {
    if (!dpSolutionExplorer->Visible)
      dpSolutionExplorer->Visible = true;
    dxDockingController()->ActiveDockControl = dpSolutionExplorer;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonClassViewClick(
      TObject *Sender)
{
  if (dpClassView != NULL) {
    if (!dpClassView->Visible)
      dpClassView->Visible = true;
    dxDockingController()->ActiveDockControl = dpClassView;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonPropertiesClick(
      TObject *Sender)
{
  if (dpProperties != NULL) {
    if (!dpProperties->Visible)
      dpProperties->Visible = true;
    dxDockingController()->ActiveDockControl = dpProperties;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonToolBoxClick(
      TObject *Sender)
{
  if (dpToolbox != NULL) {
    if (!dpToolbox->Visible)
      dpToolbox->Visible = true;
    dxDockingController()->ActiveDockControl = dpToolbox;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonCallStackClick(
      TObject *Sender)
{
  if (dpCallStack != NULL) {
    if (!dpCallStack->Visible)
      dpCallStack->Visible = true;
    dxDockingController()->ActiveDockControl = dpCallStack;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonOutputClick(
      TObject *Sender)
{
  if (dpOutput != NULL) {
  if (!dpOutput->Visible)
    dpOutput->Visible = true;
  dxDockingController()->ActiveDockControl = dpOutput;
  }
}
//---------------------------------------------------------------------------

void __fastcall TDockingMegaDemoMainForm::dxBarButtonWatchClick(
      TObject *Sender)
{
  if (dpWatch != NULL) {
    if (!dpWatch->Visible)
      dpWatch->Visible = true;
    dxDockingController()->ActiveDockControl = dpWatch;
  }
}
//---------------------------------------------------------------------------
void __fastcall TDockingMegaDemoMainForm::FormCreate(TObject *Sender)
{
  dmCommonData->AboutFormClass = __classid(TDockingMegaDemoAboutForm);

#if __BORLANDC__  >= 0x550   // BCB version >= 5
  dpStartPage->OnContextPopup = dpContextPopup;
  dpProperties->OnContextPopup = dpContextPopup;
  dpSolutionExplorer->OnContextPopup = dpContextPopup;
  dpClassView->OnContextPopup = dpContextPopup;
  dpOutput->OnContextPopup = dpContextPopup;
  dpCallStack->OnContextPopup = dpContextPopup;
  dpWatch->OnContextPopup = dpContextPopup;
  dpToolbox->OnContextPopup = dpContextPopup;
#endif

}
//---------------------------------------------------------------------------

