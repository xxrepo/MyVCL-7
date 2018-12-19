unit MDIFrame;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, Menus, jpeg, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, StdActns, ActnList, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sButton,
  sSkinProvider, sSkinManager, sDialogs, sStatusBar, sPanel;

type
  TFrameForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Window1: TMenuItem;
    OpenFileDialog: TsOpenDialog;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    N2: TMenuItem;
    sStatusBar1: TsStatusBar;
    ActionList1: TActionList;
    WindowCascade1: TWindowCascade;
    WindowArrange1: TWindowArrange;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowClose1: TWindowClose;
    Cascade2: TMenuItem;
    ileHorizontally1: TMenuItem;
    ileVertically1: TMenuItem;
    MinimizeAll1: TMenuItem;
    Arrange1: TMenuItem;
    Close1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  end;

var
  FrameForm: TFrameForm;

implementation

uses MDIEdit, acntUtils;

{$R *.DFM}

procedure TFrameForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrameForm.New1Click(Sender: TObject);
begin
  TEditForm.Create(Application);
end;

procedure TFrameForm.Open1Click(Sender: TObject);
begin
  if OpenFileDialog.Execute then TEditForm.Create(Application).Open(OpenFileDialog.FileName);
end;

end.
