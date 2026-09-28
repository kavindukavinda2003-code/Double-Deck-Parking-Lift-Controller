----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:33 07/19/2026 
-- Design Name: 
-- Module Name:    DECK_SELECTION - Behavioral 
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

entity DECK_SELECTION is
    Port ( S : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D1_A : INout  STD_LOGIC;
           D2_A : INout  STD_LOGIC;
           P : INout  STD_LOGIC);
end DECK_SELECTION;

architecture Behavioral of DECK_SELECTION is

COMPONENT D1_AV
    PORT (S: IN STD_LOGIC;
	       D1: IN STD_LOGIC;
			 D1_A: INOUT STD_LOGIC);
END COMPONENT;

COMPONENT D2_AV
    Port ( S : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D2_A : INout  STD_LOGIC);
END COMPONENT;

COMPONENT PARK
    Port ( S : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           P : INout  STD_LOGIC);
END COMPONENT;


begin
C1: D1_AV PORT MAP (S,D1,D1_A);
C2: D2_AV PORT MAP (S,D1,D2,D2_A);
C3: PARK PORT MAP (S,D1,D2,P);
end Behavioral;

