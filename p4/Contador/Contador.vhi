
-- VHDL Instantiation Created from source file Contador.vhd -- 18:23:38 03/21/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Contador
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;          
		count : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Contador: Contador PORT MAP(
		clk => ,
		reset => ,
		ce => ,
		count => 
	);


