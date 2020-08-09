library verilog;
use verilog.vl_types.all;
entity Neander_vlg_check_tst is
    port(
        Display1        : in     vl_logic_vector(6 downto 0);
        Display2        : in     vl_logic_vector(6 downto 0);
        Display3        : in     vl_logic_vector(6 downto 0);
        Display4        : in     vl_logic_vector(6 downto 0);
        Encerra         : in     vl_logic;
        Saida           : in     vl_logic_vector(7 downto 0);
        tINMEM          : in     vl_logic_vector(15 downto 0);
        tOUTAC          : in     vl_logic_vector(7 downto 0);
        tOUTMEM         : in     vl_logic_vector(15 downto 0);
        tOUTMUX         : in     vl_logic_vector(3 downto 0);
        tOUTPC          : in     vl_logic_vector(3 downto 0);
        tOUTRDM         : in     vl_logic_vector(15 downto 0);
        tOUTREM         : in     vl_logic_vector(3 downto 0);
        tOUTULA         : in     vl_logic_vector(7 downto 0);
        tR              : in     vl_logic;
        tSel            : in     vl_logic;
        tW              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Neander_vlg_check_tst;
