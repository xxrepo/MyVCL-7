{********************************************************************}
{ IntraWeb script editor property editor                             }
{ for Delphi & C++Builder                                            }
{ version 1.0                                                        }
{                                                                    }
{ written by : TMS Software                                          }
{               copyright © 2002 - 2003                              }
{               Email : info@tmssoftware.com                         }
{               Web : http://www.tmssoftware.com                     }
{********************************************************************}
unit AdvMemoDE;

interface
{$I TMSDEFS.INC}

uses
  Classes, AdvMemo, Dialogs, uMemoEdit, Forms, Controls, AdvMemoAC,
  {$IFDEF DELPHI6_LVL}
  DesignIntf, DesignEditors
  {$ELSE}
  DsgnIntf
  {$ENDIF}
  ;
                                                        
type
  TAdvMemoProperty = class(TClassProperty)
  public
    function GetAttributes:TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TAdvMemoEditor = class(TDefaultEditor)
  protected
  {$IFNDEF DELPHI6_LVL}
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); override;
  {$ELSE}
    procedure EditProperty(const PropertyEditor: IProperty; var Continue: Boolean); override;
  {$ENDIF}
  public
    function GetVerb(index: Integer):string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

  TMemoAutoCorrectProperty = class(TClassProperty)
  public
    function GetAttributes:TPropertyAttributes; override;
    procedure Edit; override;
  end;

implementation

uses
  SysUtils;

{ TIWScriptEventProperty }

procedure TAdvMemoProperty.Edit;
var
  SE: TTMSMemoEdit;
begin
  SE := TTMSMemoEdit.Create(Application);

  try
    SE.AdvMemo1.Lines.Assign(TStrings(GetOrdValue));

    if GetComponent(0) is TAdvMemo then
    begin
      SE.AdvMemo1.SyntaxStyles := (GetComponent(0) as TAdvMemo).SyntaxStyles;
    end;

    if SE.ShowModal = mrOk then
      SetOrdValue(longint(SE.AdvMemo1.Lines));
  finally
    SE.Free;
  end;
end;

function TAdvMemoProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TAdvMemoEditor }
{$IFDEF DELPHI6_LVL}
procedure TAdvMemoEditor.EditProperty(const PropertyEditor: IProperty; var Continue: Boolean);
{$ELSE}
procedure TAdvMemoEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
{$ENDIF}
var                             
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'LINES') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TAdvMemoEditor.GetVerb(Index: Integer):string;
begin
  if Index = 0 then
    Result := 'About';
end;

function TAdvMemoEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TAdvMemoEditor.ExecuteVerb(Index: Integer);
var
  compiler:string;

begin
  {$IFDEF VER100}
  compiler := 'Delphi 3';
  {$ENDIF}
  {$IFDEF VER110}
  compiler := 'C++Builder 3';
  {$ENDIF}
  {$IFDEF VER120}
  compiler := 'Delphi 4';
  {$ENDIF}
  {$IFDEF VER125}
  compiler := 'C++Builder 4';
  {$ENDIF}
  {$IFDEF VER130}
  {$IFDEF BCB}
  compiler := 'C++Builder 5';
  {$ELSE}
  compiler := 'Delphi 5';
  {$ENDIF}
  {$ENDIF}
  {$IFDEF VER140}
    {$IFDEF BCB}
    compiler := 'C++Builder 6';
    {$ELSE}
    compiler := 'Delphi 6';
    {$ENDIF}
  {$ENDIF}
  {$IFDEF VER150}
    {$IFDEF BCB}
    compiler := '';
    {$ELSE}
    compiler := 'Delphi 7';
    {$ENDIF}
  {$ENDIF}

  if Index = 0 then
    MessageDlg(Component.ClassName+' version '+(Component as TAdvCustomMemo).GetVersionString+' for '+compiler+#13#10'© 2001-2003 by TMS software',
               mtinformation,[mbok],0);
end;

{ TMemoAutoCorrectProperty }

procedure TMemoAutoCorrectProperty.Edit;
var
  Dlg: TMemoAC;
  i: Integer;
  Memo: TAdvMemo;
begin
  Dlg := TMemoAc.Create(Application);

  Memo := TAdvMemo(GetComponent(0));

  if Memo.AutoCorrect.OldValue.Count > 0 then
    Dlg.StringGrid1.RowCount := 1 + Memo.AutoCorrect.OldValue.Count;

  for i := 1 to Memo.AutoCorrect.OldValue.Count do
  begin
    Dlg.StringGrid1.Cells[0,i] := Memo.AutoCorrect.OldValue.Strings[i - 1];
    Dlg.StringGrid1.Cells[1,i] := Memo.AutoCorrect.NewValue.Strings[i - 1];
  end;

  if Dlg.ShowModal = mrOk then
  begin
    Memo.AutoCorrect.OldValue.Clear;
    Memo.AutoCorrect.NewValue.Clear;

    for i := 1 to Dlg.StringGrid1.RowCount - 1 do
    begin
      Memo.AutoCorrect.OldValue.Add(Dlg.StringGrid1.Cells[0,i]);
      Memo.AutoCorrect.NewValue.Add(Dlg.StringGrid1.Cells[1,i]);
    end;
  end;

  Dlg.Free;

end;

function TMemoAutoCorrectProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

end.




