library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity p1b_tb is
end p1b_tb;

architecture practica of p1b_tb is
    component p1b
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
    end component;

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal wr       : std_logic := '0';
    signal reg1_rd  : std_logic_vector(4 downto 0) := (others => '0');
    signal reg2_rd  : std_logic_vector(4 downto 0) := (others => '0');
    signal reg_wr   : std_logic_vector(4 downto 0) := (others => '0');
    signal data_wr  : std_logic_vector(31 downto 0) := (others => '0');
    signal data1_rd : std_logic_vector(31 downto 0);
    signal data2_rd : std_logic_vector(31 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: p1b
        port map (
            clk      => clk,
            reset    => reset,
            wr       => wr,
            reg1_rd  => reg1_rd,
            reg2_rd  => reg2_rd,
            reg_wr   => reg_wr,
            data_wr  => data_wr,
            data1_rd => data1_rd,
            data2_rd => data2_rd
        );

    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stim_proc : process
    begin
        -- Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Escribir x"AAAABBBB" en el registro 5
        wr <= '1';
        reg_wr <= "00101";
        data_wr <= x"AAAABBBB";
        wait for clk_period;
        wr <= '0';
        wait for clk_period;
	
    	-- Escribir x"BBBBAAA" en el registro pero con wr = 0
   
        reg_wr <= "00110";
        data_wr <= x"BBBBAAAA";
        wait for clk_period;
 
	
        
        
        -- Leer desde el registro 5
        reg1_rd <= "00101";
        wait for clk_period;
        
        -- Leer desde el registro 6 Verificar que no se haya escrito
        reg1_rd <= "00110";
        wait for clk_period;

        -- Verificar que se leyó correctamente
        assert data1_rd = x"AAAABBBB"
        report "Fallo: el valor leído de R5 no es el esperado"
        severity error;

        -- Leer desde el registro 0 (debería dar 0)
        reg2_rd <= "00000";
        wait for clk_period;

        -- Verificar que se leyó 0
        assert data2_rd = x"00000000"
        report "Fallo: el valor leído de R0 debería ser cero"
        severity error;

        wait;
    end process;

end test;
