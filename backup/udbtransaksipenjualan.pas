unit udbtransaksipenjualan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls, DBGrids, udbTambahTransaksi;

type

  { TfrmTransaksi }

  TfrmTransaksi = class(TForm)
    btnTambahData: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnTambahDataClick(Sender: TObject);
  private

  public

  end;

var
  frmTransaksi: TfrmTransaksi;

implementation

{$R *.lfm}

{ TfrmTransaksi }

procedure TfrmTransaksi.btnTambahDataClick(Sender: TObject);
begin
   if frmTambahTransaksi.ShowModal = mrOK then
end;

end.

