package CONSTANTS is
   constant IVDELAY : time := 0.1 ns;
   constant NDDELAY : time := 0.2 ns;
   constant NDDELAYRISE : time := 0.6 ns;
   constant NDDELAYFALL : time := 0.4 ns;
   constant NRDELAY : time := 0.2 ns;
   constant DRCAS : time := 1 ns;
   constant DRCAC : time := 2 ns;
   constant NumBit : integer := 16;	
   constant TP_MUX : time := 0.5 ns; 	
function f_log2 ( x: integer ) return integer;

end CONSTANTS;


PACKAGE body  CONSTANTS IS
-- function for compute the log2 
function f_log2 ( x: integer ) return integer is
    variable i: integer;

    begin
        i:=0;
        while ( 2**i < x ) loop
            i:=i+1;
        end loop;
        return i;
end function f_log2;



END PACKAGE BODY CONSTANTS;


