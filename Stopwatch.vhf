--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Stopwatch.vhf
-- /___/   /\     Timestamp : 09/02/2019 16:08:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl Stopwatch.vhf -w /home/btech/cs1180365/lab4_1/Stopwatch.sch
--Design Name: Stopwatch
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL CC16CE_HXILINX_Stopwatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CC16CE_HXILINX_Stopwatch is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in  STD_LOGIC;
    CE  : in  STD_LOGIC;
    CLR : in  STD_LOGIC
    );
end CC16CE_HXILINX_Stopwatch;

architecture Behavioral of CC16CE_HXILINX_Stopwatch is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
begin

  process(C, CLR)
  begin
    if (CLR='1') then
      COUNT <= (others => '0');
    elsif (C'event and C = '1') then
      if (CE='1') then 
      COUNT <= COUNT+1;
      end if;
    end if;
  end process;


  TC <= '0' when (CLR = '1') else
        '1' when (COUNT = TERMINAL_COUNT) else '0';
  CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
  Q<=COUNT;

end Behavioral;
----- CELL D4_16E_HXILINX_Stopwatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_Stopwatch is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;
    D8  : out std_logic;
    D9  : out std_logic;
    D10  : out std_logic;
    D11  : out std_logic;
    D12  : out std_logic;
    D13  : out std_logic;
    D14  : out std_logic;
    D15  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    E   : in std_logic
  );
end D4_16E_HXILINX_Stopwatch;

architecture D4_16E_HXILINX_Stopwatch_V of D4_16E_HXILINX_Stopwatch is
  signal d_tmp : std_logic_vector(15 downto 0);
begin
  process (A0, A1, A2, A3, E)
  variable sel   : std_logic_vector(3 downto 0);
  begin
    sel := A3&A2&A1&A0;
    if( E = '0') then
    d_tmp <= "0000000000000000";
    else
      case sel is
      when "0000" => d_tmp <= "0000000000000001";
      when "0001" => d_tmp <= "0000000000000010";
      when "0010" => d_tmp <= "0000000000000100";
      when "0011" => d_tmp <= "0000000000001000";
      when "0100" => d_tmp <= "0000000000010000";
      when "0101" => d_tmp <= "0000000000100000";
      when "0110" => d_tmp <= "0000000001000000";
      when "0111" => d_tmp <= "0000000010000000";
      when "1000" => d_tmp <= "0000000100000000";
      when "1001" => d_tmp <= "0000001000000000";
      when "1010" => d_tmp <= "0000010000000000";
      when "1011" => d_tmp <= "0000100000000000";
      when "1100" => d_tmp <= "0001000000000000";
      when "1101" => d_tmp <= "0010000000000000";
      when "1110" => d_tmp <= "0100000000000000";
      when "1111" => d_tmp <= "1000000000000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D15 <= d_tmp(15);
    D14 <= d_tmp(14);
    D13 <= d_tmp(13);
    D12 <= d_tmp(12);
    D11 <= d_tmp(11);
    D10 <= d_tmp(10);
    D9  <= d_tmp(9);
    D8  <= d_tmp(8);
    D7  <= d_tmp(7);
    D6  <= d_tmp(6);
    D5  <= d_tmp(5);
    D4  <= d_tmp(4);
    D3  <= d_tmp(3);
    D2  <= d_tmp(2);
    D1  <= d_tmp(1);
    D0  <= d_tmp(0);

end D4_16E_HXILINX_Stopwatch_V;
----- CELL FTC_HXILINX_Stopwatch -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_Stopwatch is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_Stopwatch;

architecture Behavioral of FTC_HXILINX_Stopwatch is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL OR6_HXILINX_Stopwatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR6_HXILINX_Stopwatch is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end OR6_HXILINX_Stopwatch;

architecture OR6_HXILINX_Stopwatch_V of OR6_HXILINX_Stopwatch is
begin
  O <=  (I0 or I1 or I2 or I3 or I4 or I5);
end OR6_HXILINX_Stopwatch_V;
----- CELL M4_1E_HXILINX_Stopwatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_Stopwatch is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_Stopwatch;

