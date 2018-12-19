inherited DragDropDemoMainForm: TDragDropDemoMainForm
  Left = 188
  Top = 42
  Width = 758
  Height = 548
  Caption = 'ExpressQuantumTreeList4 DragDropDemo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 750
    Caption = 
      'This demo demonstrates how to populate the TreeList control from' +
      ' another one and change its hierarchy using drag/drop. See Help/' +
      'About for more information'
  end
  object Splitter1: TSplitter [1]
    Left = 361
    Top = 32
    Width = 8
    Height = 443
    Color = 15981511
    ParentColor = False
  end
  inherited sbMain: TStatusBar
    Top = 475
    Width = 750
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      '- assign persons to a department as employees '
      'This can be done in three different ways:'
      
        '  (a) multiselect any rows of the Person list from the Dictionar' +
        'ies form and drop them onto the list of persons displayed to the' +
        ' left of the main form'
      
        '  (b) multiselect any rows of the Person list from the Dictionar' +
        'ies form and drop them onto any department within the Department' +
        's hierarchy, displayed to the right of the main form'
      
        '  (c) multiselect any rows of the employee list displayed to the' +
        ' left of the main form and drop them onto another department wit' +
        'hin the Departments hierarchy'
      ''
      '- change the Departments hierarchy'
      'This can be done in two different ways:'
      
        '  (a) multiselect any rows of the department list from the Dicti' +
        'onaries form and drop them onto any department within the Depart' +
        'ments hierarchy'
      
        '  (b) select any department within the Departments hierarchy and' +
        ' drop it onto another department'
      ''
      '- insert/delete departments using the Ins/Ctrl+Delete keys'
      ''
      
        'NOTE: if you haven'#39't done so already, you might like to practice' +
        ' by completing the tutorial version of this demo (see the tutori' +
        'als folder).')
  end
  object pnlDepartments: TPanel [4]
    Left = 0
    Top = 32
    Width = 361
    Height = 443
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pnlDepartments'
    TabOrder = 2
    object tlDepartments: TcxDBTreeList
      Left = 0
      Top = 28
      Width = 361
      Height = 415
      Styles.StyleSheet = DragDropDemoDataDM.TreeListStyleSheetDevExpress
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band + 1'
        end>
      BufferedPaint = False
      DataController.DataSource = DragDropDemoDataDM.dsDepartments
      DataController.ParentField = 'PARENTID'
      DataController.KeyField = 'ID'
      DragMode = dmAutomatic
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.AutomateLeftMostIndent = False
      OptionsBehavior.DragFocusing = True
      OptionsBehavior.DragDropText = True
      OptionsData.Inserting = True
      OptionsView.GridLineColor = 14916958
      OptionsView.GridLines = tlglBoth
      OptionsView.Indicator = True
      Preview.Column = tlDepartmentsNAME
      Preview.Place = tlppTop
      Preview.Visible = True
      RootValue = 255
      TabOrder = 0
      OnDragDrop = tlDepartmentsDragDrop
      OnDragOver = tlDepartmentsDragOver
      OnInitInsertingRecord = tlDepartmentsInitInsertingRecord
      object tlDepartmentsID: TcxDBTreeListColumn
        Visible = False
        Caption.Text = 'ID'
        DataBinding.FieldName = 'ID'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsPARENTID: TcxDBTreeListColumn
        Visible = False
        Caption.Text = 'PARENTID'
        DataBinding.FieldName = 'PARENTID'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsNAME: TcxDBTreeListColumn
        Caption.Text = 'NAME'
        DataBinding.FieldName = 'NAME'
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsBUDGET: TcxDBTreeListColumn
        Caption.Text = 'BUDGET'
        DataBinding.FieldName = 'BUDGET'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsPHONE: TcxDBTreeListColumn
        Caption.Text = 'PHONE'
        DataBinding.FieldName = 'PHONE'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsFAX: TcxDBTreeListColumn
        Caption.Text = 'FAX'
        DataBinding.FieldName = 'FAX'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsEMAIL: TcxDBTreeListColumn
        Caption.Text = 'EMAIL'
        DataBinding.FieldName = 'EMAIL'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlDepartmentsVACANCY: TcxDBTreeListColumn
        Caption.Text = 'VACANCY'
        DataBinding.FieldName = 'VACANCY'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object pnlDeptCaption: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Departments'
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlEmployees: TPanel [5]
    Left = 369
    Top = 32
    Width = 381
    Height = 443
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlEmployees'
    TabOrder = 3
    object pnlEmplCaption: TPanel
      Left = 0
      Top = 0
      Width = 381
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Employees'
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object tlEmployees: TcxDBTreeList
      Left = 0
      Top = 28
      Width = 381
      Height = 415
      Styles.StyleSheet = DragDropDemoDataDM.TreeListStyleSheetDevExpress
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band + 1'
        end>
      BufferedPaint = False
      DataController.DataSource = DragDropDemoDataDM.dsPersons
      DataController.ParentField = 'ID'
      DataController.KeyField = 'ID'
      DragMode = dmAutomatic
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.AutomateLeftMostIndent = False
      OptionsBehavior.DragFocusing = True
      OptionsBehavior.DragDropText = True
      OptionsSelection.MultiSelect = True
      OptionsView.Buttons = False
      OptionsView.Indicator = True
      OptionsView.ShowRoot = False
      RootValue = 255
      TabOrder = 1
      OnDragDrop = tlEmployeesDragDrop
      OnDragOver = tlEmployeesDragOver
      OnMoveTo = tlEmployeesMoveTo
      object tlEmployeesName: TcxDBTreeListColumn
        Caption.Text = 'Name'
        DataBinding.FieldName = 'Name'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object tlEmployeesCountry: TcxDBTreeListColumn
        Caption.Text = 'Country'
        DataBinding.FieldName = 'Country'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesPostalCode: TcxDBTreeListColumn
        Caption.Text = 'PostalCode'
        DataBinding.FieldName = 'PostalCode'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesCity: TcxDBTreeListColumn
        Caption.Text = 'City'
        DataBinding.FieldName = 'City'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesAddress: TcxDBTreeListColumn
        Caption.Text = 'Address'
        DataBinding.FieldName = 'Address'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesPhone: TcxDBTreeListColumn
        Caption.Text = 'Phone'
        DataBinding.FieldName = 'Phone'
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesFax: TcxDBTreeListColumn
        Caption.Text = 'Fax'
        DataBinding.FieldName = 'Fax'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesEMAIL: TcxDBTreeListColumn
        Caption.Text = 'EMAIL'
        DataBinding.FieldName = 'EMAIL'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesHOMEPAGE: TcxDBTreeListColumn
        Caption.Text = 'HOMEPAGE'
        DataBinding.FieldName = 'HOMEPAGE'
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlEmployeesDepartmentID: TcxDBTreeListColumn
        Visible = False
        Caption.Text = 'DepartmentID'
        DataBinding.FieldName = 'DepartmentID'
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object ShowDictionaries1: TMenuItem [0]
        Caption = 'Show &Dictionaries'
        Hint = 'Shows the Dictionaries form'
        OnClick = ShowDictionaries1Click
      end
      object N2: TMenuItem [1]
        Caption = '-'
      end
      object miDragExpande: TMenuItem [2]
        Caption = 'Drag &Expande'
        Checked = True
        Hint = 
          'If checked, a collapsed node is expanded when a user drags a nod' +
          'e to it'
        OnClick = miDragExpandeClick
      end
      object miDragCollapse: TMenuItem [3]
        Caption = 'Drag &Collapse'
        Checked = True
        Hint = 
          'If checked, an expanded node is collapsed when a user drags a no' +
          'de to it '
        OnClick = miDragCollapseClick
      end
      object N1: TMenuItem [4]
        Caption = '-'
      end
      object miColumnCustomization: TMenuItem [5]
        Caption = 'Column &Customization ...'
        Hint = 'Shows the column customization form'
        OnClick = miColumnCustomizationClick
      end
      object miSeparator1: TMenuItem [6]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [7]
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            GroupIndex = 1
            Hint = 'Setting this option changes the demo appearance to Flat style'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miStandard: TMenuItem
            Tag = 1
            Caption = '&Standard'
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Standard styl' +
              'e'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miUltraFlat: TMenuItem
            Tag = 2
            Caption = '&Ultra Flat'
            Checked = True
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Ultra Flat st' +
              'yle'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object Office111: TMenuItem
            Tag = 3
            Caption = 'Office 11'
            GroupIndex = 1
            RadioItem = True
            OnClick = LookAndFeelChange
          end
        end
        object miNativeStyle: TMenuItem
          Tag = 4
          Caption = '&Native Style'
          Hint = 'Setting this option changes the demo appearance to Native style'
          OnClick = LookAndFeelChange
        end
      end
      object miSeparator2: TMenuItem [8]
        Caption = '-'
      end
    end
  end
end
