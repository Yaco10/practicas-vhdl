--1) Determine si el código VHDL (cod. 1) describe el comportamiento de la función s =
--OR (a(2), a(1), a(0)). Modifique el contenido del proceso PrOR para que describa la
--función requerida en el caso que el código no deseado.

entity nombre_entidad is
    port (  a: in std_logic_vector(2 downto 0);
            s: out std_logic;
    );
    end nombre_entidad

architecture nombre_arquitectura of nombre_entidad is
    begin
        prOR: process(a)
        begin
            s <= a(2) or a(1) or a(0)
        end process
end nombre_enarquitectura