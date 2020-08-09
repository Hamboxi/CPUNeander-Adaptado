library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        CLK             : in     vl_logic;
        X               : in     vl_logic_vector(0 downto 0);
        Y               : in     vl_logic_vector(0 downto 0);
        SelULA          : in     vl_logic_vector(2 downto 0);
        AC              : out    vl_logic_vector(0 downto 0);
        N               : out    vl_logic;
        Z               : out    vl_logic
    );
end ULA;
