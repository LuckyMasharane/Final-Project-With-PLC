library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;


Entity  counterUp_Down is 
	port ( secret_Code     : in std_logic_vector (2 downto 0);
           Button		   : in std_logic_vector(1 downto 0);
           mode_Switch     : in std_logic;
           man_switch      : in std_logic_vector(4 downto 0);
           
           Operation		: inout std_logic;
           LEDG1     		: inout std_logic;
           LEDG2			: inout std_logic;
           pinCorrect_Led	: inout std_logic;
           clock     		: in std_logic;
           reset			: in std_logic;
		  
           Digit1 	: out std_logic_vector(6 downto 0); 
           Digit2 	: out std_logic_vector(6 downto 0);
           Digit3 	: out std_logic_vector(6 downto 0);
           Digit4 	: out std_logic_vector(6 downto 0));
End counterUp_Down;
    
 Architecture projectBehaviour of counterUp_Down is
	signal number		: integer range 0 to 32:=0;
	signal PRESCALER	: integer range 0 to 50000000:=0;
	signal input		: std_logic_vector(4 downto 0);
	signal sgmt			: std_logic_vector(4 downto 0);
	signal num2			: integer range 0 to 32:=0;
   begin    
	input<=std_logic_vector(to_unsigned(number,5)); 
   DisplaySegment1:process(secret_Code,input,sgmt)
   begin
   if(clock'event and clock='1')then
			if(PRESCALER<50000000)then
				PRESCALER<=PRESCALER+1;
			else
				PRESCALER<=0;
			end if;
			
			if(PRESCALER=0)then
		case Button(0) is
		when '0' =>
			if(number<16)then
					number<=number+1;
					else
						number<=0;				
			end if;
			when '1'=>
			if(number>0)then
					number<=number-1;
					else
						number<=16;	
			end if;
			end case;
		end if;
		end if;
		
		  
 if secret_Code = "101" then
			 Digit3 <= "0001100";
			 pinCorrect_Led <='1';
-------------------------------------------------------------
 
if mode_Switch ='0' then
		case  input is
				when "00000"=> Digit1 <="1000000";  -- '0'
								Digit2 <="1111111";
				when "00001"=> Digit1 <="1111001";  -- '1'
								Digit2 <="1111111";
				when "00010"=> Digit1 <="0100100";  -- '2'
								Digit2 <="1111111";
				when "00011"=> Digit1 <="0110000";  -- '3'
								Digit2 <="1111111";
				when "00100"=> Digit1 <="0011001";  -- '4'
								Digit2 <="1111111";
				when "00101"=> Digit1 <="0010010";  -- '5'
								Digit2 <="1111111";
				when "00110"=> Digit1 <="0000010";  -- '6'
								Digit2 <="1111111";
				when "00111"=> Digit1 <="1111000";  -- '7'
								Digit2 <="1111111";
				when "01000"=> Digit1 <="0000000";  -- '8'
								Digit2 <="1111111";
				when "01001"=> Digit1 <="0010000";  -- '9'
								Digit2 <="1111111";
				when "01010"=> Digit1 <="1000000";  -- '10'
							   Digit2 <="1111001";  
				when "01011"=> Digit1 <="1111001";  -- '11'
							   Digit2 <="1111001";  
				when "01100"=> Digit1 <="0100100";  -- '12'
							   Digit2 <="1111001";  
				when "01101"=> Digit1 <="0110000";  -- '13'
							   Digit2 <="1111001";  
				when "01110"=> Digit1 <="0011001";  -- '14'
							   Digit2 <="1111001";  
				when "01111"=> Digit1 <="0010010";  -- '15'
							   Digit2 <="1111001";  
				when "10000"=> Digit1 <="0000010";  -- '16'
							   Digit2 <="1111001";   
				when others => Digit1 <="1111111";
				
				end case;
   
		  end if;
---------------------------------------------------------------------------
	if mode_Switch ='1' then		 
	Digit1 <="1111111";
	Digit2 <="1111111";
	
	if man_switch ="00000" then
	Digit1 <="0111111";  -- '0'
	LEDG1 <='0';
	LEDG2 <='0';
	elsif man_switch ="00001" then
	Digit1 <="1111001"; ---'1'
	LEDG1 <='1';
	LEDG2 <='0';
	elsif man_switch ="00010" then
	 Digit1 <="0100100";   -- '2'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="00011" then
	 Digit1 <="0110000";  -- '3'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="00100" then
	 Digit1 <="0011001";  -- '4' 
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="00101" then
	 Digit1 <="0010010";  -- '5'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="00110" then
	 Digit1 <="0000011";  -- '6'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="00111" then
	 Digit1 <="1111000";  -- '7'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="01000" then
	 Digit1 <="0000000";  -- '8'
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="01001" then
	 Digit1 <="0010000";  -- '9
	 LEDG1 <='1';
	 LEDG2 <='0';
	 elsif man_switch ="01010" then
	 Digit1 <="1000000";  -- '10'
	 Digit2 <="1111001"; 
	 LEDG1 <='1';
	 LEDG2 <='1'; 
	 elsif man_switch ="01011" then
	 Digit1 <="1111001";   -- '11'
	 Digit2 <="1111001";  
	 LEDG1 <='1';
	 LEDG2 <='1';
	 elsif man_switch ="01100" then
	 Digit1 <="0100100";  -- '12'
	 Digit2 <="1111001"; 
	 LEDG1 <='1';
	 LEDG2 <='1';
	 elsif man_switch ="01101" then
	 Digit1 <="0110000"; -- '13'
	 Digit2 <="1111001"; 
	 LEDG1 <='1';
	 LEDG2 <='1';
	 elsif man_switch ="01110" then
	 Digit1 <="0011001";  -- '14'
	 Digit2 <="1111001";
	 LEDG1 <='1';
	 LEDG2 <='1';
	 elsif man_switch ="01111" then
	 Digit1 <="0010010";  -- '15'
	 Digit2 <="1111001"; 
	 LEDG1 <='1';
	 LEDG2 <='1';
	 elsif man_switch ="10000" then
	 Digit1 <="0000011";  -- '16'
	 Digit2 <="1111001"; 
	 LEDG1 <='1';
	 LEDG2 <='1';
	 end if;
	else
	 Operation <='0';
end if;
	
if  secret_Code = "001" then
	Digit3 <= "1111111";
end if;

 if secret_Code = "111" then
	Operation <='1';
	Digit3 <= "0001100";
	segPass <='1';
	else
	Digit3 <= "1111111";
	Operation <='0';
	pinCorrect_Led <='0';
	LEDG2 <='0';
	LEDG1 <='0';
    end if;
		if secret_Code = "011" then
		Digit3 <= "1111111";
		end if;
		
		if secret_Code = "100" then
		Digit3 <= "1111111";
		end if;
		
		if secret_Code = "101" then
		Digit3 <= "1111111";
		end if;
		
		if secret_Code = "110" then
		Digit3 <= "1111111";
		end if;
		
		
		if secret_Code = "100" then
		Digit3 <= "1111111";
		end if; 
		end if;    
End process;

end projectBehaviour;