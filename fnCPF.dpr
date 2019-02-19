program fnCPF;

{$APPTYPE CONSOLE}

uses
  SysUtils, Clipbrd;


  function GeraCPF(const Ponto: Boolean=False): string;
  var
    n1, n2, n3, n4, n5, n6, n7, n8, n9, d1, d2: LongInt;
  begin
    Randomize;
    Randomize;
    Randomize;
    Randomize;

    n1 := Trunc(Random(10));
    n2 := Trunc(Random(10));
    n3 := Trunc(Random(10));
    n4 := Trunc(Random(10));
    n5 := Trunc(Random(10));
    n6 := Trunc(Random(10));
    n7 := Trunc(Random(10));
    n8 := Trunc(Random(10));
    n9 := Trunc(Random(10));
    d1 := (n9 * 2) + (n8 * 3) + (n7 * 4) + (n6 *  5) + (n5 * 6) +
          (n4 * 7) + (n3 * 8) + (n2 * 9) + (n1 * 10);
    d1 := 11 - (d1 mod 11);
    if (d1 >= 10) then
      d1 := 0;
    d2 := (d1 * 2) + (n9 * 3) + (n8 * 4) + (n7 *  5) + (n6 *  6) +
          (n5 * 7) + (n4 * 8) + (n3 * 9) + (n2 * 10) + (n1 * 11);
    d2 := 11 - (d2 mod 11);
    if (d2>=10) then
      d2 := 0;
    Result := IntToStr(n1) + IntToStr(n2) + IntToStr(n3) + IntToStr(n4) + IntToStr(n5) + IntToStr(n6) +
              IntToStr(n7) + IntToStr(n8) + IntToStr(n9) + IntToStr(d1) + IntToStr(d2);
    if Ponto then
      Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' + Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);
  end;


    
var
  vCPF:String;
begin
  vCPF := GeraCPF;
  Clipboard.AsText := vCPF;
  WriteLn('CPF GERADO = ' + vCPF);
  Sleep(500);
end.
 