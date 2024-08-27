`timescale 1ns/1ps

module tb_FSM_Seq;

    // Inputs
    reg clk;
    reg reset;
    reg data;
    reg done_counting;
    reg ack;

    // Outputs
    wire shift_ena;
    wire counting;
    wire done;

    // Instantiate the FSM_Seq module
    FSM_Seq uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .shift_ena(shift_ena),
        .counting(counting),
        .done(done),
        .done_counting(done_counting),
        .ack(ack)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns period, 100MHz clock

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        data = 0;
        done_counting = 0;
        ack = 0;

        // Apply reset
        #10;
        reset = 0;

        // Sequence detection of 1101
        #10 data = 1;  // S -> S1
        #10 data = 1;  // S1 -> S11
        #10 data = 0;  // S11 -> S110
        #10 data = 1;  // S110 -> B0

        // Shifting 4 bits (B0, B1, B2, B3)
        #40;           // 4 clock cycles

        // Counting state
        done_counting = 0;  // Counting not yet done
        #20 done_counting = 1;  // Move to waiting for ack

        // Acknowledgment
        #20 ack = 1;  // FSM should reset to start looking for the pattern again

        // Finish simulation
        #20 $finish;
    end

    initial begin
        $dumpfile("tb_FSM_Seq.vcd");  // Dump waveform
        $dumpvars(0, tb_FSM_Seq);     // Dump all variables
    end

endmodule
