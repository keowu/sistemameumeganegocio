unit Uauditoriafuncionariosmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  Tfrmauditoriafuncionarios = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    Label1: TLabel;
    RoundRect2: TRoundRect;
    Label2: TLabel;
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmauditoriafuncionarios: Tfrmauditoriafuncionarios;

implementation

{$R *.fmx}

uses Udesativarfuncionario, Uativarfuncionario;

procedure Tfrmauditoriafuncionarios.RoundRect1Click(Sender: TObject);
begin
frmdesativarfuncionario.ShowModal;
end;

procedure Tfrmauditoriafuncionarios.RoundRect2Click(Sender: TObject);
begin
frmativarfuncionario.ShowModal;
end;

end.
