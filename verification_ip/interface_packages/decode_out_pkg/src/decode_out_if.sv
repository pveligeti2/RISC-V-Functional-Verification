//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the decode_out interface signals.
//      It is instantiated once per decode_out bus.  Bus Functional Models, 
//      BFM's named decode_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named decode_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(decode_out_bus.E_control), // Agent input 
// .dut_signal_port(decode_out_bus.Mem_Control), // Agent input 
// .dut_signal_port(decode_out_bus.npc_out), // Agent input 
// .dut_signal_port(decode_out_bus.W_control), // Agent input 
// .dut_signal_port(decode_out_bus.IR), // Agent input 

import uvmf_base_pkg_hdl::*;
import decode_out_pkg_hdl::*;

interface  decode_out_if 

  (
  input tri clock, 
  input tri reset,
  inout tri [5:0] E_control,
  inout tri  Mem_Control,
  inout tri [15:0] npc_out,
  inout tri [1:0] W_control,
  inout tri [15:0] IR,
  inout tri en_decode
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input E_control,
  input Mem_Control,
  input npc_out,
  input W_control,
  input IR,
  input en_decode
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input E_control,
  input Mem_Control,
  input npc_out,
  input W_control,
  input IR,
  input en_decode
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output E_control,
  output Mem_Control,
  output npc_out,
  output W_control,
  output IR,
  output en_decode
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

