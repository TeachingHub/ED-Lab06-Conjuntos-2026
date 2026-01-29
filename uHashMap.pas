unit uHashMap;

interface

uses
    SysUtils;

const
    HashMapSize = 10;

type

    tEntrada = record
        key: string;
        value: Integer;
    end;

    tHashMap = array[0..HashMapSize-1] of tEntrada;

    procedure initialize(var map: tHashMap);
    procedure add(var map: tHashMap; key: string; value: Integer);
    procedure remove(var map: tHashMap; key: string);
    function contains(map: tHashMap; key: string): Boolean;
    procedure show_map_state(map: tHashMap);
    function hash_function(key: string): Integer;

implementation




procedure show_map_state(map: tHashMap);
var
    i: Integer;
begin
    for i := 0 to HashMapSize-1 do
    begin
        WriteLn(Format('[%s: %d]', [map[i].key, map[i].value]));
    end;
end;

end.