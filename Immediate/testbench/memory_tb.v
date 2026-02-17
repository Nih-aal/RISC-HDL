`timescale 1ns / 1ps

module tb_DataMemory();

    reg clk;
    reg reset;
    reg [9:0] address;
    reg [63:0] write_data;
    reg MemRead;
    reg MemWrite;

    wire [63:0] read_data;

    DataMemory uut (
        .clk(clk),
        .reset(reset),
        .address(address),
        .write_data(write_data),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(read_data)
    );

    always #5 clk = ~clk; // 10 ns period

    initial begin

        $dumpfile("GTK/memory.vcd");
        $dumpvars(0, tb_DataMemory);

        // Signal Initialisation
        clk = 0;
        reset = 0;
        address = 0;
        write_data = 0;
        MemRead = 0;
        MemWrite = 0;

        // Reset
        $display("Applying Reset...");
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Writing 0x1122334455667788 to address 0
        $display("Writing Data: 0x1122334455667788 to Address 0");
        address = 10'd0;
        write_data = 64'h1122334455667788;
        MemWrite = 1;
        #10; 
        MemWrite = 0;

        // Reading back the data 
        #10;
        MemRead = 1;
        address = 10'd0;
        
        $display("Read Data: %h", read_data);
        
        if (read_data == 64'h1122334455667788)
            $display("Test Passed: Big Endian match!");
        else
            $display("Test Failed: Data mismatch!");
            
        MemRead = 0;

        // Final Dump 
        // Some delay later for now
        #50;
        save_memory_to_file();
        
        $display("Memory dumped to data_mem.txt. Simulation finished.");
        $finish;
    end

    // Saving memory contents to file
    task save_memory_to_file;
        begin
            // h stands for hex
            $writememh("data_mem.txt", uut.mem);
        end
    endtask

endmodule