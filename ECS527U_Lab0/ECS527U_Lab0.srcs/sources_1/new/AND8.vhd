----------------------------------------------------------------------------------
-- Company: EECS, Queen Mary University of London
-- 
-- Create Date: 27.01.2022
-- Design Name: 
-- Module Name: AND8 - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND8 is
port (
    A: in std_logic_vector(7 downto 0);
    Y: out std_logic
);
end AND8;

architecture Behavioral of AND8 is
    signal Y1, Y2: std_logic;
begin
    Y1 <= A(3) and A(2) and A(1) and A(0);
    Y2 <= A(7) and A(6) amd A(5) and A(4);
    Y <= Y1 and Y2;
end Behavioral;
