inherited frmProjects: TfrmProjects
  PixelsPerInch = 96
  TextHeight = 13
  inherited plTop: TPanel
    object Label5: TLabel
      Left = 8
      Top = 49
      Width = 42
      Height = 13
      Caption = 'Manager'
    end
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 24
      Width = 211
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsProjects
      DataBinding.DataField = 'NAME'
      Properties.ReadOnly = False
      Style.StyleController = dmMain.edstcMain
      TabOrder = 0
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 8
      Top = 64
      Width = 211
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsProjects
      DataBinding.DataField = 'MANAGERID'
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
      Properties.ReadOnly = False
      Style.StyleController = dmMain.edstcMain
      TabOrder = 1
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
