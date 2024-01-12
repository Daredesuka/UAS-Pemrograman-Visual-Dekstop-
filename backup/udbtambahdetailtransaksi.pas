unit udbTambahDetailTransaksi;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
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
  Form3: TForm3;

implementation

{$R *.lfm}

end.

