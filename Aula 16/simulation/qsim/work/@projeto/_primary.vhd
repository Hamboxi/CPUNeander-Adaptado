library verilog;
use verilog.vl_types.all;
entity Projeto is
    port(
        Binario         : in     vl_logic_vector(12 downto 0);
        Enable          : in     vl_logic;
        Display4        : out    vl_logic_vector(6 downto 0);
        Display3        : out    vl_logic_vector(6 downto 0);
        Display2        : out    vl_logic_vector(6 downto 0);
        Display1        : out    vl_logic_vector(6 downto 0)
    );
end Projeto;
