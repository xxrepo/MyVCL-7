object EditorsInPlaceDemoCarsForm: TEditorsInPlaceDemoCarsForm
  Left = 286
  Top = 110
  Width = 673
  Height = 455
  Caption = 'EditorsInPlaceDemoCarsForm'
  Color = clBtnFace
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarInfo: TPanel
    Left = 48
    Top = 16
    Width = 473
    Height = 321
    Color = 15780517
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object cxDBMemo1: TcxDBMemo
      Left = 8
      Top = 181
      Width = 457
      Height = 128
      DataBinding.DataField = 'Description'
      DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
      Properties.ScrollBars = ssVertical
      Style.Color = 16247513
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 457
      Height = 49
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15780517
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Trade Mark'
      end
      object Label4: TLabel
        Left = 236
        Top = 16
        Width = 29
        Height = 13
        Caption = 'Model'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 68
        Top = 13
        Width = 121
        Height = 21
        DataBinding.DataField = 'Trademark'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 0
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 272
        Top = 13
        Width = 121
        Height = 21
        DataBinding.DataField = 'Model'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 145
      Height = 97
      Caption = 'Engine'
      TabOrder = 1
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        DataBinding.DataField = 'Liter'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 0
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        DataBinding.DataField = 'HP'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 2
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 8
        Top = 40
        Width = 121
        Height = 21
        DataBinding.DataField = 'Cyl'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 160
      Top = 64
      Width = 145
      Height = 97
      Caption = 'Transmission'
      TabOrder = 2
      object cxDBCheckBox: TcxDBCheckBox
        Left = 10
        Top = 54
        Width = 127
        Height = 21
        DataBinding.DataField = 'TransmissAutomatic'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        ParentColor = False
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Yes'
        Properties.ValueUnchecked = 'No'
        Properties.Caption = 'Automatic'
        Style.Color = 16247513
        TabOrder = 1
      end
      object cxDBListBox: TcxDBListBox
        Left = 10
        Top = 16
        Width = 127
        Height = 33
        ItemHeight = 13
        Items.Strings = (
          '4 speed'
          '5 speed')
        ParentColor = False
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        DataBinding.DataField = 'TransmissSpeedCount'
        ReadOnly = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 312
      Top = 64
      Width = 153
      Height = 97
      Caption = 'Miles per gallon'
      TabOrder = 3
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        DataBinding.DataField = 'MPG_Highway'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 0
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 16
        Top = 44
        Width = 121
        Height = 21
        DataBinding.DataField = 'MPG_City'
        DataBinding.DataSource = EditorsInPlaceDemoDataDM.dsCars
        Style.Color = 16247513
        TabOrder = 1
      end
    end
  end
end
