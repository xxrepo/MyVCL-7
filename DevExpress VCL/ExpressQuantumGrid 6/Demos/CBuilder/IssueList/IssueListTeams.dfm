inherited frmTeams: TfrmTeams
  PixelsPerInch = 96
  TextHeight = 13
  inherited plTop: TPanel
    object Label9: TLabel
      Left = 8
      Top = 89
      Width = 41
      Height = 13
      Caption = 'Function'
    end
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Project'
    end
    object Label1: TLabel
      Left = 8
      Top = 49
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 104
      Width = 217
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsTeams
      DataBinding.DataField = 'FUNCTION'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 0
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 8
      Top = 24
      Width = 217
      Height = 24
      RepositoryItem = dmMain.edrepProjectName
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsTeams
      DataBinding.DataField = 'PROJECTID'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dmMain.dsDepartment
      Style.StyleController = dmMain.edstcMain
      TabOrder = 1
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 8
      Top = 64
      Width = 217
      Height = 24
      RepositoryItem = dmMain.edrepUserLookup
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsTeams
      DataBinding.DataField = 'USERID'
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
      TabOrder = 2
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
