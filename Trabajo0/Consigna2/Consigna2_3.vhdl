entity mux2to1 is
    port (  p1, p2, sel:in std_logic;
            s1, s2, o: out std_logic;
    );
    end mux2to1

architecture comp of mux2to1 is
    signal not_sel: std_logic

    component andGate
        port (
            a, b : in std_logic;
            x : out std_logic
        );
    end component;

    component orGate
        port (
            a, b : in std_logic;
            x : out std_logic
        );
    end component;
        
    begin
        not_sel <= not sel;

        and1: andGate port map (a => p1, b => not_sel,x => s1)
        and2: andGate port map (b => p2, b => sel,x => s2)
        or1: orGate port map(a => s1, b => s2, x => o )
end comp;