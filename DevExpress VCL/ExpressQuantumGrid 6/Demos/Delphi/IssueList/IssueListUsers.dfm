inherited frmUsers: TfrmUsers
  ClientHeight = 312
  ClientWidth = 212
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCaption: TLabel
    Width = 212
    Caption = 'lbCaption + Users'
  end
  inherited plTop: TPanel
    Width = 212
    Height = 257
    object Label9: TLabel
      Left = 8
      Top = 1
      Width = 47
      Height = 13
      Caption = 'Forename'
    end
    object Label1: TLabel
      Left = 8
      Top = 41
      Width = 57
      Height = 13
      Caption = 'Middlename'
    end
    object Label2: TLabel
      Left = 8
      Top = 81
      Width = 42
      Height = 13
      Caption = 'Surname'
    end
    object Label3: TLabel
      Left = 8
      Top = 161
      Width = 31
      Height = 13
      Caption = 'Phone'
    end
    object Label4: TLabel
      Left = 8
      Top = 201
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label5: TLabel
      Left = 8
      Top = 121
      Width = 55
      Height = 13
      Caption = 'Department'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 16
      Width = 196
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'FNAME'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 0
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 8
      Top = 56
      Width = 196
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'MNAME'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 1
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 8
      Top = 96
      Width = 196
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'LNAME'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 2
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 8
      Top = 176
      Width = 196
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'PHONE'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 4
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 8
      Top = 136
      Width = 196
      Height = 24
      RepositoryItem = dmMain.edrepDepartmentName
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'DEPARTMENTID'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dmMain.dsDepartment
      Style.StyleController = dmMain.edstcMain
      TabOrder = 3
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 8
      Top = 216
      Width = 196
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsUsers
      DataBinding.DataField = 'EMAIL'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 5
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
