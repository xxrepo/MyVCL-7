unit WfSub;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TWfSubClassForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    EditClassName: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SetField(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WfSubClassForm: TWfSubClassForm;

implementation

{$R *.DFM}

procedure TWfSubClassForm.FormShow(Sender: TObject);
begin
  EditClassName.Text:='';
  Memo1.Lines.Clear;
end;

procedure TWfSubClassForm.SetField(Sender: TObject);
begin
  ActiveControl:=EditClassName;
end;

end.
