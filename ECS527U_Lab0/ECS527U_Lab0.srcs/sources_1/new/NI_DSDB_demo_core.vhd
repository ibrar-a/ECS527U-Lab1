----------------------------------------------------------------------------------
-- Company: Queen Mary University of London
-- Engineer: Matthew Tang
-- 
-- Create Date: 13.02.2019 11:12:03
-- Design Name: 8-input AND gate
-- Module Name: NI_DSDB_demo_core - Behavioral
-- Project Name: ECS527U Lab 0 - AND8
-- Target Devices: NI DSDB Board
-- Tool Versions: Vivado 2017.03
-- Updated: 17.01.2022 by Matthew
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NI_DSDB_demo_core is
    port (
        sw: in std_logic_vector(7 downto 0);
        elvis_dio: in std_logic_vector(15 downto 0);
        led: out std_logic_vector(7 downto 0);
        btn: in std_logic_vector(3 downto 0);
        CLK: in std_logic;
        ss3: out std_logic_vector(3 downto 0);
        ss2: out std_logic_vector(3 downto 0);
        ss1: out std_logic_vector(3 downto 0);
        ss0: out std_logic_vector(3 downto 0)
    );
end NI_DSDB_demo_core;

architecture structural of NI_DSDB_demo_core is
    component AND8 is
    port (
        A: in std_logic_vector(7 downto 0);
        Y: out std_logic
    );
    end component;
begin    
    U1: AND8 port map (A => elvis_dio(7 downto 0),  Y => led(7)); -- LD7
    U2: AND8 port map (A => elvis_dio(15 downto 8), Y => led(6)); -- LD6
    U3: AND8 port map (A => sw(7 downto 0),         Y => led(0)); -- LD0  
    
    led(5 downto 1) <= (others => '0'); -- these are OFF
    
    ss3 <= "1110"; -- E
    ss2 <= "0101"; -- 5
    ss1 <= "0010"; -- 2
    ss0 <= "0111"; -- 7
end structural;
