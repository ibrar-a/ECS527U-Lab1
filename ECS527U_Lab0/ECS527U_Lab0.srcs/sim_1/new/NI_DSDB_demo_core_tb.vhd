library IEEE;
use IEEE.std_logic_1164.all;

entity NI_DSDB_demo_core_tb is
end NI_DSDB_demo_core_tb;

architecture sim of NI_DSDB_demo_core_tb is
    component NI_DSDB_demo_core is
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
    end component;
    signal sw, led: std_logic_vector(7 downto 0);
    signal elvis_dio: std_logic_vector(15 downto 0);
    signal CLK: std_logic;
    signal btn, ss3, ss2, ss1, ss0: std_logic_vector(3 downto 0);
begin
    UUT: NI_DSDB_demo_core port map (sw=>sw, elvis_dio=>elvis_dio, led=>led, CLK=>CLK, btn=>btn, ss3=>ss3, ss2=>ss2, ss1=>ss1, ss0=>ss0);
    sim_proc: process
    begin
        -- 4 random cases
        elvis_dio(15 downto 8) <= "10110110"; 
        elvis_dio(7 downto 0) <= "01100100";     
        wait for 100 ns;
        elvis_dio(15 downto 8) <= "11110111";
        elvis_dio(7 downto 0) <= "11111111";     
        wait for 100 ns;
        elvis_dio(15 downto 8) <= "11111111";
        elvis_dio(7 downto 0) <= "10101100";     
        wait for 100 ns;
        elvis_dio(15 downto 8) <= "00000001";
        elvis_dio(7 downto 0) <= "11101101";
        wait for 100 ns;
        wait;
    end process sim_proc;
end sim;