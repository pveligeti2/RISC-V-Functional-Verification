//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an imem
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class imem_hazard_transaction
  extends inst_mem_transaction ;

  `uvm_object_utils(imem_hazard_transaction)

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_hazard_transaction");
    super.new(name);
  endfunction

	randc bit [2:0] dr;
	rand bit [2:0]  br; 
    randc bit [8:0] pcoffset9;
	randc bit [5:0] pcoffset6;
	
	constraint hazaer_constraint_for_loads
  	{
    	Instr_dout[15:12] inside { 2, 6, 10, 14 };
		
		if(Instr_dout[15:12] != 6){
			Instr_dout[11:9] == dr;	
			Instr_dout[8:0] == pcoffset9;	
		} 
		else {
			Instr_dout[11:9] == dr;	
			Instr_dout[8:6] == br;	
			Instr_dout[5:0] == pcoffset6;	
		}
    
  	}
    
    function void post_randomize();
      
    endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end