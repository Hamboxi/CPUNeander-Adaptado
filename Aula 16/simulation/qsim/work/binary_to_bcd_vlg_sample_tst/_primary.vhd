library verilog;
use verilog.vl_types.all;
entity binary_to_bcd_vlg_sample_tst is
    port(
        BINARY          : in     vl_logic_vector(12 downto 0);
        EN              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end binary_to_bcd_vlg_sample_tst;
