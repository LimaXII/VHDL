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
           saida : out STD_LOGIC_VECTOR (n-1 downto 0);
           saida2 : out STD_LOGIC_VECTOR (n-1 downto 0);
           saida3 : out STD_LOGIC_VECTOR (n-1 downto 0));
end ula8bits;
architecture Behavioral of ula8bits is

begin
saida <= std_logic_vector(unsigned(A) + unsigned(B)) when sel = "00" else
         std_logic_vector(unsigned(A) - unsigned(B)) when sel = "01" else
         A xor B when sel = "10" else
         not A when sel = "11";

process(A, B, sel)
begin 
    if sel = "00" then
        saida2 <= std_logic_vector(unsigned(A) + unsigned(B));
    elsif sel = "01" then
        saida2 <= std_logic_vector(unsigned(A) - unsigned(B));
    elsif sel = "10" then
        saida2 <= A xor B;
    else 
        saida2 <= not A;
    end if;
end process;
    
process (A,B, sel)
begin
    CASE sel is
        when "00" => saida3 <= std_logic_vector(unsigned(A) + unsigned(B));
        when "01" => saida3 <= std_logic_vector(unsigned(A) - unsigned(B));
        when "10" => saida3 <= A xor B;
        when "11" => saida3 <= not A;
        
    end case;
end process;

end Behavioral;