unit unJogoDaVelha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ButtonGroup, AGeral;

type
  TTJogodaVelha = class(TForm)
    Button1: TButton;

    Button11: TButton;
    Button12: TButton;
    Button13: TButton;

    Button21: TButton;
    Button22: TButton;
    Button23: TButton;

    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    LabelCorSC1: TLabelCorSC;
    procedure ButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Comeca;
    procedure Valida;
    procedure AtualizaMatriz(Posicao: Integer; Jogador: Integer);
    procedure DesabilitaTodosBotoes;
  public
  end;

var
  TJogodaVelha: TTJogodaVelha;
  MatrizDaVelha: array[1..3, 1..3] of Integer;
  Pontuacao: Integer;
  Vez: Integer;
  JogadasX: Integer;
  JogadasO: Integer;
implementation

{$R *.dfm}

procedure TTJogodaVelha.Comeca;
begin
  Button11.Enabled := True;
  Button12.Enabled := True;
  Button13.Enabled := True;
  Button21.Enabled := True;
  Button22.Enabled := True;
  Button23.Enabled := True;
  Button31.Enabled := True;
  Button32.Enabled := True;
  Button33.Enabled := True;

  //preenche vazio
  FillChar(MatrizDaVelha, SizeOf(MatrizDaVelha), -10);

  Pontuacao := -1;
  Vez := 1;
  JogadasX := 0;
  JogadasO := 0;

  Button11.Caption := '';
  Button12.Caption := '';
  Button13.Caption := '';
  Button21.Caption := '';
  Button22.Caption := '';
  Button23.Caption := '';
  Button31.Caption := '';
  Button32.Caption := '';
  Button33.Caption := '';
end;

procedure TTJogodaVelha.Button1Click(Sender: TObject);
begin
  Comeca;
end;

procedure TTJogodaVelha.ButtonClick(Sender: TObject);
var
  BtnIndex: Integer;
begin
  //Nome dos botoes
  if Sender = Button11 then BtnIndex := 0;
  if Sender = Button12 then BtnIndex := 1;
  if Sender = Button13 then BtnIndex := 2;
  if Sender = Button21 then BtnIndex := 3;
  if Sender = Button22 then BtnIndex := 4;
  if Sender = Button23 then BtnIndex := 5;
  if Sender = Button31 then BtnIndex := 6;
  if Sender = Button32 then BtnIndex := 7;
  if Sender = Button33 then BtnIndex := 8;

  // Verificacoes
  if (Sender as TButton).Caption <> '' then
  begin
    ShowMessage('Essa Posicaoição já está ocupada!');
    Exit;
  end;

  if Vez = 1 then
    (Sender as TButton).Caption := 'X'
  else
    (Sender as TButton).Caption := 'O';

  AtualizaMatriz(BtnIndex, Vez);

  if Vez = 1 then
    Inc(JogadasX)
  else
    Inc(JogadasO);

  Valida;

  if Vez = 1 then
    Vez := 0
  else
    Vez := 1;
end;

procedure TTJogodaVelha.Valida;
var
  I, J: Integer;
begin
  for I := 1 to 3 do
  begin
    Pontuacao := 0;
    for J := 1 to 3 do
      Pontuacao := Pontuacao + MatrizDaVelha[I, J];
    if (Pontuacao = 3) then
    begin
      ShowMessage('X WINS!');
      DesabilitaTodosBotoes;
      Exit;
    end;
    if (Pontuacao = 0) then
    begin
      ShowMessage('O WINS!');
      DesabilitaTodosBotoes;
      Exit;
    end;
  end;

  for I := 1 to 3 do
  begin
    Pontuacao := 0;
    for J := 1 to 3 do
      Pontuacao := Pontuacao + MatrizDaVelha[J, I];
    if (Pontuacao = 3) then
    begin
      ShowMessage('X WINS!');
      DesabilitaTodosBotoes;
      Exit;
    end;
    if (Pontuacao = 0) then
    begin
      ShowMessage('O WINS!');
      DesabilitaTodosBotoes;
      Exit;
    end;
  end;

  Pontuacao := MatrizDaVelha[1, 1] + MatrizDaVelha[2, 2] + MatrizDaVelha[3, 3];
  if (Pontuacao = 3) then
  begin
    ShowMessage('X WINS!');
    DesabilitaTodosBotoes;
    Exit;
  end;
  if (Pontuacao = 0) then
  begin
    ShowMessage('O WINS!');
    DesabilitaTodosBotoes;
    Exit;
  end;

  Pontuacao := MatrizDaVelha[1, 3] + MatrizDaVelha[2, 2] + MatrizDaVelha[3, 1];
  if (Pontuacao = 3) then
  begin
    ShowMessage('X WINS!');
    DesabilitaTodosBotoes;
    Exit;
  end;
  if (Pontuacao = 0) then
  begin
    ShowMessage('O WINS!');
    DesabilitaTodosBotoes;
    Exit;
  end;

  if (JogadasX = 5) and (Pontuacao < 3) then
  begin
    ShowMessage('EMPATE!');
    DesabilitaTodosBotoes;
  end;
end;

procedure TTJogodaVelha.AtualizaMatriz(Posicao: Integer; Jogador: Integer);
begin
  case Posicao of
    0: MatrizDaVelha[1, 1] := Jogador;
    1: MatrizDaVelha[1, 2] := Jogador;
    2: MatrizDaVelha[1, 3] := Jogador;
    3: MatrizDaVelha[2, 1] := Jogador;
    4: MatrizDaVelha[2, 2] := Jogador;
    5: MatrizDaVelha[2, 3] := Jogador;
    6: MatrizDaVelha[3, 1] := Jogador;
    7: MatrizDaVelha[3, 2] := Jogador;
    8: MatrizDaVelha[3, 3] := Jogador;
  end;
end;

procedure TTJogodaVelha.DesabilitaTodosBotoes;
begin
  Button11.Enabled := False;
  Button12.Enabled := False;
  Button13.Enabled := False;
  Button21.Enabled := False;
  Button22.Enabled := False;
  Button23.Enabled := False;
  Button31.Enabled := False;
  Button32.Enabled := False;
  Button33.Enabled := False;
end;

end.

