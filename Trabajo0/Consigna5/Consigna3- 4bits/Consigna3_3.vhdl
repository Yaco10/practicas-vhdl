entity demux1to2 is
    port (
        sel: in std_logic:
        e: in std_logic_vector(3 downto 0);
        o1, o2: out std_logic_vector(3 downto 0)
    );
end demux1to2;

architecture compdemux of demux1to2 is
    signal not_sel : std_logic_vector(3 downto 0);
    signal sel_bus : std_logic_vector(3 downto 0);

    component notGate
        port (
            a : in std_logic_vector(3 downto 0);
            x : out std_logic_vector(3 downto 0)
        );
    end component;

    component andGate
        port (
            a, b : in std_logic_vector(3 downto 0);
            x : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    sel_bus <= (others => sel);

    notSel: notGate port map (a => sel_bus, x => not_sel);
    and1: andGate port map (a => e, b => not_sel, x => o1);
    and2: andGate port map (a => e, b => sel_bus, x => o2);
end compdemux;

            