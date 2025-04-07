entity mux4to1 is
    port (  a, b, c, d: in std_logic_vector(3 downto 0);
            sel: in std_logic_vector(1 downto 0)
            o: out std_logic_vector(3 downto 0)
    );
    end mux4to1

architecture compmux4to1 of mux4to1 is
    signal o1, o2: std_logic_vector(3 downto 0);

    component mux2to1
        port (
            i1, i2: in std_logic_vector(3 downto 0);
            sel: in std_logic;
            x : out std_logic_vector(3 downto 0):
        );
    end component;
    
    begin
        mux1: mux2to1 port map(i1 => a, i2 => b, sel => sel(0), x => o1)
        mux2: mux2to1 port map(i1 => c, i2 => d, sel => sel(0), x => o2)
        mux3: mux2to1 port map(i1 => o1, i2 => o2, sel => sel(1), x => o)     
end compmux4to1;