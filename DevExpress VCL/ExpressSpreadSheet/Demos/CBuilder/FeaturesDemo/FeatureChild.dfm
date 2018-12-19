object FeatureChildForm: TFeatureChildForm
  Left = 336
  Top = 224
  Width = 633
  Height = 484
  Caption = 'FeatureChildForm'
  Color = clBtnFace
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxSpreadSheetBook: TcxSpreadSheetBook
    Left = 0
    Top = 0
    Width = 625
    Height = 450
    Align = alClient
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    OnEditing = cxSpreadSheetBookEditing
    OnEndEdit = cxSpreadSheetBookEndEdit
    OnSheetPopupMenu = cxSpreadSheetBookSheetPopupMenu
    OnContextPopup = cxSpreadSheetBookContextPopup
  end
end
