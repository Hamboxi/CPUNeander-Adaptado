library verilog;
use verilog.vl_types.all;
entity MEM is
    port(
        RDMEntrada      : in     vl_logic_vector(4 downto 0);
        CLK             : in     vl_logic;
        Endereco        : in     vl_logic_vector(1 downto 0);
        Leitura         : in     vl_logic;
        Escrita         : in     vl_logic;
        Encerra         : out    vl_logic;
        Saida           : out    vl_logic_vector(4 downto 0)
    );
end MEM;
