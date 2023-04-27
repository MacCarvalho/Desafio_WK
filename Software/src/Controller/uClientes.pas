unit uClientes;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.SysUtils;

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
  public
    constructor Create(ACodigo: Integer; ANome: string);
    property Codigo: Integer read FCodigo;
    property Nome: string read FNome;
  end;

  TClientes = class
  public
    function BuscarClientesPorNome(const ANome: string): TList<TCliente>;
  end;

implementation

uses UConexao;

function TClientes.BuscarClientesPorNome(const ANome: string): TList<TCliente>;
var
  qryClientes: TFDQuery;
  FTransacao: TFDTransaction;
begin

  FTransacao := TFDTransaction.Create(nil);
  FTransacao.Connection := dmConexao.Conexao;

  FTransacao.StartTransaction;
  Result := TList<TCliente>.Create;
  qryClientes := TFDQuery.Create(nil);
  try
    qryClientes.Connection := dmConexao.Conexao;
    qryClientes.SQL.Text :=
      'SELECT codigo, nome FROM clientes WHERE nome LIKE :Nome';
    qryClientes.ParamByName('Nome').Value := '%' + ANome + '%';
    qryClientes.Open;
    qryClientes.First;

    while not qryClientes.Eof do
    begin
      Result.Add(TCliente.Create(qryClientes.FieldByName('codigo').AsInteger,
        qryClientes.FieldByName('nome').AsString));
      qryClientes.Next;
    end;
    FTransacao.Commit;
  except
    on E: Exception do
    begin
      FTransacao.Rollback;
    end;

  end;

  qryClientes.Free;
  FTransacao.Free;

end;

{ TCliente }

constructor TCliente.Create(ACodigo: Integer; ANome: string);
begin
  FCodigo := ACodigo;
  FNome := ANome;
end;

end.
