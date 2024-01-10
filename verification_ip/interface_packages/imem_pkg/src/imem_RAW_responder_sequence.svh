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

class imem_RAW_responder_sequence 
  extends imem_responder_sequence ;

  `uvm_object_utils( imem_RAW_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_RAW_responder_sequence");
    super.new(name);
  endfunction
  
  bit [2:0] raw_dr = 3'b000;
  bit [2:0] raw_sr1 = 3'b000;
  bit [2:0] raw_sr2 = 3'b000;
  bit [4:0] raw_imm5 = 5'b000;
  bit [8:0] raw_pcoffset9 = 9'b0_0000_0000;
  
  bit [15:0] Instruction[bit[15:0]];
  
  virtual function void load();
        
		int addr_o = 16'h3008;
        Instruction[16'h3000] = 16'hE000; 
        Instruction[16'h3001] = 16'hE200; 
        Instruction[16'h3002] = 16'hE400; 
        Instruction[16'h3003] = 16'hE600; 
        Instruction[16'h3004] = 16'hE800; 
        Instruction[16'h3005] = 16'hEA00; 
        Instruction[16'h3006] = 16'hEC00; 
        Instruction[16'h3007] = 16'hEE00; 
		
		
		//NOT
        for(int i=0; i<8; i++)begin
            for(int j=0; j<8; j++)begin
					raw_dr = i;
					raw_sr1 = j;
					Instruction[addr_o] = {NOT, raw_dr, raw_sr1, 6'b111111}; 
                    addr_o++;
            end
        end
		
		for(int i= 0; i<8; i++) begin
                for(int j =0; j<512; j++) begin
                raw_dr = i;
				raw_pcoffset9 = j;
                    Instruction[addr_o] = {LEA, raw_dr, raw_pcoffset9};
                    addr_o++;
                    
                    end
              
            end
			
			
			
		
		
    endfunction
  

  task body();
    
	bit[15:0] gold_pc = 16'h3000;
	req=imem_transaction::type_id::create("req");
    load();

        forever begin
            start_item(req);
            
            if(Instruction.exists(gold_pc))begin
                req.Instr_dout = Instruction[gold_pc];
                gold_pc++;
            end 
			else begin
                req.Instr_dout = Instruction[16'h3008];
            end
			finish_item(req);
        end
	  
	  
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