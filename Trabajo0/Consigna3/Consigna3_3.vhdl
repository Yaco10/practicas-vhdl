entity demux1to2 is
    port (
        e, sel: in std_logic;
        o1, o2: out std_logic
    );
end demux1to2;

architecture compdemux of demux1to2 is
    signal not_sel: std_logic

    component notGate
        port (
            a : in std_logic;
            x : out std_logic
        );
    end component;

    component andGate
        port (
            a, b : in std_logic;
            x : out std_logic
        );
    end component;

    begin
        notSel: notGate port map (a => sel, x => not_sel)
        and1: andGate port map (a => e, b => not_sel, x => o1)
        and2: andGate port map (a => e, b => sel, x => o2)
    
    end compdemux

            