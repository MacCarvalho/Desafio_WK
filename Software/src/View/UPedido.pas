unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.UITypes;

type
  TfrmPedido = class(TForm)
    painelTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    cbxCliente: TComboBox;
    Label2: TLabel;
    editData: TMaskEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    EdtValor: TEdit;
    EdtQuantidade: TEdit;
    Label5: TLabel;
    ButtonAdicionar: TButton;
    Panel3: TPanel;
    GridProdutos: TDBGrid;
    ButtonLocalizarPedido: TButton;
    ButtonGravarPedido: TButton;
    LabelTotal: TLabel;
    edtProduto: TEdit;
    cdsProdutos: TClientDataSet;
    cdsProdutoscodigo: TIntegerField;
    cdsProdutosdescricao: TStringField;
    cdsProdutosvalor_unitario: TCurrencyField;
    cdsProdutosvalor_total: TCurrencyField;
    DataSource1: TDataSource;
    cdsProdutosqtde: TIntegerField;
    edtIDPedido: TEdit;
    buttonApagarPedido: TButton;
    procedure cbxClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonAdicionarClick(Sender: TObject);
    Procedure AtualizaValorTotal;
    procedure ButtonGravarPedidoClick(Sender: TObject);
    procedure ButtonLocalizarPedidoClick(Sender: TObject);
    procedure buttonApagarPedidoClick(Sender: TObject);
    procedure GridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisaClienteNome;
    Procedure PesquisaProdutoCodigo;
    procedure AdicionarProduto;
    Procedure InserirDados;
    procedure CarregaPedido;
    Procedure ApagarPedido;
    procedure ApagarProduto;

  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses uClientes, UProduto, uPedidoController;

{ TfrmPedido }

procedure TfrmPedido.AdicionarProduto;
var
  Produto: TProduto;
begin
  if cdsProdutos.Active = false then
  begin
    cdsProdutos.createdataset;
  end;

  Produto := TProduto.Create;
  try
    Produto.AdicionarCDS(edtProduto.Tag, StrToInt(EdtQuantidade.Text),
      edtProduto.Text, StrToCurr(EdtValor.Text), cdsProdutos);
    LabelTotal.Caption :=  FormatCurr('#,##0.00', Produto.SomaClientDataset(cdsProdutos)) ;
  finally
    Produto.Free;
    EdtQuantidade.Text := '1';
    edtProduto.Clear;
    EdtValor.Clear;
  end;

end;

procedure TfrmPedido.ApagarPedido;
var
Pedido : TPedidoController;
begin
 if MessageDlg('Deseja realamente apagar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
    Pedido := TPedidoController.Create;
    Pedido.ApagarPedido(strtoint(edtIDPedido.Text));
    showmessage('Pedido apagado com sucesso');

    end
end;

procedure TfrmPedido.ApagarProduto;
begin
  cdsProdutos.Delete;
end;

procedure TfrmPedido.AtualizaValorTotal;
var

  Produto: TProduto;
begin

  Produto := TProduto.Create;
  try
    Produto.AtualizaValorTotal(cdsProdutos);

  finally

    Produto.Free;
  end;

end;

procedure TfrmPedido.ButtonAdicionarClick(Sender: TObject);
begin
  if (cdsProdutos.State in [dsEdit]) then
  begin
    if MessageDlg('Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      AtualizaValorTotal;
    end

  end
  else
  begin
    AdicionarProduto;
  end;
end;

procedure TfrmPedido.buttonApagarPedidoClick(Sender: TObject);
begin
  ApagarPedido;
end;

procedure TfrmPedido.ButtonGravarPedidoClick(Sender: TObject);
begin
  InserirDados;
end;

procedure TfrmPedido.ButtonLocalizarPedidoClick(Sender: TObject);
begin
CarregaPedido;
end;

procedure TfrmPedido.CarregaPedido;
var
  Produto: TProduto;
  Pedido : TPedidoController;
begin
  if cdsProdutos.Active = false then
  begin
    cdsProdutos.createdataset;
  end;

  Produto := TProduto.Create;
  Pedido := TPedidoController.Create;
  try
    if pedido.CarregarPedido(strtoint(edtIDPedido.Text), cdsProdutos) then
    begin
    LabelTotal.Caption :=  FormatCurr('#,##0.00', Produto.SomaClientDataset(cdsProdutos)) ;
    cbxCliente.Text := pedido.Cliente;
    editData.Text := Pedido.Data;
    end else
    begin
      showmessage('Pedido não encontrado');
    end;

  finally
    Produto.Free;
    pedido.Free;

  end;

end;

procedure TfrmPedido.cbxClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    PesquisaClienteNome;
end;

procedure TfrmPedido.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (trim(edtProduto.Text).IsEmpty = false) and (Key = VK_RETURN) then
  begin
    PesquisaProdutoCodigo;
  end;

end;

procedure TfrmPedido.EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    EdtValor.SetFocus;
  end;
end;

procedure TfrmPedido.GridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
    begin
      if MessageDlg('Deseja realamente apagar o produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
    ApagarProduto;
    showmessage('Produto apagado com sucesso');
    end
    end;
end;

procedure TfrmPedido.InserirDados;
var
  PedidoController: TPedidoController;
  Produto: TProduto;
begin
  PedidoController := TPedidoController.Create;
  Produto := TProduto.Create;
  try
    PedidoController.InserirPedido
      (Integer(cbxCliente.Items.Objects[cbxCliente.ItemIndex]), StrToDate(editData.Text),
      Produto.SomaClientDataset(cdsProdutos), cdsProdutos);

  finally
    PedidoController.Free;
    Produto.Free;
    showmessage('Pedido criado com sucesso!');
    self.Close;
  end;
end;



procedure TfrmPedido.PesquisaClienteNome;
var
  clientes: TList<TCliente>;
  cliente: TCliente;
begin
  // Verifica se o texto de pesquisa tem mais de 2 caracteres
  if Length(cbxCliente.Text) >= 2 then
  begin
    // Busca clientes no banco de dados
    clientes := TClientes.Create.BuscarClientesPorNome(cbxCliente.Text);
    try
      // Limpa os itens antigos do ComboBox
      cbxCliente.Items.Clear;

      // Adiciona os novos itens ao ComboBox
      for cliente in clientes do
        cbxCliente.Items.AddObject(cliente.Nome, TObject(cliente.Codigo));
    finally
      clientes.Free;
      cbxCliente.DroppedDown := true;
      ButtonLocalizarPedido.Enabled := false;
      ButtonGravarPedido.Enabled := true;
      buttonApagarPedido.Enabled := false;
    end;
  end;
end;

procedure TfrmPedido.PesquisaProdutoCodigo;
var
  Produto: TProduto;
begin
  Produto := TProduto.Create;
  try
    if Produto.Pesquisar(StrToInt(edtProduto.Text)) then
    begin
      edtProduto.Text := Produto.Descricao;
      EdtQuantidade.Text := '1';
      EdtQuantidade.SetFocus;
      EdtValor.Text := FormatCurr('0.00', Produto.Preco);
      edtProduto.Tag := Produto.Codigo;
    end
    else
      ShowMessage('Produto não encontrado');
  finally
    Produto.Free;
  end;

end;

end.
