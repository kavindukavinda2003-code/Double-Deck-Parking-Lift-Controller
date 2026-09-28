----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:31:14 07/19/2026 
-- Design Name: 
-- Module Name:    FSM_1 - Behavioral 
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

entity FSM_1 is
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
end FSM_1;

architecture Behavioral of FSM_1 is


    type state_type is (S_INIT, S_CHECK, S_STORE, S_D1RET, S_D2RET, S_PFULL,
                         S_MUP, S_MDOWN, S_WAIT, S_WAIT1, S_SAFERET, S_EMERG);
 
    signal current_state, next_state : state_type := S_INIT;
 
    
    function state_code(st : state_type) return STD_LOGIC_VECTOR is
    begin
        case st is
            when S_INIT    => return "0000";
            when S_CHECK   => return "0001";
            when S_STORE   => return "0010";
            when S_D1RET   => return "0011";
            when S_D2RET   => return "0100";
            when S_PFULL   => return "0101";
            when S_MUP     => return "0110";
            when S_MDOWN   => return "0111";
            when S_WAIT    => return "1000";
            when S_WAIT1   => return "1001";
            when S_SAFERET => return "1010";
            when S_EMERG   => return "1011";
        end case;
    end function;
 
begin
 

    STATE_REG : process(clk, RESET)
    begin
        if RESET = '1' then
            current_state <= S_INIT;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process STATE_REG;
 

    NEXT_STATE_LOGIC : process(current_state, SB, RB1, RB2, G, B, E, D1, D2,
                                R, D1_A, D2_A, P)
    begin
        next_state <= current_state; 
 
        case current_state is
 
            when S_INIT =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif SB = '1' then
                    next_state <= S_CHECK;          
                elsif RB1 = '1' then
                    next_state <= S_D1RET;          
                elsif RB2 = '1' then
                    next_state <= S_D2RET;          
                else
                    next_state <= S_INIT;           
                end if;
 
            when S_CHECK =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsIF (D1_A OR D2_A OR P) ='1' THEN
                    next_state <= S_STORE;
				    ELSE
					     next_state <= S_CHECK;
                end if;
 
            when S_STORE =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif P = '1' then
                    next_state <= S_PFULL;
                elsif D1_A = '1' then
                    next_state <= S_MUP;
                elsif D2_A = '1' then
                    next_state <= S_MDOWN;
                else
                    next_state <= S_STORE;
                end if;
 
            when S_D1RET =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif D1 = '1' then
                    next_state <= S_MUP;
                else
                    next_state <= S_D1RET;
                end if;
 
            when S_D2RET =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif D2 = '1' then
                    next_state <= S_MDOWN;
                else
                    next_state <= S_D2RET;
                end if;
 
            when S_PFULL =>
                if E = '1' then
                    next_state <= S_EMERG;
                else
                    next_state <= S_INIT;
                end if;
 
            when S_MUP =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif G = '1' then
                    next_state <= S_WAIT;
                else
                    next_state <= S_MUP;
                end if;
 
            when S_MDOWN =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif B = '1' then
                    next_state <= S_WAIT1;
                else
                    next_state <= S_MDOWN;
                end if;
 
            when S_WAIT =>
                if E = '1' then
                    next_state <= S_EMERG;
                else
                    next_state <= S_SAFERET;
                end if;
 
            when S_WAIT1 =>
                if E = '1' then
                    next_state <= S_EMERG;
                else
                    next_state <= S_INIT;
                end if;
 
            when S_SAFERET =>
                if E = '1' then
                    next_state <= S_EMERG;
                elsif R = '1' then
                    next_state <= S_MDOWN;
                else
                    next_state <= S_SAFERET;
                end if;
 
            when S_EMERG =>
                
                next_state <= S_EMERG;
 
            when others =>
                next_state <= S_INIT;
 
        end case;
    end process NEXT_STATE_LOGIC;
 

    OUTPUT_LOGIC : process(current_state)
    begin
        PL <= '0';
        EL <= '0';
        UR <= '0';
        DR <= '0';
        EB <= '0';
        S  <= '0';
        RR <= '0';
 
        case current_state is
            when S_PFULL =>
                PL <= '1';
            when S_MUP =>
                UR <= '1';
					 
            when S_MDOWN =>
                DR <= '1';
            when S_EMERG =>
                EL <= '1';
                EB <= '1';
            when S_CHECK =>
                S  <= '1';
            when S_STORE =>
                S  <= '1';
            when S_SAFERET =>
                RR <= '1';
            when others =>
                null;
        end case;
    end process OUTPUT_LOGIC;
 
    Q <= state_code(current_state);
 
end Behavioral;