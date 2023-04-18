unit uPedidoController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Data.DB, Datasnap.DBClient,
  FireDAC.Comp.Client;

type
  TPedidoController = class
  private
    FCodigo: Integer;
    FCliente: string;
    FData: string;
    function GetCliente: string;
    function GetData: string;
    function GetCodigo: Integer;
  public
    procedure InserirPedido(codigo_cliente: Integer; Data: TDateTime;
      valor_total: Currency; CDS: TClientDataSet);
    property Cliente: string read GetCliente;
    property Data: string read GetData;
    property Codigo: Integer read GetCodigo;

    function CarregarPedido(CodigoPedido: Integer; CDS: TClientDataSet)
      : boolean;

    procedure ApagarPedido(CodigoPedido: Integer);
  end;

implementation

{ TPedidoController }

uses UConexao, uClientes;

procedure TPedidoController.ApagarPedido(CodigoPedido: Integer);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := dmConexao.Conexao;
    query.SQL.Text := 'delete from pedidos_produtos ' +
      'where pedidos_codigo = :Codigo;' +
      ' delete from pedidos where codigo = :Codigo ';
      query.ParamByName('Codigo').Value := CodigoPedido;
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TPedidoController.CarregarPedido(CodigoPedido: Integer;
  CDS: TClientDataSet): boolean;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := dmConexao.Conexao;
    query.SQL.Text :=
      'select clientes.nome, clientes.codigo, data from pedidos ' +
      'inner join clientes on cliente_codigo = clientes.codigo ' +
      'where pedidos.codigo = :Codigo';

    query.ParamByName('Codigo').Value := CodigoPedido;
    query.Open();
    if not query.IsEmpty then
    begin
      FCliente := query.FieldByName('nome').AsString;
      FCodigo := query.FieldByName('codigo').AsInteger;
      FData := query.FieldByName('data').AsString;

      query.Close;
      query.SQL.Text :=
        'select pedidos_produtos.codigo, descricao, qtde, valor_unitario, valor_total from pedidos_produtos '
        + 'inner join produtos on produtos.codigo = produtos_codigo ' +
        'where pedidos_codigo = :Codigo';

      query.ParamByName('Codigo').Value := CodigoPedido;
      query.Open();
      if not query.IsEmpty then
      begin
        while not query.Eof do
        begin
          CDS.Append;
          CDS.FieldByName('codigo').AsInteger := query.FieldByName('codigo')
            .AsInteger;
          CDS.FieldByName('descricao').AsString :=
            query.FieldByName('descricao').AsString;
          CDS.FieldByName('qtde').AsInteger := query.FieldByName('qtde')
            .AsInteger;
          CDS.FieldByName('valor_unitario').AsCurrency :=
            query.FieldByName('valor_unitario').AsCurrency;
          CDS.FieldByName('valor_total').AsCurrency := query.FieldByName('qtde')
            .AsInteger * query.FieldByName('valor_unitario').AsCurrency;
          CDS.Post;
          query.Next;
        end;

        result := true;
      end;

    end
    else
    begin
      result := false;
    end;
  finally
    query.Free;
  end;
end;

function TPedidoController.GetCliente: string;
begin
  result := FCliente;
end;

function TPedidoController.GetCodigo: Integer;
begin
  result := FCodigo;
end;

function TPedidoController.GetData: string;
begin
  result := FData;
end;

procedure TPedidoController.InserirPedido(codigo_cliente: Integer;
  Data: TDateTime; valor_total: Currency; CDS: TClientDataSet);
var
  query: TFDQuery;
  IDRetorno: Integer;
  SQL: String;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := dmConexao.Conexao;
    query.SQL.Text := 'INSERT INTO Pedidos (data, valor_total, cliente_codigo) '
      + 'VALUES (:DataPedido, :Total, :Cliente); ' +
      'select last_insert_id() as id';
    query.ParamByName('DataPedido').Value := Data;
    query.ParamByName('Total').Value := valor_total;
    query.ParamByName('Cliente').Value := codigo_cliente;
    query.Open();
    IDRetorno := query.FieldByName('id').AsInteger;
    CDS.First;
    SQL := 'INSERT INTO pedidos_produtos ' +
      '(pedidos_codigo, produtos_codigo, qtde, valor_unitario, valor_total) ' +
      'VALUES (:PedidosCodigo, :ProdutosCodigo, :Qtde, :ValorUnitario, :ValorTotal)';
    query.Close;
    query.SQL.Text := SQL;
    while not CDS.Eof do
    begin
      query.Params.ParamByName('PedidosCodigo').Value := IDRetorno;
      query.Params.ParamByName('ProdutosCodigo').Value :=
        CDS.FieldByName('codigo').AsInteger;
      query.Params.ParamByName('Qtde').Value := CDS.FieldByName('qtde').AsFloat;
      query.Params.ParamByName('ValorUnitario').Value :=
        CDS.FieldByName('valor_unitario').AsFloat;
      query.Params.ParamByName('ValorTotal').Value :=
        CDS.FieldByName('valor_total').AsFloat;
      query.ExecSQL;
      CDS.Next;
    end;
  finally
    query.Free;
  end;
end;

end.
