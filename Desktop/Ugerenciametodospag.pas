unit Ugerenciametodospag;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.Layouts, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  System.Notification, FireDAC.Stan.Param;
                       //evita warning FireDAC.Stan.Param
type
  Tfrmmetodopag = class(TForm)
    centraldenotifialteracao: TNotificationCenter;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    lsmetodopag: TListView;
    edtnomemetodopag: TEdit;
    Label1: TLabel;
    Rectangle1: TRectangle;
    btnbuscar: TRoundRect;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    btncadastrar: TRoundRect;
    Label3: TLabel;
    btnalterar: TRoundRect;
    Label4: TLabel;
    procedure btnbuscarClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure lsmetodopagItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure edtnomemetodopagKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    codigodometododepag: Integer;
  end;

var
  frmmetodopag: Tfrmmetodopag;

implementation

{$R *.fmx}

uses Umodulo;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmmetodopag.btnbuscarClick(Sender: TObject);
begin
  dm.consultametodopag.Close;
  dm.consultametodopag.Open;
end;

procedure Tfrmmetodopag.btncadastrarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
if(edtnomemetodopag.Text = '') then
begin
  //ShowMessage('Voc� esqueceu um campo vazio !');
  mostraMensagem('Voc� esqueceu um campo vazio !', 'Voc� esqueceu um campo vazio !', 'OK');
  abort;
end;
 //busca para ver se encontra registros semelhantes !
 dm.consultametodopag.Close;
 dm.consultametodopag.SQL.Text := 'select * from tiposdepagamentos where tiponome = ' + QuotedStr(edtnomemetodopag.Text);
 dm.consultametodopag.Open;
if(dm.consultametodopag.RecordCount >= 1) then
begin
//retorna o select ao normal ap�s identificar se existe um registro igual !
  dm.consultametodopag.Close;
  dm.consultametodopag.SQL.Text := 'select * from tiposdepagamentos';
  dm.consultametodopag.Open;
 // ShowMessage('M�todo de pagamento j� cadastrado !!!');
  mostraMensagem('M�todo de pagamento j� cadastrado !!!', 'M�todo de pagamento j� cadastrado !!!', 'OK');
  abort;
end;
 dm.inseremetodopag.Params.ParamByName('tiponome').Value := edtnomemetodopag.Text;
 dm.inseremetodopag.Prepare;
 dm.inseremetodopag.ExecSQL;
 if(dm.inseremetodopag.RowsAffected = 1) then
 begin
  // ShowMessage('Novo m�todo de pagamento cadastrado com sucesso !');
   mostraMensagem('Novo m�todo de pagamento cadastrado com sucesso !', 'Novo m�todo de pagamento cadastrado com sucesso !', 'OK');
     // notifica��o do windows 10
  notificacao := centraldenotifialteracao.CreateNotification;
  try
    notificacao.Name := 'Meu mega Neg�cio';
    notificacao.Title := 'Cadastro de m�todo de pagamento !';
    notificacao.AlertBody :=
      'O M�todo de pagamento foi cadastrado com sucesso !';
    centraldenotifialteracao.ScheduleNotification(notificacao);
    centraldenotifialteracao.PresentNotification(notificacao);
  finally
    notificacao.Free;
  end;
  //retorna o select ao normal ap�s cadastrar para evitar bugs demasiados !
  dm.consultametodopag.Close;
  dm.consultametodopag.SQL.Text := 'select * from tiposdepagamentos';
  dm.consultametodopag.Open;
  edtnomemetodopag.Text := '';
 end;
end;

procedure Tfrmmetodopag.edtnomemetodopagKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if (KeyChar in ['0'..'9', #8, #27, #32]) then
begin
  KeyChar := #0;
 // ShowMessage('Apenas texto !');
  mostraMensagem('Apenas texto !', 'Apenas texto !', 'OK');
end;
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmmetodopag.btnalterarClick(Sender: TObject);
var
  notificacao: TNotification;
begin
  if(edtnomemetodopag.Text = '') then
  begin
  //  ShowMessage('Campos vazios !');
    mostraMensagem('Campos vazios !', 'Campos vazios !', 'OK');
    abort;
  end;
  dm.alterametodopag.Params.ParamByName('tiponome').Value :=
    edtnomemetodopag.Text;
  dm.alterametodopag.Params.ParamByName('tipoid').Value := codigodometododepag;
  dm.alterametodopag.Prepare;
  dm.alterametodopag.ExecSQL;
 // ShowMessage('Alterado com sucesso, consulte novamente para ver as mudan�as!');
  mostraMensagem('Alterado com sucesso, consulte novamente para ver as mudan�as!', 'Alterado com sucesso, consulte novamente para ver as mudan�as!', 'OK');
  dm.consultametodopag.Close;
  edtnomemetodopag.Text := '';
  btnalterar.Visible := false;
  btncadastrar.Visible := true;
  // notifica��o do windows 10
  notificacao := centraldenotifialteracao.CreateNotification;
  try
    notificacao.Name := 'Meu mega Neg�cio';
    notificacao.Title := 'Altera��o de m�todo de pagamento !';
    notificacao.AlertBody :=
      'O M�todo de pagamento foi alterado com sucesso !';
    centraldenotifialteracao.ScheduleNotification(notificacao);
    centraldenotifialteracao.PresentNotification(notificacao);
  finally
    notificacao.Free;
  end;
end;

procedure Tfrmmetodopag.FormShow(Sender: TObject);
begin
  btnalterar.Visible := false;
  dm.consultametodopag.Close;
  dm.consultametodopag.SQL.Text := 'select * from tiposdepagamentos';
  dm.consultametodopag.Open;
end;

procedure Tfrmmetodopag.lsmetodopagItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  dm.consultametodopag.RecNo := lsmetodopag.Selected.Index + 1;
  edtnomemetodopag.Text := dm.consultametodopagtiponome.AsString;
  codigodometododepag := dm.consultametodopagtipoid.AsInteger;
  btnalterar.Visible := true;
  btncadastrar.Visible := false;
end;

end.
