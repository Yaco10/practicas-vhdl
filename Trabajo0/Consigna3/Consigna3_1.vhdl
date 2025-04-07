entity demux1to2 is
    port (
        sel: in std_logic;
        o,  in std_logic_vector(3 downto 0);
        a, b: out std_logic_vector(3 downto 0)
    );
end demux1to2;

architecture compdemux of demux1to2 is
    begin
    prDem: process(o)
        begin
            if (sel = '0') then 
                a <= o;
                b <= '0';
            else
                a <= '0';
                b <= o;
            end if;
        end process
    end compdemux

            