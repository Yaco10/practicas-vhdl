entity mux2to1 is
    port (  a, b, sel:in std_logic;
            x: out std_logic;
    );
    end mux2to1

architecture comp of mux2to1 is
    begin
            x <= a when sel='0' else b;
end comp;