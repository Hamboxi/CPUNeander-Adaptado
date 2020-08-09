library verilog;
use verilog.vl_types.all;
entity Neander is
    port(
        CLK             : in     vl_logic;
        CLKmaq          : in     vl_logic;
        Gravar          : in     vl_logic;
        CargaAC         : in     vl_logic_vector(7 downto 0);
        CargaRDM        : in     vl_logic_vector(15 downto 0);
        CargaPC         : in     vl_logic_vector(3 downto 0);
        CargaREM        : in     vl_logic_vector(3 downto 0);
        Saida           : out    vl_logic_vector(7 downto 0);
        Display4        : out    vl_logic_vector(6 downto 0);
        Display3        : out    vl_logic_vector(6 downto 0);
        Display2        : out    vl_logic_vector(6 downto 0);
        Display1        : out    vl_logic_vector(6 downto 0);
        Encerra         : out    vl_logic;
        tOUTREM         : out    vl_logic_vector(3 downto 0);
        tOUTPC          : out    vl_logic_vector(3 downto 0);
        tOUTMUX         : out    vl_logic_vector(3 downto 0);
        tOUTAC          : out    vl_logic_vector(7 downto 0);
        tOUTULA         : out    vl_logic_vector(7 downto 0);
        tOUTRDM         : out    vl_logic_vector(15 downto 0);
        tOUTMEM         : out    vl_logic_vector(15 downto 0);
        tINMEM          : out    vl_logic_vector(15 downto 0);
        tW              : out    vl_logic;
        tR              : out    vl_logic;
        tSel            : out    vl_logic
    );
end Neander;
