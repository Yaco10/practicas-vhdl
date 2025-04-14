library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all; 

entity p1a is
    port (
        a, b    : in std_logic_vector(31 downto 0);
        control : in std_logic_vector(2 downto 0);
        zero    : out std_logic;
        result  : out std_logic_vector(31 downto 0)
    );
end p1a;

architecture practica of p1a is
    signal result_internal : std_logic_vector(31 downto 0);
begin
    prAlu: process(a, b, control)
    begin
        case control is
            when "000" =>
                result_internal <= a and b;

            when "001" =>
                result_internal <= a or b;

            when "010" =>
                result_internal <= a + b;

            when "100" =>
                result_internal <= b(15 downto 0) & x"0000";

            when "110" =>
                result_internal <= a - b;

            when "111" =>
                if a < b then
                    result_internal <= (31 downto 1 => '0') & '1';
                else
                    result_internal <= (others => '0');
                end if;

            when others =>
                result_internal <= (others => '0');
        end case;
    end process;

    result <= result_internal;
    zero <= '1' when result_internal = x"00000000" else '0';
end practica;


