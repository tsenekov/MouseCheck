unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.DateUtils;

type
  TfrmMain = class(TForm)
    Timer1: TTimer;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    sd: TTime;
    ls: integer;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Memo1.Lines.SaveToFile('d:\temp.txt');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Memo1.Clear;
  sd := now();
  Timer1.Enabled := true;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  ks: integer;
  r: string;
  t: int64;
begin
  if GetKeyState(vk_NumLock)=1 then
  begin
    ks := GetKeyState(1);
    if ks <> ls then
    begin
      ls := ks;

      t := MilliSecondsBetween(now(), sd);
      sd := now();
      Memo1.Lines.Add('Delay ' + t.ToString + ' ms');

      if ks < 0 then
      begin
        Memo1.Lines.Add('MoveTo ' + Mouse.CursorPos.X.ToString + ' ' + Mouse.CursorPos.Y.ToString);
      end;

      if ks < 0 then
        r := 'LeftDown 1';
      if ks >= 0 then
        r := 'LeftUp 1';

      Memo1.Lines.Add(r);
    end;
  end;
end;

end.
