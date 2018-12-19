inherited SpreadSheetRLForm: TSpreadSheetRLForm
  Left = 182
  Top = 159
  Caption = 'Report Links Demo - ExpressSpreadSheet'
  ClientHeight = 531
  ClientWidth = 874
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Top = 54
    Width = 874
    Caption = 
      'This example demonstrates the ExpressSpreadSheet printing capabi' +
      'lities.'
  end
  inherited sbMain: TStatusBar
    Top = 512
    Width = 874
    Visible = False
  end
  inherited ToolBar1: TToolBar
    Width = 874
    object ToolButton2: TToolButton
      Left = 123
      Top = 0
      Action = actSaveSpeadSheet
    end
    object ToolButton3: TToolButton
      Left = 146
      Top = 0
      Action = actCut
    end
    object ToolButton4: TToolButton
      Left = 169
      Top = 0
      Action = actCopy
    end
    object ToolButton5: TToolButton
      Left = 192
      Top = 0
      Action = actPaste
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 471
    Width = 874
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      Action = actLoadData
      TabOrder = 0
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 105
      Height = 25
      Action = actApplyFormatting
      TabOrder = 1
    end
    object Button4: TButton
      Left = 788
      Top = 8
      Width = 75
      Height = 25
      Action = actExit
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object Button3: TButton
      Left = 232
      Top = 8
      Width = 105
      Height = 25
      Action = actSaveSpeadSheet
      TabOrder = 3
    end
  end
  object cxSpreadBook: TcxSpreadSheetBook [4]
    Left = 0
    Top = 70
    Width = 874
    Height = 401
    Align = alClient
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    OnActiveSheetChanging = cxSpreadBookActiveSheetChanging
    OnSetSelection = cxSpreadBookSetSelection
    OnSheetPopupMenu = cxSpreadBookSheetPopupMenu
  end
  object ToolBar2: TToolBar [5]
    Left = 0
    Top = 25
    Width = 874
    Height = 29
    ButtonHeight = 24
    Caption = 'ToolBar2'
    EdgeBorders = [ebTop, ebBottom]
    TabOrder = 4
    object pnCellsRect: TPanel
      Left = 0
      Top = 2
      Width = 81
      Height = 24
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'A1'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 81
      Top = 2
      Width = 56
      Height = 24
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'Cell text = '
      ParentBackground = False
      TabOrder = 0
    end
    object edtCellEdit: TEdit
      Left = 137
      Top = 2
      Width = 571
      Height = 24
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      TabOrder = 2
      OnChange = edtCellEditChange
      OnExit = edtCellEditExit
      OnKeyPress = edtCellEditKeyPress
    end
  end
  inherited mmMain: TMainMenu
    inherited miFile: TMenuItem
      object LoadData1: TMenuItem [0]
        Action = actLoadData
      end
      object miSaveSpreadSheet: TMenuItem [1]
        Tag = 2
        Action = actSaveSpeadSheet
      end
      object MenuItem6: TMenuItem [2]
        Caption = '-'
      end
      object PrintArea1: TMenuItem [3]
        Caption = 'Print &Area'
        object SetPrintArea1: TMenuItem
          Action = actSetPrintArea
        end
        object ClearPrintArea1: TMenuItem
          Action = actClearPrintArea
        end
      end
    end
    object mnuEdit: TMenuItem [1]
      Caption = '&Edit'
      object miCut: TMenuItem
        Tag = 3
        Action = actCut
      end
      object miCopy: TMenuItem
        Tag = 2
        Action = actCopy
      end
      object miPaste: TMenuItem
        Tag = 4
        Action = actPaste
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miCells: TMenuItem
        Caption = 'C&ells'
        object miFormat: TMenuItem
          Tag = 5
          Action = actFormatCells
        end
        object miHide: TMenuItem
          Tag = 6
          Action = actHideCells
        end
        object miShow: TMenuItem
          Tag = 7
          Action = actShowCells
        end
        object miDeletecells: TMenuItem
          Tag = 12
          Action = actDeleteCells
        end
        object Insertcells1: TMenuItem
          Tag = 13
          Action = actInsertCells
        end
      end
      object miColumns: TMenuItem
        Caption = 'C&olumns'
        object MenuItem7: TMenuItem
          Tag = 8
          Action = actHideCol
        end
        object MenuItem8: TMenuItem
          Tag = 9
          Action = actShowCol
        end
      end
      object miRows: TMenuItem
        Caption = 'Ro&ws'
        object Hide3: TMenuItem
          Tag = 10
          Action = actHideRow
        end
        object Show3: TMenuItem
          Tag = 11
          Action = actShowRow
        end
      end
    end
    object mnuConfig: TMenuItem [3]
      Caption = '&Configuration'
      object ApplyFormatting1: TMenuItem
        Action = actApplyFormatting
      end
    end
  end
  inherited sty: TActionList
    object actDeleteCells: TAction
      Category = 'Cells'
      Caption = 'Delete...'
      OnExecute = actCellsExecute
      OnUpdate = AlwaysEnabled
    end
    object actSaveSpeadSheet: TAction
      Category = 'File'
      Caption = '&Save SpeadSheet'
      ImageIndex = 14
      ShortCut = 16467
      OnExecute = actSaveSpeadSheetExecute
      OnUpdate = actSaveSpeadSheetUpdate
    end
    object actInsertCells: TAction
      Tag = 1
      Category = 'Cells'
      Caption = 'Insert...'
      OnExecute = actCellsExecute
      OnUpdate = AlwaysEnabled
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut'
      ImageIndex = 15
      ShortCut = 16472
      OnExecute = actCutExecute
      OnUpdate = AlwaysEnabled
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy'
      ImageIndex = 16
      ShortCut = 16451
      OnExecute = actCopyExecute
      OnUpdate = AlwaysEnabled
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste'
      ImageIndex = 17
      ShortCut = 16470
      OnExecute = actPasteExecute
      OnUpdate = AlwaysEnabled
    end
    object actFormatCells: TAction
      Category = 'Cells'
      Caption = 'Format Cells...'
      OnExecute = actFormatCellsExecute
      OnUpdate = AlwaysEnabled
    end
    object actHideCells: TAction
      Category = 'Cells'
      Caption = 'Hide'
      OnExecute = actHideCellsExecute
      OnUpdate = AlwaysEnabled
    end
    object actShowCells: TAction
      Category = 'Cells'
      Caption = 'Show'
      OnExecute = actShowCellsExecute
      OnUpdate = AlwaysEnabled
    end
    object actHideCol: TAction
      Category = 'Cols'
      Caption = 'Hide'
      OnExecute = actHideColExecute
      OnUpdate = AlwaysEnabled
    end
    object actShowCol: TAction
      Category = 'Cols'
      Caption = 'Show'
      OnExecute = actShowColExecute
      OnUpdate = AlwaysEnabled
    end
    object actHideRow: TAction
      Category = 'Rows'
      Caption = 'Hide'
      OnExecute = actHideRowExecute
      OnUpdate = AlwaysEnabled
    end
    object actShowRow: TAction
      Category = 'Rows'
      Caption = 'Show'
      OnExecute = actShowRowExecute
      OnUpdate = AlwaysEnabled
    end
    object actApplyFormatting: TAction
      Category = 'Configuration'
      Caption = 'A&pply Formatting'
      OnExecute = actApplyFormattingExecute
      OnUpdate = actApplyFormattingUpdate
    end
    object actLoadData: TAction
      Category = 'File'
      Caption = '&Load Data'
      OnExecute = actLoadDataExecute
      OnUpdate = AlwaysEnabled
    end
    object actSetPrintArea: TAction
      Caption = '&Set Print Area'
      OnExecute = actSetPrintAreaExecute
      OnUpdate = AlwaysEnabled
    end
    object actClearPrintArea: TAction
      Caption = '&Clear Print Area'
      OnExecute = actClearPrintAreaExecute
      OnUpdate = AlwaysEnabled
    end
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink1
    object dxComponentPrinterLink1: TdxSpreadSheetBookReportLink
      Component = cxSpreadBook
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  inherited dxPSEngineController1: TdxPSEngineController
    Active = True
  end
  inherited ilMain: TcxImageList
    FormatVersion = 1
  end
  object Query: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      
        'Select CO_NAME, SHARES, CUR_PRICE, YRL_HIGH, YRL_LOW, PUR_PRICE,' +
        ' PUR_DATE from holdings.dbf h, master.DBF m WHERE m.SYMBOL = h.S' +
        'YMBOL ')
    Left = 480
    Top = 96
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Spreadsheet files (*.xls)|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 512
    Top = 97
  end
  object pmSheetPopup: TPopupMenu
    Images = ilMain
    Left = 544
    Top = 97
    object pmiCut: TMenuItem
      Tag = 3
      Action = actCut
    end
    object pmiCopy: TMenuItem
      Tag = 2
      Action = actCopy
    end
    object pmiPaste: TMenuItem
      Tag = 4
      Action = actPaste
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object pmiDelete: TMenuItem
      Tag = 12
      Action = actDeleteCells
    end
    object pmiInsert: TMenuItem
      Tag = 13
      Action = actInsertCells
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object pmiCols: TMenuItem
      Caption = 'Cols'
      object pmiColsHide: TMenuItem
        Tag = 8
        Action = actHideCol
      end
      object pmiColsShow: TMenuItem
        Tag = 9
        Action = actShowCol
      end
    end
    object pmiRows: TMenuItem
      Caption = 'Rows'
      object pmiRowsHide: TMenuItem
        Tag = 10
        Action = actHideRow
      end
      object pmiRowsShow: TMenuItem
        Tag = 11
        Action = actShowRow
      end
    end
    object MenuItem4: TMenuItem
      Action = actShowCells
    end
    object MenuItem5: TMenuItem
      Action = actHideCells
    end
    object pmiFormatCells: TMenuItem
      Tag = 5
      Action = actFormatCells
    end
  end
end
