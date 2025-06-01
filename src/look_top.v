module lock_top (
    input clk,
    input reset,
    input [3:0] in_digit,
    input enter_btn,
    output locked_led,
    output unlocked_led,
    output error_led,
    output [2:0] state_leds
);

    wire slow_clk;
    wire [1:0] state;
    wire correct_digit;

    slow_clock clkgen (
        .clk(clk),
        .reset(reset),
        .clk_out(slow_clk)
    );

    fsm_moore fsm_ctrl (
        .clk(slow_clk),
        .reset(reset),
        .enter(enter_btn),
        .correct_digit(correct_digit),
        .state(state),
        .locked_led(locked_led),
        .unlocked_led(unlocked_led),
        .error_led(error_led),
        .state_leds(state_leds)
    );

    fsm_mealy fsm_verify (
        .digit(in_digit),
        .state(state),
        .enter(enter_btn),
        .correct_digit(correct_digit)
    );
endmodule
