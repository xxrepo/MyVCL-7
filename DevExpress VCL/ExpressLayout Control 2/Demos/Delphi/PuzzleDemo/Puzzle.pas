unit Puzzle;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dxLayoutControl, cxControls,
  dxLayoutLookAndFeels, Menus, ActnList, BasicDemoMain;

type
  TfrmPuzzle = class(TfrmBasicDemoMain)
    dxLayoutLookAndFeelList10: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel10: TdxLayoutStandardLookAndFeel;
    lcItem7: TdxLayoutItem;
    Image1: TImage;
    lcItem4: TdxLayoutItem;
    Image2: TImage;
    lcItem6: TdxLayoutItem;
    Image3: TImage;
    lcItem1: TdxLayoutItem;
    Image4: TImage;
    lcItem2: TdxLayoutItem;
    Image5: TImage;
    lcItem8: TdxLayoutItem;
    Image6: TImage;
    lcItem3: TdxLayoutItem;
    Image7: TImage;
    lcItem5: TdxLayoutItem;
    Image9: TImage;
    lcMainGroup2: TdxLayoutGroup;
    Image8: TImage;
    lcItem9: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup1: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    Solvepuzzle1: TMenuItem;
    Shufflepuzzle1: TMenuItem;
    N1: TMenuItem;
    procedure Shufflepuzzle1Click(Sender: TObject);
    procedure Customization1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitializeNewForm; {$IFDEF DELPHI12} override; {$ENDIF}
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

var
  frmPuzzle: TfrmPuzzle;

implementation

{$R *.dfm}

constructor TfrmPuzzle.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
{$IFNDEF DELPHI12}
  InitializeNewForm;
{$ENDIF}
end;

procedure TfrmPuzzle.Shufflepuzzle1Click(Sender: TObject);
var
  AList: TList;
  I, J: Integer;
  AItem: TdxLayoutItem;
  AGroup: TdxLayoutGroup;
begin
  AList := TList.Create;
  try
    AList.Add(lcItem1);
    AList.Add(lcItem2);
    AList.Add(lcItem3);
    AList.Add(lcItem4);
    AList.Add(lcItem5);
    AList.Add(lcItem6);
    AList.Add(lcItem7);
    AList.Add(lcItem8);
    AList.Add(lcItem9);
    lcMain.BeginUpdate;
    try
      lcMain.Items.LayoutDirection := ldVertical;
      Randomize;
      for I := 0 to 2 do
      begin
        AGroup := TdxLayoutGroup.Create(lcMain);
        AGroup.Container := lcMain;
        AGroup.LayoutDirection := ldHorizontal;
        AGroup.Hidden := True;
        AGroup.MoveTo(lcMain.Items, 0);
        for J := 0 to 2 do
        begin
          AItem := TdxLayoutItem(AList[Random(AList.Count)]);
          AList.Extract(AItem);
          AItem.MoveTo(AGroup, J);
        end;
      end;
    finally
      lcMain.EndUpdate;
    end;
  finally
    AList.Free;
  end;
end;

procedure TfrmPuzzle.Customization1Click(Sender: TObject);
begin
  inherited;
  lcMain.CustomizeForm.Left := Left - lcMain.CustomizeForm.Width;
  lcMain.CustomizeForm.Top := Top;
end;

procedure TfrmPuzzle.InitializeNewForm;
begin
{$IFDEF DELPHI12}
  inherited;
{$ENDIF}
  Position := poDesigned;
end;

end.
