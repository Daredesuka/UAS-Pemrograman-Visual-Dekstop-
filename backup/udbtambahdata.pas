unit udbTambahData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls;

type

  { TTfrmTambah }

  TTfrmTambah = class(TForm)
    btnSimpan: TButton;
    DataSource1: TDataSource;
    dbLookupKategori: TDBLookupComboBox;
    edtNama: TEdit;
    edtHargaBeli: TEdit;
    edtHargaJual: TEdit;
    edtJumlahStok: TEdit;
    edtFileGambar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
    add: boolean
  end;

var
  TfrmTambah: TTfrmTambah;

implementation

{$R *.lfm}

{ TTfrmTambah }

procedure TTfrmTambah.btnSimpanClick(Sender: TObject);
begin
  try
    with SQLQuery1 do
    begin
      SQL.Add('INSERT INTO data_barang (nama, kategori_id, harga_beli, harga_jual, stok)');
      SQL.Add('VALUES (:nama, :kategori_id, :harga_beli, :harga_jual, :stok)');
      Params.ParamByName('nama').AsString:=edtNama.Text;
      Params.ParamByName('kategori_id').AsInteger:=dbLookupKategori.KeyValue;
      Params.ParamByName('harga_beli').AsInteger:=StrToInt(edtHargaBeli.Text);
      Params.ParamByName('harga_jual').AsInteger:=StrToInt(edtHargaJual.Text);
      Params.ParamByName('stok').AsInteger:=StrToInt(edtJumlahStok.Text);
      SQLTransaction1.Commit;

      ShowMessage('Data Telah Ditambahkan');
      edtNama.Text:='';
      edtHargaJual.Text:='';
      edtHargaBeli.Text:='';
      edtJumlahStok.Text:='';
    end;
  except
    on E: Exception do
       ShowMessage('Terjadi Kesalahan: '+E.Message);
  end;
end;

procedure TTfrmTambah.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if add = True then
  begin
      add := False;
      ModalResult:= mrOk;
  end
  else
      ModalResult:= mrCancel;
end;

procedure TTfrmTambah.FormCreate(Sender: TObject);
begin
  SQLQuery1.Open;
end;
end.

