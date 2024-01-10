//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class imem_memory_responder_sequence 
  extends imem_responder_sequence ;

  `uvm_object_utils( imem_memory_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_memory_responder_sequence");
    super.new(name);
  endfunction
  
  
  

  task body();
    bit [2:0] BaseR = 3'b000;
	bit [5:0] pcoffset6 = 6'b000000;
	bit [2:0] DR = 3'b000;
	bit [2:0] SR1 = 3'b000;
	bit [2:0] SR2 = 3'b000;
	bit [8:0] pcoffset9 = 9'b000000000; 
	
	req=imem_transaction::type_id::create("req");
	
	start_item(req);
	req.Instr_dout = 16'hE000;
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hE200; 
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hE400;
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hE600; 
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hE800; 
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hEA00; 
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hEC00; 
	finish_item(req);
	start_item(req);
	req.Instr_dout = 16'hEE00;
	finish_item(req);
    
		repeat(8) begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = LEA;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:0] = pcoffset9;
			finish_item(req);
			DR = DR + 1'b1;
        end
		DR = 3'b000;
        repeat(8) begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = JMP;
			req.Instr_dout[11:9] = 3'b000;
			req.Instr_dout[8:6] = BaseR;
			req.Instr_dout[5:0] = 6'b00_0000;
			finish_item(req);
			BaseR = BaseR + 1'b1;
        end
		BaseR = 3'b000;
		repeat(8) begin
		  repeat(8) begin
			repeat(64) begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = LDR;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:6] = BaseR;
			req.Instr_dout[5:0] = pcoffset6;
			finish_item(req);
			pcoffset6 = pcoffset6 + 1'b1;
			end
			BaseR = BaseR + 1'b1;
          end
		DR = DR + 1'b1;
	    end
		DR = 3'b000;
		BaseR = 3'b000;
		pcoffset6 = 6'b000000;
		repeat(8) begin
		  repeat(8) begin
			repeat(64) begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = STR;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:6] = BaseR;
			req.Instr_dout[5:0] = pcoffset6;
			finish_item(req);
			pcoffset6 = pcoffset6 + 1'b1;
			end
			BaseR = BaseR + 1'b1;
          end
		DR = DR + 1'b1;
	    end
		DR = 3'b000;
		BaseR = 3'b000;
		pcoffset9 = 9'b000000000;
		repeat(8) begin
		  repeat(512) begin
			
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = STI;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:0] = pcoffset9;
			finish_item(req);
			pcoffset9 = pcoffset9 + 1'b1;
		
          end
		DR = DR + 1'b1;
	    end
	  DR = 3'b000;
	  pcoffset9 = 9'b000000000;
	  repeat(8) begin
		  repeat(512) begin
			
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = LDI;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:0] = pcoffset9;
			finish_item(req);
			pcoffset9 = pcoffset9 + 1'b1;
		
          end
		DR = DR + 1'b1;
	    end
	  DR = 3'b000;
	  pcoffset9 = 9'b000000000;
	  repeat(8) begin
		  repeat(512) begin
			
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = ST;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:0] = pcoffset9;
			finish_item(req);
			pcoffset9 = pcoffset9 + 1'b1;
		
          end
		DR = DR + 1'b1;
	    end
	  DR = 3'b000;
	  pcoffset9 = 9'b000000000;
	  repeat(8) begin
		  repeat(512) begin
			
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = LD;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:0] = pcoffset9;
			finish_item(req);
			pcoffset9 = pcoffset9 + 1'b1;
		
          end
		DR = DR + 1'b1;
	    end
	  DR = 3'b000;
	  pcoffset9 = 9'b000000000;
	  
	  repeat(8) begin
		  repeat(8) begin
			repeat(8)begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = ADD;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:6] = SR1;
			req.Instr_dout[5:3] = 3'b000;
			req.Instr_dout[2:0] = SR2;
			finish_item(req);
			SR2 = SR2 + 1'b1;
			end
			SR1 = SR1 + 1'b1;
          end
		DR = DR + 1'b1;
	    end
		DR = 3'b000;
		SR1 = 3'b000;
		SR2 = 3'b000;
		
		repeat(8) begin
		  repeat(8) begin
			repeat(8)begin
            start_item(req);
            
            req.randomize();
			req.Instr_dout[15:12] = AND;
			req.Instr_dout[11:9] = DR;
			req.Instr_dout[8:6] = SR1;
			req.Instr_dout[5:3] = 3'b000;
			req.Instr_dout[2:0] = SR2;
			finish_item(req);
			SR2 = SR2 + 1'b1;
			end
			SR1 = SR1 + 1'b1;
          end
		DR = DR + 1'b1;
	    end
		DR = 3'b000;
		SR1 = 3'b000;
		SR2 = 3'b000;
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      //`uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    
	//`uvm_info("WAW",$sformatf("finished"),UVM_LOW)
	
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end