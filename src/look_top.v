module tt_um_fsm_ChurrasquitoTV (
    input  [7:0] io_in,
    output [7:0] io_out,
    input        clk,      // No usado, clock viene de io_in[0]
    output       clk_out   // No usado, se puede dejar sin conectar
);

    // Mapear entradas desde io_in
    wire clk_in       = io_in[0];
    wire reset        = io_in[1];
    wire enter_btn    = io_in[2];
    wire [3:0] in_digit = io_in[6:3];

    // Salidas internas
    wire locked_led;
    wire unlocked_led;
    wire error_led;
    wire [2:0] state_leds;

    // Módulo principal
    lock_top uut (
        .clk(clk_in),
        .reset(reset),
        .in_digit(in_digit),
        .enter_btn(enter_btn),
        .locked_led(locked_led),
        .unlocked_led(unlocked_led),
        .error_led(error_led),
        .state_leds(state_leds)
    );

    // Asignar salidas a io_out
    assign io_out[0] = locked_led;
    assign io_out[1] = unlocked_led;
    assign io_out[2] = error_led;
    assign io_out[5:3] = state_leds;
    assign io_out[7:6] = 2'b00; // Sin usar
endmodule
