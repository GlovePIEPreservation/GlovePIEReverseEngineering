object CursorForm: TCursorForm
  Left = 173
  Top = 107
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'CursorForm'
  ClientHeight = 48
  ClientWidth = 104
  Color = 16448250
  TransparentColor = True
  TransparentColorValue = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TTntImage
    Left = 0
    Top = 0
    Width = 48
    Height = 48
  end
  object Label1: TTntLabel
    Left = 24
    Top = 23
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Timer1: TTimer
    Interval = 20
    OnTimer = Timer1Timer
    Left = 72
  end
end
