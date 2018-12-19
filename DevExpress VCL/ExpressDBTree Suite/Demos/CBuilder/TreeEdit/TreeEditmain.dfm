object Form1: TForm1
  Left = 219
  Top = 173
  Width = 536
  Height = 387
  Caption = 'Example of using DBTreeViewEdit'
  Color = clBtnFace
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
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 287
    Width = 528
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 262
      Top = 6
      Width = 255
      Height = 26
      Caption = 
        'On CloseUp event  the DBTreeViewEdit also changes state and coun' +
        'try fields'
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
      Width = 241
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
      TreeViewSortType = stText
      OnCloseUp = DBTreeViewEdit1CloseUp
      DividedChar = '.'
      TextStyle = tvtsShort
      DataField = 'City'
      DataSource = DataSource1
    end
    object DBNavigator1: TDBNavigator
      Left = 9
      Top = 36
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 443
      Top = 36
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 287
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 5
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 516
      Height = 275
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
          Expanded = False
          FieldName = 'CustNo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Company'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'City'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'State'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Country'
          Visible = True
        end>
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    FieldDefs = <
      item
        Name = 'CustNo'
        DataType = ftFloat
      end
      item
        Name = 'Company'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Addr1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Addr2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'State'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Zip'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Country'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Phone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TaxRate'
        DataType = ftFloat
      end
      item
        Name = 'Contact'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LastInvoiceDate'
        DataType = ftDateTime
      end>
    StoreDefs = True
    TableName = 'CUSTOMER.DB'
    Left = 200
    Top = 41
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 24
  end
end
