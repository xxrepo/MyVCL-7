unit FrameAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  sFrameAdapter, sCheckbox, ExtCtrls, sPanel, sGroupBox, StdCtrls, sLabel,
  Buttons, sSpeedButton;

type
  TFrameAbout = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    sGroupBox1: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sPanel1: TsPanel;
    sLabel2: TsLabelFX;
    sLabel1: TsLabelFX;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MainUnit;

{$R *.DFM}

end.
