unit Ucadcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  System.Notification, FireDAC.Stan.Param;
                       //FireDAC.Stan.Param evita warnings
type
  Tfrmcadcategorias = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    edtnomecat: TEdit;
    Label1: TLabel;
    edtdesccat: TEdit;
    Label2: TLabel;
    btncadastrar: TRoundRect;
    Label3: TLabel;
    btnalterar: TRoundRect;
    Label4: TLabel;
    cadatradocategoriacentral: TNotificationCenter;
    procedure FormShow(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure edtnomecatKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtdesccatKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    //vari�vel para comaprar
    oque_e_cara : string;
    idcategoria : integer;
  end;

var
  frmcadcategorias: Tfrmcadcategorias;

implementation

{$R *.fmx}

uses Umodulo, Uconsultacategorias;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmcadcategorias.btnalterarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
if(edtnomecat.Text.Equals('') or edtdesccat.Text.Equals('')) then
begin
  // ShowMessage('Campos em branco preencha e tente novamente !');
   mostraMensagem('Campos em branco preencha e tente novamente !', 'Campos em branco preencha e tente novamente !', 'OK');
end
else
begin
  dm.alteracategoria.Params.ParamByName('catecod').Value := idcategoria;
  dm.alteracategoria.Params.ParamByName('catenome').Value := edtnomecat.Text;
  dm.alteracategoria.Params.ParamByName('catedescricao').Value := edtdesccat.Text;
  dm.alteracategoria.Prepare;
  dm.alteracategoria.ExecSQL;
  //ShowMessage('Alterado com sucesso !');
  mostraMensagem('Alterado com sucesso !', 'Alterado com sucesso !', 'OK');
  // Caso o login do usu�rio tenha dado certo
  notificacao := cadatradocategoriacentral.CreateNotification;
  try
    notificacao.Name := 'Meu mega Neg�cio';
    notificacao.Title := 'Altera��o de nova categoria';
    notificacao.AlertBody :=
            'A categoria: ' + edtnomecat.Text + ' foi alterada com sucesso !';
    cadatradocategoriacentral.ScheduleNotification(notificacao);
    cadatradocategoriacentral.PresentNotification(notificacao);
  finally
    notificacao.Free;
  end;
    edtnomecat.Text := '';
   edtdesccat.Text := '';
   frmcadcategorias.Close;
   frmconsultacategoria.Show;
end;
end;

procedure Tfrmcadcategorias.btncadastrarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
  if(edtnomecat.Text.Equals('') or edtdesccat.Text.Equals('')) then
  begin
    //ShowMessage('Os campos est�o vazios preencha e tente novamente !');
    mostraMensagem('Os campos est�o vazios preencha e tente novamente !', 'Os campos est�o vazios preencha e tente novamente !', 'OK');
  end
  else
  begin
  try
    dm.inserecategoria.Params.ParamByName('catenome').Value := edtnomecat.Text;
    dm.inserecategoria.Params.ParamByName('catedescricao').Value := edtdesccat.Text;
    dm.inserecategoria.Prepare;
    dm.inserecategoria.ExecSQL;
    if(dm.inserecategoria.RowsAffected = 1) then
    begin
      //ShowMessage('Nova categoria criada com sucesso !');
      mostraMensagem('Nova categoria criada com sucesso !', 'Nova categoria criada com sucesso !', 'OK');
              // Caso o login do usu�rio tenha dado certo
        notificacao := cadatradocategoriacentral.CreateNotification;
        try
          notificacao.Name := 'Meu mega Neg�cio';
          notificacao.Title := 'Cadastro de nova categoria';
          notificacao.AlertBody :=
            'A categoria: ' + edtnomecat.Text + ' foi criado com sucesso !';
          cadatradocategoriacentral.ScheduleNotification(notificacao);
          cadatradocategoriacentral.PresentNotification(notificacao);
        finally
          notificacao.Free;
        end;
        edtnomecat.Text := '';
        edtdesccat.Text := '';
    end
    else
    begin
     // ShowMessage('Ocorreu um erro ao criar a nova categoria tente novamente mais tarde !');
      mostraMensagem('Ocorreu um erro ao criar a nova categoria tente novamente mais tarde !', 'Ocorreu um erro ao criar a nova categoria tente novamente mais tarde !', 'OK');
    end;
  except
      //ShowMessage('Ocorreu um erro ao inserir suas informa��es no seu banco de dados !');
      mostraMensagem('Ocorreu um erro ao criar a nova categoria tente novamente mais tarde !', 'Ocorreu um erro ao criar a nova categoria tente novamente mais tarde !', 'OK');
  end;
  end;
end;

procedure Tfrmcadcategorias.edtdesccatKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmcadcategorias.edtnomecatKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmcadcategorias.FormShow(Sender: TObject);
begin
  if( oque_e_cara = 'cadastro') then
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

end.
