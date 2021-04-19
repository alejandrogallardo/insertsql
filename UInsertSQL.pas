unit UInsertSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, inifiles;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    LblContador: TLabel;
    BtnGuardar: TButton;
    BtnBuscar: TButton;
    OpenDialog1: TOpenDialog;
    BtnCrear: TButton;
    Label1: TLabel;
    ADOConnection: TADOConnection;
    QInsert: TADOQuery;
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCrearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WinIni: TIniFile;
  end;

var
  Form1: TForm1;
  FilePath: String;
  c: Integer;
  FirstTime: boolean;

implementation

{$R *.dfm}

procedure TForm1.BtnBuscarClick(Sender: TObject);
var
  openDialog : TOpenDialog;
begin
  openDialog := TOpenDialog.Create(self);
  openDialog.Execute;
  FilePath := openDialog.FileName;
  openDialog.Free;
end;

procedure TForm1.BtnCrearClick(Sender: TObject);
begin
  QInsert.Close;
  QInsert.SQL.Clear;
  QInsert.SQL.Add('CREATE TABLE dbo.DPALIAS (PRTIPO numeric(3, 0) NULL ,'+
                                            'DPAGEN numeric(4, 0) NULL ,'+
       	                                    'DPCORR numeric(7, 0) NULL ,'+
                                            'DPDIVE numeric(2, 0) NULL ,'+
                                            'ALICOD numeric(2, 0) NULL ,'+
                                            'DPALIA varchar(50) NULL ,'+
                                            ')');
  QInsert.ExecSQL;
  ShowMessage('Tabla Creada Correctamente');
end;

procedure TForm1.BtnGuardarClick(Sender: TObject);
var
   i: Integer;
   MyFile: TextFile;
   xTmp, p1, p2, p3, p4, p5, p6, res: String;
begin

  AssignFile(MyFile, FilePath);
  reset(MyFile);
  i := 0;
  c := 0;
  while not eof(MyFile) do
  begin
    ReadLn(MyFile, xTmp);
    p1 := copy(xTmp, 1, pos(';', xTmp) - 1);
    xTmp := Copy(xTmp, Pos(';', xtmp) + 1, length(xTmp));
    p2 := Copy(xTmp, 1, Pos(';', xTmp) - 1);
    xtmp:=copy(xtmp,pos(';',xtmp)+1,length(xtmp));
    p3:=copy(xtmp,1,pos(';',xtmp)-1);
    xtmp:=copy(xtmp,pos(';',xtmp)+1,length(xtmp));
    p4:=copy(xtmp,1,pos(';',xtmp)-1);
    xtmp:=copy(xtmp,pos(';',xtmp)+1,length(xtmp));
    p5:=copy(xtmp,1,pos(';',xtmp)-1);
    xtmp:=copy(xtmp,pos(';',xtmp)+1,length(xtmp));
    p6:=xtmp;
    res := 'Registro: ' + p1 + ' --- ' + p2 +' --- '+ p3 +' --- '+ p4 +' --- '+ p5 +' --- '+ p6;
    Memo1.Lines.Add(res);
    QInsert.Close;
    QInsert.SQL.Clear;
    QInsert.SQL.Add('INSERT INTO DPALIAS (PRTIPO, DPAGEN, DPCORR, DPDIVE, ALICOD, DPALIA) VALUES ('''+p1+''', '''+p2+''', '''+p3+''', '''+p4+''', '''+p5+''', '''+p6+''' )');
    //ShowMessage(QInsert.SQL.Text);
    QInsert.ExecSQL;
    inc(i);
    LblContador.Caption:= IntToStr(i);
    Application.ProcessMessages;
  end;

  // LblContador.Caption := IntToStr(i);

end;

procedure TForm1.FormActivate(Sender: TObject);
begin


  // ShowMessage(extractfilepath(application.ExeName));
  if FirstTime then
   begin
    WinIni := TIniFile.Create('E:\CompeXml\Progs\datos.ini');
    ADOConnection.ConnectionString:=WinIni.ReadString('DATOS','conection','');
    WinIni.Free;
   end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   LblContador.Caption := IntToStr(c);
   FirstTime:=true;

end;

end.
