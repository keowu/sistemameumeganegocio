unit Uauditoriaprodutosmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  Tfrmauditoriaprodutos = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmauditoriaprodutos: Tfrmauditoriaprodutos;

implementation

{$R *.fmx}

uses Uauditoria, Udesativarprodutos, Uativarprodutos;

procedure Tfrmauditoriaprodutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmauditoria.Close;
end;

procedure Tfrmauditoriaprodutos.RoundRect1Click(Sender: TObject);
begin
frmdesativarproduto.ShowModal;
end;

procedure Tfrmauditoriaprodutos.RoundRect2Click(Sender: TObject);
begin
frmativarprodutos.ShowModal;
end;

end.
