unit Uauditoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  Tfrmauditoria = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    lblinfo: TLabel;
    btnlogalteracoes: TRoundRect;
    btnativaoudesativaproduto: TRoundRect;
    Label1: TLabel;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    RoundRect3: TRoundRect;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnlogalteracoesClick(Sender: TObject);
    procedure btnativaoudesativaprodutoClick(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmauditoria: Tfrmauditoria;

implementation

{$R *.fmx}

uses Ulogin, Ulogalteracoes, Uauditoriaprodutosmenu, Uauditoriacategoriasmenu,
  Uauditoriasubcategoriasmenu, Uauditoriafuncionariosmenu;

procedure Tfrmauditoria.btnativaoudesativaprodutoClick(Sender: TObject);
begin
frmauditoria.Hide;
frmauditoriaprodutos.ShowModal;
end;

procedure Tfrmauditoria.btnlogalteracoesClick(Sender: TObject);
begin
frmlogalteracoes.ShowModal;
end;

procedure Tfrmauditoria.FormShow(Sender: TObject);
begin
lblinfo.Text := 'Ol� ' + frmlogin.nome_do_usuario_logado_para_proteger_integridade_do_sistema + ' a partir desse ponto do sistema todas as suas a��es ser�o armazenadas em um log !';
end;

procedure Tfrmauditoria.RoundRect1Click(Sender: TObject);
begin
frmauditoria.Hide;
frmauditoriacategorias.ShowModal;
end;

procedure Tfrmauditoria.RoundRect2Click(Sender: TObject);
begin
frmauditoria.Hide;
frmauditoriasubcategorias.ShowModal;
end;

procedure Tfrmauditoria.RoundRect3Click(Sender: TObject);
begin
frmauditoria.Hide;
frmauditoriafuncionarios.ShowModal;
end;

end.
