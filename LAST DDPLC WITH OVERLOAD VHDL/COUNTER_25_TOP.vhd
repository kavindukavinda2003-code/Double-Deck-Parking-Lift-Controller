----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:39 07/22/2026 
-- Design Name: 
-- Module Name:    COUNTER_25_TOP - Behavioral 
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

entity COUNTER_25_TOP is
    Port ( EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
--			  Q0 : inout  STD_LOGIC;
--			  Q1: inout  STD_LOGIC;
--			  Q2 : inout  STD_LOGIC;
--			  Q3: inout  STD_LOGIC;
--			  Q4 : inout  STD_LOGIC;
			  CLR : in  STD_LOGIC;
           COMPLETED : inout  STD_LOGIC);
end COUNTER_25_TOP;

architecture Behavioral of COUNTER_25_TOP is

COMPONENT DF0
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
END COMPONENT;

COMPONENT DF1
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
END COMPONENT;		

COMPONENT DF2
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
END COMPONENT;		

COMPONENT DF3
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
END COMPONENT;	

COMPONENT DF4
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
END COMPONENT;				  
			  
COMPONENT D_0
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D0 : inout  STD_LOGIC);
END COMPONENT;

COMPONENT D_1
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D1 : inout  STD_LOGIC);
END COMPONENT;

COMPONENT D_2
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D2 : inout  STD_LOGIC);
END COMPONENT;

COMPONENT D_3
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D3 : inout  STD_LOGIC);
END COMPONENT;

COMPONENT D_4
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           D4 : inout  STD_LOGIC);
END COMPONENT;

COMPONENT OUTL
    Port ( Q4 : in  STD_LOGIC;
           Q3 : in  STD_LOGIC;
           Q2 : in  STD_LOGIC;
           Q1 : in  STD_LOGIC;
           Q0 : in  STD_LOGIC;
           COMPLETED : inout  STD_LOGIC);
END COMPONENT;

SIGNAL D0,D1,D2,D3,D4,Q0BAR,Q1BAR,Q2BAR,Q3BAR,Q4BAR,S0,COMPL,Q0,Q1,Q2,Q3,Q4 : STD_LOGIC;

begin
S0 <= CLK AND EN;
C1: DF0 PORT MAP (D0,S0,CLR,Q0,Q0BAR);
C2: DF1 PORT MAP (D1,S0,CLR,Q1,Q1BAR);
C3: DF2 PORT MAP (D2,S0,CLR,Q2,Q2BAR);
C4: DF3 PORT MAP (D3,S0,CLR,Q3,Q3BAR);
C5: DF4 PORT MAP (D4,S0,CLR,Q4,Q4BAR);
C6: D_0 PORT MAP (Q4,Q3,Q2,Q1,Q0,D0);
C7: D_1 PORT MAP (Q4,Q3,Q2,Q1,Q0,D1);
C8: D_2 PORT MAP (Q4,Q3,Q2,Q1,Q0,D2);
C9: D_3 PORT MAP (Q4,Q3,Q2,Q1,Q0,D3);
C10: D_4 PORT MAP (Q4,Q3,Q2,Q1,Q0,D4);
C11: OUTL PORT MAP (Q4,Q3,Q2,Q1,Q0,COMPL);

COMPLETED <= COMPL;
end Behavioral;

