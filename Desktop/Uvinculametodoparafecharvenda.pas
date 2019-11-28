unit Uvinculametodoparafecharvenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmvinculametodopagemtnovenda = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Label1: TLabel;
    lsmetodospag: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormShow(Sender: TObject);
    procedure lsmetodospagItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvinculametodopagemtnovenda: Tfrmvinculametodopagemtnovenda;

implementation

{$R *.fmx}

uses Umodulo, Ufechavenda;

procedure Tfrmvinculametodopagemtnovenda.FormShow(Sender: TObject);
begin
dm.consultametodopag.Close;
dm.consultametodopag.Open;
end;

procedure Tfrmvinculametodopagemtnovenda.lsmetodospagItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  dm.consultametodopag.RecNo := lsmetodospag.Selected.Index + 1;
  frmfechavenda.codigodopagementovinculado := dm.consultametodopagtipoid.AsInteger;
  frmfechavenda.lblselecionado.Text := dm.consultametodopagtiponome.AsString;
  frmfechavenda.Show;
  frmvinculametodopagemtnovenda.Close;
end;

end.
