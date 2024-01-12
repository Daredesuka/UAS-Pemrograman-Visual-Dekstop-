program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, udbMain, udbLogin, udbMasterDetailData, udbTambahData, 
udbtransaksipenjualan, udbTambahTransaksi, udbTambahDetailTransaksi, 
udbPencarianData, udbKategoriBarang, udbReport;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMasterDetailData, frmMasterDetailData);
  Application.CreateForm(TTfrmTambah, TfrmTambah);
  Application.CreateForm(TfrmTransaksi, frmTransaksi);
  Application.CreateForm(TfrmTambahTransaksi, frmTambahTransaksi);
  Application.CreateForm(TfrmTambahDetailTransaksi, frmTambahDetailTransaksi);
  Application.CreateForm(TfrmDataBarang, frmDataBarang);
  Application.CreateForm(TfrmKategoriBarang, frmKategoriBarang);
  Application.CreateForm(TTfrmReport, TfrmReport);
  Application.Run;
end.

