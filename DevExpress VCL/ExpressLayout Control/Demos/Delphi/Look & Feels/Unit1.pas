unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, dxLayoutLookAndFeels, dxLayoutControl, ExtCtrls, DBCtrls,
  cxControls, DB, DBTables, Buttons, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DataSource2: TDataSource;
    Table2: TTable;
    DataSource3: TDataSource;
    Table3: TTable;
    lcMain: TdxLayoutControl;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit5: TDBEdit;
    DBImage1: TDBImage;
    dxDBLookupEdit1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBImage2: TDBImage;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    lcMain_Root: TdxLayoutGroup;
    lcMainGroup7: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    lcMainItem7: TdxLayoutItem;
    lcMainGroup4: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup8: TdxLayoutGroup;
    lcMainItem3: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem9: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem12: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    lfStandard: TdxLayoutStandardLookAndFeel;
    lfOffice: TdxLayoutOfficeLookAndFeel;
    lfWeb: TdxLayoutWebLookAndFeel;
    lcMainItem1: TdxLayoutItem;
    SpeedButton1: TSpeedButton;
    lcMainItem8: TdxLayoutItem;
    SpeedButton2: TSpeedButton;
    lcMainItem13: TdxLayoutItem;
    SpeedButton3: TSpeedButton;
    lcMainItem14: TdxLayoutItem;
    SpeedButton4: TSpeedButton;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem15: TdxLayoutItem;
    Bevel1: TBevel;
    procedure SpeedButton4Click(Sender: TObject);
    procedure lcMainCustomization(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  lcMain.Customization := TSpeedButton(Sender).Down;
end;

procedure TForm1.lcMainCustomization(Sender: TObject);
begin
  SpeedButton4.Down := lcMain.Customization;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);

  function GetLookAndFeel(AIndex: Integer): TdxCustomLayoutLookAndFeel;
  begin
    case AIndex of
      0: Result := lfStandard;
      1: Result := lfOffice;
      2: Result := lfWeb;
    else
      Result := nil;
    end;
  end;

begin
  lcMain.LookAndFeel := GetLookAndFeel(TSpeedButton(Sender).Tag);
end;

end.
