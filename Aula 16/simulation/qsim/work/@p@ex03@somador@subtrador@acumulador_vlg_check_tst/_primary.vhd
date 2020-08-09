library verilog;
use verilog.vl_types.all;
entity PEx03SomadorSubtradorAcumulador_vlg_check_tst is
    port(
        Acumulador      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end PEx03SomadorSubtradorAcumulador_vlg_check_tst;
