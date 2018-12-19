unit IssueListSchedule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IssueListForm, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxImageComboBox, cxMaskEdit, cxLookupEdit, cxDBLookupComboBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, ExtCtrls, StdCtrls, cxSpinEdit, DBCtrls;

type
  TfrmSchedule = class(TfrmBasic)
    ScrollBox: TScrollBox;
    cxDBTextEdit9: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label1: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSchedule: TfrmSchedule;

implementation

{$R *.dfm}

uses
  IssueListForms, IssueListConst, IssueListData;


initialization

  FormManager.RegisterForm(ScheduleFormID, TfrmSchedule, 'SCHEDULE');

end.
