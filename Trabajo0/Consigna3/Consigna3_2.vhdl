entity demux1to2 is
    port (
        o, sel: in std_logic;
        a, b: out std_logic
    );
end demux1to2;

architecture compdemux of demux1to2 is
    begin
        a <= o when sel='0' else '0'
        b <= o when sel='1' else '0'
    end compdemux

            