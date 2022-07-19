--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:22:49 07/19/2022
-- Design Name:   
-- Module Name:   C:/SD/fsm_1proces_botao/td_botao.vhd
-- Project Name:  fsm_1proces_botao
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fsM_1process_botao
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY td_botao IS
END td_botao;
 
ARCHITECTURE behavior OF td_botao IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsM_1process_botao
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         B : IN  std_logic;
         LED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal LED : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsM_1process_botao PORT MAP (
          clk => clk,
          reset => reset,
          B => B,
          LED => LED
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset <= '1';
		b <= '0';
      wait for clk_period*2;
		reset <= '0';
		b <= '0';
		wait for clk_period*2;
		b <= '1';
		wait for clk_period*3;
		b <= '0';
		wait for clk_period*2;
		b <= '1';
		wait for clk_period*5;
		b <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;
