----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:11 07/26/2026 
-- Design Name: 
-- Module Name:    TOP_OVERLOAD - Behavioral 
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

entity TOP_OVERLOAD is
    Port ( CLK : IN STD_LOGIC;
	        CLR : IN STD_LOGIC;
	        OL : in  STD_LOGIC;
           AL : out  STD_LOGIC;
           E : out  STD_LOGIC;
           RST : out  STD_LOGIC);
end TOP_OVERLOAD;

architecture Behavioral of TOP_OVERLOAD is

COMPONENT COUNTER_25_TOP
    Port ( EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
--			  Q0 : inout  STD_LOGIC;
--			  Q1: inout  STD_LOGIC;
--			  Q2 : inout  STD_LOGIC;
--			  Q3: inout  STD_LOGIC;
--			  Q4 : inout  STD_LOGIC;
			  CLR : in  STD_LOGIC;
           COMPLETED : inout  STD_LOGIC);
END COMPONENT;

COMPONENT OVERLOAD_FSM
    Port ( CLK: IN STD_LOGIC;
	        OL : in  STD_LOGIC;
           CL : in  STD_LOGIC;
           RESET : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           E : out  STD_LOGIC;
           AL : out  STD_LOGIC);
END COMPONENT;

SIGNAL CL,EN : STD_LOGIC;


begin
C1 : OVERLOAD_FSM PORT MAP (CLK,OL,CL,RST,EN,E,AL);
C2 : COUNTER_25_TOP PORT MAP (EN,CLK,CLR,CL);


end Behavioral;

