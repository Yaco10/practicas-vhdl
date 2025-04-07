entity mux2to1 is
    port (   sel: in std_logic;
            a, b: in  std_logic_vector(3 downto 0);
               x: out std_logic_vector(3 downto 0);
    );
    end mux2to1

architecture comp of mux2to1 is
    begin
            x <= a when sel='0' else b;
end comp;