unit udbLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnLogin: TButton;
    btnCancel: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private

  public

  end;

var
  frmLogin: TfrmLogin;

implementation

uses udbMain;

{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  username, password: String;
begin
  username:=edtUsername.Text;
  password:=edtPassword.Text;

  if (username = 'admin') AND (password = 'admin') then
     begin
       if MessageDlg('Account Correct', 'Status Login', mtInformation, [mbOK], 0, mbOK) = mrOK then
          begin
            frmMain := TfrmMain.Create(Application);
            frmMain.Show;
            frmLogin.Hide;
          end
       else
           begin
             MessageDlg('Failed To Login', 'Status Login', mtError, [mbOK], 0, mbOK);
           end;
     end
  else
      begin
       MessageDlg('Account Incorrect', 'Status Login', mtError, [mbOK], 0, mbOK)
      end;
    end;

end.

