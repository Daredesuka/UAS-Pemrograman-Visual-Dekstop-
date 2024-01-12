unit udbTambahDetailTransaksi;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TfrmTambahDetailTransaksi }

  TfrmTambahDetailTransaksi = class(TForm)
    btnTambahBarang: TButton;
    dbLookupBarang: TDBLookupComboBox;
    edtJumlahBarang: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private

  public

  end;

var
  frmTambahDetailTransaksi: TfrmTambahDetailTransaksi;

implementation

{$R *.lfm}

end.

