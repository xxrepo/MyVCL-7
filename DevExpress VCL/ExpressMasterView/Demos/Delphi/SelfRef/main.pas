unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxMasterView, Db, DBTables, StdCtrls, ExtCtrls;

type
  TfmMain = class(TForm)
    MasterView: TdxMasterView;
    DataSource1: TDataSource;
    Table1: TTable;
    lvlProducts: TdxMasterViewLevel;
    lvlControls: TdxMasterViewLevel;
    lvlComponents: TdxMasterViewLevel;
    lvlComponentsPr_name: TdxMasterViewColumn;
    lvlComponentsPr_info: TdxMasterViewColumn;
    lvlControlsPr_name: TdxMasterViewColumn;
    lvlControlsPr_info: TdxMasterViewColumn;
    lvlProductsPr_name: TdxMasterViewColumn;
    lvlProductsPr_info: TdxMasterViewColumn;
    MasterViewStyle1: TdxMasterViewStyle;
    MasterViewStyle2: TdxMasterViewStyle;
    MasterViewStyle3: TdxMasterViewStyle;
    MasterViewStyle4: TdxMasterViewStyle;
    MasterViewStyle5: TdxMasterViewStyle;
    plBottom: TPanel;
    btnFullCollapse: TButton;
    btnFullExpand: TButton;
    Customize: TButton;
    procedure lvlProductsFilterRecord(Sender: TdxMasterViewLevel;
      const AID, AKeyValue: Variant; var Accept: Boolean);
    procedure btnFullCollapseClick(Sender: TObject);
    procedure btnFullExpandClick(Sender: TObject);
    procedure CustomizeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}
//load records only
procedure TfmMain.lvlProductsFilterRecord(Sender: TdxMasterViewLevel;
  const AID, AKeyValue: Variant; var Accept: Boolean);
begin
  //load only the root level's records
  Accept := Sender.DataSet.FieldByName('Pr_Parent').AsInteger = -1;
end;

procedure TfmMain.btnFullCollapseClick(Sender: TObject);
begin
  MasterView.FullCollapse;
end;

procedure TfmMain.btnFullExpandClick(Sender: TObject);
begin
  MasterView.FullExpand;
end;

procedure TfmMain.CustomizeClick(Sender: TObject);
begin
  MasterView.Customizing := not MasterView.Customizing; 
end;

end.
