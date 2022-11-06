unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    DBGrid1: TDBGrid;
    Conexao: TFDConnection;
    QryClientes: TFDQuery;
    DsClientes: TDataSource;
    QryClientesID: TIntegerField;
    QryClientesNOME: TStringField;
    QryClientesEMAIL: TStringField;
    EdtId: TDBEdit;
    EdtNome: TDBEdit;
    EdtEmail: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    procedure inativacampos;
    procedure ativacampos;
    procedure inativabotoes;
    procedure ativabotoes;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.ativabotoes;
begin
  BtnIncluir.Visible   := True;
  BtnAlterar.Visible   := True;
  BtnGravar.Visible    := False;
  BtnCancelar.Visible  := False;
  BtnExcluir.Visible   := True;
end;

procedure TFrmPrincipal.ativacampos;
begin

  EdtId.Enabled      := False;
  EdtNome.Enabled    := True;
  EdtEmail.Enabled   := True;

end;

procedure TFrmPrincipal.BtnAlterarClick(Sender: TObject);
begin
  QryClientes.Edit;
    ativacampos;
    EdtNome.SetFocus;
    inativabotoes;
end;

procedure TFrmPrincipal.BtnCancelarClick(Sender: TObject);
begin
  QryClientes.Cancel;
    inativacampos;
    ativabotoes;
end;

procedure TFrmPrincipal.BtnExcluirClick(Sender: TObject);
begin

  if (Application.MessageBox('Deseja realmente excluir?','Confirmação', MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
    begin
      QryClientes.Delete;
    end;

end;

procedure TFrmPrincipal.BtnGravarClick(Sender: TObject);
begin
  QryClientes.Post;
  Conexao.Commit;
  inativacampos;
  ShowMessage('Registro salvo com suncesso!');
  ativabotoes;

end;

procedure TFrmPrincipal.BtnIncluirClick(Sender: TObject);
begin
  QryClientes.Insert;
  ativacampos;
  EdtNome.SetFocus;
  inativabotoes;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Conexao.Connected := True;
  QryClientes.Open();
  inativacampos;
  ativabotoes;
end;

procedure TFrmPrincipal.inativabotoes;
begin
  BtnIncluir.Visible   := False;
  BtnAlterar.Visible   := False;
  BtnGravar.Visible    := True;
  BtnCancelar.Visible  := True;
  BtnExcluir.Visible   := False;

end;

procedure TFrmPrincipal.inativacampos;
begin
  EdtId.Enabled      := False;
  EdtNome.Enabled    := False;
  EdtEmail.Enabled   := False;
end;

end.
