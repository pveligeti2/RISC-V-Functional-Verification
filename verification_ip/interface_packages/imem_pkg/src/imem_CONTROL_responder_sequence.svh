class imem_CONTROL_responder_sequence extends imem_responder_sequence;
    `uvm_object_utils(imem_CONTROL_responder_sequence)

    bit [15:0] Imem_arr [15:0];
    integer count;

    function new(string name = "imem_CONTROL_responder_sequence");
        super.new(name);
        count = 0;
    endfunction

    task body();

        Imem_arr[0] = 16'he000;                                         //LEA 3001 -> R0
        Imem_arr[1] = 16'he200;                                         //LEA 3002 -> R1
        Imem_arr[2] = 16'he400;                                         //LEA 3003 -> R2
        Imem_arr[3] = 16'he600;                                         //LEA 3004 -> R3
        Imem_arr[4] = 16'he800;                                         //LEA 3005 -> R4
        Imem_arr[5] = 16'hea00;                                         //LEA 3006 -> R5
        Imem_arr[6] = 16'hec00;                                         //LEA 3007 -> R6
        Imem_arr[7] = 16'hee00;                                         //LEA 3008 -> R7
        Imem_arr[8] = {4'b0001, 3'b001, 3'b000, 6'b100101};            //ADD R1 R0 #5
        Imem_arr[9] = {4'b0001, 3'b001, 3'b001, 6'b111011};           // ADD R1 R1 #-5
        Imem_arr[10] = {4'b0000, 3'b010, 9'b111111111};                // BRZ PC-1
        Imem_arr[11] = {4'b0001, 3'b010, 3'b001, 6'b100100};           //ADD R2 R1 #4
        Imem_arr[12] = {4'b0000, 3'b100, 9'b111111111};                // BRN PC-1
        Imem_arr[13] = {4'b0001, 3'b010, 3'b010, 6'b111110};           // ADD R2 R2 #-2
        Imem_arr[14] = {4'b0000, 3'b001, 9'b111111111};                // BRP PC-1
        Imem_arr[15] = {4'b1100, 3'b000, 9'b000000000};                // JMP

        req = imem_transaction::type_id::create("req");

        repeat(16) begin
        start_item(req);    
        finish_item(req);
        req.Instr_dout = Imem_arr[count];
        req.complete_instr = 1;  
        `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
        count = count + 1;
        end
    endtask
endclass