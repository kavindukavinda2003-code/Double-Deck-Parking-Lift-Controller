----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:01:29 07/19/2026 
-- Design Name: 
-- Module Name:    D1 - Behavioral 
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

entity D1 is
    Port ( Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D1 : inout  STD_LOGIC);
end D1;

architecture Behavioral of D1 is

begin
 D1 <= ((NOT Q2) AND Q1 AND (NOT Q0)) OR ((NOT Q3) AND Q1 AND (NOT Q0)) OR ((NOT Q2) AND (NOT Q1) AND Q0) OR ((NOT Q3) AND (NOT Q1) AND Q0);

end Behavioral;

