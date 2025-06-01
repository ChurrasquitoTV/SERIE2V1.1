module tt_um_ChurrasquitoTV (
    input  [7:0] io_in,
    output [7:0] io_out,
    input        clk,       // No usado, usa io_in[0]
    output       clk_out,   // No usado
    input        ena        // Requerido por TinyTapeout (aunque no lo uses)
);
    // Mapear entradas
    wire clk_in       = io_in[0];
    wire reset        = io_in[1];
    wire enter_btn    = io_in[2];
    wire [3:0] in_digit = io_in[6:3];

    // Salidas
    wire locked_led;
    wire unlocked_led;
    wire error_led;
    wire [2:0] state_leds;

    // Instancia del módulo principal
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
    assign io_out[0] = locked_led;
    assign io_out[1] = unlocked_led;
    assign io_out[2] = error_led;
    assign io_out[5:3] = state_leds;
    assign io_out[7:6] = 2'b00;

    assign clk_out = 1'b0; // sin uso real
endmodule

