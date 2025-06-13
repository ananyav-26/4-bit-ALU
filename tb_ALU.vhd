-- =============================================================================
-- Title       : 4-bit ALU Testbench
-- Author      : Ananya Vaidya
-- =============================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Testbench Entity
ENTITY Tb_alu IS
END Tb_alu;

-- Architecture for the testbench
ARCHITECTURE behavior OF Tb_alu IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT alu
        PORT (
            inp_a   : IN signed(3 downto 0);          -- ALU input A
            inp_b   : IN signed(3 downto 0);          -- ALU input B
            sel     : IN std_logic_vector(2 downto 0);-- Operation selector
            out_alu : OUT signed(3 downto 0)          -- ALU result
        );
    END COMPONENT;

    -- Signals for driving inputs and observing outputs
    signal inp_a   : signed(3 downto 0) := (others => '0');
    signal inp_b   : signed(3 downto 0) := (others => '0');
    signal sel     : std_logic_vector(2 downto 0) := (others => '0');
    signal out_alu : signed(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: alu PORT MAP (
        inp_a   => inp_a,
        inp_b   => inp_b,
        sel     => sel,
        out_alu => out_alu
    );

    -- Stimulus process to test all operations
    stim_proc: process
    begin
        -- Initial wait before stimulus
        wait for 100 ns;

        -- Apply sample inputs
        inp_a <= "1011"; -- -5 in signed 4-bit
        inp_b <= "1111"; -- -1 in signed 4-bit

        -- Cycle through all ALU operations
        sel <= "000"; -- Addition: -5 + (-1) = -6
        wait for 100 ns;
        sel <= "001"; -- Subtraction: -5 - (-1) = -4
        wait for 100 ns;
        sel <= "010"; -- Decrement A: -5 - 1 = -6
        wait for 100 ns;
        sel <= "011"; -- Increment A: -5 + 1 = -4
        wait for 100 ns;
        sel <= "100"; -- AND: bitwise AND
        wait for 100 ns;
        sel <= "101"; -- OR: bitwise OR
        wait for 100 ns;
        sel <= "110"; -- NOT A: bitwise NOT of A
        wait for 100 ns;
        sel <= "111"; -- XOR: bitwise XOR
        wait;
    end process;

END;