architecture M4_1E_HXILINX_Stopwatch_V of M4_1E_HXILINX_Stopwatch is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_Stopwatch_V;
----- CELL FJKC_HXILINX_Stopwatch -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FJKC_HXILINX_Stopwatch is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    J   : in STD_LOGIC;
    K   : in STD_LOGIC
    );
end FJKC_HXILINX_Stopwatch;

architecture Behavioral of FJKC_HXILINX_Stopwatch is
signal q_tmp : std_logic := TO_X01(INIT);

begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(J='0') then
      if(K='1') then
      q_tmp <= '0';
    end if;
    else
      if(K='0') then
      q_tmp <= '1';
      else
      q_tmp <= not q_tmp;
      end if;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL D2_4E_HXILINX_Stopwatch -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_Stopwatch is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_Stopwatch;

architecture D2_4E_HXILINX_Stopwatch_V of D2_4E_HXILINX_Stopwatch is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_Stopwatch_V;
----- CELL CB2CE_HXILINX_Stopwatch -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_Stopwatch is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_Stopwatch;

architecture Behavioral of CB2CE_HXILINX_Stopwatch is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity LATCH1_MUSER_Stopwatch is
   port ( clock  : in    std_logic; 
          pause  : in    std_logic; 
          start  : in    std_logic; 
          enable : out   std_logic);
end LATCH1_MUSER_Stopwatch;

architecture BEHAVIORAL of LATCH1_MUSER_Stopwatch is
   attribute HU_SET     : string ;
   signal XLXN_4 : std_logic;
   component FJKC_HXILINX_Stopwatch
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             J   : in    std_logic; 
             K   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
begin
   XLXN_4 <= '0';
   XLXI_1 : FJKC_HXILINX_Stopwatch
      port map (C=>clock,
                CLR=>XLXN_4,
                J=>start,
                K=>pause,
                Q=>enable);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SegmentDispay_MUSER_Stopwatch is
   port ( B0 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          B3 : in    std_logic; 
          Ao : out   std_logic; 
          A0 : out   std_logic; 
          A1 : out   std_logic; 
          A2 : out   std_logic; 
          A3 : out   std_logic; 
          Bo : out   std_logic; 
          Co : out   std_logic; 
          Do : out   std_logic; 
          Eo : out   std_logic; 
          Fo : out   std_logic; 
          Go : out   std_logic);
end SegmentDispay_MUSER_Stopwatch;

