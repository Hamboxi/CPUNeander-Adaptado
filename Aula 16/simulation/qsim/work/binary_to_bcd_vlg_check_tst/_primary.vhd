library verilog;
use verilog.vl_types.all;
entity binary_to_bcd_vlg_check_tst is
    port(
        BCD_HUN         : in     vl_logic_vector(3 downto 0);
        BCD_TEN         : in     vl_logic_vector(3 downto 0);
        BCD_THO         : in     vl_logic_vector(3 downto 0);
        BCD_UNI         : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end binary_to_bcd_vlg_check_tst;
