library verilog;
use verilog.vl_types.all;
entity Projeto_vlg_sample_tst is
    port(
        Binario         : in     vl_logic_vector(12 downto 0);
        Enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Projeto_vlg_sample_tst;
