// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// Generated by Quartus Prime Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition
// Created on Tue Feb 19 20:30:22 2019

// synthesis message_off 10175

`timescale 1ns/1ns

module SM (
    input logic reset, input logic clock, input logic Exe,
    output logic Add, output logic Sub, output logic Shift, output logic Clr_Ld);

    enum int unsigned { Add0=0, S0=1, Add1=2, S1=3, Add2=4, S2=5, Add3=6, S3=7, Add4=8, S4=9, Add5=10, S5=11, Add6=12, S6=13, Sub7=14, S7=15, Halt=16, Display=17, Start=18 } fstate, reg_fstate;

    always_ff @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always_comb begin
        if (reset) begin
            reg_fstate <= Display;
            Add <= 1'b0;
            Sub <= 1'b0;
            Shift <= 1'b0;
            Clr_Ld <= 1'b0;
        end
        else begin
            Add <= 1'b0;
            Sub <= 1'b0;
            Shift <= 1'b0;
            Clr_Ld <= 1'b0;
            case (fstate)
                Add0: begin
                    reg_fstate <= S0;

                    Add <= 1'b1;
                end
                S0: begin
                    reg_fstate <= Add1;

                    Shift <= 1'b1;
                end
                Add1: begin
                    reg_fstate <= S1;

                    Add <= 1'b1;
                end
                S1: begin
                    reg_fstate <= Add2;

                    Shift <= 1'b1;
                end
                Add2: begin
                    reg_fstate <= S2;

                    Add <= 1'b1;
                end
                S2: begin
                    reg_fstate <= Add3;

                    Shift <= 1'b1;
                end
                Add3: begin
                    reg_fstate <= S3;

                    Add <= 1'b1;
                end
                S3: begin
                    reg_fstate <= Add4;

                    Shift <= 1'b1;
                end
                Add4: begin
                    reg_fstate <= S4;

                    Add <= 1'b1;
                end
                S4: begin
                    reg_fstate <= Add5;

                    Shift <= 1'b1;
                end
                Add5: begin
                    reg_fstate <= S5;

                    Add <= 1'b1;
                end
                S5: begin
                    reg_fstate <= Add6;

                    Shift <= 1'b1;
                end
                Add6: begin
                    reg_fstate <= S6;

                    Add <= 1'b1;
                end
                S6: begin
                    reg_fstate <= Sub7;

                    Shift <= 1'b1;
                end
                Sub7: begin
                    reg_fstate <= S7;

                    Sub <= 1'b1;
                end
                S7: begin
                    reg_fstate <= Halt;

                    Shift <= 1'b1;
                end
                Halt: begin
                    if (Exe)
                        reg_fstate <= Halt;
                    else if (~(Exe))
                        reg_fstate <= Display;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Halt;
                end
                Display: begin
                    if (Exe)
                        reg_fstate <= Start;
                    else if (~(Exe))
                        reg_fstate <= Display;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Display;
                end
                Start: begin
                    reg_fstate <= Add0;

                    Clr_Ld <= 1'b1;
                end
                default: begin
                    Add <= 1'bx;
                    Sub <= 1'bx;
                    Shift <= 1'bx;
                    Clr_Ld <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // SM