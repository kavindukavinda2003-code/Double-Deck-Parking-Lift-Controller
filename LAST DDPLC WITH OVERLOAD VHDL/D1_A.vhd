----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:18:28 07/19/2026 
-- Design Name: 
-- Module Name:    D1_A - Behavioral 
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

entity D1_AV is
    Port ( S : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D1_A : inout  STD_LOGIC);
end D1_AV;

architecture Behavioral of D1_AV is

begin

 D1_A <= S AND (NOT D1);
end Behavioral;

