module tb_FourBitDecimalCounter;
    // Testbench signals
    reg clk;
    reg reset;
    wire [3:1] ena;
    wire [15:0] q;

    // Instantiate the top module
    FourBitDecimalCounter uut (
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .q(q)
    );

    // Clock generation
    initial begin
        $dumpfile("tb_FourBitDecimalCounter.vcd");
        $dumpvars (0,tb_FourBitDecimalCounter);

   
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;

        // Wait for global reset
        #15;
        reset = 0;

        // Run the simulation for a certain period
        #200;

        // End the simulation
        $stop;
    end
   

    

    
endmodule


