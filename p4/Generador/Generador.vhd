----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:56 04/25/2018 
-- Design Name: 
-- Module Name:    Generador - Behavioral 
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

entity Generador is
    Port ( preset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           q : out  STD_LOGIC
           );
end Generador;

architecture Behavioral of Generador is
COMPONENT ffD_preset
PORT(
		clk : IN std_logic;
		ce : IN std_logic;
		preset : IN std_logic;
		d : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
	
	signal da: std_logic;
	signal qa,qb,qc,qd,qe,qf,qg: std_logic;
	
begin
Unit_A: ffD_preset PORT MAP(
		clk => clk ,
		ce => ce,
		preset => preset ,
		q => qa,
		d => da
	);
Unit_B: ffD_preset PORT MAP(
		clk =>clk ,
		ce => ce,
		preset => preset,
		q => qb,
		d => qa
	);
Unit_C: ffD_preset PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => qc,
		d => qb
	);
Unit_D: ffD_preset PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => qd,
		d => qc
	);
Unit_E: ffD_preset PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => qe,
		d => qd
	);
Unit_F: ffD_preset PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => qf,
		d => qe
	);
Unit_G: ffD_preset PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => qg,
		d => qf
	);

da <= (qf xor qg);
q <= qg;

end Behavioral;

