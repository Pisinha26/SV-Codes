`define PERIOD 10ns

module tb;

    realtime TON = `PERIOD * 0.6;
    realtime TOFF = `PERIOD * 0.4;
    
    int clock;

    initial begin
        clock = 1;
    end
    always begin
        #6 clock = 0;
        #4 clock = 1;
    end 

    property check_ton(int ton_time);
        time current_time;
        (1, current_time = $realtime) |=> @(negedge clock) (ton_time == ($realtime-current_time));
    endproperty : check_ton

    property check_toff(int toff_time);
        time current_time;
        (1, current_time = $realtime) |=> @(posedge clock) (toff_time == ($realtime-current_time));
    endproperty : check_toff

    assert property ( @(posedge clock) check_ton(TON))
        $display($time," CHECK_TON : PASS");
    else $warning($time," CHECK_TON : FAIL");

    assert property ( @(negedge clock) check_toff(TOFF))
        $display($time," CHECK_TOFF : PASS\n");
    else $warning($time," CHECK_TOFF : FAIL\n");

    initial begin
        #50 $finish;
    end
endmodule :tb
