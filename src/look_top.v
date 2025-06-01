module tt_um_ChurrasquitoTV (
    input  [7:0] ui_in,
    output [7:0] uo_out,
    input  [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe,
    input        clk,
    input        rst_n,
    input        ena
);

    // Entradas del usuario
    wire clk_in       = ui_in[0];
    wire reset        = ~rst_n;
    wire enter_btn    = ui_in[2];
    wire [3:0] in_digit = ui_in[6:3];

    // Salidas internas
    wire locked_led;
    wire unlocked_led;
    wire error_led;
    wire [2:0] state_leds;

    // Instancia de tu módulo funcional
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

    // Asignaciones de salida
    assign uo_out[0] = locked_led;
    assign uo_out[1] = unlocked_led;
    assign uo_out[2] = error_led;
    assign uo_out[5:3] = state_leds;
    assign uo_out[7:6] = 2'b00;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule

