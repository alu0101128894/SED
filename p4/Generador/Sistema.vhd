----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:11 04/25/2018 
-- Design Name: 
-- Module Name:    Sistema - Behavioral 
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

entity Sistema is
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           x : out  STD_LOGIC;
           z : out  STD_LOGIC;
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
           preset : in  STD_LOGIC);
end Sistema;

architecture Behavioral of Sistema is
COMPONENT Generador
	PORT(
		clk : IN std_logic;
		ce : IN std_logic;
		preset : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Detector
	PORT(
		x : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;
		clk : IN std_logic;          
		z : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Contador
	PORT(
		clk : IN std_logic;
		ce : IN std_logic;
		reset : IN std_logic;          
		count : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT Decodificador
	PORT(
		bcd : IN std_logic_vector(3 downto 0);          
		led : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	signal leds : std_logic_vector(6 downto 0);
	signal abcd : std_logic_vector(3 downto 0);
	signal z1,y1,dat : std_logic;
begin
Inst_Detector: Detector PORT MAP(
		x => dat,
		reset => reset,
		ce => ce,
		clk => clk,
		z => z1
	);
	
	Inst_Generador: Generador PORT MAP(
		clk => clk,
		ce => ce,
		preset => preset,
		q => dat
	);
	
	Inst_Contador: Contador PORT MAP(
		clk => clk,
		ce => z1,
		reset => reset,
		count => abcd 
	);

	Inst_Decodificador: Decodificador PORT MAP(
		bcd => abcd,
		led => leds
	);
	
	seg <= leds;
	x <= dat;
	z <= z1;
	
end Behavioral;

