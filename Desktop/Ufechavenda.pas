unit Ufechavenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  System.Notification, FireDAC.Stan.Param;
                       //FireDAC.Stan.Param evita warnings
type
  Tfrmfechavenda = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    lblcodigovenda: TLabel;
    lblcodigocaixa: TLabel;
    BindingsList1: TBindingsList;
    Layout3: TLayout;
    lspagamentos: TListView;
    Layout5: TLayout;
    Label3: TLabel;
    lbltotaldavenda: TLabel;
    Label5: TLabel;
    lbltotaljapagopelocliente: TLabel;
    btnfinalizavenda: TRoundRect;
    Label7: TLabel;
    Layout6: TLayout;
    Label4: TLabel;
    edtvalorpag: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    lblselecionado: TLabel;
    btnadicionarpagamento: TRoundRect;
    Label10: TLabel;
    Line1: TLine;
    Label11: TLabel;
    edtdesconto: TEdit;
    Label12: TLabel;
    btnaplicar: TRoundRect;
    Label13: TLabel;
    BindSourceDB1: TBindSourceDB;
    Label1: TLabel;
    lbldesconto: TLabel;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure btnadicionarpagamentoClick(Sender: TObject);
    procedure btnaplicarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnfinalizavendaClick(Sender: TObject);
    procedure edtvalorpagKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtdescontoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lspagamentosItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
    //s� vai ser usado no form para aplicar descontos nas vendas
    desconto: real;
  public
    { Public declarations }
    // -- essas vem do outro form de vendas
    codigovenda, codigocaixa, codigomedotopag: Integer;
    valortotaldavenda_antes_de_pagar: real;
    // essas vem de outros forms para vincular
    codigodopagementovinculado: Integer;
    totalpagodavenda: real;
  end;

var
  frmfechavenda: Tfrmfechavenda;

implementation

{$R *.fmx}

uses Umodulo, Uvenda, Uvinculametodoparafecharvenda;

//mensagem custom vers�o para tcc v1.9.2 -> 27/07/2019
//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagemFinalVenda(codigovenda, troco, total: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagemFinalVenda';
//FIM DO DLL

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmfechavenda.btnadicionarpagamentoClick(Sender: TObject);
var
  precofix: string;
begin
  // verifica se edt vazio
  if (edtvalorpag.Text.Equals('')) then
  begin
   // ShowMessage('Valor do m�todo de pagamento vazio !');
    mostraMensagem('Valor do m�todo de pagamento vazio !', 'Valor do m�todo de pagamento vazio !', 'OK');

    abort;
  end;

  // verifica se sem m�todo vinculado
  if (codigodopagementovinculado = 0) then
  begin
  //  ShowMessage('Sem m�todo de pagamento');
    mostraMensagem('Sem m�todo de pagamento', 'Sem m�todo de pagamento', 'OK');
    abort;
  end;

  // previne bugs
  precofix := StringReplace(edtvalorpag.Text, ',', '.', [rfReplaceAll]);
  // prepara para inserir
  dm.inserepagamentos.Params.ParamByName('pagcodven').Value := codigovenda;
  dm.inserepagamentos.Params.ParamByName('pagvlr').Value := precofix;
  dm.inserepagamentos.Params.ParamByName('tipopag').Value :=
    codigodopagementovinculado;
  dm.inserepagamentos.Prepare;
  dm.inserepagamentos.ExecSQL;

  dm.consultapagamentos.Close;
  dm.consultapagamentos.SQL.Text :=
    'select pagid, pagcodven, pagvlr, tiponome as ' + QuotedStr('nomepagamento')
    + ' from pagamentos inner join tiposdepagamentos on tipopag = tipoid and pagcodven = '
    + IntToStr(codigovenda);
  dm.consultapagamentos.Open;

  dm.consultapagamentos.First;
  lbltotaljapagopelocliente.Text := 'R$ 0,00';
  totalpagodavenda := 0;
  while not dm.consultapagamentos.Eof do
  begin
    totalpagodavenda := totalpagodavenda + dm.consultapagamentospagvlr.AsFloat;
    dm.consultapagamentos.Next;
  end;
  lbltotaljapagopelocliente.Text := 'R$' + FloatToStr(totalpagodavenda);
  codigodopagementovinculado := 0;
  lblselecionado.Text := 'SELECIONE UM';
end;

procedure Tfrmfechavenda.btnaplicarClick(Sender: TObject);
begin
try
  //se a edt tiver em branco
  if(edtdesconto.Text.Equals('')) then
  begin
    abort;
  end;
  // previne bugs
  desconto := StrToFloat(StringReplace(edtdesconto.Text, '.', ',', [rfReplaceAll]));
  valortotaldavenda_antes_de_pagar := valortotaldavenda_antes_de_pagar - desconto;
  lbltotaldavenda.Text := 'R$' + FloatToStr(valortotaldavenda_antes_de_pagar);
  //lbltotaljapagopelocliente.Text := 'R$ ' + FloatToStr(totalpagodavenda);
  lbldesconto.Text := 'R$ ' + FloatToStr(desconto);
