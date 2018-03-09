module ALU(
    input[2:0] mode,
    input[7:0] reg1,
    input[7:0] reg2,
    output reg[7:0] out
);
    // Interface:
    // mode 0 - Add
    // mode 1 - Sub
    // mode 2 - And
    // mode 3 - Or
    // mode 4 - Not
    // mode 5 - Xor
    
    wire[7:0] addOut;
    FA fa0(reg1,reg2,addOut);
    
    wire[7:0] subOut;
    FS fs0(reg1,reg2,subOut);
    
    wire[7:0] andOut;
    AND and0(reg1,reg2,andOut);
    
    wire[7:0] orOut;
    OR or0(reg1,reg2,orOut);
    
    wire[7:0] notOut;
    NOT not0(reg1,notOut);
    
    wire[7:0] xorOut;
    XOR xor0(reg1,reg2,xorOut);

    always@(*)case(mode)
    0: out =addOut;
    1: out =subOut;
    2: out =andOut;
    3: out =orOut;
    4: out =notOut;
    5: out =xorOut;
    default: out =0;
    endcase
    
endmodule
