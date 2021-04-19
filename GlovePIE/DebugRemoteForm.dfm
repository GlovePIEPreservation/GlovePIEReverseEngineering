object DebugRemoteForm: TDebugRemoteForm
  Left = 308
  Top = 110
  Width = 696
  Height = 480
  Caption = 'DebugRemoteForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TTntMemo
    Left = 8
    Top = 32
    Width = 673
    Height = 417
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 24
    OnTimer = Timer1Timer
    Left = 56
  end
end
