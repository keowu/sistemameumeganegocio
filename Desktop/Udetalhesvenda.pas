unit Udetalhesvenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Winapi.Windows, Winapi.ShellAPI, Vcl.Graphics, Vcl.Imaging.jpeg, FireDAC.Stan.Param;
                                                                                       //FireDAC.Stan.Param evita warnings
type
  Tfrmdetalhesdavenda = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    lbldatavenda: TLabel;
    lbltotalvenda: TLabel;
    lbldesconto: TLabel;
    lblcliente: TLabel;
    lblvendedor: TLabel;
    lblcodigocaixa: TLabel;
    lblmetodopag: TLabel;
    btnconferido: TRoundRect;
    Label1: TLabel;
    lsmetodopagamentos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    Image1: TImage;
    lblcodigodavenda: TLabel;
    procedure btnconferidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigodavendaparafazeroselect :string;
  end;

var
  frmdetalhesdavenda: Tfrmdetalhesdavenda;

implementation

{$R *.fmx}

uses Uconsultavendas, Umodulo, SynPdf, Ucarregapdf;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmdetalhesdavenda.btnconferidoClick(Sender: TObject);
begin
  frmdetalhesdavenda.Close;
  frmconsultarvendas.Show;
end;

procedure Tfrmdetalhesdavenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.consultapagamentos.SQL.Text := 'select pagid, pagcodven, pagvlr, tiponome as ' + QuotedStr('nomepagamento') +' from pagamentos inner join tiposdepagamentos on tipopag = tipoid'; // retorna a query devolta ao que era antes da consulta para a venda !
dm.consultapagamentos.close; //fecha a consulta de m�todos de pagamento
frmconsultarvendas.Show;
end;

procedure Tfrmdetalhesdavenda.FormShow(Sender: TObject);
begin
dm.consultapagamentos.Close;
dm.consultapagamentos.SQL.Text := 'select pagid, pagcodven, pagvlr, tiponome as ' + QuotedStr('nomepagamento') +' from pagamentos inner join tiposdepagamentos on tipopag = tipoid and pagcodven = ' + QuotedStr(codigodavendaparafazeroselect);
dm.consultapagamentos.Open;
end;

procedure Tfrmdetalhesdavenda.Image1Click(Sender: TObject);
var
PDF : TPdfDocumentGDI;
Page : TPdfPage;
i : integer;
nomerelatorio : integer;
cor : TColor;
pdf_abrir : string;
Bmp : TBitmap;
begin
   //synpdf tutorial
   //https://www.youtube.com/watch?v=hD6e6iGvBYE   <- muito bom
   //https://www.youtube.com/watch?v=IJSVD-x9mpM   <- muito bom
   PDF := TPdfDocumentGDI.Create();
   Bmp := TBitmap.Create;
   Try
     PDF.Info.Author := 'Meu mega neg�cio';
     PDF.Info.CreationDate := Now;
     PDF.info.Creator := 'Meu mega Neg�cio';
     PDF.Info.Title := 'Cupom Fiscal';
     //----------------------



     Page := PDF.AddPage;
     Page.PageLandscape := false;
     pdf.DefaultPaperSize := psA4;

     //tenta inserir um logo caso n�o de ele simplesmente cria o pdf sem o logo
     try
     Bmp.LoadFromFile('./cupons/logotipos/logotipocupons.bmp');
     PDF.VCLCanvas.Draw(100,800, Bmp);
     except

     end;

     pdf.VCLCanvas.Font.Size := 12;
     pdf.VCLCanvas.Font.Name := 'Arial';
     cor := $0000FF; //vermelho
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 16;
     PDF.VCLCanvas.TextOut(100, 80, '__________________________________________________________________');
     PDF.VCLCanvas.TextOut(100, 110, '                        Informa��es sobre a venda:                   ');
     PDF.VCLCanvas.TextOut(100, 140, '__________________________________________________________________');
     cor := $000000; //preto
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 12;
     pdf.VCLCanvas.TextOut(100, 170,lblcodigodavenda.Text);
     pdf.VCLCanvas.TextOut(100, 200,lbldatavenda.Text);
     pdf.VCLCanvas.TextOut(100, 230,lbltotalvenda.Text);
     pdf.VCLCanvas.TextOut(100, 260,lbldesconto.Text);
     pdf.VCLCanvas.TextOut(100, 290,lblcliente.Text);
     pdf.VCLCanvas.TextOut(100, 320,lblvendedor.Text);
     pdf.VCLCanvas.TextOut(100, 350,lblcodigocaixa.Text);
     cor := $0000FF; //vermelho
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 16;
     PDF.VCLCanvas.TextOut(100, 380, '__________________________________________________________________');
     PDF.VCLCanvas.TextOut(100, 410, '                       M�todos de pagamento utilizados:             ');
     PDF.VCLCanvas.TextOut(100, 440, '__________________________________________________________________');
     cor := $000000; //preto
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 11;
     dm.consultapagamentos.Open;
     dm.consultapagamentos.First;
     i := 440;
     while not dm.consultapagamentos.Eof do
     begin
      i := i + 30;
      PDF.VCLCanvas.TextOut(100, i, dm.consultapagamentosnomepagamento.AsString);
      PDF.VCLCanvas.TextOut(600, i, 'R$ ' + dm.consultapagamentospagvlr.AsString);
      dm.consultapagamentos.Next;
     end;
     dm.consultapagamentos.Close;

     //retorna para as posi��es originais
     dm.consultapagamentos.SQL.Text := 'select pagid, pagcodven, pagvlr, tiponome as ' + QuotedStr('nomepagamento') +' from pagamentos inner join tiposdepagamentos on tipopag = tipoid and pagcodven = ' + QuotedStr(codigodavendaparafazeroselect);
     dm.consultapagamentos.Open;

     //salva o diretorio do relat�rio
     nomerelatorio  := 1 + Random(10000);
     pdf_abrir := './cupons/cumpom' + IntToStr(nomerelatorio) + '.pdf';

     //salva no banco local
     dm.insererelatorio.Params.ParamByName('relatorionome').Value := nomerelatorio;
     dm.insererelatorio.Params.ParamByName('relatoriodir').Value := pdf_abrir;
     dm.insererelatorio.Params.ParamByName('relatoriotipo') .Value := 'Detalhes de vendas';
     dm.insererelatorio.Prepare;
     dm.insererelatorio.ExecSQL;

     //abre
     pdf_abrir := './cupons/cumpom' + IntToStr(nomerelatorio) + '.pdf';
     pdf.SaveToFile(pdf_abrir);
     frmcarregapdf.carrega.URL := 'file://' + GetCurrentDir + pdf_abrir;
     frmcarregapdf.carrega.Navigate;
     frmcarregapdf.ShowModal;
   Finally
   bmp.free;
   PDF.Free;
   //ShowMessage('Cupom gerado com sucesso, escolha um programa para abri-lo');
   end;
end;

end.
