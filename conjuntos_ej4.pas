program conjuntos_ej4;

uses
    SysUtils, 
    uHashSet,
    math;


const
    HashSetSize = 10;

var
    my_hash_set: THashSet;
    intento: string;


// vamos a generar un histograma de colisiones, para ello, vamos a insertar las letras del abecedario en el hashset
// y vamos a contar cuantas colisiones se producen, es decir, cuántas veces se intenta meter una letra el el hashset
// y nos dice que ya existe, aunque no exista.
procedure histograma_colisiones;
var
    i, t: Integer;
    letra: Char;
    histograma: array[0..HashSetSize-1] of integer;

begin 
    // Inicializar el HashSet como vacío
    FillChar(histograma, SizeOf(histograma), 0);
    t := 0;

    for letra := 'A' to 'Z' do
    begin
        i := hash_function(letra);
        Inc(histograma[i]);
    end;

    for i := Low(histograma) to High(histograma) do
    begin
        WriteLn('Hash ', i, ': ', max(histograma[i]-1,0), ' colisiones');
        t := t + max(histograma[i]-1,0);
    end;
    WriteLn('Total de colisiones: ', t);
end;



begin
    // Inicializar el HashSet como vacío
    FillChar(my_hash_set, SizeOf(my_hash_set), 0);
    WriteLn('HashSet inicializado vacío.');
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    // Añadir elementos y mostrar el estado
    add(my_hash_set, 'Jones');
    WriteLn('''Jones'' está en el HashSet: ', contains(my_hash_set, 'Jones'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Lisa');
    WriteLn('''Lisa'' está en el HashSet: ', contains(my_hash_set, 'Lisa'));
    WriteLn('''Bob'' está en el HashSet: ', contains(my_hash_set, 'Bob')); // Aún no se ha añadido Bob
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Bob');
    WriteLn('''Bob'' está en el HashSet: ', contains(my_hash_set, 'Bob'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Siri');
    WriteLn('''Siri'' está en el HashSet: ', contains(my_hash_set, 'Siri'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Pete');
    WriteLn('''Pete'' está en el HashSet: ', contains(my_hash_set, 'Pete'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');


    // Ejercicio 3.2. Busca una palabra que produzca una coliusión
    intento := 'URJC';
    WriteLn('''', intento, ''' tiene el hash ', hash_function(intento));
    add(my_hash_set, intento);

    WriteLn('--------------------');
    show_hashset_state(my_hash_set);
    clear_hashset(my_hash_set);
    WriteLn('--------------------');
    WriteLn('Histograma de colisiones:');
    histograma_colisiones;

    ReadLn;
end.