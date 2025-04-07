entity demux1to2 is
    port (
        sel: in std_logic:
        o: in std_logic_vector(3 downto 0);
        a, b: out std_logic_vector(3 downto 0)
    );
end demux1to2;

architecture compdemux of demux1to2 is
    begin
        a <= o when sel='0' (others => '0');
        b <= o when sel='1' (others => '0');
    end compdemux

            