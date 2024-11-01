//case 1 to op_code

class opc_1 extends uvm_sequence#(seq_item);
  
  `uvm_object_utils (opc_1)
  
  function new(string name = "opc_1");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      req.cw_bus = 14'b0000 ;
     
      finish_item(req);
      
  endtask ;
  
    endclass: opc_1


//case 2 to op_code

class opc_2 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_2)
  
  function new(string name = "opc_2");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      
      req.cw_bus = 14'b0001 ;
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_2


//case 3 to op_code

class opc_3 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_3)
  
  function new(string name = "opc_3");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      
      req.cw_bus = 14'b1111 ;
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_3

//case 4 to op_code

class opc_4 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_4)
  
  function new(string name = "opc_4");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
     
      req.cw_bus = 14'b1110 ;
      finish_item(req);
      
  endtask ;
  
    endclass: opc_4

//case 5 to op_code

class opc_5 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_5)
  
  function new(string name = "opc_5");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
     
      req.cw_bus = 14'b0000; 
      finish_item(req);
      
  endtask ;
  
    endclass: opc_5

//case 6 to op_code

class opc_6 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_6)
  
  function new(string name = "opc_6");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());

      req.cw_bus = 14'b0010 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_6

//case 7 to op_code

class opc_7 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_7)
  
  function new(string name = "opc_7");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());

      req.cw_bus = 14'b0011110001111 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_7


//case 8 to op_code

class opc_8 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_8)
  
  function new(string name = "opc_8");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
    
      req.cw_bus = 14'b1110 ;
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_8

class opc_9 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_9)
  
  function new(string name = "opc_9");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      req.cw_bus = 14'b0011110101011 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_9


class opc_10 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_10)
  
  function new(string name = "opc_10");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
  
      req.cw_bus = 14'b0011 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_10

class opc_11 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_11)
  
  function new(string name = "opc_11");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
 
      req.cw_bus = 14'b1111 ;
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_11


class opc_12 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_12)
  
  function new(string name = "opc_12");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());

      req.cw_bus = 14'b1110 ;
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_12



class opc_13 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_13)
  
  function new(string name = "opc_13");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());

      req.cw_bus = 14'b0011100100111 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_13



class opc_14 extends uvm_sequence#(seq_item) ;
  
  `uvm_object_utils (opc_14)
  
  function new(string name = "opc_14");
    super.new(name);
  endfunction: new
  
    task body() ;
      req = seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());

      req.cw_bus = 14'b0011100100100 ; 
      
      finish_item(req);
      
  endtask ;
  
    endclass: opc_14




class sequenc extends uvm_sequence#(seq_item) ;
  opc_1 opc__1;
  opc_2 opc__2;
  opc_3 opc__3;
  opc_4 opc__4;
  opc_5 opc__5;
  opc_6 opc__6;
  opc_7 opc__7;
  opc_8 opc__8;
  opc_9 opc__9;
  opc_10 opc__10;
  opc_11 opc__11;
  opc_12 opc__12;
  opc_13 opc__13;
  opc_14 opc__14;
  
  `uvm_object_utils(sequenc) ;
  function new(string name = "sequenc");
    super.new(name);
  endfunction: new
  
    virtual task body() ;
      repeat (1) begin
        `uvm_do(opc__1)
        
      end
      
      repeat (1) begin
        `uvm_do(opc__2)
        
      end
      repeat (1) begin
        `uvm_do(opc__3)
        
      end
      repeat (1) begin
        `uvm_do(opc__4)
       
      end
      repeat (1) begin
        `uvm_do(opc__5)
        
      end
      repeat (1) begin
        `uvm_do(opc__6)
        
      end
      repeat (1) begin
        `uvm_do(opc__7)
        
      end
      repeat (1) begin
        `uvm_do(opc__8)
        
      end
      repeat (1) begin
        `uvm_do(opc__9)
        
      end
      repeat (1) begin
        `uvm_do(opc__10)
        
      end
      repeat (1) begin
        `uvm_do(opc__11)
        
      end
      repeat (1) begin
        `uvm_do(opc__12)
        
      end
      repeat (1) begin
        `uvm_do(opc__13)
        
      end
      repeat (1) begin
        `uvm_do(opc__14)
        
      end
       
  endtask

    endclass: sequenc