except
  //pass
end;
end;

procedure Tfrmfechavenda.btnfinalizavendaClick(Sender: TObject);
var
  valor: real;
begin
  if valortotaldavenda_antes_de_pagar > totalpagodavenda then
  begin
    valor := 0;
    valor := valortotaldavenda_antes_de_pagar - totalpagodavenda;
    //ShowMessage('Ainda faltam: R$ ' + FloatToStr(valor));
    mostraMensagem('Ainda faltam: R$ ' + FloatToStr(valor), 'Ainda faltam: R$ ' + FloatToStr(valor), 'OK');
  end
  else
  begin
  //troco
    valor := valortotaldavenda_antes_de_pagar - totalpagodavenda - desconto;
    valor := valor * -1;   //remover o negativo
    //fecha a venda
    dm.alteravenda.Params.ParamByName('ventotal').Value := valortotaldavenda_antes_de_pagar;
    dm.alteravenda.Params.ParamByName('vendesconto').Value := desconto;
    dm.alteravenda.Params.ParamByName('vencod').Value := codigovenda;
    dm.alteravenda.Prepare;
    dm.alteravenda.ExecSQL;
    // limpa as paradas l� da parte de vendas
      frmvenda.lblmostracodigodavenda.Text := '';
      frmvenda.lblventotal.Text := 'R$ 0,00';
      frmvenda.edtcpfcli.Text := '';
      frmvenda.edtcodprod.Text := '';
      frmvenda.edtquant.Text := '';
      frmvenda.edtvalorunit.Text := '';
      dm.consultaitensvenda.Close;
      //mostra mensagem de venda efetuada com sucesso !
      mostraMensagemFinalVenda('C�digo da venda: ' + IntToStr(codigovenda), 'Troco: R$' + FloatToStr(valor), 'Total da venda: R$' + FloatToStr(valortotaldavenda_antes_de_pagar));
      // limpa as paras aqui do fechar venda
      frmfechavenda.edtvalorpag.Text := '';
      frmfechavenda.edtdesconto.Text := '';
      frmfechavenda.lblcodigovenda.Text := '0';
      frmfechavenda.lblcodigocaixa.Text := '0';
      frmfechavenda.lbltotaldavenda.Text := 'R$ 0,00';
      frmfechavenda.lbltotaljapagopelocliente.Text := 'R$ 0,00';
      frmfechavenda.lblselecionado.Text := 'Selecione o m�todo de pagamento';
      frmfechavenda.lbldesconto.Text := 'R$ 0,00';
      valortotaldavenda_antes_de_pagar := 0;
      frmfechavenda.codigovenda := 0;
      frmfechavenda.codigocaixa := 0;
      dm.consultapagamentos.Close;
      frmfechavenda.Close;
  end;
end;

procedure Tfrmfechavenda.edtdescontoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if (KeyChar in ['a'..'z', 'A' .. 'Z', #8, #27, #32]) then
begin
  KeyChar := #0;
 //ShowMessage('Apenas N�meros !');
 mostraMensagem('Apenas N�meros !', 'Apenas N�meros !', 'OK');
end;
end;

procedure Tfrmfechavenda.edtvalorpagKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if (KeyChar in ['a'..'z', 'A' .. 'Z', #8, #27, #32]) then
begin
  KeyChar := #0;
 //ShowMessage('Apenas N�meros !');
 mostraMensagem('Apenas N�meros !', 'Apenas N�meros !', 'OK');
end;
end;

procedure Tfrmfechavenda.FormShow(Sender: TObject);
begin
//caso a venda seja efetuada aqui quando abrir o form novamente para outra venda, a vari�vel desconto vai ser zerada !
desconto := 0;
end;

procedure Tfrmfechavenda.lspagamentosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
try
  begin
   dm.consultapagamentos.RecNo := lspagamentos.Selected.Index + 1;
   dm.excluirpagamentos.Params.ParamByName('pagid').Value := dm.consultapagamentospagid.AsString;
   dm.excluirpagamentos.Prepare;
   dm.excluirpagamentos.ExecSQL;
   mostraMensagem('M�todo de pagamento removido', 'M�todo de pagamento removido', 'OK');
   dm.consultapagamentos.Close;
   dm.consultapagamentos.Open();
  end;
except
  //pass
end;
end;

procedure Tfrmfechavenda.SpeedButton1Click(Sender: TObject);
begin
  frmvinculametodopagemtnovenda.ShowModal;
end;

end.
