
-- VHDL Instantiation Created from source file Detector.vhd -- 16:24:02 04/25/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Detector
	PORT(
		clk : IN std_logic;
		ce : IN std_logic;
		preset : IN std_logic;
		x : IN std_logic;          
		z : OUT std_logic
		);
	END COMPONENT;

	Inst_Detector: Detector PORT MAP(
		clk => ,
		ce => ,
		preset => ,
		x => ,
		z => 
	);


