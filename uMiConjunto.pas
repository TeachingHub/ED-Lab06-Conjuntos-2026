unit uMiConjunto;

interface

uses uListaEnlazadaSimple;

type
    tConjunto = record
        lista: tListaSimple;
    end;

    {Operaciones básicas}
    procedure init(var c: tConjunto);
    procedure add(var c: tConjunto; x: integer);
    procedure remove(var c: tConjunto; x: integer);
    function contains(c: tConjunto; x: integer): boolean;
    function is_empty_con(c: tConjunto): boolean;
    function size(c: tConjunto): integer;
    function to_string_con(c: tConjunto): string;
    procedure empty(var c: tConjunto);

    {Otras operaciones}
    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);


implementation



end.