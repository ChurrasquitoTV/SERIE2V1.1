module tt_um_ChurrasquitoTV (
    input  [7:0] io_in,
    output [7:0] io_out,
    input        clk,
    output       clk_out,
    input        ena,
    input        rst_n   // <- obligatorio para TinyTapeout
);

    // Señales internas
    wire clk_in       = io_in[0];
    wire reset        = ~rst_n; // <- convertir a activo alto si lo usas así
    wire enter_btn    = io_in[2];
    wire [3:0] in_digit = io_in[6:3];

    wire locked_led;
    wire unlocked_led;
    wire error_led;
    wire [2:0] state_leds;

    // Instancia del módulo funcional
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

    assign io_out[0] = locked_led;
    assign io_out[1] = unlocked_led;
    assign io_out[2] = error_led;
    assign io_out[5:3] = state_leds;
    assign io_out[7:6] = 2'b00;

    assign clk_out = 1'b0;
endmodule

