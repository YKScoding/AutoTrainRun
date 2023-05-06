




program AutoTrainRun;

uses 
     SysUtils , Crt ;

type 
     trackinfo = record
                    staid : string[10]; {station identifier}
                    staname : string[30]; {station name}
                    length : integer; {distance to next station, in meters}
                    limit : integer; {speed limit of section, in km/h}
               end;

var {main program variables}
     tracklocal : array[1..100] of trackinfo;
    
    
    
    
     procedure showarray(var pos : int16);
     var 
          i : int16;
     begin
          for i := 1 to pos do begin
               with tracklocal[i] do begin
                    writeln(staid , '  ' , staname);
                    writeln('           ' , length , 'm  ' , limit , 'km/h');
                    writeln;
                    sleep(100);
               end; {of with}
          end; {of for loop}
     end; {of showarray}





     procedure readfile; {reading the route file}
     var
          track : text;
          count , i : integer;
     begin {of readfile}
     
          assign(track , 'train.txt');
          reset(track);
          count := 0;
          
          writeln('initializing... ');
          
          while not eof(track) do begin
               readln(track);
               count := count + 1;
               sleep(20);
               clrscr;
               writeln('loaded  ' , count , '  objects.');
          end; {of while loop}
          count := count div 4;
          clrscr;
          reset(track);
          
          for i := 1 to count do begin
               with tracklocal[i] do begin
                    readln(track , staid);
                    readln(track , staname);
                    readln(track , length);
                    readln(track , limit);
               end; {of with}
               
               writeln('loading...  ' , i , ' / ' ,  count);
               sleep(20);
               clrscr;
          end;{of for loop}
          
          close(track);
          showarray(count);
          writeln(count , ' objects imported.')
     end; {of readfile}





     {main program}
     begin
          readfile;
     end.
     {main program}