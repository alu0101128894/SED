--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:26:07 04/25/2018
-- Design Name:   
-- Module Name:   E:/Generador Miguel/Generador/Sistema_tb.vhd
-- Project Name:  Generador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sistema
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
 
ENTITY Sistema_tb IS
END Sistema_tb;
 
ARCHITECTURE behavior OF Sistema_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sistema
    PORT(
         ce : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         x : OUT  std_logic;
         z : OUT  std_logic;
         seg : OUT  std_logic_vector(6 downto 0);
         preset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ce : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal preset : std_logic := '0';

 	--Outputs
   signal x : std_logic;
   signal z : std_logic;
   signal seg : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sistema PORT MAP (
          ce => ce,
          clk => clk,
          reset => reset,
          x => x,
          z => z,
          seg => seg,
          preset => preset
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
		
      preset<='1';
		reset<='1';
		ce<='0';
		
		wait for 10 ns;
		
      preset<='0';
		reset<='0';
		ce<='1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
