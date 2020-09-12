
//////////////////////
/////// sv hint //////
//////////////////////


/*synthesizable*/

interface example ();
logic banan;

modport random (output banan);
endinterface

// normally instantiated inside interfaces
clocking ran clk_event:
item list;
  endclocking ran

clocking bus @(posedge clk);
  parameter INPUT_SKEW=1;
  default inoo #10;
  input #3 banan;
  endclocking

  // program block simimlat to a module for solving race condition
  program
    helloWorld();
    initial
    begin: hello
      $display("helloWorld",);
    end

    initial
    begin: there
      $display("hello there",);
    end 
  endprogram: helloWorld

sequence d (data,en);
  (!en) #1 data=0;
endsequence

// if start match execture the next
// with |=> evaluation start in next cc otherwise it is overlapped
property p1;
  @(posedge clk) disable iff(!active)
  start |-> request ##2 (grant==1);
endproperty

  assert property (p1); // property can be concatenated with logical operators 
// inside property first_match , within and throughout
//also if then else in property


// there can be local variable and fucntion calls in property
//$rose  1 -> , $fell 0->  // used when the changes happen between 2 clock events
// $stable , $past for sample in the past



$system("shell command");


http://www.asic-world.com/systemverilog/vmm1.html#Introduction

property is cuncurrent assetions
  -layesrs:
    boolean all the boolean operatior expect for the increment ones
    sequence

    and : When both sequence are expected to match, and both the sequence start at same time, but are not expected to finish at same time. Then and operator is used.
    intersect : When both sequence are expected to match, and both the sequence start and end at same time. Then intersect operator is used.
    or : When one of the both sequence are expected to match. Then or operator is used.
  

first_match
  

When we want to stop after first match of sequence, we use first_match match operator.

throughout
  

When we want to check if some condition is valid over period of sequence, then throughout match operator is used.

within
  

When we want to check containment of one sequence in another sequence, we use within match operator.
        // ## number of sample edges or delay ##[1:5] it can be checkef for the next 4cc
// $ -> infinite number of cycles
// [*3] sequence of 3 events must be true for 3 consecutive cc
// [=3] sequence of 3 event which can be non consecutive [=3:5] min 3 max 4

// Consecutive repetition ( [* ): Consecutive repetition specifies finitely many
        // iterative matches of the operand sequence, with a delay of one clock 
        // tick from the end of one match to the beginning of the next. 
        // The overall repetition sequence matches at the end of the last iterative match of the operand.
// Goto repetition ( [-> ): Goto repetition specifies finitely many iterative matches 
    //of the operand boolean expression, with a delay of one or more clock ticks
    // from one match of the operand to the next successive match and no match of the
    //  operand strictly in between. The overall repetition sequence matches at the last iterative match of the operand.
// Nonconsecutive repetition ( [= ): Nonconsecutive repetition specifies finitely 
    //many iterative matches of the operand boolean expression, with a delay of one or 
    //more clock ticks from one match of the operand to the next successive match and
    // no match of the operand strictly in between. The overall repetition sequence

      property:
         19     disable iff (reset) // disable if reset is asserted
        use if then else insie the property block


    |-> : Overlapped implication operator. If there is a match for the antecedent sequence_expr, then the end point of the match is the start point of the evaluation of the consequent property_expr.
    |=> : Non Overlapped implication operator. The start point of the evaluation of the consequent property_expr is the clock tick after the end point of the match.






// system tasks

    $rose returns true, when least significant bit changes to 1.
    $fell returns true, when least significant bit changes to 0.
    $stable returns true, if value did not change since last clock event to current clock event.
    $past returns value n clock events before.


  /* assert : if the property holds correctly
      assume : it specifies the property as an assumption for verification  useful for verification tools 
      cover: it monitors the propertty for the sake of coverage 
      inst: assert/assume/cover  property_name;
    */

expect is same as assert in syntax, but expect is used inside a procedural block, and it waits till a property evalutes to true or false.s
  // Wait for the sequence if pass, terminate sim
 32   expect ( @ (posedge clk) a  ##1  b  ##1  c  ##1   ! c)
 33      $finish;
 34    else
 35      $error ("Something is wrong");
 


bind to module  "bind_assertion" the property defined in the assertion_ip moduele
 bind bind_assertion   assertion_ip      U_assert_ip (
 13 // .vip port (RTL port)
 14  .clk_ip   (clk),
 15  .req_ip   (req),
 16  .reset_ip (reset),
 17  .gnt_ip   (gnt)
 18 );



// checking property for multiclocked signals 
  //=================================================
  // Sequence Specification Layer
  //=================================================
  sequence multi_clock_seq;
     @(posedge clk1) req  ##1  @(posedge clk2) gnt;
  endsequence
  //=================================================
  // Property Specification Layer
  //=================================================
  property multi_clock_prop;
    @ (posedge clk1)
        req |-> multi_clock_seq; // at clk1 posedge check the non overlapping sequence of multi_clk_set -> at posdege clk1 req is true and after 1cc gnt is tru at posdege of clk2
  endproperty
  //=================================================
  // Assertion Directive Layer
  //=================================================
  multi_clock_assert : assert property (multi_clock_prop);



  0   my_cov.ADDRESS.option.at_least = 1;
 21   my_cov.ADDRESS2.option.at_least = 2;
 22   // start the coverage collection
 23   my_cov.start();
 24   // Set the coverage group name
 25   my_cov.set_inst_name("ASIC-WORLD");
 26   $monitor("addr 8'h%x addr2 8'h%x",addr,addr2);
 27   repeat (10) begin
 28     addr = $urandom_range(0,7);
 29     // Sample the covergroup
 30     my_cov.sample();
 31      #10 ;
 32   end
 33   // Stop the coverage collection
 34   my_cov.stop();
 35   // Display the coverage
 36   $display("Instance coverage is %e",my_cov.get_coverage());



    $set_coverage_db_name(name) : sets the filename of the coverage database into which coverage
    information is saved at the end of a simulation run.
    $load_coverage_db(name) :loads from the given filename the cumulative coverage information for all coverage group types.
    $get_coverage() :returns as a real number in the range of 0 to 100 the overall coverage of all coverage group types. This number is computed as described abov



// umv order of executio 
    new()    The constructor
2. build_phase()     Create components using new or the factory
3. connect_phase()     Make port, export and implementation connections
4. end_of_elaboration_phase()    After all connections have been hardened
5. start_of_simulation_phase()     Just before simulation starts
6. run_phase()     Runs simulation
7. extract_phase()    Post processing 1
8. check_phase()    Post processing 2
9. report_phase()   Post processing 3
10. final_phase()    Backstop