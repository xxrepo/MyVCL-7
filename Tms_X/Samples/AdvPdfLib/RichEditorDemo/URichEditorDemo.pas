unit URichEditorDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, AdvRichEditorToolBar, AdvToolBar,
  AdvToolBarExt, AdvScrollControl, AdvRichEditorBase, AdvRichEditor,
  StdCtrls, AdvRichEditorPDFIO, AdvPDFIO;

type
  TForm1 = class(TForm)
    AdvRichEditor1: TAdvRichEditor;
    AdvRichEditorFormatToolBar1: TAdvRichEditorFormatToolBar;
    AdvRichEditorEditingToolBar1: TAdvRichEditorEditingToolBar;
    btnGeneratePdf: TButton;
    AdvRichEditorEditToolBar1: TAdvRichEditorEditToolBar;
    AdvRichEditorPDFIO1: TAdvRichEditorPDFIO;
    procedure btnGeneratePdfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnGeneratePdfClick(Sender: TObject);
begin
  AdvRichEditorPDFIO1.Save;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvRichEditor1.LoadFromFile('.\sample.rte');
end;

end.
