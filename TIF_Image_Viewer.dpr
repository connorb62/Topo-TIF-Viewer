program TIF_Image_Viewer;

uses
  Forms,
  MAIN in 'MAIN.pas' {frmMain};

{$E .tif}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TtifV v1.0.0.1';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
