inherited frmOlapBrowser: TfrmOlapBrowser
  Left = 228
  Top = 187
  Caption = 'PivotGrid - OLAP Browser Demo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Caption = 
      'This demo shows you how to mine data from an OLAP cube. To run t' +
      'his demo you must have the MSOLAP 8.0 or 9.0 OLE DB provider prop' +
      'erly installed on your system.'
  end
  object UnboundPivotGrid: TcxPivotGrid [1]
    Left = 0
    Top = 32
    Width = 807
    Height = 519
    OLAPDataSource = OLAPDataSource
    Align = alClient
    Groups = <>
    ParentFont = False
    TabOrder = 0
  end
  inherited mmMain: TMainMenu
    inherited miFile: TMenuItem
      object NewConnection1: TMenuItem [0]
        Caption = 'New Connection'
        OnClick = NewConnection1Click
      end
      object N3: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  object OLAPDataSource: TcxPivotGridOLAPDataSource
    Active = False
    Left = 712
  end
end
