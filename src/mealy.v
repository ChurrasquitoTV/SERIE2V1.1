module fsm_mealy (
    input [3:0] digit,
    input [1:0] state,
    input enter,
    output correct_digit
);

    wire [3:0] pin0 = 4'd1;
    wire [3:0] pin1 = 4'd3;
    wire [3:0] pin2 = 4'd9;
    wire [3:0] pin3 = 4'd2;

    reg correct;

    always @(*) begin
        case (state)
            2'd0: correct = (digit == pin0);
            2'd1: correct = (digit == pin1);
            2'd2: correct = (digit == pin2);
            2'd3: correct = (digit == pin3);
            default: correct = 0;
        endcase
    end

    assign correct_digit = enter && correct;
endmodule
