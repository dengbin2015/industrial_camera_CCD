LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY SH_ICG_frequency IS
PORT(CLK_DIV: IN STD_LOGIC;
	 QM,SH,ICG: OUT STD_LOGIC);
END;
ARCHITECTURE SH_ICG_frequency_ARCH OF SH_ICG_frequency IS
SIGNAL SH_TMP:STD_LOGIC:='1';
SIGNAL ICG_TMP:STD_LOGIC:='0';
BEGIN
PROCESS(CLK_DIV)
VARIABLE CNT: INTEGER RANGE 0 TO 14999;
VARIABLE SH_COUNT: INTEGER RANGE 0 TO 1000:=0;
BEGIN
--	IF (RESET_N = '0') THEN
	--	CNT := 0; SH_TMP <= '0'; ICG_TMP <= '1';
	IF (CLK_DIV'EVENT AND CLK_DIV = '0') THEN
		IF CNT = 0 THEN 
			SH_TMP <= '1';
		END IF;
		IF (CNT = 14999) THEN
			CNT := 0;	
		ELSE
			CNT := CNT + 1;
		END IF;
	--	CASE CNT IS
			--WHEN 4|6 =>
			--	SH_TMP <= NOT SH_TMP;
	--		WHEN 0|30 =>
	--			ICG_TMP <= NOT ICG_TMP;
	--		WHEN OTHERS => NULL;
	--	END CASE;
		IF CNT>=0 AND CNT<=30 THEN
				ICG_TMP <= '0';
		ELSE
				ICG_TMP <= '1';
		END IF;
--		IF (SH_COUNT = 80) THEN
--			SH_TMP <= NOT SH_TMP;
--			SH_COUNT := 0;
--		ELSE
--			SH_COUNT:=SH_COUNT+1;
--		END IF;
        IF CNT>=3 AND CNT<=20 THEN
				SH_TMP <= '1';
		ELSE
				SH_TMP <= '0';
		END IF;

	END IF;
	QM <= CLK_DIV; SH <= SH_TMP; ICG <= ICG_TMP;
END PROCESS;
END SH_ICG_frequency_ARCH;