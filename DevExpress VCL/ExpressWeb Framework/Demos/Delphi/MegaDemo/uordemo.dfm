object OrderDemo: TOrderDemo
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebModuleActivate
  Height = 539
  HorizontalOffset = 255
  VerticalOffset = 120
  Width = 582
  object wedFirstName: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 80
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 0
  end
  object StyleController: TcxWebStyleController
    Left = 32
    Top = 16
    object stButtonDef: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebAliceBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebCornflowerBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stButtonHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDarkBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebAliceBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebCornflowerBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stTips: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebSandyBrown
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebRed
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = 14811135
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stLabel: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 12
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebDimGray
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stReqFields: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
    end
    object stDefFields: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwNormal
    end
    object stDescription: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebLightSlateGray
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
    end
  end
  object wlblFirstName: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 80
    Height = 16
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'First Name:'
  end
  object wedLastName: TcxWebEdit
    CustomEvents = <>
    Left = 368
    Top = 80
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 1
  end
  object wlblLastName: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 264
    Top = 80
    Height = 16
    Width = 95
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Last Name:'
  end
  object wlblAbout: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabel
    Left = 24
    Top = 40
    Height = 0
    Width = 0
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stLabel
    WordWrap = False
    Caption = 'About You'
  end
  object wedMail: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 112
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 2
  end
  object wlblMail: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 112
    Height = 16
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'E-mail:'
  end
  object wedVMail: TcxWebEdit
    CustomEvents = <>
    Left = 368
    Top = 112
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 3
  end
  object wlblVMail: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 264
    Top = 112
    Height = 16
    Width = 95
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Verify E-mail:'
  end
  object wlblPhone: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 24
    Top = 148
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'Phone:'
  end
  object wedPhone: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 144
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 4
  end
  object wlblFax: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 264
    Top = 148
    Height = 18
    Width = 95
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'Fax:'
  end
  object wedFax: TcxWebEdit
    CustomEvents = <>
    Left = 368
    Top = 144
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 5
  end
  object wlblCompany: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 24
    Top = 176
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'Company:'
  end
  object wbBuy: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 416
    Top = 552
    ZIndex = 0
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 6
    Caption = 'Buy Now !'
    GlyphPosition = gpBeforeText
    OnClick = wbBuyClick
  end
  object wbReset: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 304
    ShowHint = True
    Top = 552
    ZIndex = 0
    Hint = 'Click&nbsp;to&nbsp;clear&nbsp;all&nbsp;entered&nbsp;data'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 7
    Caption = 'Reset Form'
    GlyphPosition = gpBeforeText
    OnClick = wbResetClick
  end
  object wlblError: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stTips
    Left = 24
    Top = 504
    Height = 0
    Width = 0
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stTips
    WordWrap = True
    Caption = 'Error'
  end
  object wlblBAdress: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabel
    Left = 24
    Top = 216
    Height = 0
    Width = 0
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stLabel
    WordWrap = False
    Caption = 'Billing Adress'
  end
  object wlblAdress: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 256
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Address:'
  end
  object wedAdress: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 256
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 8
  end
  object wlblSuite: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 24
    Top = 288
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'Suite/Apt.:'
  end
  object wedSuite: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 288
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 9
  end
  object wlblCity: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 320
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'City:'
  end
  object wedCity: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 320
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 10
  end
  object wlblState: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 24
    Top = 352
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'State:'
  end
  object wlblZip: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 384
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Zip Code:'
  end
  object wedZip: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 384
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 11
  end
  object wlblCountry: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 24
    Top = 416
    Height = 18
    Width = 80
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Country:'
  end
  object wedCountry: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 416
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 12
  end
  object wlblPayment: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabel
    Left = 264
    Top = 216
    Height = 0
    Width = 0
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stLabel
    WordWrap = False
    Caption = 'Payment Method'
  end
  object wlblType: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 280
    Top = 312
    Height = 18
    Width = 70
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = False
    Caption = 'Type:'
  end
  object wcbType: TcxWebComboBox
    CustomEvents = <>
    Left = 360
    Top = 312
    Height = 22
    Width = 153
    ZIndex = 0
    TabOrder = 13
    ItemIndex = 0
    Items = <
      item
        Selected = True
        Text = 'VISA'
        Value = '0'
      end
      item
        Text = 'MasterCard'
        Value = '1'
      end
      item
        Text = 'American Express'
        Value = '2'
      end>
  end
  object wlblNumber: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 280
    Top = 344
    Height = 18
    Width = 70
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Number:'
  end
  object wedNumber: TcxWebEdit
    CustomEvents = <>
    Left = 360
    Top = 344
    Height = 22
    Width = 151
    ZIndex = 0
    TabOrder = 14
  end
  object wlblExpDate: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 280
    Top = 376
    Height = 17
    Width = 70
    ZIndex = 0
    AutoSize = False
    Styles.Default = stReqFields
    WordWrap = False
    Caption = 'Exp. Date:'
  end
  object wcbExpMonth: TcxWebComboBox
    CustomEvents = <>
    Left = 360
    Top = 376
    Height = 22
    Width = 48
    ZIndex = 0
    TabOrder = 15
    ItemIndex = -1
    Items = <
      item
        Text = 'MM'
        Value = '0'
      end
      item
        Text = '01'
        Value = '1'
      end
      item
        Text = '02'
        Value = '2'
      end
      item
        Text = '03'
        Value = '3'
      end
      item
        Text = '04'
        Value = '4'
      end
      item
        Text = '05'
        Value = '5'
      end
      item
        Text = '06'
        Value = '6'
      end
      item
        Text = '07'
        Value = '7'
      end
      item
        Text = '08'
        Value = '8'
      end
      item
        Text = '09'
        Value = '9'
      end
      item
        Text = '10'
        Value = '10'
      end
      item
        Text = '11'
        Value = '11'
      end
      item
        Text = '12'
        Value = '12'
      end>
  end
  object wcbExpYear: TcxWebComboBox
    CustomEvents = <>
    Left = 416
    Top = 376
    Height = 22
    Width = 97
    ZIndex = 0
    TabOrder = 16
    ItemIndex = -1
    Items = <
      item
        Text = 'YYYY'
        Value = '0'
      end
      item
        Text = '2001'
        Value = '1'
      end
      item
        Text = '2002'
        Value = '2'
      end
      item
        Text = '2003'
        Value = '3'
      end
      item
        Text = '2004'
        Value = '4'
      end
      item
        Text = '2005'
        Value = '5'
      end
      item
        Text = '2006'
        Value = '6'
      end
      item
        Text = '2007'
        Value = '7'
      end
      item
        Text = '2008'
        Value = '8'
      end
      item
        Text = '2009'
        Value = '9'
      end
      item
        Text = '2010'
        Value = '10'
      end>
  end
  object wlblComments: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stDefFields
    Left = 24
    Top = 456
    Height = 37
    Width = 75
    ZIndex = 0
    AutoSize = False
    Styles.Default = stDefFields
    WordWrap = True
    Caption = 'Your Comments:'
  end
  object wcbState: TcxWebComboBox
    CustomEvents = <>
    Left = 104
    Top = 352
    Height = 22
    Width = 153
    ZIndex = 0
    TabOrder = 17
    ItemIndex = -1
    Items = <
      item
        Value = '0'
      end
      item
        Text = 'Alaska'
        Value = '1'
      end
      item
        Text = 'Alabama'
        Value = '2'
      end
      item
        Text = 'Alaska'
        Value = '3'
      end
      item
        Text = 'Arizona'
        Value = '4'
      end
      item
        Text = 'Arkansas'
        Value = '5'
      end
      item
        Text = 'California'
        Value = '6'
      end
      item
        Text = 'Colorado'
        Value = '7'
      end
      item
        Text = 'Connecticut'
        Value = '8'
      end
      item
        Text = 'Delaware'
        Value = '9'
      end
      item
        Text = 'District of Columbia'
        Value = '10'
      end
      item
        Text = 'Florida'
        Value = '11'
      end
      item
        Text = 'Georgia'
        Value = '12'
      end
      item
        Text = 'Hawaii'
        Value = '13'
      end
      item
        Text = 'Idaho'
        Value = '14'
      end
      item
        Text = 'Illinois'
        Value = '15'
      end
      item
        Text = 'Indiana'
        Value = '16'
      end
      item
        Text = 'Iowa'
        Value = '17'
      end
      item
        Text = 'Kansas'
        Value = '18'
      end
      item
        Text = 'Kentucky'
        Value = '19'
      end
      item
        Text = 'Louisiana'
        Value = '20'
      end
      item
        Text = 'Maine'
        Value = '21'
      end
      item
        Text = 'Massachusetts'
        Value = '22'
      end
      item
        Text = 'Maryland'
        Value = '23'
      end
      item
        Text = 'Michigan'
        Value = '24'
      end
      item
        Text = 'Minnesota'
        Value = '25'
      end
      item
        Text = 'Mississippi'
        Value = '26'
      end
      item
        Text = 'Missouri'
        Value = '27'
      end
      item
        Text = 'Montana'
        Value = '28'
      end
      item
        Text = 'North Carolina'
        Value = '29'
      end
      item
        Text = 'North Dakota'
        Value = '30'
      end
      item
        Text = 'Nebraska'
        Value = '31'
      end
      item
        Text = 'Nevada'
        Value = '32'
      end
      item
        Text = 'New Hampshire'
        Value = '33'
      end
      item
        Text = 'New Jersey'
        Value = '34'
      end
      item
        Text = 'New Mexico'
        Value = '35'
      end
      item
        Text = 'New York'
        Value = '36'
      end
      item
        Text = 'Ohio'
        Value = '37'
      end
      item
        Text = 'Oklahoma'
        Value = '38'
      end
      item
        Text = 'Oregon'
        Value = '39'
      end
      item
        Text = 'Pennsylvania'
        Value = '40'
      end
      item
        Text = 'Rhode Island'
        Value = '41'
      end
      item
        Text = 'South Carolina'
        Value = '42'
      end
      item
        Text = 'South Dakota'
        Value = '43'
      end
      item
        Text = 'Tennessee'
        Value = '44'
      end
      item
        Text = 'Texas'
        Value = '45'
      end
      item
        Text = 'Utah'
        Value = '46'
      end
      item
        Text = 'Virginia'
        Value = '47'
      end
      item
        Text = 'Vermont'
        Value = '48'
      end
      item
        Text = 'Washington'
        Value = '49'
      end
      item
        Text = 'West Virginia'
        Value = '50'
      end
      item
        Text = 'Wisconsin'
        Value = '51'
      end
      item
        Text = 'Wyoming'
        Value = '52'
      end>
  end
  object weCompany: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 176
    Height = 22
    Width = 417
    ZIndex = 0
    TabOrder = 18
  end
  object wmComments: TcxWebMemo
    CustomEvents = <>
    Left = 104
    Top = 456
    Height = 40
    Width = 410
    ZIndex = 0
    TabOrder = 19
  end
  object wrbPayMethod: TcxWebRadioGroup
    CustomEvents = <>
    StyleItem_Default = stReqFields
    Left = 272
    Top = 256
    Height = 46
    Width = 225
    ZIndex = 0
    Styles.Default = stReqFields
    TabOrder = 20
    Items.Strings = (
      'Credit card'
      'Cache')
    ItemIndex = 0
  end
end
