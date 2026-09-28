----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:18 07/18/2026 
-- Design Name: 
-- Module Name:    DF3 - Behavioral 
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

entity DF3 is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QBAR : inout  STD_LOGIC);
end DF3;

architecture Behavioral of DF3 is
signal q_int : STD_LOGIC := '0';
begin
    process(CLK, CLR)
    begin
        if CLR = '1' then          
            q_int <= '0';
        elsif rising_edge(clk) then
            q_int <= D;
        end if;
    end process;
	     Q    <= q_int;
    QBAR <= not q_int;

end Behavioral;

