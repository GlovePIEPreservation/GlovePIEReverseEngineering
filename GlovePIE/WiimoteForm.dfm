object WiimoteForm: TWiimoteForm
  Left = 173
  Top = 107
  Caption = 'Wiimote Calibration'
  ClientHeight = 300
  ClientWidth = 432
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    432
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object InstructionsLabel: TTntLabel
    Left = 8
    Top = 161
    Width = 416
    Height = 132
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      'Lay all your Wiimotes on a flat, level, surface, with the button' +
      's facing up.'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel1: TTntLabel
    Left = 8
    Top = 42
    Width = 177
    Height = 19
    AutoSize = False
    Caption = 'Sensor Bar Distance'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel2: TTntLabel
    Left = 318
    Top = 42
    Width = 101
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'm'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel3: TTntLabel
    Left = 8
    Top = 11
    Width = 177
    Height = 25
    AutoSize = False
    Caption = 'Sensor Bar Separation'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel4: TTntLabel
    Left = 318
    Top = 11
    Width = 101
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'mm'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel5: TTntLabel
    Left = 8
    Top = 105
    Width = 411
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Manually override accelerometer calibration?'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel6: TTntLabel
    Left = 8
    Top = 67
    Width = 177
    Height = 32
    AutoSize = False
    Caption = 'Sensor Bar Dot Count'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel7: TTntLabel
    Left = 318
    Top = 67
    Width = 115
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '0 if no sensor bar'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object TntLabel8: TTntLabel
    Left = 215
    Top = 130
    Width = 209
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'If yes: Do what it says below...'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 16736256
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object OkButton: TTntButton
    Left = 8
    Top = 268
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK, Manually override it'
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object BuiltInCalibrationButton: TTntButton
    Left = 8
    Top = 130
    Width = 185
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'No, Use built in calibration instead'
    TabOrder = 1
    OnClick = BuiltInCalibrationButtonClick
  end
  object SensorBarDistBox: TTntEdit
    Left = 191
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = SensorBarDistBoxChange
  end
  object SensorBarSepBox: TTntEdit
    Left = 191
    Top = 9
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = SensorBarSepBoxChange
  end
  object SensorBarDotBox: TTntEdit
    Left = 191
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = SensorBarDotBoxChange
  end
end
