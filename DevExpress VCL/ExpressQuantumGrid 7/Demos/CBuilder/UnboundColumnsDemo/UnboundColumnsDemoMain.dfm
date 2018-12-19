object UnboundColumnsDemoMainForm: TUnboundColumnsDemoMainForm
  Left = 107
  Top = 75
  Width = 847
  Height = 523
  Caption = 'ExpressQuantumGrid UnboundColumns Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 839
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      'Experiment with unbound columns within the data-aware GridView. ' +
      'Click '#39'About this demo'#39' for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 450
    Width = 839
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 25
    Width = 839
    Height = 425
    Align = alClient
    TabOrder = 1
    object BandedTableView: TcxGridDBBandedTableView
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = UnboundColumnsDemoDataDM.dsCustomers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      Styles.OnGetContentStyle = BandedTableViewStylesGetContentStyle
      Styles.GroupByBox = cxStyle1
      Bands = <
        item
          Caption = 'Unbound Data (Data is randomly generated )'
          Width = 392
        end
        item
          Caption = 'Bound Data'
          Width = 428
        end>
      object BandedTableViewFIRSTNAME: TcxGridDBBandedColumn
        Caption = 'First Name'
        DataBinding.FieldName = 'FIRSTNAME'
        Width = 73
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object BandedTableViewLASTNAME: TcxGridDBBandedColumn
        Caption = 'Last Name'
        DataBinding.FieldName = 'LASTNAME'
        Width = 74
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object BandedTableViewCOMPANYNAME: TcxGridDBBandedColumn
        Caption = 'Company'
        DataBinding.FieldName = 'COMPANYNAME'
        Width = 78
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object BandedTableViewPURCHASEDATE: TcxGridDBBandedColumn
        Caption = 'Purchase Date'
        DataBinding.FieldName = 'PURCHASEDATE'
        Width = 55
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object BandedTableViewPAYMENTAMOUNT: TcxGridDBBandedColumn
        Caption = 'Payment Amount'
        DataBinding.FieldName = 'PAYMENTAMOUNT'
        Width = 55
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object BandedTableViewCOPIES: TcxGridDBBandedColumn
        Caption = 'Copies'
        DataBinding.FieldName = 'COPIES'
        Width = 44
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object BandedTableViewSelected: TcxGridDBBandedColumn
        Caption = 'Selected'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 67
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object BandedTableViewSupportRequests: TcxGridDBBandedColumn
        Caption = 'Support Requests'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 130
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object BandedTableViewLastSupportRequest: TcxGridDBBandedColumn
        Caption = 'Last Support Request'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 129
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object BandedTableViewComments: TcxGridDBBandedColumn
        Caption = 'Comments'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Width = 66
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object Level: TcxGridLevel
      GridView = BandedTableView
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfOffice11
    NativeStyle = True
    Left = 472
    Top = 24
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 536
    Top = 24
    object styChecked: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16313312
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 97182
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5298174
      TextColor = 10066329
    end
  end
end
