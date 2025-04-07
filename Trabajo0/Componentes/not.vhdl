entity notGate is
    port (  a: in std_logic;
            x: out std_logic
    );
    end notGate;

architecture compnot of notGate is
    begin
        prNot: process(a)
        begin
            x <= not a;
        end process;
end compnot;