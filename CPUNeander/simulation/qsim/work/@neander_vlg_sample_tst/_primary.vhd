library verilog;
use verilog.vl_types.all;
entity Neander_vlg_sample_tst is
    port(
        CargaAC         : in     vl_logic_vector(7 downto 0);
        CargaPC         : in     vl_logic_vector(3 downto 0);
        CargaRDM        : in     vl_logic_vector(15 downto 0);
        CargaREM        : in     vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        CLKmaq          : in     vl_logic;
        Gravar          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Neander_vlg_sample_tst;
