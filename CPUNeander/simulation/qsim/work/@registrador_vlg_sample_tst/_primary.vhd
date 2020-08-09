library verilog;
use verilog.vl_types.all;
entity Registrador_vlg_sample_tst is
    port(
        Carga           : in     vl_logic_vector(0 downto 0);
        L               : in     vl_logic;
        X               : in     vl_logic_vector(0 downto 0);
        sampler_tx      : out    vl_logic
    );
end Registrador_vlg_sample_tst;
