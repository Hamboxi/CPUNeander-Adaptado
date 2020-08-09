library verilog;
use verilog.vl_types.all;
entity Projeto_vlg_check_tst is
    port(
        Display1        : in     vl_logic_vector(6 downto 0);
        Display2        : in     vl_logic_vector(6 downto 0);
        Display3        : in     vl_logic_vector(6 downto 0);
        Display4        : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Projeto_vlg_check_tst;
