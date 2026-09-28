----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:07 07/19/2026 
-- Design Name: 
-- Module Name:    SAFETY_RETURN - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SAFETY_RETURN is
    Port ( L : in  STD_LOGIC;
           COUNT : in  STD_LOGIC;
           R : out  STD_LOGIC);
end SAFETY_RETURN;

architecture Behavioral of SAFETY_RETURN is

begin

R <= L AND COUNT;
end Behavioral;

