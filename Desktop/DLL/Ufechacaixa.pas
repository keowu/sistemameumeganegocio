unit Ufechacaixa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Layouts,
  System.Rtti, FMX.Platform, FMX.Surfaces,
  FMX.Edit, Vcl.Graphics, Vcl.Imaging.jpeg;

type
  Tfrmfecharcaixa = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Rectangle3: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    lblvalorinicial: TLabel;
    lblvalorfechamento: TLabel;
    lblcodigodocaixa: TLabel;
    lblvendedor: TLabel;
    Image4: TImage;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    procedure RoundRect1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Click : integer;
  end;

var
  frmfecharcaixa: Tfrmfecharcaixa;

implementation

{$R *.fmx}

uses SynPdf;


procedure Tfrmfecharcaixa.FormShow(Sender: TObject);
begin
  Click := 0;
  self.WindowState := TWindowState.wsMaximized;
end;


procedure Tfrmfecharcaixa.Image3Click(Sender: TObject);
var
PDF : TPdfDocumentGDI;
Page : TPdfPage;
cor : TColor;
Bmp : TBitmap;
pdf_abrir : string;
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
     PDF.Info.Title := 'Relat�rio fechamento de caixa';
     //----------------------



     Page := PDF.AddPage;
     Page.PageLandscape := false;
     pdf.DefaultPaperSize := psA4;

     pdf.VCLCanvas.Font.Size := 12;
     pdf.VCLCanvas.Font.Name := 'Arial';
     cor := $FFFFFF; //branco
     pdf.VCLCanvas.Brush.Color :=cor; //cor que passa por cima de todas as letras
     cor := $0000FF; //vermelho
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 16;
     PDF.VCLCanvas.TextOut(100, 10, '__________________________________________________________________');
     PDF.VCLCanvas.TextOut(100, 40, '                        Informa��es sobre o caixa:                ');
     PDF.VCLCanvas.TextOut(100, 70, '__________________________________________________________________');
     cor := $000000; //preto
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 12;
     PDF.VCLCanvas.TextOut(100, 100, lblvalorinicial.Text);
     PDF.VCLCanvas.TextOut(100, 130, lblvalorfechamento.Text);
     PDF.VCLCanvas.TextOut(100, 160, lblcodigodocaixa.Text);
     PDF.VCLCanvas.TextOut(100, 190, lblvendedor.Text);
     cor := $0000FF; //vermelho
     PDF.VCLCanvas.Font.Color := cor;
     pdf.VCLCanvas.Font.Size := 16;
     PDF.VCLCanvas.TextOut(100, 220, '__________________________________________________________________');
     PDF.VCLCanvas.TextOut(100, 250, '                        Gerado em: ' + DateToStr(Now));
     PDF.VCLCanvas.TextOut(100, 280, '__________________________________________________________________');


    // PDF.Canvas.Rectangle(10,10,30,30);
    //tenta inserir um logo caso n�o de ele simplesmente cria o pdf sem o logo
     try
     Bmp.LoadFromFile('./relatorios/logos/logotiporelatorios.bmp');
     PDF.VCLCanvas.Draw(150,390, Bmp);
     except

     end;


     pdf_abrir := './relatorios/fechamentodecaixa/relatorio' + IntToStr(1 + Random(10000)) + '.pdf';
     pdf.SaveToFile(pdf_abrir);
     pdf_abrir := './cupons/cumpom' + IntToStr(1 + Random(10000)) + '.pdf';
     pdf.SaveToFile(pdf_abrir);

   Finally
   Bmp.Free;
   PDF.Free;
   ShowMessage('Relat�rio gerado com sucesso !');
   end;
end;

procedure Tfrmfecharcaixa.RoundRect1Click(Sender: TObject);
begin
  Click := (Sender as TRoundRect).Tag;
  Self.Close;
end;

end.
