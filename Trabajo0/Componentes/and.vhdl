entity andGate is
    port (  a, b:in std_logic;
            x: out std_logic
    );
    end andGate;

architecture compand of andGate is
    begin
        prAnd: process(a,b)
        begin
            x <= a and b;
        end process;
end compand;