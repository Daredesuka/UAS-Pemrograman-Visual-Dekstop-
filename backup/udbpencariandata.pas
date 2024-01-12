unit udbPencarianData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids;

type

  { TfrmDataBarang }

  TfrmDataBarang = class(TForm)
    BHapusData: TButton;
    BTambahBarang: TButton;
    btnCari: TButton;
    btnReset: TButton;
    BUpdateBarang: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtKeyword: TEdit;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure tampilkanDataBarang;
  private

  public

  end;

var
  frmDataBarang: TfrmDataBarang;

implementation

{$R *.lfm}

{ TfrmDataBarang }

procedure TfrmDataBarang.tampilkanDataBarang;
begin
  with SQLQuery1 do
  begin
    Close;
    SQL.Text:='SELECT * FROM data_barang';
    Open;
  end;
end;

end.

