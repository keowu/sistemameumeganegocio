unit Uconfiguracaoinicialsistema;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit,
  FMX.Ani;

type
  Tfrmconfiguracoesiniciais = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    load_mega_negocio: TCircle;
    animacoes: TTimer;
    lbldatainfo: TLabel;
    Layout2: TLayout;
    edtusuario: TEdit;
    edtconfirmsenha: TEdit;
    edtsenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btncadastrar: TRoundRect;
    Label4: TLabel;
    cadastrolay: TLayout;
    layloadcentro: TLayout;
    load_mega_negocio_centro: TCircle;
    lblstatus2: TLabel;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Image1: TImage;
    finalizacadastro_anima: TTimer;
    btnsairdaconfigura_inicial: TRoundRect;
    Label5: TLabel;
    procedure animacoesTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure edtconfirmsenhaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtsenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtusuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure finalizacadastro_animaTimer(Sender: TObject);
    procedure btnsairdaconfigura_inicialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dados: integer;
  end;

var
  frmconfiguracoesiniciais: Tfrmconfiguracoesiniciais;

implementation

{$R *.fmx}

uses Umodulo, Ulogin;


//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmconfiguracoesiniciais.animacoesTimer(Sender: TObject);
var
 porcentagem_load : integer;
begin
  if (dados = 0) then
  begin
    if (load_mega_negocio_centro.RotationAngle = 360) then
    begin
      load_mega_negocio.AnimateFloat('RotationAngle', 0, 1,
        TAnimationType.InOut, TInterpolationType.Circular);
        load_mega_negocio_centro.AnimateFloat('RotationAngle', 0, 1,
        TAnimationType.InOut, TInterpolationType.Circular);
        lbldatainfo.Text := 'Aguardando cadastro para primeiro acesso !';
        lblstatus2.Text :=  'Aguardando cadastro para primeiro acesso !';
        dados := 10;
        layloadcentro.Visible := false;
        load_mega_negocio.Visible := true;
        lbldatainfo.Visible := true;
        cadastrolay.Visible := true;
    end
    else
    begin
      load_mega_negocio.AnimateFloat('RotationAngle', 360, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
      load_mega_negocio_centro.AnimateFloat('RotationAngle', 360, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
    end;
  end;

end;

procedure Tfrmconfiguracoesiniciais.btncadastrarClick(Sender: TObject);
begin
if(edtusuario.Text.Equals('') or edtconfirmsenha.Text.Equals('') or edtsenha.Text.Equals('')) then
begin
  mostraMensagem('Campos n�o preenchidos !', 'Campos n�o preenchidos !', 'OK');
  abort;
end;
if(edtsenha.Text <> edtconfirmsenha.text) then
begin
  mostraMensagem('As senhas n�o conferem !', 'As senhas n�o conferem !', 'OK');
  abort;
end;
dm.insereempresario_primeiroacesso.Params.ParamByName('empnome').Value := edtusuario.Text;
dm.insereempresario_primeiroacesso.Params.ParamByName('empsenha').Value := edtsenha.Text;
dm.insereempresario_primeiroacesso.Params.ParamByName('empfuncionario').Value := '0';
dm.insereempresario_primeiroacesso.Prepare;
dm.insereempresario_primeiroacesso.ExecSQL;
if(dm.insereempresario_primeiroacesso.RowsAffected = 1) then
begin
  mostraMensagem('Seu primeiro usu�rio foi criado com sucesso !', 'Seu primeiro usu�rio foi criado com sucesso !', 'Prosseguir');
  edtusuario.Text := '';
  edtsenha.Text := '';
  edtconfirmsenha.Text := '';
  cadastrolay.Visible := false;
  animacoes.Enabled := false;
  finalizacadastro_anima.Enabled := true;
  layloadcentro.Visible := true;
  load_mega_negocio_centro.AnimateFloat('RotationAngle', 360, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
  load_mega_negocio.AnimateFloat('RotationAngle', 360, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
  lblstatus2.Text := 'Preparando sistema !';
  lbldatainfo.Text := 'Preparando sistema !';
  btnsairdaconfigura_inicial.Visible := true;
end;
end;

procedure Tfrmconfiguracoesiniciais.btnsairdaconfigura_inicialClick(
  Sender: TObject);
begin
frmlogin.Show;
frmconfiguracoesiniciais.Close;
end;

procedure Tfrmconfiguracoesiniciais.edtconfirmsenhaKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
keychar := UpCase(KeyChar);
end;

procedure Tfrmconfiguracoesiniciais.edtsenhaKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
keychar := UpCase(KeyChar);
end;

procedure Tfrmconfiguracoesiniciais.edtusuarioKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
keychar := UpCase(KeyChar);
end;

procedure Tfrmconfiguracoesiniciais.finalizacadastro_animaTimer(
  Sender: TObject);
var
sum_fecha_form : integer;
begin
   sum_fecha_form := sum_fecha_form + 1;
   if (load_mega_negocio_centro.RotationAngle = 360) then
    begin
    load_mega_negocio_centro.AnimateFloat('RotationAngle', 0, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
    load_mega_negocio.AnimateFloat('RotationAngle', 0, 2,
        TAnimationType.InOut, TInterpolationType.Circular);
    end;
   if(sum_fecha_form >= 2) then
   begin
     lbldatainfo.Text := 'Conclu�do !';
     lblstatus2.Text := 'Conclu�do !';
   end;
end;

procedure Tfrmconfiguracoesiniciais.FormShow(Sender: TObject);
begin
  dados := 0;
end;

end.
