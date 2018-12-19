{***************************************************************************}
{ TAdvStringGrid Find & replace dialog component                            }
{ for Delphi & C++Builder                                                   }
{ version 1.0                                                               }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright � 2002                                               }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}

{$I TMSDEFS.INC}

unit AsgReplaceDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, AdvGrid;

type
  TAsgReplaceEvent = procedure(Sender: TObject; OldValue: string; var NewValue: string) of object;

  TAdvGridReplaceDialog = class;
  
  TAsgReplaceDialog = class(TForm)
    Options: TGroupBox;
    Label1: TLabel;
    TextToFind: TComboBox;
    Docase: TCheckBox;
    Whole: TCheckBox;
    MatchFirst: TCheckBox;
    IgnoreHTML: TCheckBox;
    Scope: TRadioGroup;
    OkBtn: TButton;
    CancelBtn: TButton;
    Fixed: TCheckBox;
    gbDirection: TGroupBox;
    cbForwardTB: TCheckBox;
    cbForwardLR: TCheckBox;
    cbBackwardBT: TCheckBox;
    cbBackwardRL: TCheckBox;
    Label2: TLabel;
    TextToReplace: TComboBox;
    ReplaceAll: TButton;
    Prompt: TCheckBox;
    procedure OkBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure TextToFindChange(Sender: TObject);
    procedure ScopeClick(Sender: TObject);
    procedure cbForwardTBClick(Sender: TObject);
    procedure cbForwardLRClick(Sender: TObject);
    procedure cbBackwardBTClick(Sender: TObject);
    procedure cbBackwardRLClick(Sender: TObject);
    procedure cbForwardTBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbForwardLRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbBackwardBTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbBackwardRLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ReplaceAllClick(Sender: TObject);
  private
    { Private declarations }
    bInhibitcbForwardTB: boolean;
    bInhibitcbForwardLR: boolean;
    bInhibitcbBackwardBT: boolean;
    bInhibitcbBackwardRL: boolean;
  public
    { Public declarations }
    bInhibitToggle: boolean;
    FGrid: TAdvStringGrid;
    FGridCell: TPoint;
    FReplaceDlg: TAdvGridReplaceDialog;
    FMsgNoMoreFound: string;
    FMsgNotFound: string;
    FMsgReplace: string;
    FAutoPosition: Boolean;
  end;


  TAdvGridReplaceDialog = class(TComponent)
  private
    FGrid: TAdvStringGrid;
    FAsgReplace: TAsgReplaceDialog;
    FTxtCaption: string;
    FTxtOptionsWholeWords: string;
    FTxtScope: string;
    FTxtDirForward1: string;
    FTxtDirForward2: string;
    FTxtBtnOk: string;
    FTxtScopeCurrCol: string;
    FTxtOptionsCase: string;
    FTxtOptionsFixedCells: string;
    FTxtOptionsMatchFirst: string;
    FTxtScopeAllCells: string;
    FTxtTextToFind: string;
    FTxtScopeCurrRow: string;
    FTxtBtnCancel: string;
    FTxtDirBackward1: string;
    FTxtDirBackward2: string;
    FTxtDirection: string;
    FTxtOptionsIgnoreHTML: string;
    FTxtOptions: string;
    FMsgNoMoreFound: string;
    FMsgNotFound: string;
    FAutoPosition: Boolean;
    FTxtTextToReplace: string;
    FTxtPrompt: string;
    FMsgReplace: string;
    FTxtBtnReplaceAll: string;
    FOnReplace: TAsgReplaceEvent;
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
  published
    property AutoPosition: Boolean read FAutoPosition write FAutoPosition;
    property Grid: TAdvStringGrid read FGrid write FGrid;
    property MsgNotFound: string read FMsgNotFound write FMsgNotFound;
    property MsgNoMoreFound: string read FMsgNoMoreFound write FMsgNoMoreFound;
    property MsgReplace: string read FMsgReplace write FMsgReplace;
    property TxtCaption: string read FTxtCaption write FTxtCaption;
    property TxtTextToFind: string read FTxtTextToFind write FTxtTextToFind;
    property TxtTextToReplace: string read FTxtTextToReplace write FTxtTextToReplace;
    property TxtDirection: string read FTxtDirection write FTxtDirection;
    property TTxtDirForward1: string read FTxtDirForward1 write FTxtDirForward1;
    property TTxtDirForward2: string read FTxtDirForward2 write FTxtDirForward2;
    property TTxtDirBackward1: string read FTxtDirBackward1 write FTxtDirBackward1;
    property TTxtDirBackward2: string read FTxtDirBackward2 write FTxtDirBackward2;
    property TxtScope: string read FTxtScope write FTxtScope;
    property TxtScopeAllCells: string read FTxtScopeAllCells write FTxtScopeAllCells;
    property TxtScopeCurrRow: string read FTxtScopeCurrRow write FTxtScopeCurrRow;
    property TxtScopeCurrCol: string read FTxtScopeCurrCol write FTxtScopeCurrCol;
    property TxtOptions: string read FTxtOptions write FTxtOptions;
    property TxtOptionsCase: string read FTxtOptionsCase write FTxtOptionsCase;
    property TxtOptionsWholeWords: string read FTxtOptionsWholeWords write FTxtOptionsWholeWords;
    property TxtOptionsMatchFirst: string read FTxtOptionsMatchFirst write FTxtOptionsMatchFirst;
    property TxtOptionsIgnoreHTML: string read FTxtOptionsIgnoreHTML write FTxtOptionsIgnoreHTML;
    property TxtOptionsFixedCells: string read FTxtOptionsFixedCells write FTxtOptionsFixedCells;
    property TxtPrompt: string read FTxtPrompt write FTxtPrompt;
    property TxtBtnOk: string read FTxtBtnOk write FTxtBtnOk;
    property TxtBtnCancel: string read FTxtBtnCancel write FTxtBtnCancel;
    property TxtBtnReplaceAll: string read FTxtBtnReplaceAll write FTxtBtnReplaceAll;
    property OnReplace: TAsgReplaceEvent read FOnReplace write FOnReplace;
  end;


