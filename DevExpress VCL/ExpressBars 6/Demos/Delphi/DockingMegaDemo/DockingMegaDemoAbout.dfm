inherited DockingMegaDemoAboutForm: TDockingMegaDemoAboutForm
  ClientWidth = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 138
    Caption = 'DockingMegaDemo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 253
    Lines.Strings = (
      'This demo shows how ExpressBars 6 provides '
      'docking facilities similar in style to MS Visual Studio.'
      ''
      'Experiment with docking - you can dock, undock '
      'panels, autohide and float them'
      ''
      'Set the Font and Color of docking panels and '
      'change the View Style (see Style Menu)'
      ''
      'You can also set properties for each docking panel - '
      'select an item in the Solution Explorer and change '
      'its properties in the Properties panel.'
      ''
      'Use the '#39'Save Layout'#39' followed by '#39'Load Layout'#39' to '
      'show the persistance of settings at runtime.'
      ''
      'Note:  most of the images used in this demo have '
      'been provided by Glyfz - to purchase your copy or '
      'download free samples, please visit www.glyfz.com')
  end
end
