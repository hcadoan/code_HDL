library verilog;
use verilog.vl_types.all;
entity bcd3digit_vlg_check_tst is
    port(
        bcd0            : in     vl_logic_vector(3 downto 0);
        bcd1            : in     vl_logic_vector(3 downto 0);
        bcd2            : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end bcd3digit_vlg_check_tst;
