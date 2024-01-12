unit udbTambahTransaksi;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmTambahTransaksi }

  TfrmTambahTransaksi = class(TForm)
    btnTambahTransaksi: TButton;
    edtNamaCustomer: TEdit;
    Label1: TLabel;
    Label2: TLabel;
  private

  public

  end;

var
  frmTambahTransaksi: TfrmTambahTransaksi;

implementation

{$R *.lfm}

end.

