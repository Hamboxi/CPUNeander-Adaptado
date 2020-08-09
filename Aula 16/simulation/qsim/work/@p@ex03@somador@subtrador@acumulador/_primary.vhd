library verilog;
use verilog.vl_types.all;
entity PEx03SomadorSubtradorAcumulador is
    port(
        Bin             : in     vl_logic_vector(3 downto 0);
        Chave           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Acumulador      : out    vl_logic_vector(3 downto 0)
    );
end PEx03SomadorSubtradorAcumulador;
