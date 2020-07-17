library ieee; 
use ieee.std_logic_1164.all; 
use work.constants.ALL;

library ieee; 
use ieee.std_logic_1164.all; 
use work.constants.ALL;

entity STCG is 
    generic (   NBIT:   Natural := 32;
                SDIST:  Natural := 4); -- "sparseness", NBIT must be a multiple of SDIST
    Port (  A:      In  std_logic_vector(NBIT-1 downto 0);
            B:      In  std_logic_vector(NBIT-1 downto 0);
            cin: IN std_logic;
            Cout:   Out std_logic_vector(NBIT downto 0));
end STCG; 

architecture STRUCTURAL of STCG is

        
    constant logN : integer := f_log2(NBIT); -- from constants library


    type pgs is array(logN downto 0) of std_logic_vector(NBIT-1 downto 0);

    subtype row_col_id is integer;

    -- 1 is for the "left" input (other PG block in same column but different row), 0 is for the "right" (other PG or G block in previous row and different column)
    type needMatrixCell is array(2 downto 0) of row_col_id;

    type pg_row is array(NBIT-1 downto 0) of needMatrixCell;
    
    type pg_matrix is array(logN downto 1) of pg_row; -- the matrix that defines the structure of the sparse tree carry generator
    
    function f_find_k(i : integer; row: integer) return integer is
        variable x,y : integer;
    begin
        x := 2**(row-1);
        y := i/x;
        x := y*x;
        return x; -- returns the index of k (that is also the "left input index")
    end function f_find_k;

    function f_insert(i: integer; j: integer; m: pg_matrix; first: integer) return pg_matrix is
        variable row, col, t, k : integer;
        variable matr : pg_matrix := m;
    begin
        row := f_log2(i-j); --find the row in which the blok should be put
        col := i-1; --find the column (0-index)
        t := i-1;
            if(t-j <= 1) then --if first "row" of the sparse tree carry generator (the inputs came from the pg network)
                if(j = 0) then
                    -- Generating G block for [t:j]
                    matr(row)(col)(2) := 1; -- a G block
                    matr(row)(col)(1) := 0; -- the left input from the first row and same coulmn (col)
                    matr(row)(col)(0) := j; -- the right input from the first row and the j column
                else
                    -- Generating PG block for [t:j]
                    matr(row)(col)(2) := 2; -- a PG block
                    matr(row)(col)(1) := 0;
                    matr(row)(col)(0) := j;
                end if;
            else
                k := f_find_k(t, row); -- find the index of the block that provides the previous P and G signals
                if(j = 0) then
                    -- Generating G block for [t:j]
                    matr(row)(col)(2) := 1;
                    matr(row)(col)(1) := f_log2(i-k); -- the row where the PG block that provides the "left" PG input is (the f_log2 function gives the upper integer if the result "is a float")
                    matr(row)(col)(0) := k-1;
                else
                    -- Generating PG block for [t:j]
                    matr(row)(col)(2) := 2;
                    matr(row)(col)(1) := f_log2(i-k);
                    matr(row)(col)(0) := k-1;
                end if;
                if(first = 0 or (i-k) /= 2**f_log2(i-k)) then -- if the block that provides the left input needs to be created (is not exponential) or, if it is, is the first time the insert function is called (pruning to improve performance)
                    matr := f_insert(i, k, matr, first); -- insert the left block in the matrix
                end if;
                if(first = 0) then -- it's always an "exponential block" so no need to check
                    matr := f_insert(k, j, matr, first); -- insert the right block in the matrix
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
            if(t = (2**f_log2(t))) then -- if it is an "exponential" block
                if(first_e = 0) then -- insert it only if it is the first time an "exponential" block is found (pruning, no need to always insert all blocks)
                    first_e := 1;
                    matr := f_insert(t,0,matr,0);
                end if;
            else -- no "exponential" block (i.e. 12,20,24,28,...)
                matr := f_insert(t,0,matr,1); -- always insert but with first = 1
            end if;
            t := t - SDIST;
        end loop;
        return matr;
    end function f_compute_matrix;

    -- good just for N=32 and SDIST=4
    --constant nM : pg_matrix := (((1, 1, 0, 30),(0, 0, 0, 0),(1, 1, 0, 28),(0, 0, 0, 0),(1, 1, 0, 26),(0, 0, 0, 0),(1, 1, 0, 24),(0, 0, 0, 0),(1, 1, 0, 22),(0, 0, 0, 0),(1, 1, 0, 20),(0, 0, 0, 0),(1, 1, 0, 18),(0, 0, 0, 0),(1, 1, 0, 16),(0, 0, 0, 0),(1, 1, 0, 14),(0, 0, 0, 0),(1, 1, 0, 12),(0, 0, 0, 0),(1, 1, 0, 10),(0, 0, 0, 0),(1, 1, 0, 8),(0, 0, 0, 0),(1, 1, 0, 6),(0, 0, 0, 0),(1, 1, 0, 4),(0, 0, 0, 0),(1, 1, 0, 2),(0, 0, 0, 0),(1, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 1, 29),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 25),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 21),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 17),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 13),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 9),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 1, 5),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 1, 1),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 2, 27),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 19),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 11),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 3),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 1, 3, 23),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 1, 2, 23),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 3, 7),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 7),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)),((1, 0, 4, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 4, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 3, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(1, 0, 2, 15),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0),(0, 0, 0, 0)));

    constant nM : pg_matrix := f_compute_matrix('1'); -- useless parameter, it generates the constant matrix that is then read during the generate statement


    component PG is -- propagate and generate network
        generic ( NBIT : Natural := 8);
        Port (	A:	In	std_logic_vector(NBIT-1 downto 0);
                B:	In	std_logic_vector(NBIT-1 downto 0);
	        cin : In std_logic;
                p:	Out	std_logic_vector(NBIT-1 downto 0);
                g:	Out	std_logic_vector(NBIT-1 downto 0));
    end component;
    
    component PGSB is  -- general propagate  and generate block
        Port (	P_in_ik:	    In	std_logic;
                P_in_kj:	    In	std_logic;
                G_in_ik:	In	std_logic;
                G_in_kj:	In	std_logic;
                G_out:	Out	std_logic;
                P_out:	Out	std_logic);
    end component;
    
    component GSB is -- general generate block
        Port (	P_in_ik:	    In	std_logic;
                G_in_ik:	In	std_logic;
                G_in_kj:	In	std_logic;
                G_out:	Out	std_logic);
    end component;
    
     

    signal p, g : pgs;
    
begin

    PGnetwork : PG generic map (NBIT => NBIT) port map (A => A, B => B, cin => cin, p => p(0), g => g(0));
    
    rows:   for j in 1 to logN generate
        columns:    for i in 1 to NBIT-1 generate
			-- read each matrix cell and if the block should be generated, generate it connecting the signal as follow
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