implementation

{$R *.DFM}

procedure TAsgReplaceDialog.OkBtnClick(Sender: TObject);
var
  FirstSearch: Boolean;
  FindParams: TFindParams;
  r: TRect;
  pt1,pt2: TPoint;
  DoReplace: Boolean;
  NewValue,OldValue: string;
begin
  if Assigned(FGrid) then
  begin
    if (TextToFind.Text <> '') and
       (TextToFind.Items.IndexOf(TextToFind.Text) = -1) then
      TextToFind.Items.Add(TextToFind.Text);

    if (TextToReplace.Text <> '') and
       (TextToReplace.Items.IndexOf(TextToReplace.Text) = -1) then
      TextToReplace.Items.Add(TextToReplace.Text);


    FindParams := [fnAutoGoto];

    if DoCase.Checked then
      FindParams := FindParams + [fnMatchCase];
    if Whole.Checked then
      FindParams := FindParams + [fnMatchFull];
    if MatchFirst.Checked then
      FindParams := FindParams + [fnMatchStart];
    if IgnoreHTML.Checked then
      FindParams := FindParams + [fnIgnoreHTMLTags];
    if Fixed.Checked then
      FindParams := FindParams + [fnIncludeFixed];
    if cbBackwardBT.Checked or cbBackwardRL.Checked then
      FindParams := FindParams + [fnBackward];
    if cbForwardLR.Checked or cbBackwardRL.Checked then
      FindParams := FindParams + [fnDirectionLeftRight];
    if Scope.ItemIndex = 1 then
      FindParams := FindParams + [fnFindInCurrentRow];
    if Scope.ItemIndex = 2 then
      FindParams := FindParams + [fnFindInCurrentCol];

    FirstSearch := (FGridCell.x = -1) and (FGridCell.y = -1);

    while FirstSearch or ((FGridCell.X <> -1) and (FGridCell.Y <> -1)) do
    begin
      Hide;
      FGridCell := FGrid.Find(FGridCell,TextToFind.Text,FindParams);

      if (FGridCell.x = -1) and (FGridCell.y = -1) then
      begin
        if FirstSearch then
          MessageDlg(FMsgNotFound + ' '#13+'"'+TextToFind.Text+'"',mtInformation,[mbOK],0)
        else
          MessageDlg(FMsgNoMoreFound + ' '#13+'"'+TextToFind.Text+'"',mtInformation,[mbOK],0);
      end
      else
      begin
        DoReplace := True;

        if Prompt.Checked then
        begin
           DoReplace := MessageDlg(FMsgReplace,mtInformation,[mbYes,mbNo],0)=mrYes;
        end;

        if DoReplace then
        begin
          OldValue := FGrid.Cells[FGridCell.X,FGridCell.Y];
          {$IFDEF DELPHI4_LVL}
          NewValue := StringReplace(OldValue,TextToFind.Text,TextToReplace.Text,[rfReplaceAll]);
          {$ELSE}
          NewValue := StringReplace(OldValue,TextToFind.Text,TextToReplace.Text,'$amp');
          {$ENDIF}

          if Assigned(FReplaceDlg.OnReplace) then
            FReplaceDlg.OnReplace(FReplaceDlg,OldValue,NewValue);

          FGrid.Cells[FGridCell.X,FGridCell.Y] := NewValue;


        end;

        if FAutoPosition then
        begin
          r := FGrid.CellRect(FGridCell.x, FGridCell.Y);
          pt1 := Point(r.Left,r.Top);
          pt2 := Point(r.Right,r.Bottom);
          pt1 := FGrid.ClientToScreen(pt1);
          pt2 := FGrid.ClientToScreen(pt2);

          if pt1.y + Height > Screen.Height then
            r.Top := pt2.y - Height
          else
            r.Top := pt1.y;

          if pt1.x + Width > Screen.Width then
            r.Left := pt1.x - Width
          else
            r.Left := pt2.x;

          Left := r.Left;
          Top := r.Top;
        end;
      end;
      
      FirstSearch := False;
    end;  
  end;
end;

procedure TAsgReplaceDialog.FormCreate(Sender: TObject);
begin
  FGridCell := Point(-1,-1);
end;

procedure TAsgReplaceDialog.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAsgReplaceDialog.TextToFindChange(Sender: TObject);
begin
  FGridCell := Point(-1,-1);
end;

{ TAdvGridReplaceDialog }

constructor TAdvGridReplaceDialog.Create(AOwner: TComponent);
begin
  inherited;
  FAsgReplace := TAsgReplaceDialog.Create(nil);

  FMsgNotFound := 'Could not find text';
  FMsgNoMoreFound := 'No more occurences of text ';
  FMsgReplace := 'Replace this occurence ?';
  
  FTxtCaption := 'Replace text';

  FTxtTextToFind := 'Text to find';
  FTxtTextToReplace := 'Text to replace';

  FTxtDirection := 'Direction';
  FTxtDirForward1 := 'Forward (top to bottom)';
  FTxtDirForward2 := 'Forward (left to right)';
  FTxtDirBackward1 := 'Backward (bottom to top)';
  FTxtDirBackward2 := 'Backward (right to left)';

  FTxtScope := 'Scope';
  FTxtScopeCurrCol := 'Current column only';
  FTxtScopeCurrRow := 'Current row only';
  FTxtScopeAllCells := 'All cells';

  FTxtOptionsCase := '&Case sensitive';
  FTxtOptionsMatchFirst := '&Match from first char';
  FTxtOptionsFixedCells := '&Find in fixed cells';
  FTxtOptionsWholeWords := '&Whole words only';
  FTxtOptionsIgnoreHTML := '&Ignore HTML tags';

  FTxtPrompt := '&Prompt on replace';

  FTxtBtnCancel := 'Cancel';
  FTxtBtnOk := 'Ok';
  FTxtBtnReplaceAll := 'Replace all';
end;

destructor TAdvGridReplaceDialog.Destroy;
begin
  FAsgReplace.Free;
  inherited;
end;

procedure TAdvGridReplaceDialog.Execute;
begin
  FAsgReplace.FGrid := Self.FGrid;
  FAsgReplace.FReplaceDlg := Self;
  
  FAsgReplace.Caption := FTxtCaption;

  FAsgReplace.FAutoPosition := FAutoPosition;

  FAsgReplace.Options.Caption := FTxtOptions;

  FAsgReplace.Scope.Items[0] := FTxtScopeAllCells;
  FAsgReplace.Scope.Items[1] := FTxtScopeCurrCol;
  FAsgReplace.Scope.Items[2] := FTxtScopeCurrRow;

  FAsgReplace.Scope.Caption := FTxtScope;
  FAsgReplace.gbDirection.Caption := FTxtDirection;

  FAsgReplace.Label1.Caption := FTxtTextToFind;
  FAsgReplace.Label2.Caption := FTxtTextToReplace;

  FAsgReplace.Docase.Caption := FTxtOptionsCase;
  FAsgReplace.Whole.Caption := FTxtOptionsWholeWords;
  FAsgReplace.MatchFirst.Caption := FTxtOptionsMatchFirst;
  FAsgReplace.IgnoreHTML.Caption := FTxtOptionsIgnoreHTML;
  FAsgReplace.Fixed.Caption := FTxtOptionsFixedCells;
  FAsgReplace.Prompt.Caption := FTxtPrompt;

  FAsgReplace.OkBtn.Caption := TxtBtnOK;
  FAsgReplace.CancelBtn.Caption := TxtBtnCancel;
  FAsgReplace.ReplaceAll.Caption := TxtBtnReplaceAll;

  FAsgReplace.cbForwardTB.Caption := FTxtDirForward1;
  FAsgReplace.cbForwardLR.Caption := FTxtDirForward2;
  FAsgReplace.cbBackwardBT.Caption := FTxtDirBackward1;
  FAsgReplace.cbBackwardRL.Caption := FTxtDirBackward2;

  FAsgReplace.FMsgNoMoreFound := FMsgNoMoreFound;
  FAsgReplace.FMsgNotFound := FMsgNotFound;
  FAsgReplace.FMsgReplace := FMsgReplace;

  FAsgReplace.Show;
end;

procedure TAdvGridReplaceDialog.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if (AOperation = opRemove) and (AComponent = FGrid) then
     FGrid := Nil;
  inherited;
end;

procedure TAsgReplaceDialog.ScopeClick(Sender: TObject);
begin
  // if "Current row only" selected, disable
  // bottom-to-top & top-to-bottom directions
  if Scope.ItemIndex = 1 then
  begin
    cbForwardTB.Enabled := False;
    cbBackwardBT.Enabled := False;
    cbBackwardRL.Enabled := True;
    cbForwardLR.Enabled := True;
    if (cbForwardTB.Checked or cbBackwardBT.checked) then
    begin
      cbForwardTB.Checked := False;
      cbBackwardBT.Checked := False;
      cbBackwardRL.Checked := False;
      cbForwardLR.Checked := True;
    end;
  end
  else
  // if "Current column only" selected, disable
  // right-to-left & left-to-right directions
  if Scope.ItemIndex = 2 then
  begin
    cbForwardLR.Enabled := False;
    cbBackwardRL.Enabled := False;
    cbBackwardBT.Enabled := True;
    cbForwardTB.Enabled := True;
    if (cbForwardLR.Checked or cbBackwardRL.Checked) then
    begin
      cbForwardLR.Checked := False;
      cbBackwardRL.Checked := False;
      cbBackwardBT.Checked := False;
      cbForwardTB.Checked := True;
    end;
  end
  else
  // otherwise, enable all direction options
  begin
    cbForwardLR.Enabled := True;
    cbBackwardRL.Enabled := True;
    cbForwardTB.Enabled := True;
    cbBackwardBT.Enabled := True;
  end;
end;

// *** The following code block uses a group of four checkboxes to simulate
// *** a radio groupbox with four buttons.  This was done to produce the
// *** mutually exclusive behavior of radio's, while allowing individual
// *** "radio's" to be enabled/disabled.

procedure TAsgReplaceDialog.cbForwardTBClick(Sender: TObject);
begin
  if cbForwardTB.Checked and not bInhibitcbForwardTB then
  begin
    if cbForwardLR.Checked then
      cbForwardLR.Checked := False;
    if cbBackwardBT.Checked then
      cbBackwardBT.Checked := False;
    if cbBackwardRL.Checked then
      cbBackwardRL.Checked := False;
  end
  else
  if bInhibitcbForwardTB then
  begin
    cbForwardTB.Checked := True;
    bInhibitcbForwardTB := False;
  end;
end;

procedure TAsgReplaceDialog.cbForwardLRClick(Sender: TObject);
begin
  if cbForwardLR.Checked and not bInhibitcbForwardLR then
  begin
    if cbForwardTB.Checked then
      cbForwardTB.Checked := False;
    if cbBackwardBT.Checked then
     cbBackwardBT.Checked := False;
    if cbBackwardRL.Checked then
      cbBackwardRL.Checked := False;
  end
  else
  if bInhibitcbForwardLR then
  begin
    cbForwardLR.Checked := True;
    bInhibitcbForwardLR := False;
  end;
end;

procedure TAsgReplaceDialog.cbBackwardBTClick(Sender: TObject);
begin
  if cbBackwardBT.Checked and not bInhibitcbBackwardBT then
  begin
    if cbForwardTB.Checked then
      cbForwardTB.Checked := False;
    if cbForwardLR.Checked then
      cbForwardLR.Checked := False;
    if cbBackwardRL.Checked then
      cbBackwardRL.Checked := False;
  end
  else
  if bInhibitcbBackwardBT then
  begin
    cbBackwardBT.Checked := True;
    bInhibitcbBackwardBT := False;
  end;
end;

procedure TAsgReplaceDialog.cbBackwardRLClick(Sender: TObject);
begin
  if cbBackwardRL.Checked and not bInhibitcbBackwardRL then
  begin
    if cbForwardTB.Checked then
      cbForwardTB.Checked := False;
    if cbForwardLR.Checked then
      cbForwardLR.Checked := False;
    if cbBackwardBT.Checked then
      cbBackwardBT.Checked := False;
  end
  else
  if bInhibitcbBackwardRL then
  begin
    cbBackwardRL.Checked := True;
    bInhibitcbBackwardRL := False;
  end;
end;

procedure TAsgReplaceDialog.cbForwardTBMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbForwardTB.Checked then
    bInhibitcbForwardTB := True;
end;

procedure TAsgReplaceDialog.cbForwardLRMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbForwardLR.Checked then
    bInhibitcbForwardLR := True;
end;

procedure TAsgReplaceDialog.cbBackwardBTMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbBackwardBT.Checked then
    bInhibitcbBackwardBT := True;
end;

procedure TAsgReplaceDialog.cbBackwardRLMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbBackwardRL.Checked then
    bInhibitcbBackwardRL := True;
end;

// ********* end checkbox group with radiobox behaviour *********

procedure TAsgReplaceDialog.ReplaceAllClick(Sender: TObject);
begin
  Prompt.Checked := False;
  OkBtnClick(Sender);  
end;

end.
