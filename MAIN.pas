{ © 2022 Connor Bell
 Topographical or Orthophoto Map viewer
 Codename: TOPO20
 Name: TtifV
}
unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, ToolWin, ImgList, jpeg, FileCtrl;

type
  TfrmMain = class(TForm)
    tlbMain: TToolBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    tlbLoadImage: TToolButton;
    ilMain: TImageList;
    grpImageProp: TGroupBox;
    chkProp: TCheckBox;
    chkStretch: TCheckBox;
    chkCentre: TCheckBox;
    fllstMain: TFileListBox;
    dirlstMain: TDirectoryListBox;
    btnClear: TToolButton;
    dlgOpen1: TOpenDialog;
    btnSep1: TToolButton;
    grpProperties: TGroupBox;
    grpZoom: TGroupBox;
    trckbrMain: TTrackBar;
    scrlbxMain: TScrollBox;
    imgMain: TImage;
    Image1: TMenuItem;
    Proportional1: TMenuItem;
    Stretch1: TMenuItem;
    Centre1: TMenuItem;
    OpenImage1: TMenuItem;
    CloseImage1: TMenuItem;
    procedure chkPropClick(Sender: TObject);
    procedure chkStretchClick(Sender: TObject);
    procedure chkCentreClick(Sender: TObject);
    procedure fllstMainClick(Sender: TObject);
    procedure tlbLoadImageClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Proportional1Click(Sender: TObject);
    procedure Stretch1Click(Sender: TObject);
    procedure Centre1Click(Sender: TObject);
    procedure OpenImage1Click(Sender: TObject);
    procedure CloseImage1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  sFile_Name : string;

implementation

uses
  TOPOKEY;

{$R *.dfm}

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  // Close Image
  imgMain.Picture := nil;
  with StatusBar1 do
    begin
      Panels[0].Text := '';
      Panels[1].Text := '';
      Panels[2].Text := '';
      Panels[3].Text := '';
    end;
    chkProp.Checked := False;
    chkCentre.Checked := False;
    chkStretch.Checked := False;
end;

procedure TfrmMain.Centre1Click(Sender: TObject);
begin
// Centre Image
  if chkCentre.Checked = True then
    begin
      imgMain.Center := True;
      StatusBar1.Panels[1].Text := 'Centre';
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
    end
  else
  if chkCentre.Checked = False then
    begin
      imgMain.Center := False;
      StatusBar1.Panels[1].Text := '';
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
    end;
end;

procedure TfrmMain.chkCentreClick(Sender: TObject);
begin
  // Centre Image
  if chkCentre.Checked = True then
    begin
      imgMain.Center := True;
      StatusBar1.Panels[1].Text := 'Centre';
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
    end
  else
  if chkCentre.Checked = False then
    begin
      imgMain.Center := False;
      StatusBar1.Panels[1].Text := '';
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
    end;
end;

procedure TfrmMain.chkPropClick(Sender: TObject);
begin
  // Set Proportional
  if chkProp.Checked = True then
    begin
      imgMain.Proportional := True;
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
      StatusBar1.Panels[2].Text := 'Proportional';
    end
  else
  if chkProp.Checked = False then
    begin
      imgMain.Proportional := False;
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
      StatusBar1.Panels[2].Text := '';
    end;
end;

procedure TfrmMain.chkStretchClick(Sender: TObject);
begin
  // Stretch Image
  if chkStretch.Checked = True then
    begin
      chkProp.Checked := False;
      imgMain.Proportional := False;
      imgMain.Stretch := True;
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
      StatusBar1.Panels[3].Text := 'Stretch';
    end
  else
  if chkStretch.Checked = False then
    begin
      imgMain.Stretch := False;
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
      StatusBar1.Panels[3].Text := '';
    end;
end;

procedure TfrmMain.CloseImage1Click(Sender: TObject);
begin
 // Close Image
  imgMain.Picture := nil;
  with StatusBar1 do
    begin
      Panels[0].Text := '';
      Panels[1].Text := '';
      Panels[2].Text := '';
      Panels[3].Text := '';
    end;
    chkProp.Checked := False;
    chkCentre.Checked := False;
    chkStretch.Checked := False;
end;

procedure TfrmMain.fllstMainClick(Sender: TObject);
var
  iPos : Integer;
begin
  // Select Image from File List
  iPos := fllstMain.ItemIndex;
  sFile_Name := fllstMain.Items[iPos];
  imgMain.Picture.LoadFromFile(sFile_Name);
  StatusBar1.Panels[0].Text := sFile_Name;
end;

procedure TfrmMain.OpenImage1Click(Sender: TObject);
begin
  // Open TIF
  dlgOpen1.Filter := 'TIF|*.TIF';
  dlgOpen1.InitialDir := GetCurrentDir;
  if dlgOpen1.Execute then
    begin
      imgMain.Picture.LoadFromFile(dlgOpen1.FileName);
    end;
  StatusBar1.Panels[0].Text := dlgOpen1.FileName;
end;

procedure TfrmMain.Proportional1Click(Sender: TObject);
begin
// Set Proportional
  if chkProp.Checked = True then
    begin
      imgMain.Proportional := True;
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
      StatusBar1.Panels[2].Text := 'Proportional';
    end
  else
  if chkProp.Checked = False then
    begin
      imgMain.Proportional := False;
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
      StatusBar1.Panels[2].Text := '';
    end;
end;

procedure TfrmMain.Stretch1Click(Sender: TObject);
begin
// Stretch Image
  if chkStretch.Checked = True then
    begin
      chkProp.Checked := False;
      imgMain.Proportional := False;
      imgMain.Stretch := True;
      imgMain.AutoSize := False;
      imgMain.Align := alClient;
      StatusBar1.Panels[3].Text := 'Stretch';
    end
  else
  if chkStretch.Checked = False then
    begin
      imgMain.Stretch := False;
      imgMain.AutoSize := True;
      imgMain.Align := alNone;
      StatusBar1.Panels[3].Text := '';
    end;
end;

procedure TfrmMain.tlbLoadImageClick(Sender: TObject);
begin
  // Open TIF
  dlgOpen1.Filter := 'TIF|*.TIF';
  dlgOpen1.InitialDir := GetCurrentDir;
  if dlgOpen1.Execute then
    begin
      imgMain.Picture.LoadFromFile(dlgOpen1.FileName);
    end;
  StatusBar1.Panels[0].Text := dlgOpen1.FileName;
end;

end.
