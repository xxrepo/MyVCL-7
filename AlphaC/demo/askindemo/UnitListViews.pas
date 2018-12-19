unit UnitListViews;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  sRadioButton, ExtCtrls, sPanel, sGroupBox, ComCtrls, sListView, sFrameAdapter, StdCtrls,
  sComboBox, sButton;

type
  TFrameListViews = class(TFrame)
    sListView1: TsListView;
    sGroupBox10: TsGroupBox;
    sRadioButton21: TsRadioButton;
    sRadioButton22: TsRadioButton;
    sRadioButton23: TsRadioButton;
    sRadioButton24: TsRadioButton;
    sFrameAdapter1: TsFrameAdapter;
    sButton1: TsButton;
    procedure sRadioButton21Change(Sender: TObject);
    procedure sRadioButton22Change(Sender: TObject);
    procedure sRadioButton23Change(Sender: TObject);
    procedure sRadioButton24Change(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  end;

implementation

uses MainUnit;

{$R *.DFM}

procedure TFrameListViews.sRadioButton21Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsIcon;
end;

procedure TFrameListViews.sRadioButton22Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsList;
end;

procedure TFrameListViews.sRadioButton23Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsReport;
end;

procedure TFrameListViews.sRadioButton24Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsSmallIcon;
end;

procedure TFrameListViews.sComboBox1Change(Sender: TObject);
begin
//  sListView1.SkinData.SkinSection := sComboBox1.Text;
end;

procedure TFrameListViews.sButton1Click(Sender: TObject);
var
  i, l : integer;
begin
  sListView1.DoubleBuffered := not sListView1.DoubleBuffered;
  l := sListView1.Items.Count;
  sListView1.Items.BeginUpdate;
  for i := l + 1 to l + 100 do with sListView1.Items.Add do begin
    Caption := 'Item ' + IntToStr(i);
    SubItems.Add('SubItem 1');
    SubItems.Add('SubItem 2');
    SubItemImages[0] := 1;
  end;
  sListView1.Items.EndUpdate;
end;

end.
