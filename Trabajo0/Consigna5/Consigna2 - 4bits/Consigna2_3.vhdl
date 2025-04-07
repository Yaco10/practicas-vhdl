entity mux2to1 is
    port (   sel: in std_logic;
            p1, p2: in  std_logic_vector(3 downto 0);
               o: out std_logic_vector(3 downto 0);
    );
    end mux2to1

architecture comp of mux2to1 is
    signal not_sel: std_logic_vector(3 downto 0);
    signal sel_bus: std_logic_vector(3 downto 0);
    signal s1, s2: std_logic_vector(3 downto 0);
    component andGate
        port (
            a, b : in std_logic_vector(3 downto 0);
            x : out std_logic_vector(3 downto 0);
        );
    end component;

    component orGate
        port (
            a, b : in std_logic_vector(3 downto 0);
            x : out std_logic_vector(3 downto 0);
        );
    end component;
        
    begin
        sel_bus <= (others => sel);
        not_sel <= not sel_bus;
        

        and1: andGate port map (a => p1, b => not_sel,x => s1)
        and2: andGate port map (a => p2, b => sel_bus,x => s2)
        or1: orGate port map(a => s1, b => s2, x => o )
end comp;