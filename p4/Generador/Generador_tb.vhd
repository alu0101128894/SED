--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:36:57 04/25/2018
-- Design Name:   
-- Module Name:   E:/Generador Miguel/Generador/Generador_tb.vhd
-- Project Name:  Generador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Generador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Generador_tb IS
END Generador_tb;
 
ARCHITECTURE behavior OF Generador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Generador
    PORT(
         preset : IN  std_logic;
         clk : IN  std_logic;
         ce : IN  std_logic;
         q : OUT  std_logic;
         d : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal preset : std_logic := '0';
   signal clk : std_logic := '0';
   signal ce : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Generador PORT MAP (
          preset => preset,
          clk => clk,
          ce => ce,
          q => q,
          d => d
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		preset <= '1'; ce <= '1';
      wait for 100 ns;	
		preset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
