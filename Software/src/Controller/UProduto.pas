unit UProduto;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.SysUtils, Datasnap.DBClient;

type
  TProduto = class
  private
    FQuery: TFDQuery;
    FCodigo: Integer;
    FDescricao: string;
    FPreco: Currency;
    function GetDescricao: string;
    function GetPreco: Currency;
    function GetCodigo: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function Pesquisar(Codigo: Integer): Boolean;
    property Descricao: string read GetDescricao;
    property Preco: Currency read GetPreco;
    property Codigo: Integer read GetCodigo;
    procedure AdicionarCDS(Codigo: Integer; qtde: Integer; Descricao: string;
      Valor: Currency; CDS: TClientDataSet);

    function SomaClientDataset(CDS: TClientDataSet): double;
    procedure AtualizaValorTotal(CDS: TClientDataSet);
  end;

implementation

{ TProduto }

uses UConexao;

procedure TProduto.AdicionarCDS(Codigo: Integer; qtde: Integer;
  Descricao: string; Valor: Currency; CDS: TClientDataSet);
begin

  try
    CDS.Append;
    CDS.FieldByName('codigo').AsInteger := Codigo;
    CDS.FieldByName('descricao').AsString := Descricao;
    CDS.FieldByName('qtde').AsInteger := qtde;
    CDS.FieldByName('valor_unitario').AsCurrency := Valor;
    CDS.FieldByName('valor_total').AsCurrency := Valor * qtde;
    CDS.Post;
  finally

  end;
end;

procedure TProduto.AtualizaValorTotal(CDS: TClientDataSet);
begin
  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    cds.FieldByName('valor_total').AsCurrency :=
      cds.FieldByName('valor_unitario').AsCurrency *
      cds.FieldByName('qtde').AsInteger;
      cds.Post;
      cds.Next;
  end;
end;

constructor TProduto.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.Conexao;
end;

destructor TProduto.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TProduto.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProduto.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProduto.GetPreco: Currency;
begin
  Result := FPreco;
end;

function TProduto.Pesquisar(Codigo: Integer): Boolean;
begin
  FQuery.Close;
  FQuery.SQL.Text :=
    'select CODIGO, DESCRICAO, PRECO from produtos WHERE codigo = :codigo';
  FQuery.ParamByName('codigo').Value := Codigo;
  FQuery.Open;

  Result := not FQuery.IsEmpty;
  if Result then
  begin
    FDescricao := FQuery.FieldByName('descricao').AsString;
    FPreco := FQuery.FieldByName('preco').Value;
    FCodigo := FQuery.FieldByName('codigo').AsInteger;
  end;

end;

function TProduto.SomaClientDataset(CDS: TClientDataSet): double;
var
  ValorTotal: Double;
begin
  CDS.First;
  ValorTotal := 0;
  try
    while not CDS.Eof do
    begin
      ValorTotal := ValorTotal + CDS.FieldByName('valor_total').AsCurrency;
      CDS.Next;
    end;

    Result := ValorTotal;
  finally

  end;

end;

end.
