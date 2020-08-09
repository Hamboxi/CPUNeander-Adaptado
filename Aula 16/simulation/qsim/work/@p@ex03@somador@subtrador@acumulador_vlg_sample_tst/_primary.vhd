library verilog;
use verilog.vl_types.all;
entity PEx03SomadorSubtradorAcumulador_vlg_sample_tst is
    port(
        Bin             : in     vl_logic_vector(3 downto 0);
        Chave           : in     vl_logic;
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PEx03SomadorSubtradorAcumulador_vlg_sample_tst;
