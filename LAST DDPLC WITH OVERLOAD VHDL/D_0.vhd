----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:05 07/22/2026 
-- Design Name: 
-- Module Name:    D_0 - Behavioral 
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

entity D_0 is
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D0 : inout  STD_LOGIC);
end D_0;

architecture Behavioral of D_0 is

begin

 D0 <= ( (NOT Q3) AND (NOT Q0)) OR ( (NOT Q4) AND (NOT Q0)) OR ( (NOT Q2) AND (NOT Q1) AND (NOT Q0));

end Behavioral;