architecture BEHAVIORAL of SegmentDispay_MUSER_Stopwatch is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal E_port   : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_93  : std_logic;
   signal XLXN_96  : std_logic;
   signal XLXN_97  : std_logic;
   signal XLXN_102 : std_logic;
   signal XLXN_103 : std_logic;
   signal XLXN_108 : std_logic;
   signal XLXN_109 : std_logic;
   signal XLXN_110 : std_logic;
   signal XLXN_111 : std_logic;
   signal XLXN_121 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_162 : std_logic;
   signal XLXN_168 : std_logic;
   signal XLXN_174 : std_logic;
   signal XLXN_178 : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR6_HXILINX_Stopwatch
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component D4_16E_HXILINX_Stopwatch
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             E   : in    std_logic; 
             D0  : out   std_logic; 
             D1  : out   std_logic; 
             D10 : out   std_logic; 
             D11 : out   std_logic; 
             D12 : out   std_logic; 
             D13 : out   std_logic; 
             D14 : out   std_logic; 
             D15 : out   std_logic; 
             D2  : out   std_logic; 
             D3  : out   std_logic; 
             D4  : out   std_logic; 
             D5  : out   std_logic; 
             D6  : out   std_logic; 
             D7  : out   std_logic; 
             D8  : out   std_logic; 
             D9  : out   std_logic);
   end component;
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   attribute HU_SET of B : label is "B_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_3";
begin
   A : OR4
      port map (I0=>XLXN_178,
                I1=>XLXN_110,
                I2=>XLXN_174,
                I3=>XLXN_93,
                O=>Ao);
   
   B : OR6_HXILINX_Stopwatch
      port map (I0=>XLXN_123,
                I1=>XLXN_121,
                I2=>XLXN_111,
                I3=>XLXN_110,
                I4=>XLXN_103,
                I5=>XLXN_102,
                O=>Bo);
   
   C : OR4
      port map (I0=>XLXN_123,
                I1=>XLXN_121,
                I2=>XLXN_111,
                I3=>XLXN_96,
                O=>Co);
   
   D : OR5
      port map (I0=>XLXN_123,
                I1=>XLXN_109,
                I2=>XLXN_162,
                I3=>XLXN_174,
                I4=>XLXN_93,
                O=>Do);
   
   G : OR4
      port map (I0=>XLXN_111,
                I1=>XLXN_162,
                I2=>XLXN_93,
                I3=>XLXN_90,
                O=>Go);
   
   XLXI_3 : D4_16E_HXILINX_Stopwatch
      port map (A0=>B0,
                A1=>B1,
                A2=>B2,
                A3=>B3,
                E=>E_port,
                D0=>XLXN_90,
                D1=>XLXN_93,
                D2=>XLXN_96,
                D3=>XLXN_97,
                D4=>XLXN_174,
                D5=>XLXN_102,
                D6=>XLXN_103,
                D7=>XLXN_162,
                D8=>open,
                D9=>XLXN_108,
                D10=>XLXN_109,
                D11=>XLXN_110,
                D12=>XLXN_111,
                D13=>XLXN_178,
                D14=>XLXN_121,
                D15=>XLXN_123);
   
   XLXI_40 : OR2B1
      port map (I0=>XLXN_162,
                I1=>XLXN_162,
                O=>E_port);
   
   XLXI_41 : OR2B1
      port map (I0=>XLXN_168,
                I1=>XLXN_168,
                O=>A1);
   
   XLXI_45 : AND2B1
      port map (I0=>XLXN_168,
                I1=>XLXN_168,
                O=>A0);
   
   XLXI_47 : OR2B1
      port map (I0=>XLXN_168,
                I1=>XLXN_168,
                O=>A2);
   
   XLXI_48 : OR2B1
      port map (I0=>XLXN_168,
                I1=>XLXN_168,
                O=>A3);
   
   XLXI_50 : OR6_HXILINX_Stopwatch
      port map (I0=>XLXN_174,
                I1=>XLXN_108,
                I2=>XLXN_162,
                I3=>XLXN_102,
                I4=>XLXN_97,
                I5=>XLXN_93,
                O=>Eo);
   
   XLXI_52 : OR5
      port map (I0=>XLXN_162,
                I1=>XLXN_178,
                I2=>XLXN_97,
                I3=>XLXN_96,
                I4=>XLXN_93,
                O=>Fo);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Lab4_1_schem_MUSER_Stopwatch is
   port ( AA  : in    std_logic; 
          AB  : in    std_logic; 
          AC  : in    std_logic; 
          AD  : in    std_logic; 
          BA  : in    std_logic; 
          BB  : in    std_logic; 
          BC  : in    std_logic; 
          BD  : in    std_logic; 
          CA  : in    std_logic; 
          CB  : in    std_logic; 
          CC  : in    std_logic; 
          CD  : in    std_logic; 
          clk : in    std_logic; 
          DA  : in    std_logic; 
          DB  : in    std_logic; 
          DC  : in    std_logic; 
          DD  : in    std_logic; 
          Ao  : out   std_logic; 
          A0  : out   std_logic; 
          A1  : out   std_logic; 
          A2  : out   std_logic; 
          A3  : out   std_logic; 
          Bo  : out   std_logic; 
          Co  : out   std_logic; 
          Do  : out   std_logic; 
          Eo  : out   std_logic; 
          Fo  : out   std_logic; 
          Go  : out   std_logic);
end Lab4_1_schem_MUSER_Stopwatch;

