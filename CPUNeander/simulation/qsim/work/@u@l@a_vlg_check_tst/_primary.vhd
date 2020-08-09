library verilog;
use verilog.vl_types.all;
entity ULA_vlg_check_tst is
    port(
        AC              : in     vl_logic_vector(0 downto 0);
        N               : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ULA_vlg_check_tst;
