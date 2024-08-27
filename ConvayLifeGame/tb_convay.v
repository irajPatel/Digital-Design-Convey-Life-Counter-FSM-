`timescale 1ns / 1ps

module tb_convay;

    // Inputs
    reg clk;
    reg load;
    reg [255:0] data;

    // Outputs
    wire [255:0] q;

    // Instantiate the Unit Under Test (UUT)
    Convay uut (
        .clk(clk),
        .load(load),
        .data(data),
        .q(q)
    );

    // Clock generation
    initial begin
        $dumpfile("tb_convay.vcd");
        $dumpvars (0,tb_convay);
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        // Initialize Inputs
        load = 0;
        data = 256'b0;

        // Apply initial load and start simulation
        #10;
        load = 1;
        data = 256'b00000000000000000000000000000001_00000000000000000000000000000010_00000000000000000000000000000100_00000000000000000000000000001000_00000000000000000000000000010000_00000000000000000000000000100000_00000000000000000000000001000000_00000000000000000000000010000000_00000000000000000000000100000000_00000000000000000000001000000000_00000000000000000000010000000000_00000000000000000000100000000000_00000000000000000001000000000000_00000000000000000010000000000000_00000000000000000100000000000000_00000000000000001000000000000000;
        #10;
        load = 0;

        // Run for several clock cycles to observe the evolution of the game
        #100;
        
        // End the simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("At time %t, q = %h", $time, q);
    end

endmodule