architecture BEHAVIORAL of Lab4_1_schem_MUSER_Stopwatch is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_43               : std_logic;
   signal XLXN_70               : std_logic;
   signal XLXN_74               : std_logic;
   signal XLXN_76               : std_logic;
   signal XLXN_169              : std_logic;
   signal XLXN_179              : std_logic;
   signal XLXN_181              : std_logic;
   signal XLXN_182              : std_logic;
   signal XLXN_183              : std_logic;
   signal XLXN_187              : std_logic;
   signal XLXN_189              : std_logic;
   signal XLXN_190              : std_logic;
   signal XLXN_194              : std_logic;
   signal XLXI_7_CLR_openSignal : std_logic;
   signal XLXI_8_CLR_openSignal : std_logic;
   component M4_1E_HXILINX_Stopwatch
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component CB2CE_HXILINX_Stopwatch
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component CC16CE_HXILINX_Stopwatch
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_Stopwatch
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   component SegmentDispay_MUSER_Stopwatch
      port ( A0 : out   std_logic; 
             A1 : inout std_logic; 
             A2 : out   std_logic; 
             A3 : out   std_logic; 
             Ao : out   std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             Bo : out   std_logic; 
             Co : out   std_logic; 
             Do : out   std_logic; 
             Eo : out   std_logic; 
             Fo : out   std_logic; 
             Go : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_4";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_7";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_5";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_6";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_8";
   attribute HU_SET of XLXI_51 : label is "XLXI_51_9";
   attribute HU_SET of XLXI_52 : label is "XLXI_52_10";
begin
   XLXN_194 <= '1';
   XLXI_1 : M4_1E_HXILINX_Stopwatch
      port map (D0=>AD,
                D1=>BD,
                D2=>CD,
                D3=>DD,
                E=>XLXN_179,
                S0=>XLXN_169,
                S1=>XLXN_43,
                O=>XLXN_187);
   
   XLXI_7 : CB2CE_HXILINX_Stopwatch
      port map (C=>XLXN_70,
                CE=>XLXN_179,
                CLR=>XLXI_7_CLR_openSignal,
                CEO=>open,
                Q0=>XLXN_169,
                Q1=>XLXN_43,
                TC=>open);
   
   XLXI_8 : CC16CE_HXILINX_Stopwatch
      port map (C=>clk,
                CE=>XLXN_179,
                CLR=>XLXI_8_CLR_openSignal,
                CEO=>open,
                Q=>open,
                TC=>XLXN_70);
   
   XLXI_13 : D2_4E_HXILINX_Stopwatch
      port map (A0=>XLXN_169,
                A1=>XLXN_43,
                E=>XLXN_179,
                D0=>XLXN_74,
                D1=>XLXN_189,
                D2=>XLXN_76,
                D3=>XLXN_190);
   
   XLXI_19 : INV
      port map (I=>XLXN_74,
                O=>A0);
   
   XLXI_20 : INV
      port map (I=>XLXN_76,
                O=>A2);
   
   XLXI_21 : OR2B1
      port map (I0=>XLXN_194,
                I1=>XLXN_194,
                O=>XLXN_179);
   
   XLXI_50 : M4_1E_HXILINX_Stopwatch
      port map (D0=>AC,
                D1=>BC,
                D2=>CC,
                D3=>DC,
                E=>XLXN_179,
                S0=>XLXN_169,
                S1=>XLXN_43,
                O=>XLXN_183);
   
   XLXI_51 : M4_1E_HXILINX_Stopwatch
      port map (D0=>AB,
                D1=>BB,
                D2=>CB,
                D3=>DB,
                E=>XLXN_179,
                S0=>XLXN_169,
                S1=>XLXN_43,
                O=>XLXN_182);
   
   XLXI_52 : M4_1E_HXILINX_Stopwatch
      port map (D0=>AA,
                D1=>BA,
                D2=>CA,
                D3=>DA,
                E=>XLXN_179,
                S0=>XLXN_169,
                S1=>XLXN_43,
                O=>XLXN_181);
   
   XLXI_53 : INV
      port map (I=>XLXN_189,
                O=>A1);
   
   XLXI_54 : INV
      port map (I=>XLXN_190,
                O=>A3);
   
   XLXI_62 : SegmentDispay_MUSER_Stopwatch
      port map (B0=>XLXN_181,
                B1=>XLXN_182,
                B2=>XLXN_183,
                B3=>XLXN_187,
                Ao=>Ao,
                A0=>open,
                A2=>open,
                A3=>open,
                Bo=>Bo,
                Co=>Co,
                Do=>Do,
                Eo=>Eo,
                Fo=>Fo,
                Go=>Go,
                A1=>open);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity modulo_6_MUSER_Stopwatch is
   port ( clock0 : in    std_logic; 
          reset  : in    std_logic; 
          start1 : in    std_logic; 
          EOC    : out   std_logic; 
          Q0     : out   std_logic; 
          Q1     : out   std_logic; 
          Q2     : out   std_logic; 
          Q3     : out   std_logic);
end modulo_6_MUSER_Stopwatch;

architecture BEHAVIORAL of modulo_6_MUSER_Stopwatch is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_4    : std_logic;
   signal XLXN_10   : std_logic;
   signal XLXN_12   : std_logic;
   signal XLXN_18   : std_logic;
   signal Q0_DUMMY  : std_logic;
   signal Q1_DUMMY  : std_logic;
   signal Q2_DUMMY  : std_logic;
   signal Q3_DUMMY  : std_logic;
   signal EOC_DUMMY : std_logic;
   component FTC_HXILINX_Stopwatch
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_11";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_12";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_13";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_14";
begin
   EOC <= EOC_DUMMY;
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   XLXI_1 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_18,
                T=>start1,
                Q=>Q0_DUMMY);
   
   XLXI_2 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_18,
                T=>XLXN_4,
                Q=>Q1_DUMMY);
   
   XLXI_3 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_18,
                T=>XLXN_12,
                Q=>Q2_DUMMY);
   
   XLXI_4 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_18,
                T=>XLXN_10,
                Q=>Q3_DUMMY);
   
   XLXI_5 : AND2
      port map (I0=>Q0_DUMMY,
                I1=>start1,
                O=>XLXN_4);
   
   XLXI_6 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>XLXN_4,
                O=>XLXN_12);
   
   XLXI_7 : AND2
      port map (I0=>Q2_DUMMY,
                I1=>XLXN_12,
                O=>XLXN_10);
   
   XLXI_8 : OR2
      port map (I0=>EOC_DUMMY,
                I1=>reset,
                O=>XLXN_18);
   
   XLXI_11 : AND4B2
      port map (I0=>Q0_DUMMY,
                I1=>Q3_DUMMY,
                I2=>Q2_DUMMY,
                I3=>Q1_DUMMY,
                O=>EOC_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity modulo_10_MUSER_Stopwatch is
   port ( clock0 : in    std_logic; 
          reset  : in    std_logic; 
          start1 : in    std_logic; 
          EOC    : out   std_logic; 
          Q0     : out   std_logic; 
          Q1     : out   std_logic; 
          Q2     : out   std_logic; 
          Q3     : out   std_logic);
end modulo_10_MUSER_Stopwatch;

architecture BEHAVIORAL of modulo_10_MUSER_Stopwatch is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_4    : std_logic;
   signal XLXN_9    : std_logic;
   signal XLXN_10   : std_logic;
   signal XLXN_20   : std_logic;
   signal Q0_DUMMY  : std_logic;
   signal Q1_DUMMY  : std_logic;
   signal Q2_DUMMY  : std_logic;
   signal Q3_DUMMY  : std_logic;
   signal EOC_DUMMY : std_logic;
   component FTC_HXILINX_Stopwatch
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_15";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_16";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_17";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_18";
begin
   EOC <= EOC_DUMMY;
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   Q3 <= Q3_DUMMY;
   XLXI_2 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_20,
                T=>start1,
                Q=>Q0_DUMMY);
   
   XLXI_3 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_20,
                T=>XLXN_4,
                Q=>Q1_DUMMY);
   
   XLXI_4 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_20,
                T=>XLXN_9,
                Q=>Q2_DUMMY);
   
   XLXI_5 : FTC_HXILINX_Stopwatch
      port map (C=>clock0,
                CLR=>XLXN_20,
                T=>XLXN_10,
                Q=>Q3_DUMMY);
   
   XLXI_6 : AND2
      port map (I0=>Q0_DUMMY,
                I1=>start1,
                O=>XLXN_4);
   
   XLXI_7 : AND2
      port map (I0=>Q1_DUMMY,
                I1=>XLXN_4,
                O=>XLXN_9);
   
   XLXI_8 : AND2
      port map (I0=>Q2_DUMMY,
                I1=>XLXN_9,
                O=>XLXN_10);
   
   XLXI_9 : OR2
      port map (I0=>EOC_DUMMY,
                I1=>reset,
                O=>XLXN_20);
   
   XLXI_10 : AND4B2
      port map (I0=>Q0_DUMMY,
                I1=>Q2_DUMMY,
                I2=>Q3_DUMMY,
                I3=>Q1_DUMMY,
                O=>EOC_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Stopwatch is
   port ( CLK   : in    std_logic; 
          PAUSE : in    std_logic; 
          RESET : in    std_logic; 
          START : in    std_logic; 
          A5    : out   std_logic; 
          A05   : out   std_logic; 
          A15   : out   std_logic; 
          A25   : out   std_logic; 
          A35   : out   std_logic; 
          B5    : out   std_logic; 
          C5    : out   std_logic; 
          D5    : out   std_logic; 
          E5    : out   std_logic; 
          F5    : out   std_logic; 
          G5    : out   std_logic);
end Stopwatch;

architecture BEHAVIORAL of Stopwatch is
   attribute BOX_TYPE   : string ;
   signal XLXN_5  : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_50 : std_logic;
   signal XLXN_60 : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_63 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_66 : std_logic;
   signal XLXN_67 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
   signal XLXN_71 : std_logic;
   signal XLXN_72 : std_logic;
   signal XLXN_73 : std_logic;
   signal XLXN_74 : std_logic;
   signal XLXN_76 : std_logic;
   signal XLXN_77 : std_logic;
   signal XLXN_78 : std_logic;
   signal XLXN_83 : std_logic;
   signal XLXN_84 : std_logic;
   signal XLXN_85 : std_logic;
   signal XLXN_86 : std_logic;
   signal XLXN_87 : std_logic;
   signal XLXN_88 : std_logic;
   signal XLXN_91 : std_logic;
   signal XLXN_92 : std_logic;
   component modulo_10_MUSER_Stopwatch
      port ( clock0 : in    std_logic; 
             EOC    : out   std_logic; 
             Q0     : out   std_logic; 
             Q1     : out   std_logic; 
             Q2     : out   std_logic; 
             Q3     : out   std_logic; 
             reset  : in    std_logic; 
             start1 : in    std_logic);
   end component;
   
   component modulo_6_MUSER_Stopwatch
      port ( clock0 : in    std_logic; 
             EOC    : out   std_logic; 
             Q0     : out   std_logic; 
             Q1     : out   std_logic; 
             Q2     : out   std_logic; 
             Q3     : out   std_logic; 
             reset  : in    std_logic; 
             start1 : in    std_logic);
   end component;
   
   component Lab4_1_schem_MUSER_Stopwatch
      port ( A0  : out   std_logic; 
             A1  : out   std_logic; 
             A2  : out   std_logic; 
             A3  : out   std_logic; 
             AA  : in    std_logic; 
             AB  : in    std_logic; 
             AC  : in    std_logic; 
             AD  : in    std_logic; 
             Ao  : out   std_logic; 
             BA  : in    std_logic; 
             BB  : in    std_logic; 
             BC  : in    std_logic; 
             BD  : in    std_logic; 
             Bo  : out   std_logic; 
             CA  : in    std_logic; 
             CB  : in    std_logic; 
             CC  : in    std_logic; 
             CD  : in    std_logic; 
             clk : in    std_logic; 
             Co  : out   std_logic; 
             DA  : in    std_logic; 
             DB  : in    std_logic; 
             DC  : in    std_logic; 
             DD  : in    std_logic; 
             Do  : out   std_logic; 
             Eo  : out   std_logic; 
             Fo  : out   std_logic; 
             Go  : out   std_logic);
   end component;
   
   component LATCH1_MUSER_Stopwatch
      port ( clock  : in    std_logic; 
             enable : out   std_logic; 
             pause  : in    std_logic; 
             start  : in    std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXN_5 <= '1';
   XLXN_50 <= '0';
   XLXI_2 : modulo_10_MUSER_Stopwatch
      port map (clock0=>CLK,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_62);
   
   XLXI_3 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_60,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_63);
   
   XLXI_4 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_64,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_65);
   
   XLXI_5 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_66,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_67);
   
   XLXI_6 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_68,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_69);
   
   XLXI_7 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_70,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_71);
   
   XLXI_8 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_72,
                reset=>XLXN_50,
                start1=>XLXN_5,
                EOC=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>XLXN_73);
   
   XLXI_16 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_74,
                reset=>RESET,
                start1=>XLXN_24,
                EOC=>open,
                Q0=>XLXN_29,
                Q1=>XLXN_30,
                Q2=>XLXN_31,
                Q3=>XLXN_32);
   
   XLXI_17 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_76,
                reset=>RESET,
                start1=>XLXN_24,
                EOC=>open,
                Q0=>XLXN_33,
                Q1=>XLXN_34,
                Q2=>XLXN_35,
                Q3=>XLXN_36);
   
   XLXI_18 : modulo_10_MUSER_Stopwatch
      port map (clock0=>XLXN_78,
                reset=>RESET,
                start1=>XLXN_24,
                EOC=>open,
                Q0=>XLXN_88,
                Q1=>XLXN_87,
                Q2=>XLXN_86,
                Q3=>XLXN_85);
   
   XLXI_19 : modulo_6_MUSER_Stopwatch
      port map (clock0=>XLXN_77,
                reset=>RESET,
                start1=>XLXN_24,
                EOC=>open,
                Q0=>XLXN_37,
                Q1=>XLXN_84,
                Q2=>XLXN_83,
                Q3=>XLXN_91);
   
   XLXI_21 : Lab4_1_schem_MUSER_Stopwatch
      port map (AA=>XLXN_29,
                AB=>XLXN_30,
                AC=>XLXN_31,
                AD=>XLXN_32,
                BA=>XLXN_33,
                BB=>XLXN_34,
                BC=>XLXN_35,
                BD=>XLXN_36,
                CA=>XLXN_37,
                CB=>XLXN_84,
                CC=>XLXN_83,
                CD=>XLXN_91,
                clk=>CLK,
                DA=>XLXN_88,
                DB=>XLXN_87,
                DC=>XLXN_86,
                DD=>XLXN_85,
                Ao=>A5,
                A0=>A05,
                A1=>A15,
                A2=>A25,
                A3=>A35,
                Bo=>B5,
                Co=>C5,
                Do=>D5,
                Eo=>E5,
                Fo=>F5,
                Go=>G5);
   
   XLXI_24 : LATCH1_MUSER_Stopwatch
      port map (clock=>CLK,
                pause=>XLXN_92,
                start=>START,
                enable=>XLXN_24);
   
   XLXI_26 : INV
      port map (I=>XLXN_62,
                O=>XLXN_60);
   
   XLXI_27 : INV
      port map (I=>XLXN_63,
                O=>XLXN_64);
   
   XLXI_28 : INV
      port map (I=>XLXN_65,
                O=>XLXN_66);
   
   XLXI_29 : INV
      port map (I=>XLXN_67,
                O=>XLXN_68);
   
   XLXI_30 : INV
      port map (I=>XLXN_69,
                O=>XLXN_70);
   
   XLXI_31 : INV
      port map (I=>XLXN_71,
                O=>XLXN_72);
   
   XLXI_32 : INV
      port map (I=>XLXN_73,
                O=>XLXN_74);
   
   XLXI_33 : INV
      port map (I=>XLXN_32,
                O=>XLXN_76);
   
   XLXI_34 : INV
      port map (I=>XLXN_36,
                O=>XLXN_77);
   
   XLXI_35 : INV
      port map (I=>XLXN_83,
                O=>XLXN_78);
   
   XLXI_38 : OR2
      port map (I0=>PAUSE,
                I1=>RESET,
                O=>XLXN_92);
   
end BEHAVIORAL;


