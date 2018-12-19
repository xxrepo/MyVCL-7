object EditorsInPlaceDemoCarInfoForm: TEditorsInPlaceDemoCarInfoForm
  Left = 197
  Top = 24
  Width = 693
  Height = 426
  Caption = 'CarInfo'
  Color = clBtnFace
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarInfo: TPanel
    Left = 8
    Top = 8
    Width = 649
    Height = 329
    BevelOuter = bvNone
    TabOrder = 0
    object vgCarInfo: TcxDBVerticalGrid
      Left = 0
      Top = 0
      Width = 649
      Height = 294
      Styles.OnGetContentStyle = vgCarInfoStylesGetContentStyle
      Styles.StyleSheet = EditorsInPlaceDemoDataDM.cxVerticalGridStyleSheetDevExpress
      Align = alClient
      DataController.DataSource = EditorsInPlaceDemoDataDM.dsCars
      OptionsView.RowHeaderWidth = 242
      OptionsView.ShowHeaders = False
      OptionsView.GridLines = vglNone
      OptionsBehavior.CellHints = False
      TabOrder = 0
      OnLeftVisibleRecordIndexChanged = vgCarInfoLeftVisibleRecordIndexChanged
      LayoutStyle = lsBandsView
      object vgCarInfoCar: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Car'
            EditPropertiesClassName = 'TcxTextEditProperties'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxMRUEditProperties'
            EditProperties.LookupItems.Strings = (
              'Mercedes-Benz'
              'BMW'
              'Rolls-Royce'
              'Jaguar'
              'Cadillac '
              'Lexus'
              'Ford'
              'Dodge'
              'GMC'
              'Nissan'
              'Toyota')
            EditProperties.OnButtonClick = OnEditPropertiesButtonClick
            Width = 100
            DataBinding.FieldName = 'Trademark'
          end
          item
            DataBinding.FieldName = 'Model'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoCategory: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Category'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxRadioGroupProperties'
            EditProperties.Columns = 3
            EditProperties.Items = <
              item
                Caption = 'Sports'
                Value = 'SPORTS'
              end
              item
                Caption = 'Saloon'
                Value = 'SALOON'
              end
              item
                Caption = 'Truck'
                Value = 'TRUCK'
              end>
            Width = 90
            DataBinding.FieldName = 'Category'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoImage: TcxDBEditorRow
        Height = 128
        Properties.EditPropertiesClassName = 'TcxImageProperties'
        Properties.EditProperties.GraphicClassName = 'TJPEGImage'
        Properties.EditProperties.Stretch = True
        Properties.DataBinding.FieldName = 'Picture'
      end
      object vgCarInfoLargeImageAndPrice: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'LargePicture:'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxBlobEditProperties'
            EditProperties.BlobEditKind = bekPict
            EditProperties.PictureGraphicClassName = 'TJPEGImage'
            Width = 110
            DataBinding.FieldName = 'Picture'
          end
          item
            Caption = 'Price:'
            Options.Editing = False
            Width = 40
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxCurrencyEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            DataBinding.FieldName = 'Price'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoEngine: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Engine:'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Width = 80
            DataBinding.FieldName = 'HP'
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Width = 80
            DataBinding.FieldName = 'Liter'
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Width = 60
            DataBinding.FieldName = 'Cyl'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoTransmission: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Transmission:'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Width = 80
            DataBinding.FieldName = 'TransmissSpeedCount'
          end
          item
            EditPropertiesClassName = 'TcxCheckBoxProperties'
            EditProperties.DisplayUnchecked = 'False'
            EditProperties.ValueChecked = 'Yes'
            EditProperties.ValueUnchecked = 'No'
            Width = 30
            DataBinding.FieldName = 'TransmissAutomatic'
          end
          item
            Caption = 'Automatic'
            Options.Editing = False
            OnGetDisplayText = GetDisplayText
          end>
        Properties.Fixed = True
      end
      object vgCarInfoMPG: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'MPG:'
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Width = 100
            DataBinding.FieldName = 'MPG_City'
          end
          item
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            DataBinding.FieldName = 'MPG_Highway'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoWebSite: TcxDBMultiEditorRow
        Height = 17
        Properties.Editors = <
          item
            Caption = 'WebSite:'
            EditPropertiesClassName = 'TcxTextEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            Options.Editing = False
            Width = 80
            OnGetDisplayText = GetDisplayText
          end
          item
            EditPropertiesClassName = 'TcxHyperLinkEditProperties'
            EditProperties.Alignment.Horz = taLeftJustify
            DataBinding.FieldName = 'Hyperlink'
          end>
        Properties.Fixed = True
      end
      object vgCarInfoDescription: TcxDBEditorRow
        Height = 247
        Properties.EditPropertiesClassName = 'TcxMemoProperties'
        Properties.EditProperties.ScrollBars = ssVertical
        Properties.EditProperties.WordWrap = False
        Properties.DataBinding.FieldName = 'Description'
      end
      object vgCarInfoID: TcxDBEditorRow
        Properties.DataBinding.FieldName = 'ID'
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 294
      Width = 649
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      Color = 15784893
      TabOrder = 1
      object btnOk: TcxButton
        Tag = 1
        Left = 448
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&OK'
        TabOrder = 0
        OnClick = cxButtonClick
        Colors.Default = 15784893
        Colors.Normal = 15784893
        Colors.Hot = 15188621
        Colors.Pressed = 14659432
      end
      object btnCancel: TcxButton
        Left = 536
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = cxButtonClick
        Colors.Default = 15784893
        Colors.Normal = 15784893
        Colors.Hot = 15188621
        Colors.Pressed = 14659432
      end
    end
  end
end
