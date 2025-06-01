module fsm_moore (
    input clk,
    input reset,
    input enter,
    input correct_digit,
    output [1:0] state,
    output locked_led,
    output unlocked_led,
    output error_led,
    output [2:0] state_leds
);

    reg [1:0] current, next;

    // Estados codificados
    localparam S0 = 2'd0;
    localparam S1 = 2'd1;
    localparam S2 = 2'd2;
    localparam S3 = 2'd3;

    // Lógica secuencial
    always @(posedge clk or posedge reset) begin
        if (reset)
            current <= S0;
        else if (enter)
            current <= next;
    end

    // Lógica combinacional
    always @(*) begin
        next = current;
        case (current)
            S0: next = (enter && correct_digit) ? S1 : S0;
            S1: next = (enter && correct_digit) ? S2 :
                       (enter && !correct_digit) ? S0 : S1;
            S2: next = (enter && correct_digit) ? S3 :
                       (enter && !correct_digit) ? S0 : S2;
            S3: next = (enter) ? S0 : S3;
            default: next = S0;
        endcase
    end

    assign state = current;
    assign locked_led = (current != S3);
    assign unlocked_led = (current == S3);
    assign error_led = (enter && !correct_digit && current != S3);
    assign state_leds = {1'b0, current}; // Ajuste a 3 bits
endmodule
