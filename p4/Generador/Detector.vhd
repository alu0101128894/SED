----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:09 04/25/2018 
-- Design Name: 
-- Module Name:    Detector - Behavioral 
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

entity Detector is
    Port ( clk : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Detector;

architecture Behavioral of Detector is

	COMPONENT ffD_reset
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;
		d : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;

	signal x1,x2,z1,z2,fz: STD_LOGIC; 
	signal a,b,c,d: STD_LOGIC;
begin
Unit_A: ffD_reset PORT MAP(
		clk => clk,
		reset => reset,
		ce => ce,
		d => x1,
		q => z1
	);
	
Unit_B: ffD_reset PORT MAP(
		clk => clk,
		reset => reset,
		ce => ce,
		d =>  x2,
		q =>  z2
	);
	
	a <= x;
	b <= (x and z1 and (not z2)) or (z2 and (not x));
	fz <= x and z1 and z2;
	z <= fz;
	x1 <= b;
	x2 <= a;
	
end Behavioral;

