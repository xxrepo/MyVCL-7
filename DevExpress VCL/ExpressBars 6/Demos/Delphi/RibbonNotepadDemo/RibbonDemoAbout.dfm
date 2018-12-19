inherited RibbonDemoAboutForm: TRibbonDemoAboutForm
  Left = 395
  Top = 250
  ClientHeight = 400
  ClientWidth = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 152
    Caption = 'RibbonNotepadDemo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 588
    Height = 368
    Lines.Strings = (
      
        'This example demonstrates an RTF editor with the Ribbon Interfac' +
        'e similar to that found in Microsoft Office 2007. This '
      
        'demo uses our TdxRibbon, TdxBarApplicationMenu, TdxBarScreenTipR' +
        'epository, TdxRibbonStatusBar, '
      
        'TdxRibbonPopupMenu, and TcxImageList components to mimic the app' +
        'earance and layout adaptation capabilities of '
      'ribbon UI elements.'
      ''
      
        'This application represents a fully functional RTF editor with s' +
        'tandard features.'
      
        'Examine the effect of resizing the editor'#39's window. In particula' +
        'r, see how bar items are arranged and sized within tab groups '
      'and how the width of tab captions is adjusted.'
      
        'The TdxRibbon component provides a way to arrange and display to' +
        'olbars and their items. All design-time customization '
      
        'capabilities introduced by the previous versions of the ExpressB' +
        'ars are still available in the ExpressBars v6. So, at design '
      
        'time you still can right-click a bar item control to invoke the ' +
        'Customizing Popup Menu.'
      ''
      
        'You can make a selection within the editor, to show the '#39'Selecti' +
        'on Tools'#39' contextual tab.'
      ''
      
        'The following additional customization capabilities are availabl' +
        'e for you in this demo.'
      ''
      'The Home tab'
      
        'Use various options of tab groups to manage documents, format an' +
        'd manipulate text.'
      ''
      'The Appearance tab'
      
        '- The Color Scheme tab group. Experiment with three different co' +
        'lor schemes: Blue, Black, and Silver to instantly change '
      'the appearance of the editor.'
      
        '- The Ribbon Options tab group. Toggle the "Ribbon Form" option ' +
        'to display the editor either as a ribbon or normal form. '
      
        'You can show/hide the Application Button by toggling the corresp' +
        'onding option. Clicking the Application Button '
      
        'invokes a popup menu of the TdxBarApplicationMenu type assigned ' +
        'via the ApplicationButton.Menu property.'
      
        '- The Quick Access Toolbar tab group. You can hide/show the Quic' +
        'k Access Toolbar by toggling the corresponding '
      
        'option. You can also specify the position at which this toolbar ' +
        'will be displayed.')
  end
  inherited btnOK: TButton
    Top = 367
  end
end
