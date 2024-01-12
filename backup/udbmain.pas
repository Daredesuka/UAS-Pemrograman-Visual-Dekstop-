unit udbMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, udbLogin,
  udbMasterDetailData, udbtransaksipenjualan, udbPencarianData, udbLaporan;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    menuFIle: TMenuItem;
    Menudatamaster: TMenuItem;
    menuTransaksi: TMenuItem;
    menuLaporan: TMenuItem;
    menuLogin: TMenuItem;
    menuLogout: TMenuItem;
    menuExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenudatamasterClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menuDataBarangClick(Sender: TObject);
    procedure menuLoginClick(Sender: TObject);
    procedure menuLogoutClick(Sender: TObject);
    procedure menuTransaksiClick(Sender: TObject);
    procedure menuLaporanClick(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure DisableMenu(AMenu: TMenuItem);
var
  i: integer;
begin
  for i := 0 to AMenu.Count - 1 do
  begin
  AMenu [i].enabled := false;
  DisableMenu (AMenu [i]);
  end;
end;

Procedure EnableMenu(AMenu: TMenuItem);
var
  i: integer;
begin
  for i := 0 to AMenu.Count - 1 do
  begin
  AMenu [i].enabled := true;
  EnableMenu (AMenu [i]);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Nonaktifkan semua menu
  EnableMenu (MainMenu1.Items);

  // Aktifkan hanya menu login dan exit
  menuFile.Enabled:=true;
  menuLogin.Enabled:=true;
  menuExit.Enabled:=true;
end;

procedure TfrmMain.MenudatamasterClick(Sender: TObject);
begin
  if frmMasterDetailData.ShowModal = mrOK then
end;

procedure TfrmMain.menuExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.menulogoutClick(Sender: TObject);
begin
  //nonaktifkan semua menu
  DisableMenu(MainMenu1.Items);

  //aktifkan hanya menu login dan exit
  menufile.Enabled:=true;
  menulogin.Enabled:=true;
  menuexit.Enabled:=true;
  Menudatamaster.Enabled:=true;
end;

procedure TfrmMain.menuTransaksiClick(Sender: TObject);
begin
  if frmTransaksi.ShowModal = mrOK then
end;

procedure TfrmMain.menuLoginClick(Sender: TObject);
begin
if frmLogin.ShowModal = mrOK then
    begin
          ShowMessage('Login Aplikasi')
    end;
end;

procedure TfrmMain.menuDataBarangClick(Sender: TObject);
begin
  if frmDataBarang.ShowModal = mrOK then
end;

procedure TfrmMain.menuLaporanClick(Sender: TObject);
begin
  if frmLaporan.ShowModal = mrOK then
end;
end.

