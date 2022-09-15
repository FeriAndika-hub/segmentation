unit segmentationUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnUpload: TButton;
    btnSave: TButton;
    btnBinary: TButton;
    btnSegmentation: TButton;
    btnGray: TButton;
    openDialog: TOpenDialog;
    saveDialog: TSaveDialog;
    procedure btnUploadClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnUploadClick(Sender: TObject);
var
  i, j: integer;
begin
  if (openDialog.Execute) then
  begin
    imgSrc.Picture.LoadFromFile(openDialog.FileName);
    for j:=0 to imgSrc.Height-1 do
    begin
      for i:=0 to imgSrc.Width-1 do
      begin
        bmpR[i, j] := getRValue(imgSrc.Canvas.Pixels[i, j]);
        bmpG[i, j] := getGValue(imgSrc.Canvas.Pixels[i, j]);
        bmpB[i, j] := getBValue(imgSrc.Canvas.Pixels[i, j]);
      end;
    end;
  end;
end;

end.

