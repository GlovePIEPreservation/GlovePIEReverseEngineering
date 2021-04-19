object EditorForm: TEditorForm
  Left = 384
  Top = 219
  Caption = 'GlovePIE - Programmable Input Emulator 0.45'
  ClientHeight = 559
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000B33333333300000000000000000
    033B333333333330000000000000000B3B333B333333333000000000000000B3
    B33B33300000000000000000000000BB3B300003B3B3B30000000000000000B3
    B00B3B3B3B3B3B000000000000000BB003B3B3B3B3B3B0333333333000000B0B
    3B3B3B3B3B3B30AAAAAAAAA3300000B3B3B3B3B3B3B30AAAAAAAAAAA3000003B
    3B3B3B3B3B3B033333333333330003B3B3B3B3B3B3B300000000000000000B3B
    3B3B3B3B3B3B3B3B3B3B3B3B3B3000B3B3B3B3B3B3B3B3B3B3B3B3B3B300003B
    3B3B3B3B3B3B3B3B3B3B3B3B3B000003B3B3B3B3B3B3B3B3B3B3B3B3B0000000
    0B3B3B3B3B3B3B3B3B3B3B30000000000003B3B3B3B3B3B3B3B3B00000000000
    0000000B3B3B3B3B300000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFF800FFFF8000FFFE0000FFFC0000FFF80000FFF80001FFF8000000F0000
    000700000003000000010000000000000000000000008000000180000001C000
    0003E0000007F800001FFE00007FFFE007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000003333
    0000000000003333000000000000333300000000000000000000000000003B30
    000000000000B3B00000000000003B03333333330000B30AAAAAAAAA330030AA
    AAAAAAAAA300B0333333333333303000000000000000B3B3B3B3B3B3B3B33B3B
    3B3B3B3B3B30B3B3B3B3B3B3B3B03B3B3B3B3B3B3B0007FF000007FF000007FF
    000007FF000007FF00000FFF0000000700000003000000010000000000000000
    00000000000000000000000000000000000000010000}
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = True
  ShowHint = True
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    616
    559)
  PixelsPerInch = 96
  TextHeight = 13
  object ErrorSplitter: TSplitter
    Left = 0
    Top = 504
    Width = 616
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 391
    ExplicitWidth = 632
  end
  object Pages: TTntPageControl
    Left = 0
    Top = 0
    Width = 616
    Height = 504
    ActivePage = ScriptTab
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabHeight = 26
    TabOrder = 0
    OnChange = PagesChange
    object ScriptTab: TTntTabSheet
      Caption = 'Untitled'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 25
      ExplicitHeight = 475
      object D3D9Panel1: TD3D9Panel
        Left = 0
        Top = 0
        Width = 608
        Height = 468
        Align = alClient
        Visible = False
        ExplicitHeight = 475
      end
      object Editor: TmwCustomEdit
        Left = 0
        Top = 0
        Width = 608
        Height = 468
        Cursor = crIBeam
        Align = alClient
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = RightClickMenu
        ShowHint = False
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        HighLighter = Highlighter
        Keystrokes = <
          item
            ShortCut = 38
            ShortCut2 = 0
            Command = ecUp
          end
          item
            ShortCut = 8230
            ShortCut2 = 0
            Command = ecSelUp
          end
          item
            ShortCut = 16422
            ShortCut2 = 0
            Command = ecScrollUp
          end
          item
            ShortCut = 40
            ShortCut2 = 0
            Command = ecDown
          end
          item
            ShortCut = 8232
            ShortCut2 = 0
            Command = ecSelDown
          end
          item
            ShortCut = 16424
            ShortCut2 = 0
            Command = ecScrollDown
          end
          item
            ShortCut = 37
            ShortCut2 = 0
            Command = ecLeft
          end
          item
            ShortCut = 8229
            ShortCut2 = 0
            Command = ecSelLeft
          end
          item
            ShortCut = 16421
            ShortCut2 = 0
            Command = ecWordLeft
          end
          item
            ShortCut = 24613
            ShortCut2 = 0
            Command = ecSelWordLeft
          end
          item
            ShortCut = 39
            ShortCut2 = 0
            Command = ecRight
          end
          item
            ShortCut = 8231
            ShortCut2 = 0
            Command = ecSelRight
          end
          item
            ShortCut = 16423
            ShortCut2 = 0
            Command = ecWordRight
          end
          item
            ShortCut = 24615
            ShortCut2 = 0
            Command = ecSelWordRight
          end
          item
            ShortCut = 34
            ShortCut2 = 0
            Command = ecPageDown
          end
          item
            ShortCut = 8226
            ShortCut2 = 0
            Command = ecSelPageDown
          end
          item
            ShortCut = 16418
            ShortCut2 = 0
            Command = ecPageBottom
          end
          item
            ShortCut = 24610
            ShortCut2 = 0
            Command = ecSelPageBottom
          end
          item
            ShortCut = 33
            ShortCut2 = 0
            Command = ecPageUp
          end
          item
            ShortCut = 8225
            ShortCut2 = 0
            Command = ecSelPageUp
          end
          item
            ShortCut = 16417
            ShortCut2 = 0
            Command = ecPageTop
          end
          item
            ShortCut = 24609
            ShortCut2 = 0
            Command = ecSelPageTop
          end
          item
            ShortCut = 36
            ShortCut2 = 0
            Command = ecLineStart
          end
          item
            ShortCut = 8228
            ShortCut2 = 0
            Command = ecSelLineStart
          end
          item
            ShortCut = 16420
            ShortCut2 = 0
            Command = ecEditorTop
          end
          item
            ShortCut = 24612
            ShortCut2 = 0
            Command = ecSelEditorTop
          end
          item
            ShortCut = 35
            ShortCut2 = 0
            Command = ecLineEnd
          end
          item
            ShortCut = 8227
            ShortCut2 = 0
            Command = ecSelLineEnd
          end
          item
            ShortCut = 16419
            ShortCut2 = 0
            Command = ecEditorBottom
          end
          item
            ShortCut = 24611
            ShortCut2 = 0
            Command = ecSelEditorBottom
          end
          item
            ShortCut = 45
            ShortCut2 = 0
            Command = ecToggleMode
          end
          item
            ShortCut = 16429
            ShortCut2 = 0
            Command = ecCopy
          end
          item
            ShortCut = 8237
            ShortCut2 = 0
            Command = ecPaste
          end
          item
            ShortCut = 46
            ShortCut2 = 0
            Command = ecDeleteChar
          end
          item
            ShortCut = 8238
            ShortCut2 = 0
            Command = ecCut
          end
          item
            ShortCut = 8
            ShortCut2 = 0
            Command = ecDeleteLastChar
          end
          item
            ShortCut = 16392
            ShortCut2 = 0
            Command = ecDeleteLastWord
          end
          item
            ShortCut = 32776
            ShortCut2 = 0
            Command = ecUndo
          end
          item
            ShortCut = 40968
            ShortCut2 = 0
            Command = ecRedo
          end
          item
            ShortCut = 13
            ShortCut2 = 0
            Command = ecLineBreak
          end
          item
            ShortCut = 16449
            ShortCut2 = 0
            Command = ecSelectAll
          end
          item
            ShortCut = 16451
            ShortCut2 = 0
            Command = ecCopy
          end
          item
            ShortCut = 24649
            ShortCut2 = 0
            Command = ecBlockIndent
          end
          item
            ShortCut = 16461
            ShortCut2 = 0
            Command = ecLineBreak
          end
          item
            ShortCut = 16462
            ShortCut2 = 0
            Command = ecInsertLine
          end
          item
            ShortCut = 16468
            ShortCut2 = 0
            Command = ecDeleteWord
          end
          item
            ShortCut = 24661
            ShortCut2 = 0
            Command = ecBlockUnindent
          end
          item
            ShortCut = 16470
            ShortCut2 = 0
            Command = ecPaste
          end
          item
            ShortCut = 16472
            ShortCut2 = 0
            Command = ecCut
          end
          item
            ShortCut = 16473
            ShortCut2 = 0
            Command = ecDeleteLine
          end
          item
            ShortCut = 24665
            ShortCut2 = 0
            Command = ecDeleteEOL
          end
          item
            ShortCut = 16474
            ShortCut2 = 0
            Command = ecUndo
          end
          item
            ShortCut = 24666
            ShortCut2 = 0
            Command = ecRedo
          end
          item
            ShortCut = 16432
            ShortCut2 = 0
            Command = ecGotoMarker0
          end
          item
            ShortCut = 16433
            ShortCut2 = 0
            Command = ecGotoMarker1
          end
          item
            ShortCut = 16434
            ShortCut2 = 0
            Command = ecGotoMarker2
          end
          item
            ShortCut = 16435
            ShortCut2 = 0
            Command = ecGotoMarker3
          end
          item
            ShortCut = 16436
            ShortCut2 = 0
            Command = ecGotoMarker4
          end
          item
            ShortCut = 16437
            ShortCut2 = 0
            Command = ecGotoMarker5
          end
          item
            ShortCut = 16438
            ShortCut2 = 0
            Command = ecGotoMarker6
          end
          item
            ShortCut = 16439
            ShortCut2 = 0
            Command = ecGotoMarker7
          end
          item
            ShortCut = 16440
            ShortCut2 = 0
            Command = ecGotoMarker8
          end
          item
            ShortCut = 16441
            ShortCut2 = 0
            Command = ecGotoMarker9
          end
          item
            ShortCut = 24624
            ShortCut2 = 0
            Command = ecSetMarker0
          end
          item
            ShortCut = 24625
            ShortCut2 = 0
            Command = ecSetMarker1
          end
          item
            ShortCut = 24626
            ShortCut2 = 0
            Command = ecSetMarker2
          end
          item
            ShortCut = 24627
            ShortCut2 = 0
            Command = ecSetMarker3
          end
          item
            ShortCut = 24628
            ShortCut2 = 0
            Command = ecSetMarker4
          end
          item
            ShortCut = 24629
            ShortCut2 = 0
            Command = ecSetMarker5
          end
          item
            ShortCut = 24630
            ShortCut2 = 0
            Command = ecSetMarker6
          end
          item
            ShortCut = 24631
            ShortCut2 = 0
            Command = ecSetMarker7
          end
          item
            ShortCut = 24632
            ShortCut2 = 0
            Command = ecSetMarker8
          end
          item
            ShortCut = 24633
            ShortCut2 = 0
            Command = ecSetMarker9
          end
          item
            ShortCut = 24654
            ShortCut2 = 0
            Command = ecNormalSelect
          end
          item
            ShortCut = 24643
            ShortCut2 = 0
            Command = ecColumnSelect
          end
          item
            ShortCut = 24652
            ShortCut2 = 0
            Command = ecLineSelect
          end
          item
            ShortCut = 9
            ShortCut2 = 0
            Command = ecTab
          end
          item
            ShortCut = 8201
            ShortCut2 = 0
            Command = ecShiftTab
          end
          item
            ShortCut = 24642
            ShortCut2 = 0
            Command = ecMatchBracket
          end>
        Lines.Strings = (
          
            '// Type your script here, or click the GUI tab to autogenerate i' +
            't!'
          ''
          '')
        MaxUndo = 1024
        ReadOnly = False
        WantTabs = True
        OnKeyDown = EditorKeyDown
        OnKeyPress = EditorKeyPress
        OnChange = EditorChange
        OnSelectionChange = EditorSelectionChange
        OnSpecialLineColors = EditorSpecialLineColors
        ExplicitHeight = 475
      end
    end
    object MidiGuiTab: TTntTabSheet
      Hint = 'MIDI Graphical User Interface'
      Caption = 'GUI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      ExplicitTop = 25
      ExplicitHeight = 475
      DesignSize = (
        608
        468)
      object DeviceLabel: TTntLabel
        Left = 8
        Top = 24
        Width = 36
        Height = 28
        Hint = 
          'Choose a MIDI output device'#13#10'* means it has values set already'#13#10 +
          '-v- means drop down to see more'#13#10'(To set what the default device' +
          ' is,'#13#10'set OutDevice under Default, Default, Other Controls)'
        Caption = 'Output Device:'
        WordWrap = True
      end
      object ChannelLabel: TTntLabel
        Left = 4
        Top = 56
        Width = 42
        Height = 14
        Hint = 
          'Choose a MIDI channel'#13#10'* means it has values set already'#13#10'-v- me' +
          'ans drop down to see more'#13#10'(To set what the default channel is,'#13 +
          #10'set DefaultChannel under Default, Default, Other Controls)'
        Caption = 'Channel:'
      end
      object CategoryLabel: TTntLabel
        Left = 2
        Top = 72
        Width = 47
        Height = 14
        Hint = 
          'What kind of controls, notes or velocities do you want to set?'#13#10 +
          'Controls 0..31 can be used as one 14 bit control, '#13#10'or seperate ' +
          'coarse and fine 7 bit controls.'#13#10'Controls 64..127 have only one ' +
          '7 bit value.'#13#10'Middle C is in Octave 5.'#13#10'* means it has values se' +
          't already'#13#10'-v- means drop down to see more'
        Caption = 'Category:'
      end
      object MidiLineLabel: TTntLabel
        Left = 495
        Top = 0
        Width = 26
        Height = 14
        Hint = 'The line number in your script'#13#10'that corresponds to this value.'
        Anchors = [akTop, akRight]
        Caption = 'Line: '
      end
      object MidiOutputMinLabel: TTntLabel
        Left = 390
        Top = 88
        Width = 48
        Height = 30
        Hint = 
          'The minimum MIDI value you want to output'#13#10'(Use the format chose' +
          'n above)'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'min:'
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object ApplyHighlight: TTntShape
        Left = 208
        Top = 272
        Width = 217
        Height = 41
        Brush.Color = clLime
      end
      object MidiOutputMaxLabel: TTntLabel
        Left = 510
        Top = 88
        Width = 48
        Height = 30
        Hint = 
          'The minimum MIDI value you want to output'#13#10'(Use the format chose' +
          'n above)'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'max:'
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object DeviceBox: TTntComboBox
        Left = 48
        Top = 24
        Width = 153
        Height = 22
        Hint = 
          'Choose a MIDI output device'#13#10'* means it has values set already'#13#10 +
          '-v- means drop down to see more'#13#10'(To set what the default device' +
          ' is,'#13#10'set DeviceOut under Default Midi, Default Channel, Other C' +
          'ontrols)'
        DropDownCount = 16
        TabOrder = 0
        Text = 'Default Midi'
        OnChange = DeviceBoxChange
      end
      object ChannelBox: TTntComboBox
        Left = 48
        Top = 48
        Width = 153
        Height = 22
        Hint = 
          'Choose a MIDI channel'#13#10'* means it has values set already'#13#10'-v- me' +
          'ans drop down to see more'#13#10'(To set what the default channel is,'#13 +
          #10'set DefaultChannel under Default, Default, Other Controls)'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Default Channel'
        OnChange = ChannelBoxChange
        Items.Strings = (
          'Default Channel'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16')
      end
      object CategoryBox: TTntComboBox
        Left = 48
        Top = 72
        Width = 153
        Height = 22
        Hint = 
          'What kind of controls, notes or velocities do you want to set?'#13#10 +
          'Controls 0..31 can be used as one 14 bit control, '#13#10'or seperate ' +
          'coarse and fine 7 bit controls.'#13#10'Controls 64..127 have only one ' +
          '7 bit value.'#13#10'Middle C is in Octave 5.'#13#10'* means it has values se' +
          't already'#13#10'-v- means drop down to see more'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = '14-bit Controls 0..31'
        OnChange = CategoryBoxChange
        Items.Strings = (
          '14-bit Controls 0..31'
          '7-bit Controls 64..95'
          '7-bit Controls 96..127'
          'Coarse Controls 0..31'
          'Fine Controls 0..31'
          'Other Controls'
          'Percussion'
          'Notes Octaves 0..4'
          'Notes Octaves 5..10'
          'Note Velocities 0..4'
          'Note Velocities 5..10'
          'Note Aftertouch 0..4'
          'Note Aftertouch 5..10')
      end
      object MidiFieldBox: TTntListBox
        Left = 0
        Top = 96
        Width = 201
        Height = 341
        Hint = 
          'Choose the MIDI value you want to set or change'#13#10'* means it has ' +
          'a value set already'
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 14
        TabOrder = 3
        OnClick = MidiFieldBoxClick
        ExplicitHeight = 348
      end
      object MidiApplyButton: TTntButton
        Left = 224
        Top = 280
        Width = 185
        Height = 25
        Hint = 'Save this value to your script'
        Caption = '&Apply'
        Default = True
        TabOrder = 4
        OnClick = MidiApplyButtonClick
      end
      object MidiDeleteButton: TTntButton
        Left = 432
        Top = 280
        Width = 176
        Height = 25
        Hint = 'Remove this value from your script'
        Caption = '&Delete'
        TabOrder = 5
        OnClick = MidiDeleteButtonClick
      end
      object MidiFormatBox: TTntRadioGroup
        Left = 208
        Top = 20
        Width = 404
        Height = 65
        Hint = 
          'What format is the expression below using?'#13#10'You can choose any f' +
          'ormat you want,'#13#10'it will be converted to the proper MIDI values.'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Format'
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          '0..1'
          '0..100%'
          '0..127'
          '1..128'
          '0..16383'
          '-8192..8191'
          '-1..1'
          '-64..63'
          'True=64'
          'Other'
          '-127..0'
          '-63..64')
        TabOrder = 6
      end
      object MidiOutputMinBox: TTntEdit
        Left = 440
        Top = 88
        Width = 70
        Height = 22
        Hint = 
          'The minimum MIDI value you want to output'#13#10'(Use the format chose' +
          'n above)'
        TabOrder = 7
        Visible = False
      end
      object LimitOutputCheckbox: TTntCheckBox
        Left = 208
        Top = 88
        Width = 185
        Height = 25
        Hint = 
          'Tick this to limit the range of this control'#13#10'to a subset of the' +
          ' format chosen above'
        Caption = 'Limit output to the range'
        TabOrder = 8
        OnClick = LimitOutputCheckboxClick
      end
      object MidiOutputMaxBox: TTntEdit
        Left = 560
        Top = 88
        Width = 46
        Height = 22
        Hint = 
          'The maximum MIDI value you want to output'#13#10'(Use the format chose' +
          'n above)'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        Visible = False
      end
      object InputGroupBox: TTntGroupBox
        Left = 208
        Top = 114
        Width = 409
        Height = 161
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Input Source'
        TabOrder = 10
        DesignSize = (
          409
          161)
        object MapSourceMinLabel: TTntLabel
          Left = 160
          Top = 132
          Width = 19
          Height = 14
          Hint = 
            'The input source value you want mapped to the minimum output'#13#10'eg' +
            '. use 0 for P5 finger bend values, like P5.Thumb'
          Caption = 'min:'
          Layout = tlCenter
        end
        object MapSourceMaxLabel: TTntLabel
          Left = 246
          Top = 132
          Width = 23
          Height = 14
          Hint = 
            'The input source value you want mapped to the maximum output'#13#10'eg' +
            '. use 63 for P5 finger bend values, like P5.Thumb'
          Caption = 'max:'
          Layout = tlCenter
        end
        object MidiOpLabel: TTntLabel
          Left = 4
          Top = 60
          Width = 32
          Height = 14
          Hint = 
            'If you want to use maths on the value'#13#10'then choose an operator h' +
            'ere,'#13#10'and the right hand side value in the next box'
          Caption = 'Maths:'
          Visible = False
        end
        object MidiRhsLabel: TTntLabel
          Left = 64
          Top = 60
          Width = 181
          Height = 14
          Hint = 
            'If you chose a maths operator in the previous box'#13#10'then type the' +
            ' right hand side value in this box'
          Caption = 'Right Hand Side of maths expression:'
          Visible = False
        end
        object InputDeviceLabel: TTntLabel
          Left = 4
          Top = 20
          Width = 62
          Height = 14
          Hint = 
            'Input Device'#13#10'(Or leave this blank to type your '#13#10'own expression' +
            ' in the third box)'
          Caption = 'Input Device:'
        end
        object MidiSourceDeviceNumberLabel: TTntLabel
          Left = 112
          Top = 8
          Width = 50
          Height = 26
          Hint = 
            'Device number, or blank for default'#13#10'Only MIDI supports a device' +
            ' 0 (mapper)'
          AutoSize = False
          Caption = 'Number:'
          Layout = tlBottom
          WordWrap = True
        end
        object PartLabel: TTntLabel
          Left = 160
          Top = 8
          Width = 249
          Height = 26
          Hint = 
            'If you chose a device then select a field here.'#13#10'If you left the' +
            ' device blank then type whatever you want.'#13#10'If the device is Glo' +
            've then you can also use 5 letter codes:'#13#10'x = don'#39't care, n = fu' +
            'lly bent, r = partly bent, l = straight'#13#10'eg. nlnnn = index finge' +
            'r extended others fully bent'
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Part of device,  or a numeric value, or expression:'
          Layout = tlBottom
          WordWrap = True
          ExplicitWidth = 257
        end
        object MidiFuncLabel: TTntLabel
          Left = 4
          Top = 98
          Width = 74
          Height = 32
          Hint = 'Leave this blank,'#13#10'or choose a function'
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Function:'
          Layout = tlCenter
          Visible = False
          WordWrap = True
        end
        object MidiFuncParamLabel: TTntLabel
          Left = 236
          Top = 98
          Width = 74
          Height = 32
          Hint = 'Function Parameter'
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Parameter:'
          Layout = tlCenter
          Visible = False
          WordWrap = True
        end
        object MapSourceCheckBox: TTntCheckBox
          Left = 8
          Top = 128
          Width = 153
          Height = 25
          Hint = 
            'Tick this box to convert from the source input range'#13#10'to the for' +
            'mat or limits chosen above.'
          Caption = 'Convert from source range:'
          TabOrder = 0
          OnClick = MapSourceCheckBoxClick
        end
        object MapSourceMinBox: TTntEdit
          Left = 184
          Top = 132
          Width = 57
          Height = 22
          Hint = 
            'The input source value you want mapped to the minimum output'#13#10'eg' +
            '. use 0 for P5 finger bend values, like P5.Thumb'
          TabOrder = 1
          Visible = False
        end
        object MapSourceMaxBox: TTntEdit
          Left = 272
          Top = 132
          Width = 57
          Height = 22
          Hint = 
            'The input source value you want mapped to the maximum output'#13#10'eg' +
            '. use 63 for P5 finger bend values, like P5.Thumb'
          TabOrder = 2
          Visible = False
        end
        object MidiUnitsBox: TTntComboBox
          Left = 336
          Top = 132
          Width = 65
          Height = 22
          Hint = 'What units do you want the input source measured in?'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 'Units'
          Items.Strings = (
            'Units'
            'mickeys'
            'pixels'
            'p5units'
            'mm'
            'cm'
            'inches'
            'feet'
            'metres'
            'kilometres'
            'miles'
            'mickeys per s'
            'pixels per s'
            'p5units per s'
            'cm per s'
            'inches per s'
            'feet per s'
            'm per s'
            'kph'
            'miles per s'
            'p5units per s per s'
            'm per s per s'
            'kph per s'
            'miles per hour per s'
            'degrees'
            'radians'
            'revolutions'
            'deg per s'
            'rad per s'
            'RPM'
            'deg per s per s'
            'milliseconds'
            'pieframes'
            'seconds'
            'minutes'
            'hours'
            'days'
            'years'
            'Hz'
            'KHz'
            'MHz'
            'cents'
            'semitones'
            'octaves'
            'MajorSeconds'
            'MinorThirds'
            'MajorThirds'
            'PerfectFourths'
            'Tritones'
            'PerfectFifths'
            'MinorSixths'
            'MajorSixths'
            'MinorSevenths'
            'MajorSevenths')
        end
        object MidiOpBox: TTntComboBox
          Left = 8
          Top = 76
          Width = 49
          Height = 22
          Hint = 
            'If you want to use maths on the value'#13#10'then choose an operator h' +
            'ere,'#13#10'and the right hand side value in the next box'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = ' '
          Visible = False
          OnChange = MidiOpBoxChange
          Items.Strings = (
            ' '
            '+'
            '-'
            '*'
            '/'
            '^'
            '>'
            '>='
            '='
            '!='
            '<='
            '<'
            'and'
            'or'
            'xor'
            '&'
            '|'
            'div'
            'mod'
            'shr'
            'shl')
        end
        object MidiRhsBox: TTntEdit
          Left = 64
          Top = 76
          Width = 257
          Height = 22
          Hint = 
            'If you chose a maths operator in the previous box'#13#10'then type the' +
            ' right hand side value in this box'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Visible = False
        end
        object MidiSourceDeviceBox: TTntComboBox
          Left = 8
          Top = 36
          Width = 105
          Height = 22
          Hint = 
            'Input Device'#13#10'(Or leave this blank to type your '#13#10'own expression' +
            ' in the third box)'
          Style = csDropDownList
          DropDownCount = 10
          TabOrder = 6
          OnChange = MidiSourceDeviceBoxChange
          Items.Strings = (
            ' '
            'Glove'
            'Joystick'
            'Keyboard'
            'Mouse'
            'Microphone'
            'Remote'
            'Screen'
            'Window'
            'MIDI'
            'Z800'
            'FiveDT'
            'Intersense'
            'Bird'
            'Fastrak'
            'PPT'
            'TrackIR'
            'Pinch'
            'Rower'
            'Wiimote'
            'SIXAXIS'
            'XBox360Controller'
            'Touchpad'
            'Falcon'
            'VR920'
            'HatTrack'
            'BDRemote'
            'SpaceBall'
            'Emotiv')
        end
        object MidiSourceDeviceNumberBox: TTntComboBox
          Left = 112
          Top = 36
          Width = 41
          Height = 22
          Hint = 
            'Input device number, or blank for default'#13#10'Use 1 for the first g' +
            'love, 2 for the second glove, etc.'
          Style = csDropDownList
          TabOrder = 7
          Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16')
        end
        object MidiValueBox: TTntComboBox
          Left = 160
          Top = 36
          Width = 241
          Height = 22
          Hint = 
            'If you chose a device then select a field here.'#13#10'If you left the' +
            ' device blank then type whatever you want.'#13#10'If the device is Glo' +
            've then you can also use 5 letter codes:'#13#10'x = don'#39't care, n = fu' +
            'lly bent, r = partly bent, l = straight'#13#10'eg. nlnnn = index finge' +
            'r extended others fully bent'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          OnChange = MidiValueBoxChange
        end
        object MidiFuncBox: TTntComboBox
          Left = 80
          Top = 104
          Width = 153
          Height = 22
          Hint = 'Leave this blank,'#13#10'or choose a function'
          DropDownCount = 9
          TabOrder = 9
          Text = ' '
          Visible = False
          OnChange = MidiFuncBoxChange
          Items.Strings = (
            ' '
            'Pressed'
            'Released'
            'Clicked'
            'DoubleClicked'
            'SingleClicked'
            'HeldDown'
            'KeepDown'
            'Smooth')
        end
        object MidiFuncParamBox: TTntEdit
          Left = 312
          Top = 104
          Width = 89
          Height = 22
          Hint = 'Function Parameter'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
          Visible = False
        end
        object MoreButton: TTntButton
          Left = 326
          Top = 64
          Width = 74
          Height = 32
          Anchors = [akTop, akRight]
          Caption = '&More...'
          TabOrder = 11
          OnClick = MoreButtonClick
        end
      end
      object PressKeyButton: TTntButton
        Left = 0
        Top = 0
        Width = 201
        Height = 22
        Hint = 
          'Click here then press a key, mouse button, or joystick button or' +
          ' axis you want to emulate.'
        Caption = 'Detect &Output to Emulate'
        TabOrder = 11
        OnClick = PressKeyButtonClick
      end
      object DetectButton: TTntButton
        Left = 208
        Top = 0
        Width = 281
        Height = 22
        Hint = 
          'Click here then press an axis or a key, joystick button, mouse b' +
          'utton, or P5 button to set the input to that.'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Detect &Input'
        TabOrder = 12
        OnClick = DetectButtonClick
      end
      object ManualOutputButton: TTntButton
        Left = 0
        Top = 32
        Width = 201
        Height = 22
        Hint = 
          'Click here then press a key, mouse button, or joystick button or' +
          ' axis you want to emulate.'
        Caption = 'Choose &Manually...'
        TabOrder = 13
        OnClick = ManualOutputButtonClick
      end
      object ManualInputButton: TTntButton
        Left = 208
        Top = 32
        Width = 281
        Height = 22
        Hint = 
          'Click here then press a key, mouse button, or joystick button or' +
          ' axis you want to emulate.'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Edit &Manually...'
        TabOrder = 14
        OnClick = ManualInputButtonClick
      end
    end
    object VariablesTab: TTntTabSheet
      Caption = 'Variables'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      ExplicitTop = 25
      ExplicitHeight = 475
      object ValueListEditor: TValueListEditor
        Left = 0
        Top = 0
        Width = 608
        Height = 468
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        TitleCaptions.Strings = (
          'Variable'
          'Value')
        ExplicitHeight = 475
        ColWidths = (
          150
          452)
      end
    end
  end
  object StatusBar: TTntStatusBar
    Left = 0
    Top = 540
    Width = 616
    Height = 19
    Hint = 
      'Cursor line and column, whether the file needs saving, and Inser' +
      't key state.'
    Panels = <
      item
        Width = 64
      end
      item
        Width = 74
      end
      item
        Text = 'Insert'
        Width = 50
      end>
  end
  object ErrorBox: TTntListBox
    Left = 0
    Top = 508
    Width = 616
    Height = 32
    Hint = 
      'Stop your program to fix errors.'#13#10'Click one of these errors to g' +
      'o to that line.'#13#10'Then when you have fixed the errors choose "Run' +
      '" again.'
    Align = alBottom
    ItemHeight = 13
    TabOrder = 2
    OnClick = ErrorBoxClick
  end
  object Panel1: TTntPanel
    Left = 244
    Top = 0
    Width = 377
    Height = 28
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      377
      28)
    object RunButton: TTntBitBtn
      Left = 0
      Top = 0
      Width = 80
      Height = 28
      Hint = 'Toggles between running and stopping your script'
      Caption = 'Run'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4B4B4B4B4B4BFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F0000DF0000BF2A4B4B4BFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F0000DF0000DF0000
        BF2A4B4B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F0000DF0000DF0000DF0000BF2A4B4B4BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F0000DF0000FF0900
        DF0000DF0000BF2A4B4B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F0055FF0000FF2A00
        DF0000FF0900DF0000DF0000BF2A4B4B4BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F0055FFAA00FF0900
        FF0900FF2A00DF0055FFAA007F00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F00AAFF2A00FF0900FF0900FF0900FF2A007F00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F00AAFF2A00FF0900
        FF09AAFF2A007F00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F00AAFFAA00FF09AAFF2A007F00FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F00AAFFAAAAFFAA00
        7F00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007F00AAFFAA007F00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007F00FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = RunButtonClick
    end
    object DebugEditBox: TTntEdit
      Left = 80
      Top = 0
      Width = 300
      Height = 28
      Hint = 
        'Debug Box'#13#10'To show something here, write in your script:'#13#10'debug ' +
        '= something'
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      Visible = False
    end
  end
  object Button2: TTntButton
    Left = 216
    Top = 0
    Width = 27
    Height = 25
    Caption = '-'
    TabOrder = 4
    Visible = False
    OnClick = Button2Click
  end
  object MwCompletionProposal1: TMwCompletionProposal
    OnExecute = MwCompletionProposal1Execute
    Position = 0
    NbLinesInWindow = 12
    ClSelect = 16776176
    AnsiStrings = True
    ShortCut = 16416
    Editor = Editor
    EndOfTokenChr = '()[]. +-*/=<>:;'#39'%&^|,!'
    Left = 253
    Top = 361
  end
  object MainMenu: TTntMainMenu
    Images = ImageList1
    Left = 173
    Top = 1
    object FileMenu: TTntMenuItem
      Caption = '&File'
      object FileNew: TTntMenuItem
        Caption = '&New'
        ImageIndex = 1
        OnClick = FileNewClick
      end
      object FileOpen: TTntMenuItem
        Caption = '&Open...'
        ImageIndex = 2
        OnClick = FileOpenClick
      end
      object FileRecent: TTntMenuItem
        Caption = '&Recent'
        Enabled = False
      end
      object FileSave: TTntMenuItem
        Caption = '&Save'
        ImageIndex = 6
        OnClick = FileSaveClick
      end
      object FileSaveAs: TTntMenuItem
        Caption = 'Save &As...'
        ImageIndex = 6
        OnClick = FileSaveAsClick
      end
      object FileDownloadMiis: TTntMenuItem
        Caption = 'Extract &Miis'
        OnClick = FileDownloadMiisClick
      end
      object N5: TTntMenuItem
        Caption = '-'
        Visible = False
      end
      object N6: TTntMenuItem
        Caption = '&Download from web'
        Visible = False
        OnClick = N6Click
      end
      object N1: TTntMenuItem
        Caption = '-'
      end
      object FileExit: TTntMenuItem
        Caption = 'E&xit'
        OnClick = FileExitClick
      end
    end
    object EditMenu: TTntMenuItem
      Caption = '&Edit'
      object EditUndo: TTntMenuItem
        Caption = '&Undo'
        OnClick = EditUndoClick
      end
      object EditRedo: TTntMenuItem
        Caption = '&Redo'
        OnClick = EditRedoClick
      end
      object N4: TTntMenuItem
        Caption = '-'
      end
      object EditCut: TTntMenuItem
        Caption = 'Cu&t'
        OnClick = EditCutClick
      end
      object EditCopy: TTntMenuItem
        Caption = '&Copy'
        OnClick = EditCopyClick
      end
      object EditPaste: TTntMenuItem
        Caption = '&Paste'
        OnClick = EditPasteClick
      end
      object EditDelete: TTntMenuItem
        Caption = '&Delete'
        OnClick = EditDeleteClick
      end
      object N3: TTntMenuItem
        Caption = '-'
      end
      object EditSelectAll: TTntMenuItem
        Caption = 'Se&lect All'
        OnClick = EditSelectAllClick
      end
    end
    object SearchMenu: TTntMenuItem
      Caption = '&Search'
      object SearchFind: TTntMenuItem
        Caption = '&Find...'
        ShortCut = 16454
        OnClick = SearchFindClick
      end
      object SearchReplace: TTntMenuItem
        Caption = '&Replace...'
        ShortCut = 16466
        OnClick = SearchReplaceClick
      end
      object SearchReplaceH: TTntMenuItem
        Caption = 'Replace&H'
        ShortCut = 16456
        Visible = False
        OnClick = SearchReplaceClick
      end
    end
    object ViewMenu: TTntMenuItem
      Caption = '&View'
      object ViewScript: TTntMenuItem
        Caption = '&Script'
        Checked = True
        RadioItem = True
        OnClick = ViewScriptClick
      end
      object ViewMidiGui: TTntMenuItem
        Caption = '&GUI'
        RadioItem = True
        OnClick = ViewMidiGuiClick
      end
      object ViewVariables: TTntMenuItem
        AutoCheck = True
        Caption = '&Variables'
        RadioItem = True
        OnClick = ViewVariablesClick
      end
    end
    object CompileMenu: TTntMenuItem
      Caption = '&Run!'
      object CompileCompile: TTntMenuItem
        Caption = '&Check for errors'
        ImageIndex = 0
        OnClick = CompileCompileClick
      end
      object CompileRun: TTntMenuItem
        Caption = '&Run!'
        ImageIndex = 5
        OnClick = CompileRunClick
      end
      object CompileStop: TTntMenuItem
        Caption = '&Stop                        Shift+P+I+E'
        ImageIndex = 4
        OnClick = CompileStopClick
      end
    end
    object ControlPanelMenu: TTntMenuItem
      Caption = '&CP-Settings'
      object CPSettingsVR920Calibration: TTntMenuItem
        Caption = '&VR920 Accelerometer Calibration'
        Visible = False
        OnClick = CPSettingsVR920CalibrationClick
      end
      object SIXAXIS1: TTntMenuItem
        Caption = 'SI&XAXIS Calibration'
        OnClick = SIXAXIS1Click
      end
      object ControlPanelWiimote: TTntMenuItem
        Caption = '&Wiimote Calibration'
        OnClick = ControlPanelWiimoteClick
      end
      object CPSettingsRestoreRealTrackIR: TTntMenuItem
        Caption = '&Restore Real TrackIR'
        OnClick = CPSettingsRestoreRealTrackIRClick
      end
      object ControlPanelTurnMouseModeOff: TTntMenuItem
        Caption = '&Turn P5 Mouse Mode Off'
        OnClick = ControlPanelTurnMouseModeOffClick
      end
      object N2: TTntMenuItem
        Caption = '-'
      end
      object ControlPanelBluetooth: TTntMenuItem
        Caption = '&Bluetooth'
        ImageIndex = 16
        OnClick = ControlPanelBluetoothClick
      end
      object ControlPanelControlPanel: TTntMenuItem
        Caption = '&Control Panel'
        ImageIndex = 10
        OnClick = ControlPanelControlPanelClick
      end
      object ControlPanelP5: TTntMenuItem
        Caption = 'P&5'
        ImageIndex = 13
        OnClick = ControlPanelP5Click
      end
      object ControlPanelPPJoy: TTntMenuItem
        Caption = '&PPJoy'
        ImageIndex = 11
        OnClick = ControlPanelPPJoyClick
      end
      object ControlPanelJoystick: TTntMenuItem
        Caption = '&Joystick'
        ImageIndex = 14
        OnClick = ControlPanelJoystickClick
      end
      object ControlPanelMouse: TTntMenuItem
        Caption = '&Mouse'
        ImageIndex = 3
        OnClick = ControlPanelMouseClick
      end
      object ControlPanelKeyboard: TTntMenuItem
        Caption = '&Keyboard'
        ImageIndex = 12
        OnClick = ControlPanelKeyboardClick
      end
      object ControlPanelMidi: TTntMenuItem
        Caption = 'M&IDI'
        ImageIndex = 9
        OnClick = ControlPanelMidiClick
      end
      object SettingsSpeech: TTntMenuItem
        Caption = '&Speech'
        Hint = 'Speech Control Panel'
        ImageIndex = 15
        OnClick = SettingsSpeechClick
      end
    end
    object LanguageMenu: TTntMenuItem
      Caption = '&Language'
      object LanguageEnglish: TTntMenuItem
        AutoCheck = True
        Caption = '&English'
        Checked = True
        RadioItem = True
        OnClick = LanguageEnglishClick
      end
    end
    object TroubleShooterMenu: TTntMenuItem
      Caption = '&TroubleShooter'
      object TroubleShooterDiagnose: TMenuItem
        Caption = '&Diagnose'
        OnClick = TroubleShooterDiagnoseClick
      end
      object estFeature1: TTntMenuItem
        Caption = '&Test Feature'
        Visible = False
        OnClick = estFeature1Click
      end
      object TroubleShooterBluetoothFix: TTntMenuItem
        AutoCheck = True
        Caption = '&Bluetooth Fix'
        Visible = False
        OnClick = TroubleShooterBluetoothFixClick
      end
      object TroubleShooterNoAutoBluetooth: TTntMenuItem
        AutoCheck = True
        Caption = 'No &Auto-Bluetooth Connect'
        OnClick = TroubleShooterNoAutoBluetoothClick
      end
      object TroubleShooterTestSIXAXIS: TTntMenuItem
        Caption = 'Test SIXAXIS'
        Visible = False
        OnClick = TroubleShooterTestSIXAXISClick
      end
      object DisableCodeCompletion1: TTntMenuItem
        AutoCheck = True
        Caption = '&Disable Code Completion'
      end
      object EnableCOM2PCTVRemote1: TTntMenuItem
        AutoCheck = True
        Caption = '&Enable COM2 PCTV Remote'
      end
      object FakeWindows981: TTntMenuItem
        AutoCheck = True
        Caption = '&Fake Windows 98'
        OnClick = FakeWindows981Click
      end
      object TroubleshooterVistaSharedSpeechRecogniser: TTntMenuItem
        AutoCheck = True
        Caption = 'Vista Shared Speech Recogniser'
      end
      object TroubleShooterShowSpeech: TTntMenuItem
        AutoCheck = True
        Caption = '&Show Speech Recognition Progress'
        OnClick = TroubleShooterShowSpeechClick
      end
      object ViewCompiledCode1: TTntMenuItem
        Caption = '&View Compiled Code'
        Visible = False
        OnClick = ViewCompiledCode1Click
      end
      object TroubleShooterColours: TTntMenuItem
        AutoCheck = True
        Caption = '&Contrasting colours'
        OnClick = TroubleShooterColoursClick
      end
      object RemoteTest1: TTntMenuItem
        Caption = '&Remote Test'
        OnClick = RemoteTest1Click
      end
      object DisableMouseRead1: TTntMenuItem
        AutoCheck = True
        Caption = 'Disable &Mouse Read'
        Visible = False
      end
      object DisableJoystickRead1: TTntMenuItem
        AutoCheck = True
        Caption = 'Disable &Joystick Read'
        Visible = False
      end
      object DisableKeyboardRead1: TTntMenuItem
        AutoCheck = True
        Caption = 'Disable &Keyboard Read'
        Visible = False
      end
      object DisablePPJoyUpdate1: TTntMenuItem
        AutoCheck = True
        Caption = 'Disable &PPJoy Update'
        Visible = False
      end
    end
    object HelpMenu: TTntMenuItem
      Caption = '&Help'
      object Website1: TTntMenuItem
        Caption = '&Website'
        OnClick = Website1Click
      end
      object GettingStarted1: TTntMenuItem
        Caption = '&Getting Started'
        OnClick = GettingStarted1Click
      end
      object Hit1: TTntMenuItem
        Caption = 'What'#39's &new'
        Visible = False
        OnClick = Hit1Click
      end
      object HelpPreliminaryDocumentation: TTntMenuItem
        Caption = '&Preliminary &Documentation'
        OnClick = HelpPreliminaryDocumentationClick
      end
      object HelpInstructions: TTntMenuItem
        Caption = 'Deta&iled ramblings (read me!)'
        OnClick = HelpInstructionsClick
      end
      object WiiliForums1: TTntMenuItem
        Caption = 'GlovePIE &Forums'
        OnClick = WiiliForums1Click
      end
      object GlovePIEWiki1: TMenuItem
        Caption = 'GlovePIE Wi&ki'
        OnClick = GlovePIEWiki1Click
      end
      object YahooGroup1: TTntMenuItem
        Caption = '&Yahoo Group'
        OnClick = YahooGroup1Click
      end
      object VuzixForums1: TTntMenuItem
        Caption = 'Protest at Vu&zix VR920 Forums'
        OnClick = VuzixForums1Click
      end
      object WiiScript301: TTntMenuItem
        Caption = 'Wii &Script 3.0'
        Visible = False
        OnClick = WiiScript301Click
      end
      object HelpVideoTutorials: TTntMenuItem
        Caption = '&Video Tutorials'
        OnClick = HelpVideoTutorialsClick
      end
      object HelpGlovepieVideos: TMenuItem
        Caption = 'Yo&uTube Videos'
        OnClick = HelpGlovepieVideosClick
      end
      object HelpAbout: TTntMenuItem
        Caption = '&About...'
        OnClick = HelpAboutClick
      end
    end
    object MinToTrayMenu: TMenuItem
      Caption = '[  &.]'
      OnClick = MinimizeToTrayClick
    end
  end
  object OpenDialogTnt: TTntOpenDialog
    DefaultExt = '.PIE'
    Filter = 
      'All supported files (*.PIE, *.P5M, *.XML, *.GCC, *.PIN, *.INI, *' +
      '.IDPROF, *.SWV, *.XWII)|*.PIE;*.P5M;*.XML;*.GCC;*.GCA;*.PIN;*.IN' +
      'I;*.IDPROF;*.SWV;*.CCM;*.xwii;*.xpadderprofile|Configuration fil' +
      'es (*.inilng; *.ini)|*.inilng;*.ini|PIE scripts (*.PIE)|*.PIE|P5' +
      'midi 1.0 files (*.p5m)|*.p5m|Shoot/e-Speaking/VAC profiles (*.xm' +
      'l)|*.xml|Game Commander Command Sets (*.gcc, *.gca)|*.gcc;*.gca|' +
      'Pinnacle Game Profiles (*.pin)|*.pin|PPJoyKey files (*.ini)|*.in' +
      'i|Total Game Control profiles (*.idprof)|*.idprof|GameVoice Prof' +
      'iles (*.swv)|*.swv|VR Commander Templates (*.ccm)|*.ccm|XWii pro' +
      'files (*.xwii)|*.xwii|XPadder Profiles (*.xpadderprofile)|*.xpad' +
      'derprofile|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 61
    Top = 366
  end
  object SaveDialogTnt: TTntSaveDialog
    DefaultExt = '.PIE'
    Filter = 'PIE Files (*.PIE)|*.PIE|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofNoReadOnlyReturn, ofEnableSizing]
    Left = 93
    Top = 366
  end
  object Highlighter: TmwCarlSampleSyn
    DefaultFilter = 'All files (*.*)|*.*'
    CommentAttri.Foreground = 16029614
    CommentAttri.Style = [fsItalic]
    KeyAttri.Style = [fsBold]
    StringAttri.Foreground = clBlue
    ConstantAttri.Foreground = clGreen
    OpperatorAttri.Foreground = 15735173
    ScopeAttri.Foreground = 32928
    Symbol0Attri.Foreground = 16748607
    Symbol0Attri.Style = [fsBold]
    Symbol1Attri.Foreground = 16764960
    ContinueAttri.Foreground = 33008
    UnitsAttri.Foreground = 33008
    ErrorAttri.Foreground = clRed
    ErrorAttri.Style = [fsBold, fsUnderline]
    Left = 61
    Top = 52
  end
  object BluetoothTimer: TTimer
    Interval = 20000
    OnTimer = BluetoothTimerTimer
    Left = 24
    Top = 368
  end
  object ImageList1: TImageList
    Left = 376
    Top = 360
    Bitmap = {
      494C010111001C001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FFFF0000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFF0000FFFFFF00FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFF0000FFFFFF00FFFFFF00FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFF0000FF00
      0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFF0000FFFFFF00FFFF
      FF00FFFF0000FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FFFF
      0000FFFFFF00FFFFFF00FFFFFF00FFFF0000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFF0000FFFFFF00FF000000FFFFFF00FFFFFF00FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF00FFFF
      0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FFFF0000FFFFFF00FFFFFF00FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFF0000FFFFFF00FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FFFF0000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700ECECEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700CFCF
      CF00707070005858580058585800585858005D5D5D0085858500D4D4D400ECEC
      EC00FBFBFB000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000000000000000000000000000FCFC
      FC00EBEBEB00E7E7E700F3F3F300000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D002AAE2A0042BA420049BE
      49003BB43B00208F20004D4D4D00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF0070707000B082
      8200AF818100AF818100AF818100AF81810097747400454545005D5D5D008080
      8000C2C2C200E3E3E300E7E7E700EAEAEA000000000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000008000800080808000808080008000
      8000800000000000000000000000000000000000000000000000FCFCFC00D4D4
      D4007A7A7A0067676700A0A0A000F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000028A7280049BE490067CB67009BC3
      8F002F892F0056C4560028A7280081645C009B77740064433C004D4D4D000000
      000000000000000000000000000000000000E7E7E700B0828200AF818100F2CB
      C800FFD9D900FFFFFF00FFD9D900FAD4D400EAB4B300AF818100977474005950
      500053535300585858005B5B5B00676767000000000000FF000000FF000000FF
      0000800000008080800080808000C0C0C000FFFFFF00C0C0C00000FF000000FF
      000000FF0000C0C0C000C0C0C000808080000000000000000000E3DDDD007A7A
      7A00B58989009965640065656500CACACA00E6E6E600E7E7E700E7E7E700E7E7
      E700FEFEFE000000000000000000000000001F971F0067CB670041A44100FFFC
      F9007FB27E0073D373002B902A00B2A6A500D7D6D700BA9A9A00BF8B8B004D4D
      4D0000000000000000000000000000000000B0828200F1CCC900FFD9D900FFD9
      D900F3C9C600F5C4C200F5C4C200F6C1C000F8BFBE00F9BDBB00ECAFAF00AF81
      8100AF818100AF818100A2797900434343000000000000FF000000FF00008080
      8000C0C0C000C0C0C000FFFFFF0000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000007A7A7A00F29C
      9C00FFB6B600C078780043404000565656005858580058585800585858006F6F
      6F00CDCDCD00E6E6E600E7E7E700E7E7E700000000005E8A57000E72AF00167B
      C200317C51002F892F00BCBAB700D2BEBE00CFA8A800CFA8A800CFA8A8004D4D
      4D0000000000000000000000000000000000EBA6A600F1CCC90095433200FFFF
      FF0095433200FFFFFF0095433200FFFFFF0095433200FFFFFF0095433200FBB8
      B700FCB5B500FFD9D900AF818100404040000000000000FF000080008000C0C0
      C000C0C0C000C0C0C00000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000007A7A7A00FA95
      9500FE959500FAAEAE00C8858500C8858500C8858500C8858500C8858500413F
      3F005757570058585800585858005B5B5B00000000001579BA003399FF003399
      FF003197FB00493A3500C7CCCD00CCA1A100CD828200CD828200CCA1A1000000
      000000000000000000000000000000000000F3ABAB00F1CCC900FFFFFF009543
      3200FFFFFF0095433200FFFFFF0095433200FFFFFF0095433200FFFFFF00FBB8
      B70095433200FDB3B300AF818100404040008080800080808000FFFFFF00C0C0
      C0008080800000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000007A7A7A00FF99
      9900FE959500FAAEAE00FCA6A600FFC5C500FFC5C500EEABAB00FA949400C885
      8500C8858500C8858500C88585005B5B5B00000000003AA1FF0041A7FF0044AD
      FC0041A7FF001E465300B8887E00CA7B7D00C45C5C00C45C5C004D4D4D000000
      000000000000000000000000000000000000FAB0B000F1CCC9004B79FF004B79
      FF00CC803300FFFFFF0095433200FFFFFF0095433200FFFFFF0000FF0000FBB8
      B70095433200FDB3B300AF8181004C4C4C0080000000FFFFFF00FFFFFF00C0C0
      C0000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000007A7A7A00DB90
      9000838383007C6D6D00A47F7F00FA949400F79191006FE8F8006FE8F800FA94
      9400FFC5C500EEABAB00B97E7E007A7A7A000A6BA00048AEFF0054BBFF0056BD
      FF0054BBFF003280A800D4952F00F9AE3100F2BF6E00C4737900483229000000
      000000000000000000000000000000000000FEB2B200FFFFFF00F1CCC900F2CB
      C800F3C9C600F4C6C400F5C4C200F6C1C000F8BFBE00F9BDBB00FABAB900FBB8
      B700FCB5B500FDB3B300AF8181009393930080808000FFFFFF00FFFFFF00C0C0
      C0000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000FEFEFE00EBE3E3007A7A
      7A0098929200AEA4A400A37F7F001966FF001966FF00E37D7D004DE681004DE6
      8100E37D7D00DE8686007A7A7A00EAEAEA000A6BA000167BC2001F85D5002282
      B5001E76B400364D4A00E7AE4800FFC04E00FFC04E00D0A852007A5B30004D4D
      4D0000000000000000000000000000000000D6BFBF00FEB2B200F7AEAE00EDA8
      A800E2A1A100D79A9A00CD949400C28D8D00B8868600B0828200AF818100AF81
      8100AF818100AF818100CAB3B300F3F3F300C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C00080808000FDFDFD00F3F3F300F0EEEE007A7A
      7A00DEC8C800F5EDED00FFC5C500FA949400F7919100FFB34F00FFB34F00D78C
      8600C37E80007A7A7A00F6F6F60000000000000000002E8BBD0075B8E0007DBD
      E2003E97C900C19D5100FECC6900FECC6900FECC6900EFC3620044ADFC001576
      A2004D4D4D00000000000000000000000000000000000000000000000000D8D8
      D800A3A3A3008A8A8A0082828200AE808000D1D1D10000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00C0C0
      C000C0C0C0008080800000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000F3F3F300ABABAB00B9B9B900BABA
      BA007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A00828282009999
      9900B1B1B100FEFEFE00000000000000000000000000000000003B81A100427E
      9900BF976D00F9CE7000FFD97E00FFDC8700F1D08100A68F5C00239ECB0056BD
      FF0029546C000000000000000000000000000000000000000000EAEAEA00A885
      8500B7919100B78E8E00B3888800E9E9E9000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000CBB5B5007A7A7A007A7A7A007A7A
      7A0093939300C5C5C500F2F0F000FBFAFA00FBFAFA00FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000C6BB
      BA00FDD07300FFDC8700FFE9A000FFE9A000A1B8A10075DCFE0071D7FF006AD1
      FE0056BDFF00239FE8004D4D4D00000000000000000000000000B68D8D008989
      8900D4D4D400E7E7E70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000E5BFBF007A7A7A00AAAAAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0CE
      CF00E0C48600F1D99700FFF8B900FFFEC9001EA8DC0084EAFF0062D3F50038B7
      E40013A4D60056BDFF00239FE8004D4D4D000000000000000000B58A8A00B6B6
      B6008D8D8D008B8B8B00E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000C0C0C000C0C0
      C0000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000EADCDC00DFC3C3007A7A7A00F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6BB
      BA00C6BBBA00C9BDBD00A58B8B00A58B8B0024AAD5008FF0FF0069DAF5003FBE
      E50013A4D60013A4D60056BDFF004D4D4D000000000000000000E5D6D600B991
      9100B0828200E7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF0000C0C0
      C000C0C0C000C0C0C00080808000800080008000800080008000800080008000
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6BBBA0063A8CD00D7FCFF0077E2F6003FBE
      E50013A4D60013A4D6006AD1FE004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024AAD500D4EE
      F600D4EEF60038B7E4004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082608000E0E0
      E000E2E0C000E3E0C000E0E0C000E1E0C000E0E0C000E0E0C000EBE0C000EAC0
      C000EAC0C0006C404000000000000000000000000000F3F3F300043304007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000FFFFFF00000000000000000000000000FFFF
      FF00BFBFBF00FEFEFE00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008A808400F6E0
      E400F6ECE20004020000A088840002005000F3E7D000F1E4D000F0E0C000E0E0
      CD00EFC0C8008160600000000000000000000000000051504500840000009214
      000084100000143400002C472C0077777700EFEFEF00FBFBFB00FFFFFF000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000C0C0C0000000000000000000FFFFFF005E21
      2100F78080002E2E2E00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2868900F7F1
      E8008020000000405000000000008080800010000000F3E7D000F1E4D000F0E0
      C000E0E0CD0082606000000000000000000000000000425B3600A0200000FFE0
      C000FFDC8000FFD8B000C084000080000000801000000433040076767600FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000808080000000000000000000FFFFFF00E488
      8800E1838300C0000000FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF000000
      0000000000000000000000000000000000000000000000000000A0808000F9F0
      E800004450008001000000080000404040008C80800080809000F3E7D000F1E4
      D000F0E0C0008860600000000000000000000000000018002000800C0000FFE4
      C000FFE0C000FFDC8000FFD8B000FFD5A000FF806400CC000000343E3F00FEFE
      FE0000000000000000000000000000000000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FFFFFF000000000000000000FEFEFE00F080
      8000F0808000F88080007F7F7F00969696006F737300642A2A006F6F6F00FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000000000000A0808100F8F4
      E00080808000E0C8C800C0808000000408000100000080604800F0E0D800F3E7
      D000F1E4D000816060000000000000000000000000004002000084100000FFE8
      D000FFE4C0000081C000EFD88000FFD8B000FFA00200CC8000006F796F00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000000000000FEFEFE00F890
      9000FE808000FFB2B200FF909000FEA0A000FFA2A200FFB8B800F28080007F7F
      7F00FFFFFF00EFEFEF00FFFFFF00DFDFDF000000000000000000A8888000FBF6
      F100C0A0A000C0808000C0C0C0000000000000000000C5C08000F4EADC00F0E0
      D800F3E7D000806060000000000000000000FFFFFF0080000000A2000000FFE0
      C00020A0C0000081CC000080C000BF800000400180008004000086867E00FFFF
      FF00FFFFFF0000000000000000000000000080808000FFFFFF00C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000FFFFFF00D400
      0000000000004040400004444400F8A0A000FE808000F0909000F08282005715
      15008A0A0A00E0808000FCC4C400FFFFFF000000000000000000C0A08000F8F8
      F400FBF6F100E8D4C000A00000008040400081808000F4ECE100F5E9C100F4EA
      DC00F0E0D800898080000000000000000000FFFFFF00800800009F30000080C0
      C0000098C800FFE8D0000090C800EFC0800000000000FEC08000C00404005F5F
      5F00FFFFFF00FDFDFD00FFFFFF0000000000C0C0C0000000000000000000FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000000000000000000000000000D080
      8000000000008080800002020200C0808000AC80A0000080D00000809000E080
      8000E0000000C0727200C0000000FFFFFF000000000000000000C0A0A000FCF8
      F100F8F8F400FBF6F100F8F4E000D0C0C00000010000F6E0E400F4ECE100F5E9
      C100F4EADC00A08080000000000000000000FFFFFF00C00000009C000000FFF6
      E000FFF0E000FFE0C0000090C000FFE4C000FFE0C00088040000C0000100FFC0
      8000E08000001E1E1E00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C00000000000FFFFFF00FFFFFF00FFFF
      FF00F2CECE00F0C0C000F0D0D0005000080010008000EC808000008000008080
      0000E0808000966F6F00FFFFFF00000000000000000000000000C0A0A000FDFC
      F800FCF8F100F8F8F400FBF6F100A080800080000200F7F1E800F6E0E400F4EC
      E100F5E9C100A08080000000000000000000FFFFFF00C4280000B3640000FFF8
      F000FFF6E000FFF0E00050A0C0000080C000FFE4C000A84000006A6A6A00FFFF
      FF00E07F7F00121280000000C000FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C0000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFFFF00FEFE
      FE00BFBFBF00C0909000F0C0C000F4C4C400E0800100E6800800DA808000E3DF
      DF00FFFFFF00FFFFFF0000000000000000000000000000000000C0B0A000FEFD
      FD00FDFCF800FCF8F000F8F8F40084808000C08082008050400002014800F6E0
      E400F4ECE000A88080000000000000000000FFFFFF00B84000008C800000FFFD
      FA00FFF8F000FFF6E000FFF0E0000080CC00FFE8D000AA4400006E6E6E00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0808000FDFDFD00EFE4E400F280
      8000FF80800073646400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000D4B4A000FFFF
      FF00FEFDFD00FDFCF800FCF8F00080020000808080008060600040404000F7F1
      E800F6E0E400A08080000000000000000000FFFFFF00B9400000CC998000FFFF
      FF00FFFDFA00FFF8F000FFF6E0000084C000BFC0C000A00000009F9F9F00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6CECE007F7F7F00BFBFBF00FEFE
      FE00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2C0B000FFFF
      FF00FFFFFF00FEFDFD00FDFCF8000000080004406100A0010000C0A4A000E8E1
      E000E0E0C000808280000000000000000000FFFFFF00C0180000824400008204
      0000A204000092800000F9E8E000FFF6E000FFF0E000A040000097979700FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAC8B100FFFF
      FF00FFFFFF00FFFFFF00C08282000000020060404000B4A0A400FBF6F100C080
      0000C2824000800000000000000000000000FFFFFF00C4080000C4400000C440
      0000C4400000C4400000C44000008440000082000000804000009F9F9F00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0C1B800FFFF
      FF00FFFFFF00FFFFFF00E5D3D10084111200FDFCF800FCF8F000F8F8F400E0C0
      80008081820000000000000000000000000000000000FFFFFF00FBFBFB00564A
      560000001000C0801000C0420000C0020000C8600000C8600000BFBFBF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9D6BF00FCFD
      FC00FAFAFB00F7F8F800F4F4F000F1F0F400EEF1F100ECECF100E8E8E000C0A1
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FDFDFD000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000D9A77D00A376
      0000A3760000A3760000D9A77D000000000000000000D9A77D00A3760000A376
      0000A3760000D9A77D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000000000000000000A3760000D9A7
      7D00CB8C4400CB8C4400A37600000000000000000000A3760000FF9F7F00CB8C
      4400CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000004B4B4B004B4B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A7007373
      73007373730059595900595959004B4B4B004B4B4B003D3D3D00303030003030
      300030303000A7A7A7000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000AA7F5500FF9F
      7F00D9A77D00CB8C4400A37600000000000000000000AA7F5500FF9F7F00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000000DF000000BF2A004B4B4B000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A70063360000CDCD
      CD00E6E6E600C1C1C100C1C1C100CDCDCD00F0F0F000EDEDED00E6E6E600A7A7
      A7003333330030303000A7A7A70000000000000000000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B70000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000BF2A004B4B4B0000000000000000000000
      000000000000000000000000000000000000633600006336000063360000DADA
      DA00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600DADA
      DA00CB8C4400633600003030300030303000000000000005B7000005B6000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000DF000000BF2A004B4B4B00000000000000
      00000000000000000000000000000000000063360000CB8C440063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C4400CB8C4400CB8C
      4400CB8C4400633600007F5B00003030300000000000000000000006D7000005
      BA000005B7000005B700000000000000000000000000000000000005B7000005
      B700000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000000DF000000FF090000DF000000DF000000BF2A004B4B4B000000
      00000000000000000000000000000000000063360000D9A77D0063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C4400CB8C
      4400CB8C440063360000CB8C4400303030000000000000000000000000000000
      00000005B7000005B7000005B600000000000005B6000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000000FF2A0000DF000000FF090000DF000000DF000000BF2A004B4B
      4B000000000000000000000000000000000063360000D9A77D0063360000D9A7
      7D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00D9A77D00CB8C4400CB8C
      4400CB8C440063360000CB8C44003D3D3D000000000000000000000000000000
      0000000000000005B6000006C7000006C7000006CE000005B400000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000055FF000000FF2A0000DF000000FF090000DF000000DF000000BF
      2A004B4B4B0000000000000000000000000063360000D9A77D0063360000AA3F
      2A00633600006336000063360000633600006336000063360000633600006336
      0000CB8C440063360000CB8C44004B4B4B000000000000000000000000000000
      000000000000000000000006C1000005C1000006DA0000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF2A0000DF000000FF090000DF000000DF
      0000007F000000000000000000000000000063360000D9A77D00633600009A9A
      9A00AAFFFF0099F8FF0099F8FF0099F8FF0099F8FF0099F8FF0099F8FF0099F8
      FF006336000063360000CB8C44004B4B4B000000000000000000000000000000
      0000000000000005B6000006D7000006CE000006DA000006E900000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF090000FF2A0000DF000055FFAA00007F
      00000000000000000000000000000000000063360000D9A77D0063360000AAFF
      FF00CDCDCD00A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF0063360000CB8C44004B4B4B000000000000000000000000000000
      00000006E5000006DA000006D30000000000000000000006E5000006EF000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF090000FF090000FF2A00007F00000000
      00000000000000000000000000000000000063360000D9A77D007F5B0000AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF0099F8FF007F5B0000CB8C44004B4B4B000000000000000000000000000006
      F8000006DA000006EF00000000000000000000000000000000000006F8000006
      F600000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF0900AAFF2A00007F0000000000000000
      00000000000000000000000000000000000063360000D9A77D007F5B0000AAFF
      FF00CDCDCD00A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF007F5B0000CB8C44004B4B4B0000000000000000000006F6000006
      F6000006F8000000000000000000000000000000000000000000000000000006
      F6000006F6000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA0000FF0900AAFF2A00007F000000000000000000000000
      00000000000000000000000000000000000063360000D9A77D0098989800AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF0099F8FF0098989800CB8C440059595900000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000006F60000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00AAFFAA00007F00000000000000000000000000000000
      00000000000000000000000000000000000063360000D9A77D00A6A6A6000000
      0000CDCDCD00CB8C4400CB8C4400A7A7A700A7A7A700A7A7A700A7A7A700C1C1
      C10099F8FF00A6A6A600D9A77D00666666000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00FFFFCC00D9A77D00A37600000000000000000000AA7F5500FFFFCC00FFFF
      CC00FF9F7F00A376000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00007F0000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A700633600007F5B00000000
      000000000000AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF00AAFFFF007F5B000063360000A7A7A7000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9A77D00AA7F
      5500AA7F5500AA7F5500D9A77D000000000000000000D9A77D00AA7F5500AA7F
      5500AA7F5500D9A77D0000000000000000000000000000000000000000000000
      000000000000007F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A7006336
      0000633600006336000063360000633600006336000063360000633600006336
      0000633600009A9A9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000C1C1C100C1C1C100818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000E1E1E100F1F1F100F8F8F800FEFEFE00FEFEFE00F4F4
      F400C1C1C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000DDDDDD00E1E1E100E1E1E100F0F0F000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000C1C1C100E1E1E100E1E1E100E1E1E100E1E1E100C1C1C100C9C9C900E8E8
      E800FEFEFE00E0E0E00020202000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000E4E4E400E0E1E100E1E1E100E1E1E100E5E5E500E1E1E100E1E1E100DDDD
      DD00F8F8F800FEFEFE0044444400000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFF00000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000E4E4E400F8F8F800EDEDED00E9E9E900E9E9E900E1E1E100E5E5E500E1E1
      E100C4C4C400F4F4F40025252500000000000000000084848400000000008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800FEFEFE00F0F0F000F1F1F100E1E1E100E9E9E900E1E1E100E1E1
      E100E1E1E100C8C8C80000000000000000008484840000000000FFFFFF00FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00FEFEFE00F0F0F000F1F1F100E1E1E100E9E9E900E5E5
      E500E1E1E10080808000000000000000000000000000FFFFFF0084840000FFFF
      0000FFFF0000FFFF000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A8A8A800FEFEFE00FEFEFE00FEFEFE00F4F4F400F1F1F100E9E9E900E1E1
      E100E1E1E100000000000000000000000000000000008484000084840000FFFF
      0000FFFF0000FFFF000084848400FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E4E400818181009C9C9C00BCBCBC0000404000F1F1F100EDEDED00E1E1
      E100808080000000000000000000000000000000000084840000FFFFFF00FFFF
      0000FFFF0000FFFF000084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800FEFEFE00FEFEFE00046464008864640090909000A9A9A900C1C1
      C1000000000000000000000000000000000000000000FFFFFF00848400008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000088888800FEFEFE00FEFEFE002020200084040400E8E8E800C9C9C9000000
      0000000000000000000000000000000000008484840000000000848400008484
      0000FFFFFF00FFFF0000FFFF0000FFFF00000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000959595000404
      040000000000000000008080800098989800A1A1A10080808000000000000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00848400008484000000000000000000008484840000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000404040000000000A0A0
      A0000000000005050500F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000008888880000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00C07F000000000000803F000000000000
      801F000000000000001F000000000000001F000000000000001F000000000000
      001F000000000000001F000000000000001F000000000000001F000000000000
      001F000000000000001F000000000000801F000000000000C03F000000000000
      E0FF000000000000FFFF000000000000F03FFFFFFFFFFFFFC0078001E1FF01FF
      80008001C0FF001F00008000C007000F00008001C000800F00008001C000801F
      00000001C000801F00000001C000001F000000018000000F0000000000018007
      E07F00010003C007C0FF8001003FE001C3FF80011FFFE000C1FF80010FFFE000
      C3FF8001FFFFFE00FFFF8001FFFFFFC1FFFFC00387FF0000F7FFC00380FF0000
      E1FFC003801F0000C1FFC003800F0000C01FC003800F0000C00CC003800F0000
      C000C00300070000C000C00300010000E000C003000000008001C00300000000
      0003C00300080000001FC003000F000007FFC003000F00008FFFC003000F0000
      FFFFC007800F0000FFFFC00FF81F0000C183FFFFFFFFFFFCC183F9FFC0039FF9
      C183F0FF80018FF3C183F07F000087E7C183F03F0000C3CFC183F01F0000F11F
      C183F00F0000F83FC183F0070000FC7FC183F0070000F83FC183F00F0000F19F
      C183F01F0000E3CFC183F03F0000C7E7C183F07F00008FFBC183F0FF10001FFF
      C183F1FF18003FFFC183FBFFC003FFFFEDB6FFFFFFFFFE1FEAAAFFFFFFFFFC07
      EAAAC007001FF803EDB6C007000FF001FFFFC0070007F001F07FC0070003E001
      C03FC0070001E001801FC0070000E001001FC007001FE0030019C007001FE003
      0010C007001FE0070019C0078FF1E0070019C00FFFF9900F0039C01FFF75081F
      8061C03FFF8F20FFC1FFFFFFFFFF81FF00000000000000000000000000000000
      000000000000}
  end
  object XMLDoc: TXMLDocument
    ParseOptions = [poPreserveWhiteSpace]
    Left = 136
    Top = 360
    DOMVendorDesc = 'MSXML'
  end
  object FindDialog: TFindDialog
    OnFind = FindDialogFind
    Left = 416
    Top = 360
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = ReplaceDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 512
    Top = 360
  end
  object UdpClient: TIdUDPClient
    Host = 'localhost'
    Port = 47110
    Left = 480
    Top = 256
  end
  object ApplicationEvents1: TApplicationEvents
    OnActivate = ApplicationEvents1Activate
    OnMinimize = ApplicationEvents1Minimize
    OnRestore = ApplicationEvents1Restore
    Left = 296
    Top = 360
  end
  object UdpServer: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 0
    Left = 408
    Top = 264
  end
  object ThreadedTimer1: TThreadedTimer
    Interval = 25
    OnTimer = ThreadedTimer1Timer
    Left = 216
    Top = 360
  end
  object HidController: TJvHidDeviceController
    OnEnumerate = HidControllerEnumerate
    Left = 176
    Top = 360
  end
  object TrayIcon: TJvTrayIcon
    Icon.Data = {
      0000010001001010100000000000280100001600000028000000100000002000
      00000100040000000000C0000000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000003333000000000000333300000000000033330000000000000000
      0000000000003B30000000000000B3B00000000000003B03333333330000B30A
      AAAAAAAA330030AAAAAAAAAAA300B0333333333333303000000000000000B3B3
      B3B3B3B3B3B33B3B3B3B3B3B3B30B3B3B3B3B3B3B3B03B3B3B3B3B3B3B0007FF
      000007FF000007FF000007FF000007FF00000FFF000000070000000300000001
      000000000000000000000000000000000000000000000000000000010000}
    IconIndex = 0
    Hint = 'GlovePIE'
    DropDownMenu = TrayMenu
    PopupMenu = TrayMenu
    Visibility = [tvVisibleTaskBar, tvVisibleTaskList, tvAnimateToTray]
    OnDblClick = TrayIconDblClick
    Left = 600
    Top = 40
  end
  object TrayMenu: TTntPopupMenu
    Left = 8
    Top = 360
    object TrayRun: TTntMenuItem
      Caption = '&Run'
      OnClick = TrayRunClick
    end
    object TrayWindowMode: TTntMenuItem
      Caption = '&Window Mode'
      Default = True
      OnClick = TrayWindowModeClick
    end
    object TrayScripts: TTntMenuItem
      Caption = '&Scripts'
      object ScriptsOpen: TTntMenuItem
        Caption = '&Open (and run)...'
        OnClick = ScriptsOpenClick
      end
    end
    object TrayExit: TTntMenuItem
      Caption = 'E&xit'
      OnClick = TrayExitClick
    end
  end
  object FileRecentManager: TJvMRUManager
    Duplicates = dupIgnore
    AccelDelimiter = adSpace
    MaxLength = 1
    IniStorage = FormStorage
    RecentMenu = FileRecent
    OnClick = FileRecentManagerClick
    Left = 448
    Top = 352
  end
  object FormStorage: TJvFormStorage
    AppStorage = GlovePieIni
    AppStoragePath = 'EditorForm\'
    Options = []
    StoredValues = <>
    Left = 560
    Top = 160
  end
  object GlovePieIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'GlovePIE.ini'
    SubStorages = <>
    Left = 496
    Top = 160
  end
  object WiimoteSpeakerTimer: TThreadedTimer
    Interval = 9
    OnTimer = WiimoteSpeakerTimerTimer
    ThreadPriority = tpHighest
    Left = 224
    Top = 272
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.PIE'
    Filter = 'PIE Files (*.PIE)|*.PIE|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofNoReadOnlyReturn, ofEnableSizing]
    Left = 304
    Top = 208
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '.PIE'
    Filter = 
      'All supported files|*.PIE;*.P5M;*.XML;*.GCC;*.GCA;*.PIN;*.INI;*.' +
      'IDPROF;*.SWV;*.CCM;*.XPadderProfile;*.xwii;*.txt|Configuration f' +
      'iles (*.inilng; *.ini)|*.inilng;*.ini|PIE scripts (*.PIE)|*.PIE|' +
      'P5midi 1.0 files (*.p5m)|*.p5m|Shoot/e-Speaking/VAC profiles (*.' +
      'xml)|*.xml|Game Commander Command Sets (*.gcc, *.gca)|*.gcc;*.gc' +
      'a|Pinnacle Game Profiles (*.pin)|*.pin|PPJoyKey files (*.ini)|*.' +
      'ini|Total Game Control profiles (*.idprof)|*.idprof|GameVoice Pr' +
      'ofiles (*.swv)|*.swv|VR Commander Templates (*.ccm)|*.ccm|XPadde' +
      'r Profiles (*.XPadderProfile)|*.XPadderProfile|XWii Profiles (*.' +
      'xwii)|*.xwii|FAAST keyboard bindings (*.txt)|*.txt|All Files (*.' +
      '*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 368
    Top = 192
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 400
    OnTimer = Timer1Timer
    Left = 48
    Top = 96
  end
  object RightClickMenu: TPopupMenu
    OnPopup = RightClickMenuPopup
    Left = 248
    Top = 120
    object PopupUndo: TMenuItem
      Caption = '&Undo'
      OnClick = EditUndoClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object PopupCut: TMenuItem
      Caption = 'Cu&t'
      OnClick = EditCutClick
    end
    object PopupCopy: TMenuItem
      Caption = '&Copy'
      OnClick = EditCopyClick
    end
    object PopupPaste: TMenuItem
      Caption = '&Paste'
      OnClick = EditPasteClick
    end
    object PopupDelete: TMenuItem
      Caption = '&Delete'
      OnClick = EditDeleteClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object PopupSelectAll: TMenuItem
      Caption = 'Select &All'
      OnClick = EditSelectAllClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object PopupCheckforErrors: TMenuItem
      Caption = 'Ch&eck Code'
      OnClick = PopupCheckforErrorsClick
    end
  end
end
