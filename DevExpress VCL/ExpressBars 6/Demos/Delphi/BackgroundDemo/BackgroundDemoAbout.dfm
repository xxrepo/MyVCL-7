inherited BackgroundDemoAboutForm: TBackgroundDemoAboutForm
  inherited lbDemoName: TLabel
    Width = 125
    Caption = 'BackgroundDemo'
  end
  inherited reDemoInfo: TRichEdit
    Lines.Strings = (
      'Experiment with displaying/hiding '
      'background images at runtime.'
      ''
      'In this demo you can:'
      ''
      '- hide background images of one '
      'or more toolbars'
      ''
      '- replace images with your own '
      ''
      '- see the effect of changing the '
      'display style'
      ''
      'Note the use of '
      'dxBarManager1.LockUpdate in '
      'the cbShowImageCaptionsClick '
      'event handler.')
  end
end
