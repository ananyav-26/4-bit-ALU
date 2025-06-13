-- =============================================================================
-- Title       : 4-bit ALU
-- Author      : Ananya Vaidya
-- =============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity Declaration
entity alu is
    Port ( 
        inp_a   : in  signed(3 downto 0);         -- 4-bit signed input A
        inp_b   : in  signed(3 downto 0);         -- 4-bit signed input B
        sel     : in  STD_LOGIC_VECTOR (2 downto 0); -- 3-bit select signal
        out_alu : out signed(3 downto 0)          -- 4-bit signed ALU output
    );
end alu;

-- Architecture Definition
architecture Behavioral of alu is
begin

    -- ALU operation based on select signal
    process(inp_a, inp_b, sel)
    begin
        case sel is
            when "000" =>
                out_alu <= inp_a + inp_b;         -- Addition
            when "001" =>
                out_alu <= inp_a - inp_b;         -- Subtraction
            when "010" =>
                out_alu <= inp_a - 1;             -- Decrement A
            when "011" =>
                out_alu <= inp_a + 1;             -- Increment A
            when "100" =>
                out_alu <= inp_a and inp_b;       -- Bitwise AND
            when "101" =>
                out_alu <= inp_a or inp_b;        -- Bitwise OR
            when "110" =>
                out_alu <= not inp_a;             -- Bitwise NOT (on A)
            when "111" =>
                out_alu <= inp_a xor inp_b;       -- Bitwise XOR
            when others =>
                null;                             -- No operation / default
        end case;
    end process;

end Behavioral;

