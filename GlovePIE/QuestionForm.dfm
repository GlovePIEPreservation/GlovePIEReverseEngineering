object QuestionForm: TQuestionForm
  Left = 200
  Top = 113
  Caption = 'Please answer'
  ClientHeight = 97
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 118
    Height = 13
    Caption = 'Please type in your name'
  end
  object Edit1: TEdit
    Left = 16
    Top = 26
    Width = 329
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object OkButton: TButton
    Left = 103
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 183
    Top = 59
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
