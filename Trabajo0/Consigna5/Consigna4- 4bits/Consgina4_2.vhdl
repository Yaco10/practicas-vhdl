
entity mux4to1 is
    port (  a, b, c, d: in std_logic_vector(3 downto 0);
            sel: in std_logic_vector(1 downto 0)
            x: out std_logic_vector(3 downto 0)
    );
    end mux4to1

architecture compmux4to1 of mux4to1 is
    begin
        x <= a when sel="00" else 
        b when sel = "01" else
        c when sel = "10" else
        d;
        
end compmux4to1;