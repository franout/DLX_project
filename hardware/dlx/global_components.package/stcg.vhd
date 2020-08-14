library ieee; 
use ieee.std_logic_1164.all; 
use work.constants.ALL;

entity STCG is 
    generic (   NBIT:   Natural := 32;
                SDIST:  Natural := 4);
    Port (  A:      In  std_logic_vector(NBIT-1 downto 0);
            B:      In  std_logic_vector(NBIT-1 downto 0);
            cin: IN std_logic;
            Cout:   Out std_logic_vector(NBIT downto 0));
end STCG; 

architecture STRUCTURAL of STCG is

        
    constant logN : integer := f_log2(NBIT); -- from constants library


    type pgs is array(logN downto 0) of std_logic_vector(NBIT-1 downto 0); 

    subtype row_col_id is integer;

    -- 1 is left, 0 is right
    type needMatrixCell is array(2 downto 0) of row_col_id;

    type pg_row is array(NBIT-1 downto 0) of needMatrixCell;
    
    type ins_row is array(NBIT-1 downto 0) of std_logic;
    
    type pg_matrix is array(logN downto 1) of pg_row;
    
    type ins_matrix is array(logN downto 1) of ins_row;
    
    function f_find_k(i : integer; row: integer) return integer is
        variable x,y : integer;
    begin
        x := 2**(row-1);
        y := i/x;
        x := y*x;
        return x;
    end function f_find_k;

    function f_insert(i: integer; j: integer; m: pg_matrix; first: integer) return pg_matrix is
        variable row, col, t, k : integer;
        variable matr : pg_matrix := m;
    begin
        row := f_log2(i-j);
        col := i-1;
        t := i-1;
            if(t-j <= 1) then
                if(j = 0) then
                    -- Generating G block for [' + str(t) + ':' + str(j) + ']'
                    matr(row)(col)(2) := 1;
                    matr(row)(col)(1) := 0;
                    matr(row)(col)(0) := j;
                else
                    -- Generating PG block for [' + str(t) + ':' + str(j) + ']'
                    matr(row)(col)(2) := 2;
                    matr(row)(col)(1) := 0;
                    matr(row)(col)(0) := j;
                end if;
            else
                k := f_find_k(t, row);
                if(j = 0) then
                    -- Generating G block for [' + str(t) + ':' + str(j) + ']'
                    matr(row)(col)(2) := 1;
                    matr(row)(col)(1) := f_log2(i-k);
                    matr(row)(col)(0) := k-1;
                else
                    -- Generating PG block for [' + str(t) + ':' + str(j) + ']'
                    matr(row)(col)(2) := 2;
                    matr(row)(col)(1) := f_log2(i-k);
                    matr(row)(col)(0) := k-1;
                end if;
                if(first = 0 or (i-k) /= 2**f_log2(i-k)) then
                    matr := f_insert(i, k, matr, first);
                end if;
                if(first = 0) then
                    matr := f_insert(k, j, matr, first);
                end if;
            end if;
        return matr;
    end function f_insert;
    
    function f_compute_matrix(nop : std_logic) return pg_matrix is
        variable t : integer;
        variable matr : pg_matrix := (OTHERS => (OTHERS => (OTHERS => 0)));
        variable first_e : integer := 0;
    begin
        t := NBIT;
        while(t >= SDIST) loop
            if(t = (2**f_log2(t))) then
                if(first_e = 0) then
                    first_e := 1;
                    matr := f_insert(t,0,matr,0);
                end if;
            else
                matr := f_insert(t,0,matr,1);
            end if;
            t := t - SDIST;
        end loop;
        return matr;
    end function f_compute_matrix;

    -- good just for N=32 and SDIST=4
    --constant nM : pg_matrix := (((1, 1, 0, 30),(0, 0, 0, 0),(1, 1, 0, 28),(0, 0, 0, 0),(1, 1, 0, 26),(0, 0, 0, 0),(1, 1, 0, 24),(0, 0, 0, 0),(1, 1, 0, 22),(0, 0, 0, 0),(1, 1, 0, 20),(0, 0, 0, 0),(1, 1, 0, 18),(0, 0, 0, 0),(1, 1, 0, 16),(0, 0, 0, 0),(1, 1, 0, 14),(0, 0, 0, 0),(1, 1, 0, 12),(0, 0, 0, 0),(1, 1, 0, 10),(0, 0, 0, 0),(1, 1, 0, 8),(0, 0, 0, 0),(1, 1, 0, 6),(0, 0, 0, 0),(1, 1, 0, 4),(0, 0, 0, 0),(1, 1, 0, 2),(0, 0, 0, 0),(1, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 1, 29),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 25),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 21),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 17),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 13),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 9),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 5),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 1, 1),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 2, 27),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 19),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 11),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 3),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 3, 23),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 23),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 3, 7),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 7),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 0, 4, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 4, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 3, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)));

    constant nM : pg_matrix := f_compute_matrix('1');


    component PG is -- propagate and generate network
        generic ( NBIT : Natural := 8);
        Port (  A:  In  std_logic_vector(NBIT-1 downto 0);
                B:  In  std_logic_vector(NBIT-1 downto 0);
            cin : In std_logic;
                p:  Out std_logic_vector(NBIT-1 downto 0);
                g:  Out std_logic_vector(NBIT-1 downto 0));
    end component;
    
    component PGSB is  -- general propagate  and generate block
        Port (  P_in_ik:        In  std_logic;
                P_in_kj:        In  std_logic;
                G_in_ik:    In  std_logic;
                G_in_kj:    In  std_logic;
                G_out:  Out std_logic;
                P_out:  Out std_logic);
    end component;
    
    component GSB is -- general generate block
        Port (  P_in_ik:        In  std_logic;
                G_in_ik:    In  std_logic;
                G_in_kj:    In  std_logic;
                G_out:  Out std_logic);
    end component;
    
     

    signal p, g : pgs;
    
begin

    PGnetwork : PG generic map (NBIT => NBIT) port map (A => A, B => B, cin => cin, p => p(0), g => g(0));
    
    rows:   for j in 1 to logN generate
        columns:    for i in 1 to NBIT-1 generate
                        --left:     row = neededMatrix(j)(i)(1) , col = i
                        --right:    row = j-1                   , col = neededMatrix(j)(i)(0)
                        
                        PGgen: if(nM(j)(i)(2) = 2) generate
                            PGi: PGSB port map (P_in_ik => p(nM(j)(i)(1))(i), P_in_kj => p(j-1)(nM(j)(i)(0)), G_in_ik => g(nM(j)(i)(1))(i), G_in_kj => g(j-1)(nM(j)(i)(0)), P_out => p(j)(i), G_out => g(j)(i));
                        end generate PGgen;
                        
                        Ggen: if(nM(j)(i)(2) = 1) generate
                            Gi: GSB port map (P_in_ik => p(nM(j)(i)(1))(i), G_in_ik => g(nM(j)(i)(1))(i), G_in_kj => g(j-1)(nM(j)(i)(0)), G_out => g(j)(i));
                            linkOut: if(2**j >= SDIST) generate
                                cout(i+1) <= g(j)(i);
                            end generate linkOut;
                        end generate Ggen;
                    end generate columns;
            end generate rows;
            cout(0) <= cin;
end STRUCTURAL;

configuration CFG_STCG_STRUCTURAL of stcg is    

  for STRUCTURAL 
  end for;
end CFG_STCG_STRUCTURAL;