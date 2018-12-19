unit wfMain;


interface

uses
  ActiveX,  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, wSplit,E_StgStr,
  ImgList;

type
  TWfModelForm = class(TForm)
    StatusBar: TStatusBar;
    TreeViewPanel: TPanel;
    Panel1: TPanel;
    TreeView: TTreeView;
    Splitter: TPanel;
    ListViewPanel: TPanel;
    ListViewCaption: TPanel;
    FileOpenDialog: TOpenDialog;
    FileSaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miFileExit: TMenuItem;
    miFileSave: TMenuItem;
    miFileOpen: TMenuItem;
    miView: TMenuItem;
    miViewLargeIcons: TMenuItem;
    miViewSmallIcons: TMenuItem;
    Small: TImageList;
    Large: TImageList;
    ListView: TListView;
    Options1: TMenuItem;
    AddWorkFlowClass1: TMenuItem;
    AddWorkFlowSubClass1: TMenuItem;
    DeleteWorkFlowItem1: TMenuItem;
    AddWorkFlowStep1: TMenuItem;
    NewModel1: TMenuItem;
    CopyModel1: TMenuItem;
    procedure FileExit(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListViewEnter(Sender: TObject);
    procedure SaveResource(Sender: TObject);
    procedure SelectViewType(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure SplitterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SplitterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SplitterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ViewMenuDropDown(Sender: TObject);
    procedure AddWfClass(Sender: TObject);
    procedure AddWfSubClass(Sender: TObject);
    procedure ListViewExit(Sender: TObject);
    procedure AddWorkFlowStep1Click(Sender: TObject);
    procedure TreeViewEnter(Sender: TObject);
    procedure TreeViewExit(Sender: TObject);
    procedure DeleteWfItem(Sender: TObject);
    procedure TvDeleteNode(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClearModel(Sender: TObject);
    procedure CopyModel1Click(Sender: TObject);
  private
    SplitControl : TSplitControl;
    CurList      : TStringList;
    TreeStorage  : TStructuredStorage;

    Function StoreNode(Var Storage     : IStorage;
                           CNode       : TTreeNode;
                           Ndx         : Integer) : Boolean;

    Function StoreModel(      CNode       : TTreeNode;
                        Const AModel      : String) : Boolean;


    Function AddModelNode(Const S : String) : TTreeNode;

    Function AddChildNode(Const S     : String;
                          Const PNode : TTreeNode;
                          Const SList : TStringList) : TTreeNode;

    Function CopyNode(Const PNode : TTreeNode;
                      Const ANode : TTreeNode) : Boolean;

    Function ReadNode(Const PNode    : TTreeNode;
                      Var   Storage  : IStorage;
                             Ndx     : Integer) : Boolean;

    Function ReadModel(Const AModel : String) : Boolean;

    Procedure SetOptionsMenu(CState : Integer);
    procedure DisplayResources(FileName : String);
    procedure UpdateViewPanel;
    procedure UpdateListView(AStrings : TStringList);
    Procedure UpdateTreeView;
  end;

var
  WfModelForm: TWfModelForm;

implementation

uses
     WfMDlg, WfSub;


{$R *.DFM}
{$R WFIMAGES.RES}

const
  itBitmap: TResType = rtBitmap; // Reference for duplicate identifier
  CLOSEFOLDER_BMP = 0;
  OPENFOLDER_BMP  = 1;
  GEARS_BMP       = 2;
  WIN95_BMP       = 3;
  ARROW_BMP       = 4;
  PAINT_BMP       = 5;
  INNOVIEW        = 0;
  INTREEVIEW      = 1;
  INLISTVIEW      = 2;
  SNoResSelected = 'No resource selected';

{ Utility Functions }

procedure Error(const ErrMsg: string);
begin
  raise Exception.Create(ErrMsg);
end;

procedure ErrorFmt(const ErrMsg: string; Params: array of const);
begin
  raise Exception.Create(format(ErrMsg, Params));
end;

function Confirm(const AMsg: String): Boolean;
begin
  Result := MessageDlg(AMsg, mtConfirmation, mbYesNoCancel, 0) = idYes;
end;

{ Form Initialization }

procedure TWfModelForm.FormCreate(Sender: TObject);
begin
  SplitControl := TSplitControl.Create(Self);
  Small.ResourceLoad(itBitmap, 'SmallImages', clOlive);
  Large.ResourceLoad(itBitmap, 'LargeImages', clOlive);
  OleInitialize(Nil);
end;
procedure TWfModelForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OleUninitialize;
  SplitControl.Free;
end;

procedure TWfModelForm.UpdateViewPanel;
begin
  with TreeView do
  begin
    if Visible and Assigned(Selected) then
    begin
      UpdateListView(TStringList(Selected.Data));
    end;
  end;
end;
Procedure TWfModelForm.UpDateTreeView;
Var
   I : Integer;
begin
  If CurList <> Nil then
  begin
    CurList.Clear;
    For I := 0 to ListView.Items.Count-1 do
      CurList.AddObject(ListView.Items[I].Caption,ListView.Items[I].Data);
    CurList:=Nil;
  end;
end;
procedure TWfModelForm.UpdateListView(AStrings : TStringList);
Var
    I : Integer;
begin
  If ActiveControl = ListView then
    UpdateTreeView;
  ListView.Items.Clear;
  If Assigned(AStrings) then
    for I := 0 to AStrings.Count-1 do
      with ListView.Items.Add do
      begin
        Data := AStrings.Objects[I];
        Caption := AStrings.Strings[I];
        ImageIndex := 2;
      end;

end;

procedure TWfModelForm.ClearModel(Sender: TObject);
begin
  ListView.Items.Clear;
  TreeView.Selected := nil;
  TreeView.Items.Clear;
end;

Procedure TWfModelForm.SetOptionsMenu(CState : Integer);
begin
  Options1.Enabled:=CState<>INNOVIEW;
  Case CState Of
    INTREEVIEW : begin
                   AddWorkFlowClass1.Enabled:=True;
                   AddWorkFlowSubClass1.Enabled:=True;
                   AddWorkFlowStep1.Enabled:=False;
                   CopyModel1.Enabled:=True;
                 end;
    INLISTVIEW : begin
                   AddWorkFlowClass1.Enabled:=False;
                   AddWorkFlowSubClass1.Enabled:=False;
                   AddWorkFlowStep1.Enabled:=True;
                   CopyModel1.Enabled:=False;
                 end;
  end;
end;
Function TWfModelForm.AddModelNode(Const S : String) : TTReeNode;
begin
  TreeView.Selected:=Nil;
  Result:=TreeView.Items.Add(Nil,S);
  Result.ImageIndex := CLOSEFOLDER_BMP;
  Result.SelectedIndex := OPENFOLDER_BMP;
  TreeView.Selected:=Result;
end;
Function TWfModelForm.AddChildNode(Const S     : String;
                                   Const PNode : TTreeNode;
                                   Const SList : TStringList) : TTreeNode;
begin
  Result:=TreeView.Items.AddChildObJect(PNode,S,SList);
  Result.ImageIndex := CLOSEFOLDER_BMP;
  Result.SelectedIndex := OPENFOLDER_BMP;
end;
Function TWfModelForm.CopyNode(Const PNode : TTreeNode;
                               Const ANode : TTreeNode) : Boolean;
Var
    TNode : TTreeNode;
    I     : Integer;
begin
  Result:=true;
  If ANode.Data<>Nil then
  begin
    CurList:=TStringList.Create;
    CurList.Assign(TStringList(ANode.Data));
  end
  else
    CurList:=Nil;
  TNode:=AddChildNode(ANode.Text,PNode,CurList);
  CurList:=Nil;
  For I:=0 to ANode.Count-1 do
    If NOT CopyNode(TNode,ANode.Item[I]) then
    begin
      Result:=False;
      Break;
    end;
end;
procedure TWfModelForm.CopyModel1Click(Sender: TObject);
Var
   ClsName : String;
   SNode   : TTreeNode;
   PNode   : TTreeNode;
   I       : Integer;
begin
  If (ActiveControl=TreeView) then With TreeView do
  begin
    If (Selected<>Nil) AND (Selected.Parent=Nil) then
    If WfModelDlg.ShowModal=MrOk then
    begin
      ClsName:=WfModelDlg.ModelNameEdit.text;
      If ClsName='' then
        ClsName:='NEW MODULE';
      SNode:=Selected;
      PNode:=AddModelNode(ClsName);
      If PNode<>Nil then
        For I:=0 to SNode.Count-1 do
          If NOT CopyNode(PNode,SNode[I]) then
            Break;
    end;
  end;
end;

Function TWfModelForm.ReadNode(Const PNode    : TTreeNode;
                            Var   Storage  : IStorage;
                                   Ndx     : Integer) : Boolean;
Var
     SubStorage : IStorage;
     Stream     : IStream;
     I          : Integer;
     S          : String;
     SubNodes   : Integer;
     SubItems   : Integer;
     CNode      : TTreeNode;
begin
  Result:=False;
  With TreeStorage do
    If OpenSubStorage('NODE'+IntToStr(Ndx),STGM_DIRECT OR STGM_READ
                        OR STGM_SHARE_EXCLUSIVE,Storage,SubStorage) then
    begin
      If OpenStream(SubStorage,'DATA',STGM_DIRECT OR STGM_READ
                    OR STGM_SHARE_EXCLUSIVE,Stream) then
      begin
        Result:=ReadString(Stream,S);
        If Result then
          Result:=ReadInt(Stream,SubNodes);
        If Result then
        begin
          Result:=ReadInt(Stream,SubItems);
          If Result then
          begin
            If SubItems>0 then
              CurList:=TStringList.Create
            else
              CurList:=Nil;
            CNode:=AddChildNode(S,PNode,CurList);
            If SubItems>0 then
            begin
              For I:=0 to SubItems-1 do
              begin
                Result:=ReadString(Stream,S);
                If Result then
                  CurList.Add(S)
                else
                  Break;
              end;
              CurList:=Nil;
            end;
          end;
        end;
        DoneStream(Stream);
      end;
      If Result then
        For I:= 0 to SubNodes-1 do
        begin
          Result:=ReadNode(CNode,SubStorage,I);
          If NOT Result then
            Break;
        end;
      DoneStorage(SubStorage);
    end;
end;
Function TWfModelForm.ReadModel(Const AModel : String) : Boolean;
Var
     Storage  : IStorage;
     Stream   : IStream;
     I        : Integer;
     SubNodes : Integer;
     S        : String;
     CNode    : TTreeNode;
begin
  Result:=False;
  With TreeStorage do
    If OpenSubStorage(AModel,STGM_DIRECT OR STGM_READ
                      OR STGM_SHARE_EXCLUSIVE,StorageFile,Storage) then
    begin
      SubNodes:=0;
      If OpenStream(Storage,'DATA',STGM_DIRECT OR STGM_READ
                    OR STGM_SHARE_EXCLUSIVE,Stream) then
      begin
        Result:=ReadString(Stream,S);
        If Result then
          Result:=ReadInt(Stream,SubNodes);
        DoneStream(Stream);
      end;
      If Result then
      begin
        CNode:=AddModelNode(S);
        For I:= 0 to SubNodes-1 do
        begin
          Result:=ReadNode(CNode,Storage,I);
          If NOT Result then
            Break;
        end;
      end;
      DoneStorage(Storage);
    end;
end;

procedure TWfModelForm.DisplayResources(FileName : String);
Var
    Stream      : IStream;
    I           : Integer;
    Success     : Boolean;
    NumModels   : Integer;
    S           : String;
begin
  TreeStorage:=TStructuredStorage.Create;
  Try
    With TreeStorage do
      If IsStorageFile(FileName) then
      begin
        ClearModel(Self);
        If OpenStorageFile(FileName,STGM_DIRECT OR STGM_READ OR
                                    STGM_SHARE_DENY_WRITE) then
        begin
          If OpenStream(StorageFile,'MODELS',STGM_DIRECT OR STGM_READ
                                    OR STGM_SHARE_EXCLUSIVE,Stream) then
          begin
            Success:=ReadInt(Stream,NumModels);
            DoneStream(Stream);
            If Success then
            begin
              For I:=0 to NumModels-1 do
                ReadModel('MODEL'+IntToStr(I));
            end
            else; {Error}
          end
          else ; {Do An Error}
        end
        else ; {Error}
        with TreeView do
        begin
          SetFocus;
          Selected := Items[0];
        end;
      end
      else ; {Do an Error}
  Except
    TreeStorage.Free;
    Raise;
  end;
  TreeStorage.Free;

end;

procedure TWfModelForm.FileOpen(Sender: TObject);
begin
  with FileOpenDialog do
  begin
    if not Execute then Exit;
    DisplayResources(FileName);
  end;
end;


Function TWfModelForm.StoreNode(Var   Storage     : IStorage;
                                   CNode       : TTreeNode;
                                   Ndx         : Integer) : Boolean;
Var
     SubStorage : IStorage;
     Stream     : IStream;
     I          : Integer;
begin
  Result:=False;
  With TreeStorage do
    If CreateSubStorage('NODE'+IntToStr(Ndx),STGM_DIRECT OR STGM_CREATE OR STGM_WRITE
                        OR STGM_SHARE_EXCLUSIVE,Storage,SubStorage) then
    begin
      If CreateStream(SubStorage,'DATA',STGM_DIRECT OR STGM_CREATE
                      OR STGM_WRITE OR STGM_SHARE_EXCLUSIVE,Stream) then
      begin
        Result:=WriteString(Stream,CNode.Text);
        If Result then
          Result:=WriteInt(Stream,CNode.Count);
        If Result then
          If CNode.Data<>Nil then
          begin
            CurList:=TStringList(CNode.Data);
            Result:=WriteInt(Stream,CurList.Count);
            If Result then
              For I:=0 to CurList.Count-1 do
                WriteString(Stream,CurList.Strings[I]);
            CurList:=Nil;
          end
          else
            Result:=WriteInt(Stream,0);
        DoneStream(Stream);
      end;
      With CNode do
       For I:= 0 to Count-1 do
       begin
         Result:=StoreNode(SubStorage,Item[I],I);
         If NOT Result then
           Break;
       end;
      DoneStorage(SubStorage);
    end;
end;

Function TWfModelForm.StoreModel(      CNode  : TTreeNode;
                              Const AModel : String) : Boolean;
Var
     Storage : IStorage;
     Stream  : IStream;
     I       : Integer;
begin
  Result:=False;
  With TreeStorage do
    If CreateSubStorage(AModel,STGM_DIRECT OR STGM_CREATE OR STGM_WRITE
                        OR STGM_SHARE_EXCLUSIVE,StorageFile,Storage) then
    begin
      If CreateStream(Storage,'DATA',STGM_DIRECT OR STGM_CREATE
                      OR STGM_WRITE OR STGM_SHARE_EXCLUSIVE,Stream) then
      begin
        Result:=WriteString(Stream,CNode.Text);
        If Result then
          Result:=WriteInt(Stream,CNode.Count);
        DoneStream(Stream);
      end;
      With CNode do
       For I:= 0 to Count-1 do
       begin
         Result:=StoreNode(Storage,Item[I],I);
         If NOT Result then
           Break;
       end;
      DoneStorage(Storage);
    end;
end;

procedure TWfModelForm.SaveResource(Sender: TObject);
Var
    Stream      : IStream;
    I           : Integer;
    Success     : Boolean;
    ModelCount  : Integer;
begin
  If TreeView.Items.Count>0 then
  begin
    If ActiveControl = ListView then
      UpdateTreeView;
    Success:=False;
    FileSaveDialog.FileName:=FileOpenDialog.FileName;
    with FileSaveDialog do
      if Execute then
      begin
        TreeStorage:=TStructuredStorage.Create;
        Try
          If TreeStorage.CreateStorageFile(FileName,STGM_DIRECT OR STGM_CREATE OR STGM_WRITE
                                           OR STGM_SHARE_EXCLUSIVE) then
          begin
            CurList:=Nil;
            With TreeStorage do
            begin
              If CreateStream(StorageFile,'MODELS',STGM_DIRECT OR STGM_CREATE
                              OR STGM_WRITE OR STGM_SHARE_EXCLUSIVE,Stream) then
              begin
                ModelCount:=0;
                For I:=0 to TreeView.Items.Count-1 do
                  If TreeView.Items[I].Parent=Nil then
                    Inc(ModelCount);
                Success:=WriteInt(Stream,ModelCount);
                If Success then
                  For I:=0 to TreeView.Items.Count-1 do
                  begin
                    If TreeView.Items[I].Parent=Nil then
                    begin
                      Success:=WriteString(Stream,TreeView.Items[I].Text);
                      IF NOT Success then
                        Break;
                    end;
                  end;
                DoneStream(Stream);
              end
              else ; {Do An Error}
              ModelCount:=0;
              If Success then
                For I:=0 to TreeView.Items.Count-1 do
                  If TreeView.Items[I].Parent=Nil then
                    If NOT StoreModel(TreeView.Items[I],'MODEL'+IntToStr(ModelCount)) then
                    begin
                      Success:=False;
                      Break;
                    end
                    else
                      Inc(ModelCount);
            end;
          end
          else{Do An Error}
          begin
          end;
        except
          TreeStorage.Free;
          Raise;
        end;
        TreeStorage.Free;
      end;
    If Success then
      FileOpenDialog.FileName:=FileSaveDialog.FileName;
  end;
end;
procedure TWfModelForm.FileExit(Sender: TObject);
begin
  Close;
end;
procedure TWfModelForm.SelectViewType(Sender: TObject);
begin
  If TComponent(Sender).Tag=0 then
  begin
    ListView.ViewStyle:=VsIcon;
    TreeView.Images:=Large;
  end
  else
  begin
    ListView.ViewStyle:=VsList;
    TreeView.Images:=Small;
  end;
end;
procedure TWfModelForm.ListViewEnter(Sender: TObject);
begin
  SetOptionsMenu(INLISTVIEW);
  If TreeView.Selected<>Nil then
    CurList:=TStringList(TreeView.Selected.Data)
  else
    CurList:=Nil;
  with ListView do
    if (Items.Count > 1) and (Selected = nil) then
    begin
      Selected := Items[0];
      ItemFocused := Selected;
    end;
end;

procedure TWfModelForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  UpdateViewPanel;
end;

procedure TWfModelForm.ViewMenuDropDown(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to miView.Count-1 do
    with miView.Items[I] do
      if GroupIndex = 1 then
        Checked := (Tag = Ord(ListView.ViewStyle));
end;

procedure TWfModelForm.SplitterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Shift = [ssLeft]) then
    SplitControl.BeginSizing(Splitter, TreeViewPanel);
end;

procedure TWfModelForm.SplitterMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  with SplitControl do if Sizing then ChangeSizing(X, Y);
end;

procedure TWfModelForm.SplitterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with SplitControl do if Sizing then EndSizing;
end;


procedure TWfModelForm.AddWfClass(Sender: TObject);
Var
   ClsName : String;
begin
  If WfModelDlg.ShowModal=MrOk then
  begin
    ClsName:=WfModelDlg.ModelNameEdit.text;
    If ClsName='' then
      ClsName:='NEW MODULE';
    AddModelNode(ClsName);
  end;
end;

procedure TWfModelForm.AddWfSubClass(Sender: TObject);
Var
    ClsName : String;
    AStrings  : TStringList;
begin
  If (ActiveControl=TreeView) AND (TreeView.Selected<>Nil) then
    If WfSubClassForm.ShowModal=MrOk then
    begin
      AStrings:=Nil;
      With WfSubClassForm do
      begin
        ClsName:=EditClassName.Text;
        If Memo1.Lines.Count>0 then
        begin
          AStrings:=TStringList.Create;
          AStrings.Assign(Memo1.Lines);
        end;
      end;
      If ClsName='' then
        ClsName:='NEW MODULE ITEM';
      TreeView.Items.AddChildObJect(TreeView.Selected,ClsName,AStrings);
    end;
end;

procedure TWfModelForm.ListViewExit(Sender: TObject);
begin
  UpdateTreeView;
  SetOptionsMenu(INNOVIEW);
end;

procedure TWfModelForm.AddWorkFlowStep1Click(Sender: TObject);
Var
   ClsName : String;
   NewItem : TListItem;
begin
  If ActiveControl=ListView then
  begin
    If NOT InputQuery('WorkFlow Step', 'Step Name', ClsName) then
      ClsName:='NEW WORKFLOW STEP';
    With ListView do
      If Selected<>Nil then
        NewItem:=Items.Insert(Selected.Index)
      else
        NewItem:=Items.Add;
    With NewItem do
    begin
      Data       := Nil;
      Caption    := ClsName;
      ImageIndex := 2;
    end;
  end;
end;

procedure TWfModelForm.TreeViewEnter(Sender: TObject);
begin
  SetOptionsMenu(INTREEVIEW);
end;

procedure TWfModelForm.TreeViewExit(Sender: TObject);
begin
  SetOptionsMenu(INNOVIEW);
end;

procedure TWfModelForm.DeleteWfItem(Sender: TObject);
begin
  If ActiveControl=ListView then
  begin
    If ListView.Selected<>Nil then
      ListView.Items.Delete(ListView.Selected.Index);
  end
  else If ACtiveControl=TreeView then
    If TreeView.Selected<>Nil then
    begin
      TreeView.Selected.DeleteChildren;
      TreeView.Selected.Delete;
      ListView.Items.Clear;
    end;
end;

procedure TWfModelForm.TvDeleteNode(Sender: TObject; Node: TTreeNode);
begin
  If Node.Data<>Nil then
    TStringList(Node.Data).Free;
end;







end.
