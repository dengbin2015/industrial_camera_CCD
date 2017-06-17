LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY usb_control IS
PORT(usb_contorl_clk: IN STD_LOGIC;
	 RXF: IN STD_LOGIC;
	 TXE: IN STD_LOGIC;
	 USB_WD: OUT STD_LOGIC;
	 USB_RD: OUT STD_LOGIC;
	 dout_switch_t: OUT STD_LOGIC:='0';
	 USB_DATA: inout STD_LOGIC_vector(7 downto 0);
	 write_data: in std_logic_vector(7 downto 0));
END;
ARCHITECTURE usb_control_ARCH OF usb_control IS
signal read_data : std_logic_vector(7 downto 0);
--signal read_data_1 : std_logic_vector(7 downto 0);
BEGIN
PROCESS(RXF)
VARIABLE rnd_state: INTEGER RANGE 0 TO 3:=0;
BEGIN
	IF usb_contorl_clk'event and usb_contorl_clk = '1' THEN
		IF RXF = '0' THEN
			case rnd_state is
				when 0 => USB_RD <= '0'; rnd_state := rnd_state + 1; --rnd_state := rnd_state +1;
				when 1 => read_data <= USB_DATA;IF  read_data = "00000000" THEN   dout_switch_t <= '1';rnd_state := rnd_state +1; END IF; 
				when 2 => rnd_state := rnd_state + 1; USB_RD <= '1';
				when 3 => rnd_state := 0; USB_RD <= '1';
						--IF  read_data = "00000000" THEN   dout_switch_t <= '1'; END IF;
			end case;
			
		END IF;
	END IF;
END PROCESS;

PROCESS(TXE)
VARIABLE wrt_state: INTEGER RANGE 0 TO 3:=0;
BEGIN
	IF usb_contorl_clk'event and usb_contorl_clk = '1' THEN
		IF TXE = '0'  AND RXF = '1' THEN
			case wrt_state is
				when 0 => USB_WD <= '1'; wrt_state := wrt_state + 1;
				when 1 => wrt_state := wrt_state +1;USB_DATA <= write_data;
				when 2 => wrt_state := wrt_state + 1; USB_WD <= '0';
				when 3 => wrt_state := 0; USB_WD <= '0';
			end case;
		END IF;
	END IF;
END PROCESS;
END usb_control_ARCH;