unit udbKategoriBarang;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids;

type

  { TfrmKategoriBarang }

  TfrmKategoriBarang = class(TForm)
    BtnAddKategori: TButton;
    BtnCari: TButton;
    BtnDelete: TButton;
    BtnReset: TButton;
    BtnUpdate: TButton;
    DataSourceKatagori: TDataSource;
    DBGridKategori: TDBGrid;
    ECari: TEdit;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQueryKategori: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddKategoriClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure DBGridKategoriCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public
    procedure AmbilKategori;
  end;

var
  frmKategoriBarang: TfrmKategoriBarang;
  idGrid: integer;

implementation

{$R *.lfm}

{ TfrmKategoriBarang }

procedure TfrmKategoriBarang.AmbilKategori;
begin
with SQLQueryKategori do
  begin
    Close;
    SQL.Text := 'SELECT * FROM kategori';
    Open;
  end;
end;

procedure TfrmKategoriBarang.FormCreate(Sender: TObject);
begin
  AmbilKategori;
end;

procedure TfrmKategoriBarang.BtnAddKategoriClick(Sender: TObject);
begin

end;

procedure TfrmKategoriBarang.BtnDeleteClick(Sender: TObject);
var
  Response: Integer;
begin
  if idGrid <> 0 then
  begin
    Response := MessageDlg('Anda yakin ingin menghapus?', mtConfirmation, mbYesNo, 0);
    if Response = mrYes then
    begin
      try
          with SQLQueryKategori do
          begin
            Close;
            SQL.Text := 'DELETE FROM kategori WHERE id = :id ';
            Params.ParamByName('id').AsString := IntToStr(idGrid);
            ExecSQL;
            SQLTransaction1.Commit;
            AmbilKategori;
          end;
        except
           on E: Exception do
           begin
              ShowMessage('Terjadi Kesalahan : ' + E.Message);
              SQLTransaction1.Rollback;
           end;
        end;
    end;
  end
  else
    ShowMessage('Klik data yang ingin dihapus terlebih dahulu');
end;

procedure TfrmKategoriBarang.BtnResetClick(Sender: TObject);
begin
   AmbilKategori;
   ECari.Text:='';
end;

procedure TfrmKategoriBarang.BtnUpdateClick(Sender: TObject);
begin

end;


procedure TfrmKategoriBarang.BtnCariClick(Sender: TObject);
begin
  with SQLQueryKategori do
  begin
    Close;
    SQL.Text := 'SELECT * FROM kategori WHERE nama LIKE :nama ';
    Params.ParamByName('nama').AsString := '%' + ECari.Text + '%';
    Open;
  end;
end;


procedure TfrmKategoriBarang.DBGridKategoriCellClick(Column: TColumn);
begin
  idGrid := StrToInt(DBGridKategori.DataSource.DataSet.FieldByName('id').AsString);
end;

procedure TfrmKategoriBarang.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   ModalResult := mrOk;
end;

end.

