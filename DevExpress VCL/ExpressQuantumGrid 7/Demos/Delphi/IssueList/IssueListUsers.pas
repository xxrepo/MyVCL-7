unit IssueListUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IssueListForm, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupComboBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxDBEdit, DBCtrls, cxDBLookupEdit,
  cxNavigator;

type
  TfrmUsers = class(TfrmBasic)
    Label9: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label3: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBTextEdit4: TcxDBTextEdit;
  private
    { Private declarations }
  public
  end;

  
implementation

{$R *.dfm}

uses
  IssueListForms, IssueListConst, IssueListData;

{ TfrmUsers }

initialization

 FormManager.RegisterForm(UsersFormID, TfrmUsers, 'USERS');

end.
