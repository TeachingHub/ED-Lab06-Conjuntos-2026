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
    procedure difference(c1, c2: tConjunto; var c3: tConjunto);


implementation

    procedure init(var c: tConjunto);
    begin
        initialize(c.lista);
    end;

    procedure add(var c: tConjunto; x: integer);
    begin
        if not in_list(c.lista, x) then
            insert_at_end(c.lista, x);
    end;

    procedure remove(var c: tConjunto; x: integer);
    begin
        delete(c.lista, x);
    end;

    function contains(c: tConjunto; x: integer): boolean;
    begin
        contains := in_list(c.lista, x);
    end;

    function is_empty_con(c: tConjunto): boolean;
    begin
        is_empty_con := is_empty(c.lista);
    end;

    function size(c: tConjunto): integer;
    begin
        size := num_elems(c.lista);
    end;

    function to_string_con(c: tConjunto): string;
    begin
        to_string_con := to_string(c.lista);
    end;

    procedure empty(var c: tConjunto);
    begin
        clear(c.lista);
    end;

    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    var
        aux: tListaSimple;
        x: integer;
    begin
        init(c3);
        initialize(aux);

        copy(c1.lista, c3.lista);
        copy(c2.lista, aux);

        while not is_empty(aux) do
        begin
            x := first(aux);
            if not in_list(c3.lista, x) then
                insert_at_end(c3.lista, x);
            delete_at_begin(aux);
        end;
    end;

    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
    var
        aux: tListaSimple;
        x: integer;
    begin
        init(c3);
        initialize(aux);

        while not is_empty(c1.lista) do
        begin
            x := first(c1.lista);
            if in_list(c2.lista, x) then
                insert_at_end(c3.lista, x);
            insert_at_end(aux, x);
            delete_at_begin(c1.lista);
        end;
        c1.lista := aux;
    end;

    procedure difference(c1, c2: tConjunto; var c3: tConjunto);
    var
        aux: tListaSimple;
        x: integer;
    begin
        init(c3);
        initialize(aux);

        copy(c1.lista, c3.lista);
        copy(c2.lista, aux);

        while not is_empty(aux) do
        begin
            x := first(aux);
            if in_list(c3.lista, x) then
                delete(c3.lista, x);
            delete_at_begin(aux);
        end;
    end;

end.