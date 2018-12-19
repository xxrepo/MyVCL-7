object Register: TRegister
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 499
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 904
  object weFName: TcxWebEdit
    CustomEvents = <>
    Left = 156
    Top = 34
    Height = 22
    Width = 180
    ZIndex = 0
    TabOrder = 0
    MaxLength = 20
  end
  object weMName: TcxWebEdit
    CustomEvents = <>
    Left = 156
    Top = 63
    Height = 22
    Width = 36
    ZIndex = 0
    TabOrder = 1
    MaxLength = 1
  end
  object weLName: TcxWebEdit
    CustomEvents = <>
    Left = 157
    Top = 92
    Height = 22
    Width = 180
    ZIndex = 0
    TabOrder = 2
    MaxLength = 20
  end
  object weNick: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 122
    Height = 22
    Width = 100
    ZIndex = 0
    TabOrder = 3
    MaxLength = 10
  end
  object weLogin: TcxWebEdit
    CustomEvents = <>
    Left = 159
    Top = 151
    Height = 22
    Width = 100
    ZIndex = 0
    TabOrder = 4
    MaxLength = 10
  end
  object wePass: TcxWebEdit
    CustomEvents = <>
    Left = 159
    Top = 179
    Height = 22
    Width = 100
    ZIndex = 0
    TabOrder = 5
    MaxLength = 10
    Password = True
  end
  object weRePass: TcxWebEdit
    CustomEvents = <>
    Left = 158
    Top = 207
    Height = 22
    Width = 100
    ZIndex = 0
    TabOrder = 6
    MaxLength = 10
    Password = True
  end
  object weQuest: TcxWebEdit
    CustomEvents = <>
    Left = 158
    Top = 234
    Height = 22
    Width = 348
    ZIndex = 0
    TabOrder = 7
    MaxLength = 50
  end
  object weAnswer: TcxWebEdit
    CustomEvents = <>
    Left = 159
    Top = 263
    Height = 22
    Width = 348
    ZIndex = 0
    TabOrder = 8
    MaxLength = 50
  end
  object weCompany: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 294
    Height = 22
    Width = 340
    ZIndex = 0
    TabOrder = 9
    MaxLength = 50
  end
  object weWww: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 351
    Height = 22
    Width = 324
    ZIndex = 0
    TabOrder = 11
    MaxLength = 100
  end
  object weAddress1: TcxWebEdit
    CustomEvents = <>
    Left = 159
    Top = 380
    Height = 22
    Width = 324
    ZIndex = 0
    TabOrder = 12
    MaxLength = 50
  end
  object weAddress2: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 411
    Height = 22
    Width = 324
    ZIndex = 0
    TabOrder = 13
    MaxLength = 50
  end
  object weEmail: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 322
    Height = 22
    Width = 372
    ZIndex = 0
    TabOrder = 10
    MaxLength = 50
  end
  object weCity: TcxWebEdit
    CustomEvents = <>
    Left = 159
    Top = 439
    Height = 22
    Width = 164
    ZIndex = 0
    TabOrder = 14
    MaxLength = 50
  end
  object weState: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 469
    Height = 22
    Width = 52
    ZIndex = 0
    TabOrder = 15
    MaxLength = 2
  end
  object weZip: TcxWebEdit
    CustomEvents = <>
    Left = 160
    Top = 499
    Height = 22
    Width = 148
    ZIndex = 0
    TabOrder = 16
    MaxLength = 20
  end
  object cbCountry: TcxWebComboBox
    CustomEvents = <>
    Left = 160
    Top = 530
    Height = 22
    Width = 100
    ZIndex = 0
    TabOrder = 17
    ItemIndex = 0
    Items = <
      item
        Selected = True
        Text = 'United States'
        Value = '1'
      end
      item
        Text = 'Canada'
        Value = '2'
      end
      item
        Text = 'Afghanistan'
        Value = '3'
      end
      item
        Text = 'Albania'
        Value = '4'
      end
      item
        Text = 'Algeria'
        Value = '5'
      end
      item
        Text = 'American Samoa'
        Value = '6'
      end
      item
        Text = 'Andorra'
        Value = '7'
      end
      item
        Text = 'Angola'
        Value = '8'
      end
      item
        Text = 'Anguilla'
        Value = '9'
      end
      item
        Text = 'Antarctica'
        Value = '10'
      end
      item
        Text = 'Antigua and Barbuda'
        Value = '11'
      end
      item
        Text = 'Argentina'
        Value = '12'
      end
      item
        Text = 'Armenia'
        Value = '13'
      end
      item
        Text = 'Aruba'
        Value = '14'
      end
      item
        Text = 'Australia'
        Value = '15'
      end
      item
        Text = 'Austria'
        Value = '16'
      end
      item
        Text = 'Azerbaijan'
        Value = '17'
      end
      item
        Text = 'Bahamas'
        Value = '18'
      end
      item
        Text = 'Bahrain'
        Value = '19'
      end
      item
        Text = 'Bangladesh'
        Value = '20'
      end
      item
        Text = 'Barbados'
        Value = '21'
      end
      item
        Text = 'Belarus'
        Value = '22'
      end
      item
        Text = 'Belgium'
        Value = '23'
      end
      item
        Text = 'Belize'
        Value = '24'
      end
      item
        Text = 'Benin'
        Value = '25'
      end
      item
        Text = 'Bermuda'
        Value = '26'
      end
      item
        Text = 'Bhutan'
        Value = '27'
      end
      item
        Text = 'Bolivia'
        Value = '28'
      end
      item
        Text = 'Bosnia and Herzegovina'
        Value = '29'
      end
      item
        Text = 'Botswana'
        Value = '30'
      end
      item
        Text = 'Bouvet Island'
        Value = '31'
      end
      item
        Text = 'Brazil'
        Value = '32'
      end
      item
        Text = 'British Indian Ocean Territories'
        Value = '33'
      end
      item
        Text = 'Brunei Darussalam'
        Value = '34'
      end
      item
        Text = 'Bulgaria'
        Value = '35'
      end
      item
        Text = 'Burkina Faso'
        Value = '36'
      end
      item
        Text = 'Burundi'
        Value = '37'
      end
      item
        Text = 'Cambodia'
        Value = '38'
      end
      item
        Text = 'Cameroon'
        Value = '39'
      end
      item
        Text = 'Cape Verde'
        Value = '41'
      end
      item
        Text = 'Cayman Islands'
        Value = '42'
      end
      item
        Text = 'Central African Republic'
        Value = '43'
      end
      item
        Text = 'Chad'
        Value = '44'
      end
      item
        Text = 'Chile'
        Value = '45'
      end
      item
        Text = 'China, People'#39's Republic of'
        Value = '46'
      end
      item
        Text = 'Christmas Island'
        Value = '47'
      end
      item
        Text = 'Cocos Islands'
        Value = '48'
      end
      item
        Text = 'Colombia'
        Value = '49'
      end
      item
        Text = 'Comoros'
        Value = '50'
      end
      item
        Text = 'Congo'
        Value = '51'
      end
      item
        Text = 'Cook Islands'
        Value = '52'
      end
      item
        Text = 'Costa Rica'
        Value = '53'
      end
      item
        Text = 'Cote D'#39'ivoire'
        Value = '54'
      end
      item
        Text = 'Croatia'
        Value = '55'
      end
      item
        Text = 'Cuba'
        Value = '56'
      end
      item
        Text = 'Cyprus'
        Value = '57'
      end
      item
        Text = 'Czech Republic'
        Value = '58'
      end
      item
        Text = 'Denmark'
        Value = '59'
      end
      item
        Text = 'Djibouti'
        Value = '60'
      end
      item
        Text = 'Dominica'
        Value = '61'
      end
      item
        Text = 'Dominican Republic'
        Value = '62'
      end
      item
        Text = 'East Timor'
        Value = '63'
      end
      item
        Text = 'Ecuador'
        Value = '64'
      end
      item
        Text = 'Egypt'
        Value = '65'
      end
      item
        Text = 'El Salvador'
        Value = '66'
      end
      item
        Text = 'Equatorial Guinea'
        Value = '67'
      end
      item
        Text = 'Eritrea'
        Value = '68'
      end
      item
        Text = 'Estonia'
        Value = '69'
      end
      item
        Text = 'Ethiopia'
        Value = '70'
      end
      item
        Text = 'Falkland Islands'
        Value = '71'
      end
      item
        Text = 'Faroe Islands'
        Value = '72'
      end
      item
        Text = 'Fiji'
        Value = '73'
      end
      item
        Text = 'Finland'
        Value = '74'
      end
      item
        Text = 'France'
        Value = '75'
      end
      item
        Text = 'France, Metropolitan'
        Value = '76'
      end
      item
        Text = 'French Guiana'
        Value = '77'
      end
      item
        Text = 'French Polynesia'
        Value = '78'
      end
      item
        Text = 'French Southern Territories'
        Value = '79'
      end
      item
        Text = 'FYROM'
        Value = '80'
      end
      item
        Text = 'Gabon'
        Value = '81'
      end
      item
        Text = 'Gambia'
        Value = '82'
      end
      item
        Text = 'Georgia'
        Value = '83'
      end
      item
        Text = 'Germany'
        Value = '84'
      end
      item
        Text = 'Ghana'
        Value = '85'
      end
      item
        Text = 'Gibraltar'
        Value = '86'
      end
      item
        Text = 'Greece'
        Value = '87'
      end
      item
        Text = 'Greenland'
        Value = '88'
      end
      item
        Text = 'Grenada'
        Value = '89'
      end
      item
        Text = 'Guadeloupe'
        Value = '90'
      end
      item
        Text = 'Guam'
        Value = '91'
      end
      item
        Text = 'Guatemala'
        Value = '92'
      end
      item
        Text = 'Guinea'
        Value = '93'
      end
      item
        Text = 'Guinea-Bissau'
        Value = '94'
      end
      item
        Text = 'Guyana'
        Value = '95'
      end
      item
        Text = 'Haiti'
        Value = '96'
      end
      item
        Text = 'Heard Island And Mcdonald Islands'
        Value = '97'
      end
      item
        Text = 'Honduras'
        Value = '98'
      end
      item
        Text = 'Hong Kong'
        Value = '99'
      end
      item
        Text = 'Hungary'
        Value = '100'
      end
      item
        Text = 'Iceland'
        Value = '101'
      end
      item
        Text = 'India'
        Value = '102'
      end
      item
        Text = 'Indonesia'
        Value = '103'
      end
      item
        Text = 'Iran'
        Value = '104'
      end
      item
        Text = 'Iraq'
        Value = '105'
      end
      item
        Text = 'Ireland'
        Value = '106'
      end
      item
        Text = 'Israel'
        Value = '107'
      end
      item
        Text = 'Italy'
        Value = '108'
      end
      item
        Text = 'Jamaica'
        Value = '109'
      end
      item
        Text = 'Japan'
        Value = '110'
      end
      item
        Text = 'Jordan'
        Value = '111'
      end
      item
        Text = 'Kazakhstan'
        Value = '112'
      end
      item
        Text = 'Kenya'
        Value = '113'
      end
      item
        Text = 'Kiribati'
        Value = '114'
      end
      item
        Text = 'Korea, Democratic Peoples Republic of'
        Value = '115'
      end
      item
        Text = 'Korea, Republic of'
        Value = '116'
      end
      item
        Text = 'Kuwait'
        Value = '117'
      end
      item
        Text = 'Kyrgyzstan'
        Value = '118'
      end
      item
        Text = 'Lao Peoples Democratic Republic'
        Value = '119'
      end
      item
        Text = 'Latvia'
        Value = '120'
      end
      item
        Text = 'Lebanon'
        Value = '121'
      end
      item
        Text = 'Lesotho'
        Value = '122'
      end
      item
        Text = 'Liberia'
        Value = '123'
      end
      item
        Text = 'Libyan Arab Jamahiriya'
        Value = '124'
      end
      item
        Text = 'Liechtenstein'
        Value = '125'
      end
      item
        Text = 'Lithuania'
        Value = '126'
      end
      item
        Text = 'Luxembourg'
        Value = '127'
      end
      item
        Text = 'Macau'
        Value = '128'
      end
      item
        Text = 'Madagascar'
        Value = '129'
      end
      item
        Text = 'Malawi'
        Value = '130'
      end
      item
        Text = 'Malaysia'
        Value = '131'
      end
      item
        Text = 'Maldives'
        Value = '132'
      end
      item
        Text = 'Mali'
        Value = '133'
      end
      item
        Text = 'Malta'
        Value = '134'
      end
      item
        Text = 'Marshall Islands'
        Value = '135'
      end
      item
        Text = 'Martinique'
        Value = '136'
      end
      item
        Text = 'Mauritania'
        Value = '137'
      end
      item
        Text = 'Mauritius'
        Value = '138'
      end
      item
        Text = 'Mayotte'
        Value = '139'
      end
      item
        Text = 'Mexico'
        Value = '140'
      end
      item
        Text = 'Micronesia'
        Value = '141'
      end
      item
        Text = 'Moldova'
        Value = '142'
      end
      item
        Text = 'Monaco'
        Value = '143'
      end
      item
        Text = 'Mongolia'
        Value = '144'
      end
      item
        Text = 'Montserrat'
        Value = '145'
      end
      item
        Text = 'Morocco'
        Value = '146'
      end
      item
        Text = 'Mozambique'
        Value = '147'
      end
      item
        Text = 'Myanmar'
        Value = '148'
      end
      item
        Text = 'Namibia'
        Value = '149'
      end
      item
        Text = 'Nauru'
        Value = '150'
      end
      item
        Text = 'Nepal'
        Value = '151'
      end
      item
        Text = 'Netherlands'
        Value = '152'
      end
      item
        Text = 'Netherlands Antilles'
        Value = '153'
      end
      item
        Text = 'New Caledonia'
        Value = '154'
      end
      item
        Text = 'New Zealand'
        Value = '155'
      end
      item
        Text = 'Nicaragua'
        Value = '156'
      end
      item
        Text = 'Niger'
        Value = '157'
      end
      item
        Text = 'Nigeria'
        Value = '158'
      end
      item
        Text = 'Niue'
        Value = '159'
      end
      item
        Text = 'Norfolk Island'
        Value = '160'
      end
      item
        Text = 'Northern Mariana Islands'
        Value = '161'
      end
      item
        Text = 'Norway'
        Value = '162'
      end
      item
        Text = 'Oman'
        Value = '163'
      end
      item
        Text = 'Pakistan'
        Value = '164'
      end
      item
        Text = 'Palau'
        Value = '165'
      end
      item
        Text = 'Panama'
        Value = '166'
      end
      item
        Text = 'Papua New Guinea'
        Value = '167'
      end
      item
        Text = 'Paraguay'
        Value = '168'
      end
      item
        Text = 'Peru'
        Value = '169'
      end
      item
        Text = 'Philippines'
        Value = '170'
      end
      item
        Text = 'Pitcairn'
        Value = '171'
      end
      item
        Text = 'Poland'
        Value = '172'
      end
      item
        Text = 'Portugal'
        Value = '173'
      end
      item
        Text = 'Puerto Rico'
        Value = '174'
      end
      item
        Text = 'Qatar'
        Value = '175'
      end
      item
        Text = 'Reunion'
        Value = '176'
      end
      item
        Text = 'Romania'
        Value = '177'
      end
      item
        Text = 'Russian Federation'
        Value = '178'
      end
      item
        Text = 'Rwanda'
        Value = '179'
      end
      item
        Text = 'Saint Helena'
        Value = '180'
      end
      item
        Text = 'Saint Kitts and Nevis'
        Value = '181'
      end
      item
        Text = 'Saint Lucia'
        Value = '182'
      end
      item
        Text = 'Saint Pierre and Miquelon'
        Value = '183'
      end
      item
        Text = 'Saint Vincent and The Grenadines'
        Value = '184'
      end
      item
        Text = 'Samoa'
        Value = '185'
      end
      item
        Text = 'San Marino'
        Value = '186'
      end
      item
        Text = 'Sao Tome and Principe'
        Value = '187'
      end
      item
        Text = 'Saudi Arabia'
        Value = '188'
      end
      item
        Text = 'Senegal'
        Value = '189'
      end
      item
        Text = 'Seychelles'
        Value = '190'
      end
      item
        Text = 'Sierra Leone'
        Value = '191'
      end
      item
        Text = 'Singapore'
        Value = '192'
      end
      item
        Text = 'Slovakia'
        Value = '193'
      end
      item
        Text = 'Slovenia'
        Value = '194'
      end
      item
        Text = 'Solomon Islands'
        Value = '195'
      end
      item
        Text = 'Somalia'
        Value = '196'
      end
      item
        Text = 'South Africa'
        Value = '197'
      end
      item
        Text = 'South Georgia and Sandwich Islands'
        Value = '198'
      end
      item
        Text = 'Spain'
        Value = '199'
      end
      item
        Text = 'Sri Lanka'
        Value = '200'
      end
      item
        Text = 'Sudan'
        Value = '201'
      end
      item
        Text = 'Suriname'
        Value = '202'
      end
      item
        Text = 'Svalbard and JanMayen'
        Value = '203'
      end
      item
        Text = 'Swaziland'
        Value = '204'
      end
      item
        Text = 'Sweden'
        Value = '205'
      end
      item
        Text = 'Switzerland'
        Value = '206'
      end
      item
        Text = 'Syrian Arab Republic'
        Value = '207'
      end
      item
        Text = 'Taiwan'
        Value = '208'
      end
      item
        Text = 'Tajikistan'
        Value = '209'
      end
      item
        Text = 'Tanzania'
        Value = '210'
      end
      item
        Text = 'Thailand'
        Value = '211'
      end
      item
        Text = 'Togo'
        Value = '212'
      end
      item
        Text = 'Tokelau'
        Value = '213'
      end
      item
        Text = 'Tonga'
        Value = '214'
      end
      item
        Text = 'Trinidad and Tobago'
        Value = '215'
      end
      item
        Text = 'Tunisia'
        Value = '216'
      end
      item
        Text = 'Turkey'
        Value = '217'
      end
      item
        Text = 'Turkmenistan'
        Value = '218'
      end
      item
        Text = 'Turks and Caicos Islands'
        Value = '219'
      end
      item
        Text = 'Tuvalu'
        Value = '220'
      end
      item
        Text = 'Uganda'
        Value = '221'
      end
      item
        Text = 'Ukraine'
        Value = '222'
      end
      item
        Text = 'United Arab Emirates'
        Value = '223'
      end
      item
        Text = 'United Kingdom'
        Value = '224'
      end
      item
        Text = 'United States Minor Outlying Islands'
        Value = '226'
      end
      item
        Text = 'Uruguay'
        Value = '227'
      end
      item
        Text = 'Uzbekistan'
        Value = '228'
      end
      item
        Text = 'Vanuatu'
        Value = '229'
      end
      item
        Text = 'Vatican City State'
        Value = '230'
      end
      item
        Text = 'Venezuela'
        Value = '231'
      end
      item
        Text = 'Vietnam'
        Value = '232'
      end
      item
        Text = 'Virgin Islands (British)'
        Value = '233'
      end
      item
        Text = 'Virgin Islands (U.S.)'
        Value = '234'
      end
      item
        Text = 'Wallis And Futuna Islands'
        Value = '235'
      end
      item
        Text = 'Western Sahara'
        Value = '236'
      end
      item
        Text = 'Yemen'
        Value = '237'
      end
      item
        Text = 'Yugoslavia'
        Value = '238'
      end
      item
        Text = 'Zaire'
        Value = '239'
      end
      item
        Text = 'Zambia'
        Value = '240'
      end
      item
        Text = 'Zimbabwe'
        Value = '241'
      end>
  end
  object Query: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from TOOLS where toolid < 1000')
    Left = 274
    Top = 24
    object QueryTOOLID: TIntegerField
      FieldName = 'TOOLID'
    end
    object QueryNAME: TMemoField
      FieldName = 'NAME'
      BlobType = ftMemo
    end
  end
  object DataSource: TcxWebDBDataSource
    CustomEvents = <>
    DataSet = Query
    Left = 414
    Top = 22
  end
  object lbTools: TcxWebListBox
    CustomEvents = <>
    Left = 160
    Top = 565
    Height = 40
    Width = 173
    ZIndex = 0
    TabOrder = 18
    Items = <>
    MultiSelect = True
  end
  object weOther: TcxWebEdit
    CustomEvents = <>
    Left = 342
    Top = 575
    Height = 22
    Width = 196
    ZIndex = 0
    TabOrder = 19
  end
  object wbRegister: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'if(!valid()) return;')
      end>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 256
    Top = 668
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 20
    Caption = 'Register Me'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbRegisterClick
  end
  object wbClear: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 368
    Top = 669
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 22
    ButtonType = btReset
    Caption = 'Clear Form'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
  end
  object wbCancel: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 476
    Top = 668
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 21
    Caption = 'Cancel'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
  end
  object wlMailWrong: TcxWebLabel
    CustomEvents = <>
    Left = 0
    Top = 0
    Visible = False
    Height = 17
    Width = 65
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'EMail is incorrect!'
  end
end
