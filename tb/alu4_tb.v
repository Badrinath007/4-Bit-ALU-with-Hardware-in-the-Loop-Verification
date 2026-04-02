`timescale 1ns/1ps

module alu4_tb();
    // Inputs
    reg [2:0] opcode;
    reg clk;
    // Outputs
    wire [3:0] y;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    alu4 uut (
        .clk(clk),
        .opcode(opcode),
        .y(y),
        .cout(cout)
    );

    // Clock generation (for the heartbeat)
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $display("Starting ALU Verification...");
        
        // Test Case 1: ADD (5 + 3 = 8)
        opcode = 3'b000; #20;
        if (y == 4'b1000) $display("ADD Pass: 5+3=8"); else $display("ADD Fail!");

        // Test Case 2: SUB (5 - 3 = 2)
        opcode = 3'b001; #20;
        if (y == 4'b0010) $display("SUB Pass: 5-3=2"); else $display("SUB Fail!");

        // Test Case 3: AND (5 & 3 = 1)
        opcode = 3'b010; #20;
        if (y == 4'b0001) $display("AND Pass: 5&3=1"); else $display("AND Fail!");

        $display("Verification Complete.");
        $finish;
    end
endmodule
