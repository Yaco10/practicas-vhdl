entity fullAdder is
    port (
        a, b, cin: in std_logic;
        s, cout: out std_logic
    );
end fullAdder;

architecture compfa of fullAdder is
    begin
        s <= (a xor b) xor cin
        cout <= ((a xor b) and cin) or (a and b)
    end compfa
    