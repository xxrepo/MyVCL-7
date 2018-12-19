object FMain: TFMain
  Left = 194
  Top = 96
  Width = 539
  Height = 416
  Caption = 'Example of using dxDBTreeViewEdit'
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000003
    333300000000033B3BBB3300000003B3BBB77777777703333337FFFFFFF7033B
    3BB7F889FFF703B3BBB7F8FFFFF703333337F88CFFF7033B3BB7F8FFFFF703B3
    BBB7F8F889F703333337F8F8FFF7033BBBB7F882FFF700033337F8FFFFF70000
    0007F8FFFFF700000007FFFFFFF700000007777777F70000000000000000E0FF
    0000803F00008000000080000000800000008000000080000000800000008000
    00008000000080000000E0000000FE000000FE000000FE000000FFFF0000}
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 531
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 262
      Top = 6
      Width = 203
      Height = 26
      Caption = 
        'On CloseUp event  the dxDBTreeViewEdit also changes state and co' +
        'untry fields'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object DBTreeViewEdit1: TdxDBTreeViewEdit
      Left = 8
      Top = 8
      Width = 243
      Height = 21
      CanSelectParents = False
      DropDownRows = 15
      ParentColor = False
      TabOrder = 0
      TabStop = True
      Text = 'Kapaa Kauai'
      TreeViewColor = clWindow
      TreeViewCursor = crDefault
      TreeViewFont.Charset = DEFAULT_CHARSET
      TreeViewFont.Color = clWindowText
      TreeViewFont.Height = -11
      TreeViewFont.Name = 'MS Sans Serif'
      TreeViewFont.Style = []
      TreeViewIndent = 19
      TreeViewReadOnly = False
      TreeViewShowButtons = True
      TreeViewShowHint = False
      TreeViewShowLines = True
      TreeViewShowRoot = True
      TreeViewSortType = stNone
      OnCloseUp = DBTreeViewEdit1CloseUp
      DividedChar = '.'
      TextStyle = tvtsShort
      DataField = 'City'
      DataSource = DataSource1
    end
    object DBNavigator1: TDBNavigator
      Left = 11
      Top = 35
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 443
      Top = 35
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 326
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 519
      Height = 314
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          FieldName = 'CustNo'
        end
        item
          FieldName = 'Company'
          Width = 150
        end
        item
          FieldName = 'City'
          Width = 85
        end
        item
          FieldName = 'State'
          Width = 48
        end
        item
          FieldName = 'Country'
        end>
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 200
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 160
    Top = 224
  end
end
