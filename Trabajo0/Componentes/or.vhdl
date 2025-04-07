entity orGate is
    port (  a, b:in std_logic;
            x: out std_logic
    );
    end orGate

architecture comp of orGate is
    begin
        prOR: process(a,b)
        begin
            x <= a or b;
        end process;
end comp;