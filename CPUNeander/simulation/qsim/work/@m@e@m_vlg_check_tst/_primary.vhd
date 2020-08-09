library verilog;
use verilog.vl_types.all;
entity MEM_vlg_check_tst is
    port(
        Encerra         : in     vl_logic;
        Saida           : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end MEM_vlg_check_tst;
