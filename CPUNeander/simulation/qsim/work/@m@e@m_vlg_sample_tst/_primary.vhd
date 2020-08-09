library verilog;
use verilog.vl_types.all;
entity MEM_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Endereco        : in     vl_logic_vector(1 downto 0);
        Escrita         : in     vl_logic;
        Leitura         : in     vl_logic;
        RDMEntrada      : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end MEM_vlg_sample_tst;
