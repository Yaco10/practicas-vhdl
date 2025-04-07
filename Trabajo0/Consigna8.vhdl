entity fullAdder8 is
    port(
        a,b: in std_logic_vector(7 downto 0);
        s: out std_logic_vector(7 downto 0)
    );
end fullAdder8;

architecture compFa8 of fullAdder8 is
    signal cout_bus: std_logic_vector(7 downto 0);
    component fullAdder
        port(
            i1, i2, cin: in std_logic;
            o, cout: out std_logic
        );
    end component;
    begin
        fullAdder1: fullAdder port map(i1 => a(0), i2 => b(0), cin => '0', o => s(0), cout => cout_bus(0));
        fullAdder2: fullAdder port map(i1 => a(1), i2 => b(1), cin => cout_bus(0), o => s(1), cout => cout_bus(1));
        fullAdder3: fullAdder port map(i1 => a(2), i2 => b(2), cin => cout_bus(1), o => s(2), cout => cout_bus(2));
        fullAdder4: fullAdder port map(i1 => a(3), i2 => b(3), cin => cout_bus(2), o => s(3), cout => cout_bus(3));
        fullAdder5: fullAdder port map(i1 => a(4), i2 => b(4), cin => cout_bus(3), o => s(4), cout => cout_bus(4));
        fullAdder6: fullAdder port map(i1 => a(5), i2 => b(5), cin => cout_bus(4), o => s(5), cout => cout_bus(5));
        fullAdder7: fullAdder port map(i1 => a(6), i2 => b(6), cin => cout_bus(5), o => s(6), cout => cout_bus(6));
        fullAdder8: fullAdder port map(i1 => a(7), i2 => b(7), cin => cout_bus(6), o => s(7), cout => cout_bus(7));
    end compFa8;