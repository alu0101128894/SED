--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:54 04/25/2018
-- Design Name:   
-- Module Name:   E:/Generador Miguel/Generador/Detector_de_tramas_tb.vhd
-- Project Name:  Generador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Detector
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
 
ENTITY Detector_de_tramas_tb IS
END Detector_de_tramas_tb;
 
ARCHITECTURE behavior OF Detector_de_tramas_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Detector
    PORT(
         clk : IN  std_logic;
         ce : IN  std_logic;
         reset : IN  std_logic;
         x : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ce : std_logic := '0';
   signal reset : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Detector PORT MAP (
          clk => clk,
          ce => ce,
          reset => reset,
          x => x,
          z => z
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
      wait for 100 ns;	
		ce <= '1';
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		x <= '0';
 
		wait for 30 ns;
		x <= '1';
		wait for 10 ns;
		x <= '0';
		wait for 30 ns;
		x <= '1';

		wait for 10 ns;
		x <= '0';
		wait for 10 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
		wait for 20 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
		wait for 20 ns;
		x <= '1';
		wait for 10 ns;
		x <= '0';	
		wait for 10 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
		wait for 10 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
		
		wait for 10 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
		wait for 40 ns;
		x <= '1';
		wait for 10 ns;
		x <= '0';
		wait for 20 ns;
		x <= '1';
		wait for 20 ns;
		x <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
