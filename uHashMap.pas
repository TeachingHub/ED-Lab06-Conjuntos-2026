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

function hash_function(key: string): Integer;
var
    i, hash: Integer;
begin
    hash := 0;
    for i := 1 to Length(key) do
        hash := (hash + Ord(key[i])) mod HashMapSize;
    hash_function := hash;
end;

procedure initialize(var map: tHashMap);
var
    i: Integer;
begin
    for i := 0 to HashMapSize-1 do
    begin
        map[i].key := '';
        map[i].value := 0;
    end;
end;

procedure add(var map: tHashMap; key: string; value: Integer);
var
    hash: Integer;
begin
    hash := hash_function(key);
    if map[hash].key = '' then
    begin
        map[hash].key := key;
        map[hash].value := value;
    end;
end;

procedure remove(var map: tHashMap; key: string);
var
    hash: Integer;
begin
    hash := hash_function(key);
    if map[hash].key = key then
    begin
        map[hash].key := '';
        map[hash].value := 0;
    end;
end;

function contains(map: tHashMap; key: string): Boolean;
var
    hash: Integer;
begin
    hash := hash_function(key);
    contains := map[hash].key = key;
end;


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