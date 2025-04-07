entity mux4to1 is
    port (  a, b, c, d: in std_logic_vector(3 downto 0);
            sel: in std_logic_vector(1 downto 0)
            x: out std_logic_vector(3 downto 0;
    );
    end mux4to1

architecture compmux4to1 of mux4to1 is
    begin
        mux4to1: process(a,b,c,d,sel)
        begin
            case sel is
                when “00” =>
                    x <= a;
                when “01” =>   
                    x <= b;
                when “10” =>
                    x <= c;
                when others =>
                    x <= d;
            end case;
        end process;
end compmux4to1;