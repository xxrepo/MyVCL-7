unit EditorsInPlaceDemoCars;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxControls, cxGridCustomView,
  cxGridLevel, cxGrid, Grids, DBGrids, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, cxClasses, StdCtrls,
  cxDropDownEdit, cxDBEdit, cxMemo, cxCheckBox, cxMaskEdit, cxSpinEdit,
  cxContainer, cxTextEdit, cxImageComboBox, cxListBox, DBCtrls;

type
  TEditorsInPlaceDemoCarsForm = class(TForm)
    pnlCarInfo: TPanel;
    cxDBMemo1: TcxDBMemo;
    Panel1: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    GroupBox2: TGroupBox;
    cxDBCheckBox: TcxDBCheckBox;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBListBox: TcxDBListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorsInPlaceDemoCarsForm: TEditorsInPlaceDemoCarsForm;

implementation

uses EditorsInPlaceDemoData;

{$R *.dfm}

end.
