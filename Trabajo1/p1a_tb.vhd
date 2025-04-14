library ieee;
use ieee.std_logic_1164.all;

entity p1a_tb is
end p1a_tb;

architecture behavior of p1a_tb is

    signal a, b      : std_logic_vector(31 downto 0);
    signal control   : std_logic_vector(2 downto 0);
    signal result    : std_logic_vector(31 downto 0);
    signal zero      : std_logic;

    component p1alu
        port (
            a, b     : in std_logic_vector(31 downto 0);
            control  : in std_logic_vector(2 downto 0);
            zero     : out std_logic;
            result   : out std_logic_vector(31 downto 0)
        );
    end component;

begin

    uut: p1alu port map (
        a       => a,
        b       => b,
        control => control,
        zero    => zero,
        result  => result
    );

    stim_proc: process
    begin
        a <= x"FFFFFFFF"; b <= x"0F0F0F0F"; control <= "000"; wait for 10 ns;
        control <= "001"; wait for 10 ns;

        a <= x"00000005"; b <= x"00000003"; control <= "010"; wait for 10 ns;

        b <= x"0000FFFF"; control <= "100"; wait for 10 ns;

        a <= x"00000008"; b <= x"00000002"; control <= "110"; wait for 10 ns;

        a <= x"00000001"; b <= x"00000002"; control <= "111"; wait for 10 ns;

        a <= x"00000003"; b <= x"00000001"; control <= "111"; wait for 10 ns;

        wait;
    end process;

end behavior;
