unit CustomFunctionFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxSSheet;

type
  TCustomFunctionForm = class(TForm)
    cxSpreadSheet: TcxSpreadSheet;
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  CustomFunctionForm: TCustomFunctionForm;

implementation

{$R *.DFM}


procedure TCustomFunctionForm.FormCreate(Sender: TObject);
var
  CellObject: TcxSSCellObject;
begin
  try
    cxSpreadSheet.LoadFromFile(ExtractFilePath(Application.ExeName) + '\CustomFunctionEx.xls');
    CellObject := cxSpreadSheet.Sheet.GetCellObject(1,4);
    try
      CellObject.Text := '=Area(B3:B4)';
    finally
      CellObject.Free;
    end;
  except
    on E: Exception do
      Application.ShowException(E);
  end;
end;

end.
