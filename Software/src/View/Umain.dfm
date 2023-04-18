object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'WK Desafio'
  ClientHeight = 296
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    489
    296)
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 147
    Height = 41
    Caption = 'Pedidos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object pnconexao: TPanel
    Left = 8
    Top = 183
    Width = 473
    Height = 105
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 36
      Height = 15
      Caption = 'Banco:'
    end
    object Label2: TLabel
      Left = 16
      Top = 45
      Width = 43
      Height = 15
      Caption = 'Usuario:'
    end
    object Label3: TLabel
      Left = 16
      Top = 74
      Width = 35
      Height = 15
      Caption = 'Senha:'
    end
    object edtNomeDB: TEdit
      Left = 68
      Top = 13
      Width = 121
      Height = 23
      TabOrder = 0
      Text = 'wk'
    end
    object edtUsuarioDB: TEdit
      Left = 68
      Top = 42
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'root'
    end
    object edtSenhaDB: TEdit
      Left = 69
      Top = 71
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 2
      Text = '102030'
    end
    object btAplicarConfiguracao: TButton
      Left = 264
      Top = 50
      Width = 105
      Height = 41
      Caption = 'Aplicar'
      TabOrder = 3
      OnClick = btAplicarConfiguracaoClick
    end
  end
end
