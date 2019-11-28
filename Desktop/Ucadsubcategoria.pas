unit Ucadsubcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  System.Notification, FireDAC.Stan.Param;
                        //FireDAC.Stan.Param evita warnings
type
  Tfrmcadsubcategoria = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    edtnomesubcat: TEdit;
    Label1: TLabel;
    edtsubcatdesc: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    edtcatid: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    btncadastrar: TRoundRect;
    Label4: TLabel;
    btnalterar: TRoundRect;
    Label5: TLabel;
    subcategorianotificacaonovo: TNotificationCenter;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure edtnomesubcatKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtsubcatdescKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    //vari�veis publicas para verificar
    iddacategoria : integer;
    subcatcod: integer; //para usar nos updates
    gamba_do_zanata : string;
  end;

var
  frmcadsubcategoria: Tfrmcadsubcategoria;

implementation

{$R *.fmx}

uses Uconsultacategorias, Umodulo, Uconsultasubcategorias;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmcadsubcategoria.btnalterarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
if(edtnomesubcat.Text.Equals('') or edtsubcatdesc.Text.Equals('') or edtcatid.Text.Equals('')) then
begin
  //ShowMessage('Campos vazios preencha e tente novamente !');
  mostraMensagem('Campos vazios preencha e tente novamente !', 'Campos vazios preencha e tente novamente !', 'OK');
end
else
begin
    dm.alterasubcategoria.Params.ParamByName('subcatnome').Value := edtnomesubcat.Text;
    dm.alterasubcategoria.Params.ParamByName('subcatdescricao').Value := edtsubcatdesc.Text;
    dm.alterasubcategoria.Params.ParamByName('catid').Value := iddacategoria.ToString;
    dm.alterasubcategoria.Params.ParamByName('subcatcod').Value := subcatcod.ToString;
    dm.alterasubcategoria.Prepare;
    dm.alterasubcategoria.ExecSQL;
   // ShowMessage('Subcategoria alterada com sucesso !');
    mostraMensagem('Subcategoria alterada com sucesso !', 'Subcategoria alterada com sucesso !', 'OK');
            // Caso o cadastro do cliente tenha dado certo
    notificacao := subcategorianotificacaonovo.CreateNotification;
    try
       notificacao.Name := 'Meu mega Neg�cio';
       notificacao.Title := 'Altera��o de uma subcategoria';
       notificacao.AlertBody :=
            'A Sua subcategoria de ' + edtcatid.Text + ' foi alterada com sucesso com o nome de ' + edtnomesubcat.Text;
       subcategorianotificacaonovo.ScheduleNotification(notificacao);
       subcategorianotificacaonovo.PresentNotification(notificacao);
    finally
       notificacao.Free;
    end;
    edtnomesubcat.Text := '';
    edtsubcatdesc.Text := '';
    edtcatid.Text := '';
    frmcadsubcategoria.Close;
    frmconsultasubcategoria.Show;
end;
end;

procedure Tfrmcadsubcategoria.btncadastrarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
if(edtnomesubcat.Text.Equals('') or edtsubcatdesc.Text.Equals('') or edtcatid.Text.Equals('')) then
begin
 // ShowMessage('Campos vazios preencha e tente novamente !');
  mostraMensagem('Campos vazios preencha e tente novamente !', 'Campos vazios preencha e tente novamente !', 'OK');
end
else
begin
  try
    dm.inseresubcategoria.Params.ParamByName('subcatnome').Value := edtnomesubcat.Text;
    dm.inseresubcategoria.Params.ParamByName('subcatdescricao').Value := edtsubcatdesc.Text;
    dm.inseresubcategoria.Params.ParamByName('catid').Value := iddacategoria;
    dm.inseresubcategoria.Prepare;
    dm.inseresubcategoria.ExecSQL;
    if(dm.inseresubcategoria.RowsAffected = 1) then
    begin
      edtnomesubcat.Text := '';
      edtsubcatdesc.Text := '';
      edtcatid.Text := '';
      //ShowMessage('Categoria cadastrada com sucesso !');
      mostraMensagem('Categoria cadastrada com sucesso !', 'Categoria cadastrada com sucesso !', 'OK');
        // Caso o cadastro do cliente tenha dado certo
        notificacao := subcategorianotificacaonovo.CreateNotification;
        try
          notificacao.Name := 'Meu mega Neg�cio';
          notificacao.Title := 'Cadastro de uma subcategoria';
          notificacao.AlertBody :=
            'A Sua subcategoria de ' + edtcatid.Text + ' foi criado com sucesso com o nome de ' + edtnomesubcat.Text;
          subcategorianotificacaonovo.ScheduleNotification(notificacao);
          subcategorianotificacaonovo.PresentNotification(notificacao);
        finally
          notificacao.Free;
        end;
    end
    else
    begin
     // ShowMessage('N�o foi possivel cadastrar sua subcatgeoria !');
      mostraMensagem('N�o foi possivel cadastrar sua subcatgeoria !', 'N�o foi possivel cadastrar sua subcatgeoria !', 'OK');
    end;
  except
     //ShowMessage('Ocorreu um erro ao tentar conectar ao seu banco de dados !');
     mostraMensagem('Ocorreu um erro ao tentar conectar ao seu banco de dados !', 'Ocorreu um erro ao tentar conectar ao seu banco de dados !', 'OK');
  end;
end;
end;

procedure Tfrmcadsubcategoria.edtnomesubcatKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmcadsubcategoria.edtsubcatdescKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmcadsubcategoria.FormShow(Sender: TObject);
begin
if (gamba_do_zanata = 'cadastro') then
begin
  btncadastrar.Visible := true;
  btnalterar.Visible := false;
end
else
begin
  btncadastrar.Visible := false;
  btnalterar.Visible := true;
end;
end;

procedure Tfrmcadsubcategoria.SpeedButton1Click(Sender: TObject);
begin
frmconsultacategoria.cadatrodesubcategoria_para_pegar_id := 'sim';
frmconsultacategoria.ShowModal;
end;

end.
