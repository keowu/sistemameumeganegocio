unit Urelatoriossalvos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView, FMX.Objects,
  FMX.Layouts, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  Tfrmrelatoriossalvos = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    lsrelatoriossalvos: TListView;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormShow(Sender: TObject);
    procedure lsrelatoriossalvosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelatoriossalvos: Tfrmrelatoriossalvos;

implementation

{$R *.fmx}

uses Umodulo, Uacoesrelatorio;

procedure Tfrmrelatoriossalvos.FormShow(Sender: TObject);
begin
      dm.consultarelatorio.Close;
      dm.consultarelatorio.Open;
end;

procedure Tfrmrelatoriossalvos.lsrelatoriossalvosItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
dm.consultarelatorio.RecNo := lsrelatoriossalvos.Selected.Index + 1;
frmacoesrelatorio.relatorioid := dm.consultarelatoriorelatorioid.AsInteger;
frmacoesrelatorio.relatorionome := dm.consultarelatoriorelatorionome.AsString;
frmacoesrelatorio.relatoriodir := dm.consultarelatoriorelatoriodir.AsString;
frmacoesrelatorio.ShowModal;
end;

end.
