program WK;

uses
  Vcl.Forms,
  Umain in 'src\View\Umain.pas' {frmMain},
  UPedido in 'src\View\UPedido.pas' {frmPedido},
  uClientes in 'src\Controller\uClientes.pas',
  UConexao in 'src\Model\UConexao.pas' {dmConexao: TDataModule},
  UProduto in 'src\Controller\UProduto.pas',
  uPedidoController in 'src\Controller\uPedidoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
