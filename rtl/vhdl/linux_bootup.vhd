
library ieee;
use ieee.std_logic_1164.all;

entity linux_bootup is

  port (
    sysclk     : in  std_logic;
    reset_n    : in  std_logic;

    -- DDR Memory
        mem_clk_p   : inout   std_logic;
    mem_clk_n   : inout   std_logic;
    mem_cke     : inout   std_logic;
    mem_a       : inout   std_logic_vector(14 downto 0);
    mem_dq      : inout std_logic_vector(31 downto 0);
    mem_dqs_p   : inout std_logic_vector(3 downto 0);
    mem_dqs_n   : inout std_logic_vector(3 downto 0);
    mem_dm      : inout   std_logic_vector(3 downto 0);
    mem_we_n    : inout   std_logic;
    mem_ras_n   : inout   std_logic;
    mem_cas_n   : inout   std_logic;
    mem_odt     : inout   std_logic;
    mem_cs_n    : inout   std_logic;
    mem_ba      : inout   std_logic_vector(2 downto 0);
    mem_reset_n : inout   std_logic;
    mem_vr_n : inout std_logic;
    mem_vr_p : inout std_logic;

    ps_clk : inout std_logic;
    ps_porb : inout std_logic;
    ps_srstb : inout std_logic;

    ps_mio : inout std_logic_vector(53 downto 0);

    
    buttons_i  : in  std_logic_vector(4 downto 0);
    switches_i : in  std_logic_vector(7 downto 0);
    leds_o     : out std_logic_vector(7 downto 0));

end entity linux_bootup;

architecture linux_bootup_rtl of linux_bootup is

  component linux_bootup_cpu is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    btns_5bits_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component linux_bootup_cpu;
  
begin  -- architecture linux_bootup_rtl

  linux_bootup_cpu_i: component linux_bootup_cpu
     port map (
      DDR_addr => mem_a,
      DDR_ba => mem_ba,
      DDR_cas_n => mem_cas_n,
      DDR_ck_n =>mem_clk_n,
      DDR_ck_p => mem_clk_p,
      DDR_cke => mem_cke,
      DDR_cs_n => mem_cs_n,
      DDR_dm => mem_dm,
      DDR_dq => mem_dq,
      DDR_dqs_n => mem_dqs_n,
      DDR_dqs_p => mem_dqs_p,
      DDR_odt => mem_odt,
      DDR_ras_n => mem_ras_n,
      DDR_reset_n => mem_reset_n,
      DDR_we_n => mem_we_n,
      FIXED_IO_ddr_vrn => mem_vr_n,
      FIXED_IO_ddr_vrp => mem_vr_p,
      FIXED_IO_mio => ps_mio,
      FIXED_IO_ps_clk => ps_clk,
      FIXED_IO_ps_porb => ps_porb,
      FIXED_IO_ps_srstb => ps_srstb,
      btns_5bits_tri_i => buttons_i,
      leds_8bits_tri_o => leds_o,
      sws_8bits_tri_i => switches_i
    );

end architecture linux_bootup_rtl;
