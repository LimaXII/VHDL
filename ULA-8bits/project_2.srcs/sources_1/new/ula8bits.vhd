----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.07.2022 08:43:34
-- Design Name: 
-- Module Name: ula8bits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ula8bits is
generic(n: natural := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           saida : out STD_LOGIC_VECTOR (n-1 downto 0));
end ula8bits;
architecture Behavioral of ula8bits is

begin
saida <= std_logic_vector(unsigned(A) + unsigned(B)) when sel = "00" else
         std_logic_vector(unsigned(A) - unsigned(B)) when sel = "01" else
         A xor B when sel = "10" else
         not A when sel = "11";

end Behavioral;
