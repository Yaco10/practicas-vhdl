entity comparator is 
    port (
        a,b: in std_logic_vector(1 downto 0);
        e,g: out bit
    );
end comparator;

architecture compcomparator of comparator is
    begin
        prComp: process(a,b)
        begin
            if (a > b) then
                g <= '1';
                e <= '0';
            else if (a = b) then
                g <= '0';
                e <= '1';
            else
                g <= '0';
                e <= '0';
            end if;
        end process;
    end compcomparator;
        
            

