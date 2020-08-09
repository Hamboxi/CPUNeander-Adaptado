library verilog;
use verilog.vl_types.all;
entity binary_to_bcd is
    port(
        EN              : in     vl_logic;
        BINARY          : in     vl_logic_vector(12 downto 0);
        BCD_UNI         : out    vl_logic_vector(3 downto 0);
        BCD_TEN         : out    vl_logic_vector(3 downto 0);
        BCD_HUN         : out    vl_logic_vector(3 downto 0);
        BCD_THO         : out    vl_logic_vector(3 downto 0)
    );
end binary_to_bcd;
