----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:16:03 07/19/2026 
-- Design Name: 
-- Module Name:    COUNT13 - Behavioral 
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

entity COUNT13 is
    Port ( EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RESET: IN STD_LOGIC;
           COUNT : out  STD_LOGIC);
end COUNT13;

architecture Behavioral of COUNT13 is

COMPONENT DF0
   PORT (D: IN STD_LOGIC;
	      CLK: IN STD_LOGIC;
			CLR: IN STD_LOGIC;
			Q: INOUT STD_LOGIC;
			QBAR:INOUT STD_LOGIC);
END COMPONENT;

COMPONENT DF1
   PORT (D: IN STD_LOGIC;
	      CLK: IN STD_LOGIC;
			CLR: IN STD_LOGIC;
			Q: INOUT STD_LOGIC;
			QBAR:INOUT STD_LOGIC);
END COMPONENT;

COMPONENT DF2
   PORT (D: IN STD_LOGIC;
	      CLK: IN STD_LOGIC;
			CLR: IN STD_LOGIC;
			Q: INOUT STD_LOGIC;
			QBAR:INOUT STD_LOGIC);
END COMPONENT;

COMPONENT DF3
   PORT (D: IN STD_LOGIC;
	      CLK: IN STD_LOGIC;
			CLR: IN STD_LOGIC;
			Q: INOUT STD_LOGIC;
			QBAR:INOUT STD_LOGIC);
END COMPONENT;

COMPONENT D0
   PORT (Q3: IN STD_LOGIC;
	Q2: IN STD_LOGIC;
	Q1: IN STD_LOGIC;
	Q0: IN STD_LOGIC;
	D0: INOUT STD_LOGIC);
END COMPONENT;

COMPONENT D3
   PORT (Q3: IN STD_LOGIC;
	Q2: IN STD_LOGIC;
	Q1: IN STD_LOGIC;
	Q0: IN STD_LOGIC;
	D3: INOUT STD_LOGIC);
END COMPONENT;

COMPONENT D1
   PORT (Q3: IN STD_LOGIC;
	Q2: IN STD_LOGIC;
	Q1: IN STD_LOGIC;
	Q0: IN STD_LOGIC;
	D1: INOUT STD_LOGIC);
END COMPONENT;

COMPONENT D2
   PORT (Q3: IN STD_LOGIC;
	Q2: IN STD_LOGIC;
	Q1: IN STD_LOGIC;
	Q0: IN STD_LOGIC;
	D2: INOUT STD_LOGIC);
END COMPONENT;

COMPONENT OUTPUT
    PORT (Q3: IN STD_LOGIC;
	Q2: IN STD_LOGIC;
	Q1: IN STD_LOGIC;
	Q0: IN STD_LOGIC;
	COUNT: OUT STD_LOGIC);
END COMPONENT;
SIGNAL D00,Q0,Q0BAR,D02,D01,D03,Q1,Q1BAR,Q2,Q2BAR,Q3,Q3BAR : STD_LOGIC;
SIGNAL S0 :STD_LOGIC;
begin
S0 <= EN AND CLK;

C0: DF0 PORT MAP (D00,S0,RESET,Q0,Q0BAR);
C1: DF1 PORT MAP (D01,S0,RESET,Q1,Q1BAR);
C2: DF2 PORT MAP (D02,S0,RESET,Q2,Q2BAR);
C3: DF3 PORT MAP (D03,S0,RESET,Q3,Q3BAR);
C4: D0 PORT MAP (Q3,Q2,Q1,Q0,D00);
C5: D1 PORT MAP (Q3,Q2,Q1,Q0,D01);
C6: D2 PORT MAP (Q3,Q2,Q1,Q0,D02);
C7: D3 PORT MAP (Q3,Q2,Q1,Q0,D03);
C8: OUTPUT PORT MAP (Q3,Q2,Q1,Q0,COUNT);

end Behavioral;

