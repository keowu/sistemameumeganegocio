unit Uconsultaprodutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.Ani, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  FMX.Layouts;

type
  Tfrmconsultaproduto = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    edtbuscar: TEdit;
    BtnBuscar: TRoundRect;
    Label1: TLabel;
    ScaleX: TFloatAnimation;
    ScaleY: TFloatAnimation;
    lsconsultaprodutos: TListView;
    Layout3: TLayout;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure BtnBuscarClick(Sender: TObject);
    procedure lsconsultaprodutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure edtbuscarKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    e_para_vincular_em_uma_venda_: string;
  end;

var
  frmconsultaproduto: Tfrmconsultaproduto;

implementation

{$R *.fmx}

uses Umodulo, Uvenda, Ucadprodutos;

procedure Tfrmconsultaproduto.BtnBuscarClick(Sender: TObject);
begin
dm.consultaproduto.Active := false;
dm.consultaproduto.SQL.Text := 'select * from produtos where prodativo = 1 and prodquantidade > 0 and prodnome like ' + QuotedStr(edtbuscar.Text + '%');
dm.consultaproduto.Active := true;
end;

procedure Tfrmconsultaproduto.edtbuscarKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmconsultaproduto.FormShow(Sender: TObject);
begin
dm.consultaproduto.Close;
end;

procedure Tfrmconsultaproduto.lsconsultaprodutosItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
if(e_para_vincular_em_uma_venda_ = 'sim') then
begin
dm.consultaproduto.RecNo := lsconsultaprodutos.Selected.Index + 1;
frmvenda.edtcodprod.Text := dm.consultaprodutoprodcod.AsString;
frmvenda.edtvalorunit.Text := dm.consultaprodutoprodvalor.AsString;
frmvenda.edtquant.Text := '1';
frmvenda.Show;
frmconsultaproduto.Close;
end
else //l�gica para altera��o
begin
  dm.consultaproduto.RecNo := lsconsultaprodutos.Selected.Index + 1;
  frmcadprodutos.edtnomeprod.Text := dm.consultaprodutoprodnome.AsString;
  frmcadprodutos.oque_manu := 'Alterar';
  //Consulta o nome da subcategoria para enviar para a altera��o
  dm.consultasubcategoria.Close;
  dm.consultasubcategoria.SQL.Text := 'select * from subcategoria where subcatcod = ' + QuotedStr(dm.consultaprodutoprodsubcategoria.AsString);
  dm.consultasubcategoria.Open;
  frmcadprodutos.edtsubcategoria.Text := dm.consultasubcategoriasubcatnome.AsString;
  frmcadprodutos.edtprecoprod.Text := dm.consultaprodutoprodvalor.AsString;
  frmcadprodutos.edtquantprod.Text := dm.consultaprodutoprodquantidade.AsString;
  frmcadprodutos.edtlucroprod.Text := dm.consultaprodutoprodlucro.AsString;
  frmcadprodutos.iddoproduto_para_alterar := dm.consultaprodutoprodcod.AsInteger;
  frmcadprodutos.iddasubcate := dm.consultaprodutoprodsubcategoria.AsInteger;
  //para n�o bugar markup n�o ficar sem valor
  frmcadprodutos.edtimposto.Text := '0';
  frmcadprodutos.edtcomissoes.Text := '0';
  frmcadprodutos.edtdespesasadminis.Text := '0';
  frmcadprodutos.edtlucrodesajado.Text := '0';
  frmcadprodutos.edtprecodevenda.Text := '0';
  //------
  frmcadprodutos.Show;
  dm.consultasubcategoria.Close;
  dm.consultasubcategoria.SQL.Text := 'select * from subcategoria';
  dm.consultasubcategoria.Open;
  frmconsultaproduto.Close;
end;
end;

end.
