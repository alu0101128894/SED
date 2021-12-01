----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:01 04/11/2018 
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
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end Sistema;

architecture Behavioral of Sistema is

COMPONENT decodificador
PORT(
	bcd : IN std_logic_vector(3 downto 0);
	led : OUT std_logic_vector(6 downto 0)
	);
END COMPONENT;

COMPONENT Contador
PORT(
			  clk : IN std_logic;
           reset : IN  std_logic;
           ce : IN  std_logic;
           count : OUT  std_logic_vector (3 downto 0));
	END COMPONENT;
	
	signal count : std_logic_vector(3 downto 0);
	
begin
Inst_decodificador: decodificador PORT MAP(
	bcd => count,
	led => led
);

Inst_Contador: Contador PORT MAP(
	clk => clk, 
	reset => reset,
	ce => ce,
	count => count

);

end Behavioral;

