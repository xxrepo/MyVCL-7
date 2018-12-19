inherited EditorsMaskDemoMainForm: TEditorsMaskDemoMainForm
  Left = 196
  Top = 33
  Caption = 'ExpressVerticalGrid EditorsMask Demo'
  ClientHeight = 620
  ClientWidth = 590
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Width = 590
    Height = 48
    Caption = 
      'Practice using masked data-aware editors for reading and writing' +
      '.'#10'Experiment by changing the Options above and also see Help/Abo' +
      'ut for other things to try.'
    Color = 12937777
    Font.Color = clWhite
  end
  inherited sbMain: TStatusBar
    Top = 601
    Width = 590
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      '- explore the mask editor'#39's options'
      ''
      '- compare its three modes with a standard maskedit '
      ''
      '- edit data records using text and masked editors'
      ''
      '- change an editor'#39's edit mask and mask kind at runtime'
      ''
      '- explore the pre-built regular expressions'
      ''
      '- see the auto-complete in action')
    TabOrder = 3
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 48
    Width = 590
    Height = 81
    Align = alTop
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 588
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Departments'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object vgDepartments: TcxDBVerticalGrid
      Left = 1
      Top = 33
      Width = 588
      Height = 47
      Align = alClient
      LayoutStyle = lsMultiRecordView
      OptionsView.ShowHeaders = False
      OptionsView.ValueWidth = 81
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      Styles.Background = EditorsMaskDemoDataDM.stBlueSky
      Styles.Content = EditorsMaskDemoDataDM.stBlueLight
      Styles.Category = EditorsMaskDemoDataDM.stBlueDark
      TabOrder = 1
      OnLeftVisibleRecordIndexChanged = vgDepartmentsLeftVisibleRecordIndexChanged
      DataController.DataSource = EditorsMaskDemoDataDM.dsDEPARTMENTS
      object cxDBVerticalGrid1CategoryRow1: TcxCategoryRow
        Properties.Caption = 'Name'
      end
      object cxDBVerticalGrid1NAME: TcxDBEditorRow
        Properties.DataBinding.FieldName = 'NAME'
      end
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 129
    Width = 590
    Height = 472
    Align = alClient
    Color = 15451300
    TabOrder = 1
    object lbFirstName: TLabel
      Left = 28
      Top = 56
      Width = 51
      Height = 13
      Caption = 'First name:'
    end
    object lbMiddleName: TLabel
      Left = 16
      Top = 84
      Width = 63
      Height = 13
      Caption = 'Middle name:'
    end
    object lbLastName: TLabel
      Left = 28
      Top = 112
      Width = 52
      Height = 13
      Caption = 'Last name:'
    end
    object lbCountry: TLabel
      Left = 40
      Top = 188
      Width = 39
      Height = 13
      Caption = 'Country:'
    end
    object lbPostalCode: TLabel
      Left = 20
      Top = 160
      Width = 59
      Height = 13
      Caption = 'Postal code:'
    end
    object lbCity: TLabel
      Left = 60
      Top = 216
      Width = 20
      Height = 13
      Caption = 'City:'
    end
    object lbAddress: TLabel
      Left = 44
      Top = 244
      Width = 35
      Height = 13
      Caption = 'Adress:'
    end
    object lbPhone: TLabel
      Left = 44
      Top = 292
      Width = 34
      Height = 13
      Caption = 'Phone:'
    end
    object lbFax: TLabel
      Left = 56
      Top = 320
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object lbEmail: TLabel
      Left = 48
      Top = 396
      Width = 31
      Height = 13
      Caption = 'E-mail:'
    end
    object lbHomePage: TLabel
      Left = 20
      Top = 368
      Width = 58
      Height = 13
      Caption = 'Home page:'
    end
    object lbInfoPhone: TLabel
      Left = 212
      Top = 292
      Width = 105
      Height = 13
      Caption = 'Delphi Standard Mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoFax: TLabel
      Left = 212
      Top = 320
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoHomePage: TLabel
      Left = 344
      Top = 368
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoEmail: TLabel
      Left = 344
      Top = 396
      Width = 91
      Height = 13
      Caption = 'Regular Expression'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoPostalCode: TLabel
      Left = 212
      Top = 160
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoFirstName: TLabel
      Left = 212
      Top = 56
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoMiddleName: TLabel
      Left = 212
      Top = 84
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoLastName: TLabel
      Left = 212
      Top = 112
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoCountry: TLabel
      Left = 212
      Top = 188
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoCity: TLabel
      Left = 212
      Top = 216
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoAddress: TLabel
      Left = 344
      Top = 244
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 588
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Users'
      Color = 4707838
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtFirstName: TcxDBTextEdit
      Left = 84
      Top = 52
      DataBinding.DataField = 'FNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.ReadOnly = False
      Style.Color = 16247513
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 121
    end
    object edtMiddleName: TcxDBTextEdit
      Left = 84
      Top = 80
      DataBinding.DataField = 'MNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.ReadOnly = False
      Style.Color = 16247513
      TabOrder = 2
      Width = 121
    end
    object edtLastName: TcxDBTextEdit
      Left = 84
      Top = 108
      DataBinding.DataField = 'LNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Style.Color = 16247513
      TabOrder = 3
      Width = 121
    end
    object edtCountry: TcxDBTextEdit
      Left = 84
      Top = 184
      DataBinding.DataField = 'COUNTRY'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Style.Color = 16247513
      TabOrder = 5
      Width = 121
    end
    object edtCity: TcxDBTextEdit
      Left = 84
      Top = 212
      DataBinding.DataField = 'CITY'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Style.Color = 16247513
      TabOrder = 6
      Width = 121
    end
    object edtAddress: TcxDBTextEdit
      Left = 84
      Top = 240
      DataBinding.DataField = 'ADDRESS'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Style.Color = 16247513
      TabOrder = 7
      Width = 253
    end
    object DBNavigator1: TcxDBNavigator
      Left = 88
      Top = 436
      Width = 225
      Height = 25
      DataSource = EditorsMaskDemoDataDM.dsUSERS
      TabOrder = 12
    end
    object edtPostalCode: TcxDBButtonEdit
      Left = 84
      Top = 156
      DataBinding.DataField = 'POSTALCODE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d\d? | \w\w\w'#39' '#39'\w\w\w'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtPostalCodePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 4
      Width = 121
    end
    object edtPhone: TcxDBButtonEdit
      Left = 84
      Top = 288
      DataBinding.DataField = 'PHONE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditMask = '!\(999\) 000-0000;1;_'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtPhonePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 8
      Width = 121
    end
    object edtFax: TcxDBButtonEdit
      Left = 84
      Top = 316
      DataBinding.DataField = 'FAX'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\(\d\d\d\)'#39#39' '#39#39')?\d\d\d-\d\d\d\d'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtFaxPropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 9
      Width = 121
    end
    object edtHomePage: TcxDBButtonEdit
      Left = 84
      Top = 364
      DataBinding.DataField = 'HOMEPAGE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = 'http\:\/\/(\w+(\.\w+)*@)?\w+\.\w+(\.\w+)*(/(\w+(/\w+)*/?)?)?'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtHomePagePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 10
      Width = 253
    end
    object edtEmail: TcxDBButtonEdit
      Left = 84
      Top = 392
      DataBinding.DataField = 'EMAIL'
      DataBinding.DataSource = EditorsMaskDemoDataDM.dsUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\w+@\w+\.\w+(\.\w+)*'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtEmailPropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 11
      Width = 253
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miDefaultMaskSettings: TMenuItem [0]
        Caption = 'Default &Mask Settings'
        Hint = 'Sets the default mask set'
        OnClick = miDefaultMaskExecute
      end
      object miShowMaskButtons: TMenuItem [1]
        Caption = 'Show Mask &Buttons'
        Checked = True
        Hint = 'Shows the edit mask buttons'
        OnClick = miShowEditMaskButtonsExecute
      end
      object N1: TMenuItem [2]
        Caption = '-'
      end
    end
  end
end
