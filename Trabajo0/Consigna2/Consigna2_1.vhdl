entity mux2to1 is
    port (  a, b, sel: std_logic;
            x: out std_logic;
    );
    end mux2to1

architecture comp of mux2to1 is
    begin
        mux2to1: process(a,b,sel)
        begin
            if(sel = '1') then
                x <= a;
            else 
                x <= b;
            end if 
        end process;
end comp;