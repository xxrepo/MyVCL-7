unit ESBarDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, dxsbar, dximctrl, Menus, ComCtrls, ImgList, dxBar,
  ActnList, ShellAPI, EBarsUtils;

type
  TESBarDemoMainForm = class(TForm)
    SideBar: TdxSideBar;
    dxSideBarPopupMenu1: TdxSideBarPopupMenu;
    SideBarStore: TdxSideBarStore;
    imgSmall: TImageList;
    imgLarge: TImageList;
    SideBarStoreItem1: TdxStoredSideItem;
    SideBarStoreItem2: TdxStoredSideItem;
    SideBarStoreItem3: TdxStoredSideItem;
    SideBarStoreItem4: TdxStoredSideItem;
    SideBarStoreItem5: TdxStoredSideItem;
    SideBarStoreItem6: TdxStoredSideItem;
    SideBarStoreItem7: TdxStoredSideItem;
    SideBarStoreItem8: TdxStoredSideItem;
    SideBarStoreItem9: TdxStoredSideItem;
    SideBarStoreItem10: TdxStoredSideItem;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    TreeView: TTreeView;
    Label3: TLabel;
    ilHelpImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    BarSubItemHelp: TdxBarSubItem;
    BarSubItemFile: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    rgSBPaintingStyles: TRadioGroup;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    procedure SideBarItemClick(Sender: TObject; Item: TdxSideBarItem);
    procedure CheckBox1Click(Sender: TObject);
    procedure SideBarChangeActiveGroup(Sender: TObject);
    procedure SideBarChangeGroupCaption(Sender: TObject;
      Group: TdxSideGroup);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actRateDemoExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure rgSBPaintingStylesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ESBarDemoMainForm: TESBarDemoMainForm;

implementation

uses EBarsDemoRating, ESBarDemoAbout;

{$R *.DFM}
{$R windowsxp.res}

procedure TESBarDemoMainForm.SideBarItemClick(Sender: TObject; Item: TdxSideBarItem);
begin
  Edit1.Text := Item.Caption;
end;

procedure TESBarDemoMainForm.CheckBox1Click(Sender: TObject);
begin
  SideBar.CanSelected := CheckBox1.Checked;
  SideBar.SelectedItem := nil;
end;

procedure TESBarDemoMainForm.SideBarChangeActiveGroup(Sender: TObject);
begin
  if(SideBar.ActiveGroup = nil) then
    Edit2.Text := ''
  else begin
    Edit2.Text := SideBar.ActiveGroup.Caption;
    CheckBox3.Checked := SideBar.ActiveGroup.IconType = dxsgLargeIcon;
  end;
  CheckBox3.Enabled := SideBar.ActiveGroup <> nil;
  Button2.Enabled := CheckBox3.Enabled;
  Button3.Enabled := CheckBox3.Enabled;
end;

procedure TESBarDemoMainForm.SideBarChangeGroupCaption(Sender: TObject;
  Group: TdxSideGroup);
begin
  if Group = SideBar.ActiveGroup then
   Edit2.Text := Group.Caption;
end;

procedure TESBarDemoMainForm.Button1Click(Sender: TObject);
begin
  SideBar.Groups.Add;
end;

procedure TESBarDemoMainForm.Button2Click(Sender: TObject);
begin
  SideBar.EditGroup(SideBar.ActiveGroup);
end;

procedure TESBarDemoMainForm.Button3Click(Sender: TObject);
begin
  SideBar.ActiveGroup.Free;
end;

procedure TESBarDemoMainForm.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
    SideBar.ActiveGroup.IconType := dxsgLargeIcon
  else SideBar.ActiveGroup.IconType := dxsgSmallIcon;
end;

procedure TESBarDemoMainForm.FormCreate(Sender: TObject);
var
  Node, Node1 : TTreeNode;
  i, j : Integer;
  St : String;
  Item : TdxStoredSideItem;
begin
  for i := 0 to SideBarStore.Categories.Count - 1 do
  begin
    St := SideBarStore.Categories[i];
    Node := TreeView.Items.Add(nil, St);
    Node.ImageIndex := -1;
    Node.SelectedIndex := -1;
    for j := 0 to SideBarStore.GetCountByCategory(St) - 1 do
    begin
      Item := SideBarStore.GetItemByCategory(St, j);
      Node1 := TreeView.Items.AddChild(Node, Item.Caption);
      Node1.Data := Item;
      Node1.ImageIndex := Item.SmallImage;
      Node1.SelectedIndex := Node1.ImageIndex;
    end;
  end;
  dmCommonData.AboutFormClass := TESBarDemoAboutForm;
end;

procedure TESBarDemoMainForm.TreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if (TreeView.Selected <> nil) and (TreeView.Selected.Data <> nil) then
  begin
    dxSideBarDragObject := TdxSideBarDragObject.Create(SideBar, DragObject, nil, TdxStoredSideItem(TreeView.Selected.Data));
//    dxSideBarDragObject.StoredItem := ;
  end;
end;

procedure TESBarDemoMainForm.actHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TESBarDemoMainForm.actRateDemoExecute(Sender: TObject);
begin
  with TEBarsDemoRatingForm.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TESBarDemoMainForm.actAboutExecute(Sender: TObject);
begin
  with TESBarDemoAboutForm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TESBarDemoMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TESBarDemoMainForm.rgSBPaintingStylesClick(Sender: TObject);
begin
  SideBar.PaintStyle := TdxsbPaintStyle(TRadioGroup(Sender).ItemIndex);
end;

end.
