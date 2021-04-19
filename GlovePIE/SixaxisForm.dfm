object SixaxisForm: TSixaxisForm
  Left = 0
  Top = 0
  Caption = 'SIXAXIS Calibration'
  ClientHeight = 321
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = TntFormClose
  DesignSize = (
    331
    321)
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 77
    Width = 20
    Height = 13
    Caption = 'min:'
  end
  object TntLabel2: TTntLabel
    Left = 89
    Top = 11
    Width = 110
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SIXAXIS Number:'
  end
  object TntLabel3: TTntLabel
    Left = 8
    Top = 127
    Width = 24
    Height = 13
    Caption = 'max:'
  end
  object TntLabel4: TTntLabel
    Left = 8
    Top = 215
    Width = 314
    Height = 98
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      'You need to fill in the minimum and maxium x, y, and z values wh' +
      'ich gravity can produce by itself. Do this by rotating the SIXAX' +
      'IS without shaking it. The six positions are when it is facing u' +
      'p, down, left, right, forward, and backward.  Press the PS butto' +
      'n to switch on the SIXAXIS.'
    WordWrap = True
  end
  object SixAxisNumberBox: TTntEdit
    Left = 205
    Top = 8
    Width = 37
    Height = 21
    TabOrder = 1
    Text = '1'
    OnChange = SixAxisNumberBoxChange
  end
  object NextButton: TTntButton
    Left = 248
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Next'
    TabOrder = 2
    OnClick = NextButtonClick
  end
  object PrevButton: TTntButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Previous'
    TabOrder = 0
    OnClick = PrevButtonClick
  end
  object xBox: TTntEdit
    Left = 44
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object yBox: TTntEdit
    Left = 139
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 4
  end
  object zBox: TTntEdit
    Left = 234
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 5
  end
  object xMinBox: TTntEdit
    Left = 44
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object yMinBox: TTntEdit
    Left = 139
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 7
  end
  object zMinBox: TTntEdit
    Left = 234
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 8
  end
  object xMaxBox: TTntEdit
    Left = 44
    Top = 146
    Width = 89
    Height = 21
    TabOrder = 9
  end
  object yMaxBox: TTntEdit
    Left = 139
    Top = 146
    Width = 89
    Height = 21
    TabOrder = 10
  end
  object zMaxBox: TTntEdit
    Left = 234
    Top = 146
    Width = 89
    Height = 21
    TabOrder = 11
  end
  object TntButton3: TTntButton
    Left = 8
    Top = 184
    Width = 127
    Height = 25
    Caption = '&Save'
    TabOrder = 12
    OnClick = TntButton3Click
  end
  object CancelButton: TTntButton
    Left = 196
    Top = 184
    Width = 127
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 13
    OnClick = CancelButtonClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 24
    OnTimer = Timer1Timer
    Left = 152
    Top = 184
  end
end
