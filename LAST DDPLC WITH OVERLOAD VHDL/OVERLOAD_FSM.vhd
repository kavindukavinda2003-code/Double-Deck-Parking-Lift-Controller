----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:12 07/26/2026 
-- Design Name: 
-- Module Name:    OVERLOAD_FSM - Behavioral 
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

entity OVERLOAD_FSM is
    Port ( CLK: IN STD_LOGIC;
	        OL : in  STD_LOGIC;
           CL : in  STD_LOGIC;
           RESET : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           E : out  STD_LOGIC;
           AL : out  STD_LOGIC);
end OVERLOAD_FSM;

architecture Behavioral of OVERLOAD_FSM is

type state_type is (IDLE, COUNTER_START, OVERLOAD_ALARM, ALARM_OFF);

signal current_state, next_state : state_type := IDLE;

begin

 STATE_REG : process(CLK)
    begin
 
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process STATE_REG;

NEXT_STATE_LOGIC : process(current_state,OL,CL)
 begin
        next_state <= current_state; 
 
        case current_state is
 
         WHEN IDLE =>
			   IF OL = '1'  THEN 
				     next_state <= COUNTER_START;
				ELSE
				     next_state <= IDLE;
					  
			   END IF;
			
			WHEN COUNTER_START =>
			   IF CL ='1' THEN
				     next_state <= OVERLOAD_ALARM;
					  
				ELSE
				     next_state <= COUNTER_START;
				END IF;
			
			WHEN OVERLOAD_ALARM =>
			   IF OL ='0' THEN
				     next_state <= ALARM_OFF;
				ELSE
				     next_state <= OVERLOAD_ALARM;
				END IF;
			
			WHEN ALARM_OFF =>
			   IF OL = '1' THEN
				     next_state <= COUNTER_START;
				ELSE
				     next_state <= IDLE;
				END IF;
        end case;
    end process NEXT_STATE_LOGIC;				
 
 OUTPUT_LOGIC : process(current_state)

begin
    EN <='0';
	 AL <='0';
	 E <='0';
	 RESET <='0';


    case current_state is
	      WHEN IDLE =>
			     RESET <='0';
	      WHEN COUNTER_START =>
			     EN <='1';
		   WHEN OVERLOAD_ALARM =>
			     AL <='1';
				  E <='1';
				  EN <='0';
			WHEN ALARM_OFF =>
			     AL <='0';
		        RESET <='1';
				  E <='0';
        end case;
    end process OUTPUT_LOGIC;
	 

				  
end Behavioral;

