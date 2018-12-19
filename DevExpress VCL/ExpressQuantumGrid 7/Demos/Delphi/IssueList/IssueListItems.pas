unit IssueListItems;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IssueListForm, ExtCtrls, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxDBEdit, DBCtrls, ComCtrls, ToolWin,
  ImgList, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupComboBox, cxImageComboBox;

type
  TfrmItems = class(TfrmBasic)
    PageControl: TPageControl;
    tsGeneral: TTabSheet;
    tsDescription: TTabSheet;
    cxDBMemo1: TcxDBMemo;
    tsResolution: TTabSheet;
    cxDBMemo2: TcxDBMemo;
    ScrollBox: TScrollBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBImageComboBox3: TcxDBImageComboBox;
    cxDBImageComboBox2: TcxDBImageComboBox;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label2: TLabel;
    cxDBDateEdit3: TcxDBDateEdit;
    Label1: TLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    Label5: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    Label4: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label10: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
  private
    { Private declarations }
  public
  end;

var
  frmItems: TfrmItems;

implementation

{$R *.dfm}

uses
  IssueListForms, IssueListConst, IssueListData;

{ TfrmItems }

initialization

 FormManager.RegisterForm(ItemsFormID, TfrmItems, 'PROJECT ITEMS');

end.
