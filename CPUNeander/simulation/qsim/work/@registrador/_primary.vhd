library verilog;
use verilog.vl_types.all;
entity Registrador is
    port(
        X               : in     vl_logic_vector(0 downto 0);
        L               : in     vl_logic;
        Carga           : in     vl_logic_vector(0 downto 0);
        Saida           : out    vl_logic_vector(0 downto 0)
    );
end Registrador;
