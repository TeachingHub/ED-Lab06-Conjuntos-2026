program conjuntos_ej1;

uses uListaEnlazadaSimple;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;



{ 
    Ejercicio 1: Dada una lista de enteros, genera una nueva lista con todos los elementos que aparecen en la lista original, pero sin duplicados y en orden creciente.
    No se permite el uso de las funciones copy ni in_list de la lista enlazada. Además, se deben usar los conjuntos de pascal. 
}
procedure generar_lista_sin_duplicados(var list, aux: tListaSimple);
var
    conjunto: set of 0..255;
    x, i: integer;
begin
    initialize(aux);
    conjunto := [];
    for i:= 1 to num_elems(list) do
    begin
        x := first(list);
        conjunto := conjunto + [x];
        delete_at_begin(list);
        insert_at_end(list, x);
    end;
    // recorremos todo el conjunto y lo insertamos en la lista auxiliar
    for x := 0 to 255 do
    begin
        if x in conjunto then
            insert_at_end(aux, x);
    end;
end;


procedure crear_lista_1(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);    
    insert_at_end(l, 5);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
end;

procedure crear_lista_2(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);    
end;


procedure crear_lista_3(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
end;

procedure crear_lista_4(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
end;


procedure test_generar_lista_sin_duplicados();
var
    lista_original, lista_resultado, lista_sin_duplicados: tListaSimple;
    resultado_str, original_str: string;
begin
    WriteLn('Ejercicio: Generar una lista con elementos sin duplicados y ordenada.');
    WriteLn('===========================================');
    WriteLn;

    crear_lista_1(lista_original);
    crear_lista_2(lista_resultado);
    original_str := to_string(lista_original);
    generar_lista_sin_duplicados(lista_original, lista_sin_duplicados);
    resultado_str := to_string(lista_sin_duplicados);

    WriteLn('Caso 1: ',  original_str, ' -> ', resultado_str, ' ', bool_to_str(resultado_str = to_string(lista_resultado)));

    clear(lista_original);
    clear(lista_resultado);
    clear(lista_sin_duplicados);

    crear_lista_3(lista_original);
    crear_lista_4(lista_resultado);
    original_str := to_string(lista_original);
    generar_lista_sin_duplicados(lista_original, lista_sin_duplicados);
    resultado_str := to_string(lista_sin_duplicados);

    WriteLn('Caso 2: ',  original_str, ' -> ', resultado_str, ' ', bool_to_str(resultado_str = to_string(lista_resultado)));

end;


begin
    test_generar_lista_sin_duplicados();
    readln;
end.