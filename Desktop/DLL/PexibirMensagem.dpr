library PexibirMensagem;

uses
  System.SysUtils,
  System.Classes,
  FMX.forms,
  Umensagem in 'Umensagem.pas' {frmmensagem},
  Ufinalizandovenda in 'Ufinalizandovenda.pas' {frmfinalizandovenda},
  SynPdf in 'SynPdf.pas',
  Ufechacaixa in 'Ufechacaixa.pas' {frmfecharcaixa};

{$R *.res}

function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
begin
  frmmensagem := Tfrmmensagem.Create(Application);
  frmmensagem.lbltextomensagem.Text := Msg1;
  frmmensagem.mensagemacao.Text := Msg2;
  frmmensagem.lbltextomensagembotao.Text := btn1;
  frmmensagem.Transparency := true;
  frmmensagem.ShowModal;


  result := frmmensagem.Click;
  frmmensagem.Free;
end;


function mostraMensagemFinalVenda(codigovenda, troco, total: string): integer; stdcall;
begin
  frmfinalizandovenda := Tfrmfinalizandovenda.Create(Application);
  frmfinalizandovenda.lblcodigodavenda.Text := codigovenda;
  frmfinalizandovenda.lbltroco.Text := troco;
  frmfinalizandovenda.lbltotalvenda.Text := total;
  frmfinalizandovenda.Transparency := true;
  frmfinalizandovenda.ShowModal;


  result := frmfinalizandovenda.Click;
  frmfinalizandovenda.Free;
end;


function mostraMensagemFecharCaixa(valorabertura, valorfechamento, codigodocaixa, vendedor: string): integer; stdcall;
begin
  frmfecharcaixa := Tfrmfecharcaixa.Create(Application);
  frmfecharcaixa.lblvalorinicial.Text := 'Valor de abertura: R$'+ valorabertura;
  frmfecharcaixa.lblvalorfechamento.Text := 'Valor de fechamento: R$' + valorfechamento;
  frmfecharcaixa.lblcodigodocaixa.Text := 'C�digo do caixa: ' + codigodocaixa;
  frmfecharcaixa.lblvendedor.Text := 'Vendedor: ' + vendedor;
  frmfecharcaixa.Series1.AddXY(0, 0);
  frmfecharcaixa.Series1.AddXY(StrToInt(valorabertura), StrToInt(valorfechamento));
  frmfecharcaixa.Transparency := true;
  frmfecharcaixa.ShowModal;

  result := frmfecharcaixa.Click;
  frmfecharcaixa.Free;
end;


exports
  mostraMensagem, mostraMensagemFinalVenda, mostraMensagemFecharCaixa;

begin

end.
