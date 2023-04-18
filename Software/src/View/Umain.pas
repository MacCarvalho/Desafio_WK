unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    pnconexao: TPanel;
    edtNomeDB: TEdit;
    Label1: TLabel;
    edtUsuarioDB: TEdit;
    Label2: TLabel;
    edtSenhaDB: TEdit;
    Label3: TLabel;
    btAplicarConfiguracao: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btAplicarConfiguracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AlterarConfiguracaoDB;

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses UPedido, UConexao;

procedure TfrmMain.AlterarConfiguracaoDB;
begin
//Adicionei essa procedure, apenas pra facilitar a configuracao, caso vcs precisem mudar o nome ou senha do script do banco ;)
  dmConexao.NomeDB := edtNomeDB.Text;
  dmConexao.UsuarioDB := edtUsuarioDB.Text;
  dmConexao.SenhaDB := edtSenhaDB.Text;

end;

procedure TfrmMain.btAplicarConfiguracaoClick(Sender: TObject);
begin
  AlterarConfiguracaoDB;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  Form: TfrmPedido;
begin
  Form := TfrmPedido.Create(Self);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  AlterarConfiguracaoDB;
end;

end.
