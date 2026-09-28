----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:42:40 07/24/2026 
-- Design Name: 
-- Module Name:    DDPLC - Behavioral 
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

entity DDPLC is

    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SB : in  STD_LOGIC;
           RB1 : in  STD_LOGIC;
           RB2 : in  STD_LOGIC;
           G : in  STD_LOGIC;
           B : in  STD_LOGIC;
           E : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
			  
           

           
			  L : IN STD_LOGIC;
           PL : out  STD_LOGIC;
           EL : out  STD_LOGIC;
           UR : out  STD_LOGIC;
           DR : out  STD_LOGIC;
           EB : out  STD_LOGIC);


end DDPLC;

architecture Behavioral of DDPLC is

COMPONENT FSM_1
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SB : in  STD_LOGIC;
           RB1 : in  STD_LOGIC;
           RB2 : in  STD_LOGIC;
           G : in  STD_LOGIC;
           B : in  STD_LOGIC;
           E : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           R : in  STD_LOGIC;
           D1_A : in  STD_LOGIC;
           D2_A : in  STD_LOGIC;
           P : in  STD_LOGIC;
           PL : out  STD_LOGIC;
           EL : out  STD_LOGIC;
           UR : out  STD_LOGIC;
           DR : out  STD_LOGIC;
           EB : out  STD_LOGIC;
           S : out  STD_LOGIC;
           RR : out  STD_LOGIC;
			  Q      : out STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

COMPONENT COUNT13
    Port ( EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RESET: IN STD_LOGIC;
           COUNT : out  STD_LOGIC);
END COMPONENT;

COMPONENT SAFETY_RETURN
    Port ( L : in  STD_LOGIC;
           COUNT : in  STD_LOGIC;
           R : out  STD_LOGIC);
END COMPONENT;

COMPONENT DECK_SELECTION
    Port ( S : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D1_A : INout  STD_LOGIC;
           D2_A : INout  STD_LOGIC;
           P : INout  STD_LOGIC);
END COMPONENT;



SIGNAL R,D1_A,D2_A,P,S,RR : STD_LOGIC;
SIGNAL Q: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL COUNT: STD_LOGIC;

begin

C1: FSM_1 PORT MAP (CLK,RESET,SB,RB1,RB2,G,B,E,D1,D2,R,D1_A,D2_A,P,PL,EL,UR,DR,EB,S,RR,Q);
C2: COUNT13 PORT MAP (RR,CLK,RESET,COUNT);
C3: SAFETY_RETURN PORT MAP (L,COUNT,R);
C4: DECK_SELECTION PORT MAP (S,D1,D2,D1_A,D2_A,P);

end Behavioral;

