library verilog;
use verilog.vl_types.all;
entity MEM is
    port(
        RDMEntrada      : in     vl_logic_vector(1 downto 0);
        REMEntrada      : in     vl_logic_vector(1 downto 0);
        Endereco        : in     vl_logic_vector(0 downto 0);
        Leitura         : in     vl_logic;
        Escrita         : in     vl_logic;
        Saida           : out    vl_logic_vector(1 downto 0)
    );
end MEM;
