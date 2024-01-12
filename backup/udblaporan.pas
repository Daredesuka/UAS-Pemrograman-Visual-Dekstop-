unit udbLaporan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, DBCtrls, LR_Class, LR_DBSet;

type

  { TfrmLaporan }

  TfrmLaporan = class(TForm)
    btnCetak: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnCetakClick(Sender: TObject);
  private
    id: integer;
  public

  end;

var
  frmLaporan: TfrmLaporan;

implementation

{$R *.lfm}

{ TfrmLaporan }

procedure TfrmLaporan.btnCetakClick(Sender: TObject);
var
  s: string;
begin
  try
   begin
     s := extractfilepath(application.ExeName) + 'report_all.lrf';
   end;

   frDBDataSet1.DataSet := SQLQuery1;
   frReport1.DataSet := frDBDataSet1;
   frReport1.LoadFromFile(s);
   frReport1.ShowReport;
  finally
   frReport1.Clear;
  end;
end;

end.

