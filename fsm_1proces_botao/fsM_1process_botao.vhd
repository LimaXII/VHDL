----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:04:24 07/19/2022 
-- Design Name: 
-- Module Name:    fsM_1process_botao - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsM_1process_botao is
Port (clk : in std_logic;
		reset: in std_logic;
		B : in std_logic;
		LED : out std_logic);
end fsM_1process_botao;

architecture Behavioral of fsM_1process_botao is
type estados is (s0,s1,s2,s3,s4);
signal state : estados;
signal cont : std_logic_vector(3 downto 0);
begin
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
			cont <= (others => '0');
		elsif(clk'event and clk = '1') then
			case state is
				when s0 => LED <= '0';
					cont <= "0000";
					if B = '0' then
						state <= s0;
					else
						state <= s1;
					end if;
				when s1 =>
					if B = '0' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2 =>
					if B = '0' then
						state <= s2;
					else
						state <= s3;
					end if;
				when s3 => cont <= std_logic_vector(unsigned(cont)+1);
					LED <= '1';
					if cont = "1010" then
						state <= s4;
					else
						state <= s3;
					end if;
				when s4 => LED <= '0';
					if B = '0' then
						state <= s0;
					else
						state <= s4;
					end if;
				when others => LED <= '0';
					cont <= "0000";
					state <= s0;
					end case;
					end if;
					end process;
					
end Behavioral;

