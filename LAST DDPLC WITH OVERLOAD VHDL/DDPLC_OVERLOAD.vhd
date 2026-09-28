----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:53 07/26/2026 
-- Design Name: 
-- Module Name:    DDPLC_OVERLOAD - Behavioral 
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

entity DDPLC_OVERLOAD is
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
           OL : in  STD_LOGIC;
           PL : out  STD_LOGIC;
           EL : out  STD_LOGIC;
           UR : out  STD_LOGIC;
           DR : out  STD_LOGIC;
           EB : out  STD_LOGIC;
           AL : out  STD_LOGIC);
end DDPLC_OVERLOAD;

architecture Behavioral of DDPLC_OVERLOAD is

COMPONENT  DDPLC
   PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         SB : IN  std_logic;
         RB1 : IN  std_logic;
         RB2 : IN  std_logic;
         G : IN  std_logic;
         B : IN  std_logic;
         E : IN  std_logic;
         D1 : IN  std_logic;
         D2 : IN  std_logic;
         L : IN  std_logic;
         PL : OUT  std_logic;
         EL : OUT  std_logic;
         UR : OUT  std_logic;
         DR : OUT  std_logic;
         EB : OUT  std_logic
        );
END COMPONENT;

COMPONENT TOP_OVERLOAD
    Port ( CLK : IN STD_LOGIC;
	        CLR : IN STD_LOGIC;
	        OL : in  STD_LOGIC;
           AL : out  STD_LOGIC;
           E : out  STD_LOGIC;
           RST : out  STD_LOGIC);
END COMPONENT;

SIGNAL E1,E2,RST,RST1 :STD_LOGIC;
begin
E1 <= E2 OR E;
RST1 <= RST OR RESET;


C1: DDPLC PORT MAP (CLK,RST1,SB,RB1,RB2,G,B,E1,D1,D2,L,PL,EL,UR,DR,EB);
C2: TOP_OVERLOAD PORT MAP (CLK,RESET,OL,AL,E2,RST);

end Behavioral;

