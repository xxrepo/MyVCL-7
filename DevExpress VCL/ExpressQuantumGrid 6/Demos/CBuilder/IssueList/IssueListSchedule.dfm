inherited frmSchedule: TfrmSchedule
  Height = 439
  inherited plTop: TPanel
    Height = 384
    object ScrollBox: TScrollBox
      Left = 0
      Top = 0
      Width = 233
      Height = 384
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 336
        Width = 40
        Height = 13
        Caption = 'Average'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 296
        Width = 43
        Height = 13
        Caption = 'Summary'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Sunday'
      end
      object Label9: TLabel
        Left = 8
        Top = 48
        Width = 38
        Height = 13
        Caption = 'Monday'
      end
      object Label2: TLabel
        Left = 8
        Top = 88
        Width = 41
        Height = 13
        Caption = 'Tuesday'
      end
      object Label3: TLabel
        Left = 8
        Top = 128
        Width = 57
        Height = 13
        Caption = 'Wednesday'
      end
      object Label6: TLabel
        Left = 8
        Top = 168
        Width = 44
        Height = 13
        Caption = 'Thursday'
      end
      object Label7: TLabel
        Left = 8
        Top = 208
        Width = 28
        Height = 13
        Caption = 'Friday'
      end
      object Label8: TLabel
        Left = 8
        Top = 248
        Width = 42
        Height = 13
        Caption = 'Saturday'
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 8
        Top = 352
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'RowAvg'
        Enabled = False
        Style.Color = clWindow
        Style.StyleController = dmMain.edstcMain
        TabOrder = 0
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 8
        Top = 312
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'RowSum'
        Enabled = False
        Style.Color = clWindow
        Style.StyleController = dmMain.edstcMain
        TabOrder = 1
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 8
        Top = 264
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'SATURDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 2
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 8
        Top = 224
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'THURSDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 3
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 8
        Top = 184
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'THURSDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 4
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 8
        Top = 144
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'WEDNESDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 5
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 8
        Top = 104
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'TUESDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 6
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 8
        Top = 64
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'MONDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 7
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 8
        Top = 24
        Width = 217
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataSource = dmMain.dsSchedule
        DataBinding.DataField = 'SUNDAY'
        Properties.ReadOnly = False
        Style.StyleController = dmMain.edstcMain
        TabOrder = 8
      end
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
