library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity p1b is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        wr       : in  std_logic;
        reg1_rd  : in  std_logic_vector(4 downto 0);
        reg2_rd  : in  std_logic_vector(4 downto 0);
        reg_wr   : in  std_logic_vector(4 downto 0);
        data_wr  : in  std_logic_vector(31 downto 0);
        data1_rd : out std_logic_vector(31 downto 0);
        data2_rd : out std_logic_vector(31 downto 0)
    );
end p1b;

architecture practica of p1b is
    type reg_array_t is array (0 to 31) of std_logic_vector(31 downto 0);
    signal Regs : reg_array_t := (others => (others => '0'));
begin

    -- Proceso combinacional de lectura
    process (reg1_rd, reg2_rd, Regs)
    begin
        if reg1_rd /= "00000" then
            data1_rd <= Regs(conv_integer(reg1_rd));
        else
            data1_rd <= x"00000000";
        end if;

        if reg2_rd /= "00000" then
            data2_rd <= Regs(conv_integer(reg2_rd));
        else
            data2_rd <= x"00000000";
        end if;
    end process;

    process (clk, reset)
    begin
        if reset = '1' then
            Regs <= (others => (others => '0'));
        elsif falling_edge(clk) then
            if wr = '1' and reg_wr /= "00000" then
                Regs(conv_integer(reg_wr)) <= data_wr;
            end if;
        end if;
    end process;

end practica;

