unit Uconsultacategorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.Ani, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  FMX.Layouts;

type
  Tfrmconsultacategoria = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    edtbuscar: TEdit;
    BtnBuscar: TRoundRect;
    Label1: TLabel;
    ScaleX: TFloatAnimation;
    ScaleY: TFloatAnimation;
    lsconsultacategoria: TListView;
    Layout3: TLayout;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure BtnBuscarClick(Sender: TObject);
    procedure lsconsultacategoriaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure edtbuscarKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    cadatrodesubcategoria_para_pegar_id: string;
  end;

var
  frmconsultacategoria: Tfrmconsultacategoria;

implementation

{$R *.fmx}

uses Umodulo, Ucadsubcategoria, Ucadcategoria;

procedure Tfrmconsultacategoria.BtnBuscarClick(Sender: TObject);
begin
  dm.consultacategoria.Active := false;
  dm.consultacategoria.SQL.Text :=
    'select * from categorias where cateativo = 1 and catenome like ' + QuotedStr(edtbuscar.Text + '%');
  dm.consultacategoria.Active := true;
end;

procedure Tfrmconsultacategoria.edtbuscarKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmconsultacategoria.FormShow(Sender: TObject);
begin
dm.consultacategoria.Active := false;
end;

procedure Tfrmconsultacategoria.lsconsultacategoriaItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
if(cadatrodesubcategoria_para_pegar_id = 'sim') then //para pegar id e mandar para o cadastro
begin
dm.consultacategoria.RecNo := lsconsultacategoria.Selected.Index + 1;
frmcadsubcategoria.iddacategoria := dm.consultacategoriacatecod.AsInteger;
frmcadsubcategoria.edtcatid.Text := dm.consultacategoriacatenome.AsString;
frmcadsubcategoria.Show;
frmconsultacategoria.close;
end
else
begin
dm.consultacategoria.RecNo := lsconsultacategoria.Selected.Index + 1;
frmcadcategorias.edtnomecat.Text := dm.consultacategoriacatenome.AsString;
frmcadcategorias.edtdesccat.Text := dm.consultacategoriacatedescricao.Text;
frmcadcategorias.idcategoria := dm.consultacategoriacatecod.AsInteger;
frmcadcategorias.oque_e_cara := 'Alterar';
frmcadcategorias.Show;
frmconsultacategoria.close;
end;
end;

end.
