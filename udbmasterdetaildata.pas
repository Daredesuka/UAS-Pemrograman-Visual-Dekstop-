unit udbMasterDetailData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls, udbTambahData;

type

  { TfrmMasterDetailData }

  TfrmMasterDetailData = class(TForm)
    btnCari: TButton;
    btnReset: TButton;
    btnTambah: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    edtKeyword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnCariClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure tampilkanDataBarang;
  private

  public

  end;

var
  frmMasterDetailData: TfrmMasterDetailData;

implementation

{$R *.lfm}

{ TfrmMasterDetailData }

procedure TfrmMasterDetailData.btnCariClick(Sender: TObject);
begin
  with SQLQuery2 do
  begin
    Close;
    SQL.Text:='SELECT * FROM data_barang WHERE nama LIKE :nama';
    Params.ParamByName('nama').AsString:= '%' + edtKeyword.Text + '%';
    Open;
  end;
end;

procedure TfrmMasterDetailData.btnResetClick(Sender: TObject);
begin
  edtKeyword.Text:='';
  tampilkanDataBarang;
end;

procedure TfrmMasterDetailData.btnTambahClick(Sender: TObject);
begin
 if TfrmTambah.ShowModal = mrOK then
end;

procedure TfrmMasterDetailData.tampilkanDataBarang;
begin
  with SQLQuery2 do
  begin
    Close;
    SQL.Text:='SELECT * FROM data_barang';
    Open;
  end;
end;


end.

