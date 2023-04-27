object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 613
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object painelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PEDIDO DE VENDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 896
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 900
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 896
    object Label1: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 46
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Alignment = taCenter
      Caption = 'Cliente:  '
      ExplicitHeight = 15
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 734
      Top = 5
      Width = 30
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Data: '
      ExplicitHeight = 15
    end
    object cbxCliente: TComboBox
      AlignWithMargins = True
      Left = 69
      Top = 5
      Width = 652
      Height = 23
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      OnKeyDown = cbxClienteKeyDown
      ExplicitWidth = 648
    end
    object editData: TMaskEdit
      AlignWithMargins = True
      Left = 777
      Top = 5
      Width = 120
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Alignment = taCenter
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = editDataKeyPress
      ExplicitLeft = 773
      ExplicitHeight = 23
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 900
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 896
    object Label3: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 46
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Alignment = taCenter
      Caption = 'Produto:'
      ExplicitHeight = 15
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 618
      Top = 5
      Width = 34
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'QTDE: '
      ExplicitHeight = 15
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 701
      Top = 5
      Width = 32
      Height = 22
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Valor: '
      ExplicitHeight = 15
    end
    object EdtValor: TEdit
      AlignWithMargins = True
      Left = 739
      Top = 3
      Width = 77
      Height = 24
      Margins.Bottom = 5
      Align = alRight
      Alignment = taCenter
      TabOrder = 2
      Text = '0'
      OnKeyPress = EdtValorKeyPress
      ExplicitLeft = 735
      ExplicitHeight = 23
    end
    object EdtQuantidade: TEdit
      AlignWithMargins = True
      Left = 658
      Top = 3
      Width = 30
      Height = 24
      Margins.Bottom = 5
      Align = alRight
      Alignment = taCenter
      TabOrder = 1
      Text = '1'
      OnKeyDown = EdtQuantidadeKeyDown
      OnKeyPress = EdtQuantidadeKeyPress
      ExplicitLeft = 654
      ExplicitHeight = 23
    end
    object ButtonAdicionar: TButton
      AlignWithMargins = True
      Left = 822
      Top = 3
      Width = 75
      Height = 26
      Align = alRight
      Caption = 'Adicionar'
      TabOrder = 3
      OnClick = ButtonAdicionarClick
      ExplicitLeft = 818
    end
    object edtProduto: TEdit
      AlignWithMargins = True
      Left = 69
      Top = 3
      Width = 536
      Height = 26
      Margins.Left = 10
      Align = alClient
      TabOrder = 0
      TextHint = 'Digite o Codigo do produto'
      OnKeyDown = edtProdutoKeyDown
      ExplicitWidth = 532
      ExplicitHeight = 23
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 544
    Width = 900
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 543
    ExplicitWidth = 896
    DesignSize = (
      900
      69)
    object LabelTotal: TLabel
      Left = 828
      Top = 16
      Width = 57
      Height = 37
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'R$ 0'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitLeft = 836
    end
    object ButtonLocalizarPedido: TButton
      Left = 162
      Top = 16
      Width = 110
      Height = 41
      Caption = 'Localizar Pedido'
      TabOrder = 0
      OnClick = ButtonLocalizarPedidoClick
    end
    object ButtonGravarPedido: TButton
      Left = 472
      Top = 16
      Width = 121
      Height = 41
      Caption = 'Gravar Pedido'
      Enabled = False
      TabOrder = 1
      OnClick = ButtonGravarPedidoClick
    end
    object edtIDPedido: TEdit
      Left = 3
      Top = 25
      Width = 142
      Height = 23
      TabOrder = 2
      TextHint = 'Informe um ID do Pedido'
    end
    object buttonApagarPedido: TButton
      Left = 278
      Top = 16
      Width = 99
      Height = 41
      Caption = 'Apagar Pedido'
      TabOrder = 3
      OnClick = buttonApagarPedidoClick
    end
  end
  object GridProdutos: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 139
    Width = 894
    Height = 395
    Margins.Top = 10
    Margins.Bottom = 10
    Align = alClient
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = GridProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        ReadOnly = True
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        ReadOnly = True
        Visible = True
      end>
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 344
    object cdsProdutoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object cdsProdutosqtde: TIntegerField
      FieldName = 'qtde'
    end
    object cdsProdutosvalor_unitario: TCurrencyField
      FieldName = 'valor_unitario'
    end
    object cdsProdutosvalor_total: TCurrencyField
      FieldName = 'valor_total'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsProdutos
    Left = 736
    Top = 288
  end
end
