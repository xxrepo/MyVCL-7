inherited frmItems: TfrmItems
  ClientHeight = 498
  ClientWidth = 279
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCaption: TLabel
    Width = 279
  end
  inherited plTop: TPanel
    Width = 279
    Height = 443
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 279
      Height = 443
      ActivePage = tsGeneral
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpLeft
      object tsGeneral: TTabSheet
        Caption = 'General'
        ImageIndex = 2
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 252
          Height = 433
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 249
            Width = 51
            Height = 13
            Caption = 'Fixed Date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 8
            Top = 289
            Width = 34
            Height = 13
            Caption = 'Creator'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 8
            Top = 329
            Width = 63
            Height = 13
            Caption = 'Created Date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 8
            Top = 369
            Width = 89
            Height = 13
            Caption = 'Last Modified Date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 48
            Width = 33
            Height = 13
            Caption = 'Project'
          end
          object Label8: TLabel
            Left = 8
            Top = 88
            Width = 24
            Height = 13
            Caption = 'Type'
          end
          object Label6: TLabel
            Left = 8
            Top = 128
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object Label3: TLabel
            Left = 8
            Top = 208
            Width = 31
            Height = 13
            Caption = 'Owner'
          end
          object Label7: TLabel
            Left = 8
            Top = 168
            Width = 31
            Height = 13
            Caption = 'Priority'
          end
          object Label11: TLabel
            Left = 8
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Subject'
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 8
            Top = 24
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'NAME'
            Style.StyleController = dmMain.edstcMain
            TabOrder = 0
          end
          object cxDBLookupComboBox3: TcxDBLookupComboBox
            Left = 8
            Top = 64
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'PROJECTID'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListSource = dmMain.dsProjects
            Style.StyleController = dmMain.edstcMain
            TabOrder = 1
          end
          object cxDBImageComboBox3: TcxDBImageComboBox
            Left = 8
            Top = 104
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'TYPE'
            Properties.Images = dmMain.imStat
            Properties.Items = <
              item
                Description = 'Bug'
                ImageIndex = 2
                Value = False
              end
              item
                Description = 'Request'
                ImageIndex = 3
                Value = True
              end>
            Style.StyleController = dmMain.edstcMain
            TabOrder = 2
          end
          object cxDBImageComboBox2: TcxDBImageComboBox
            Left = 8
            Top = 144
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'STATUS'
            Properties.Images = dmMain.imStat
            Properties.Items = <
              item
                Description = 'New'
                ImageIndex = 4
                Value = 1
              end
              item
                Description = 'Postponed'
                ImageIndex = 5
                Value = 2
              end
              item
                Description = 'Fixed'
                ImageIndex = 6
                Value = 3
              end
              item
                Description = 'Rejected'
                ImageIndex = 7
                Value = 4
              end>
            Style.StyleController = dmMain.edstcMain
            TabOrder = 3
          end
          object cxDBImageComboBox1: TcxDBImageComboBox
            Left = 8
            Top = 184
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'PRIORITY'
            Properties.Images = dmMain.imStat
            Properties.Items = <
              item
                Description = 'Low'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Normal'
                Value = 2
              end
              item
                Description = 'High'
                ImageIndex = 1
                Value = 3
              end>
            Style.StyleController = dmMain.edstcMain
            TabOrder = 4
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 8
            Top = 224
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'OWNERID'
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'FullName'
              end
              item
                FieldName = 'DepartmentName'
              end>
            Properties.ListSource = dmMain.dsUsers
            Style.StyleController = dmMain.edstcMain
            TabOrder = 5
          end
          object cxDBDateEdit3: TcxDBDateEdit
            Left = 8
            Top = 264
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'FIXEDDATE'
            Style.StyleController = dmMain.edstcMain
            TabOrder = 6
          end
          object cxDBLookupComboBox2: TcxDBLookupComboBox
            Left = 8
            Top = 304
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'CREATORID'
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'FullName'
              end
              item
                FieldName = 'DepartmentName'
              end>
            Properties.ListSource = dmMain.dsUsers
            Style.StyleController = dmMain.edstcMain
            TabOrder = 7
          end
          object cxDBDateEdit2: TcxDBDateEdit
            Left = 8
            Top = 344
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'CREATEDDATE'
            Style.StyleController = dmMain.edstcMain
            TabOrder = 8
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 8
            Top = 384
            Width = 239
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataSource = dmMain.dsItems
            DataBinding.DataField = 'LASTMODIFIEDDATE'
            Style.StyleController = dmMain.edstcMain
            TabOrder = 9
          end
        end
      end
      object tsDescription: TTabSheet
        Caption = 'Description'
        object cxDBMemo1: TcxDBMemo
          Left = 0
          Top = 0
          Width = 252
          Height = 433
          Align = alClient
          DataBinding.DataSource = dmMain.dsItems
          DataBinding.DataField = 'DESCRIPTION'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.ScrollBars = ssVertical
          Style.StyleController = dmMain.edstcMain
          TabOrder = 0
        end
      end
      object tsResolution: TTabSheet
        Caption = 'Resolution'
        ImageIndex = 1
        object cxDBMemo2: TcxDBMemo
          Left = 0
          Top = 0
          Width = 252
          Height = 433
          Align = alClient
          DataBinding.DataSource = dmMain.dsItems
          DataBinding.DataField = 'RESOLUTION'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.ScrollBars = ssVertical
          Style.Shadow = False
          Style.StyleController = dmMain.edstcMain
          TabOrder = 0
        end
      end
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
