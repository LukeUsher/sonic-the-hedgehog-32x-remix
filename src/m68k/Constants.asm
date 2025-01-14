; ---------------------------------------------------------------------------
; Constants
; ---------------------------------------------------------------------------

; SMPS Control Registers
Size_of_SegaPCM:		equ $6978
SMPS_BASE:		equ $A01B63
zPalFlag:		equ SMPS_BASE
zTempoSpeedup:		equ zPalFlag+1
zMusicNumber:		equ zTempoSpeedup+1			
zSFXNumber0:		equ zMusicNumber+1		
zSFXNumber1:		equ zSFXNumber0+1				
zPauseFlag:		equ zSFXNumber1+1
zPWMUnk			equ zPauseFlag+1
zShouldIssuePWM		equ zPWMUnk+1
zPWMRequestBytes	equ zShouldIssuePWM+1

; 32X Control Registers
MARS_BASE:		equ $A15000
MARS_CONTROL:		equ $A15100
MARS_INT_CTRL:		equ $A15102
MARS_ROM_BANK:		equ $A15104
MARS_DREQ_CTRL:		equ $A15106
MARS_DREQ_SRC:		equ $A15108
MARS_DREQ_DEST:		equ $A1510C
MARS_DREQ_LENGTH:	equ $A15110
MARS_FIFO:		equ $A15112
MARS_SEGA_TV:		equ $A1511A

; Communication Registers
MARS_SYS_COMM0:		equ $A15120
MARS_SYS_COMM2:		equ $A15122
MARS_SYS_COMM4:		equ $A15124
MARS_SYS_COMM6:		equ $A15126
MARS_SYS_COMM8:		equ $A15128
MARS_SYS_COMMA:		equ $A1512A
MARS_SYS_COMMC:		equ $A1512C
MARS_SYS_COMME:		equ $A1512E

; PWM Registers
MARS_PWM_CTRL:		equ $A15130
MARS_PWM_CYCLE:		equ $A15132
MARS_LEFT_PULSE:	equ $A15134
MARS_RIGHT_PULSE:	equ $A15136
MARS_MONO_PULSE:	equ $A15138

; VDP addressses
vdp_data_port:		equ $C00000
vdp_control_port:	equ $C00004
vdp_counter:		equ $C00008

psg_input:		equ $C00011

; Z80 addresses
z80_ram:		equ $A00000	; start of Z80 RAM
z80_dac3_pitch:		equ $A000EA
z80_dac_status:		equ $A01FFD
z80_dac_sample:		equ $A01FFF
z80_ram_end:		equ $A02000	; end of non-reserved Z80 RAM
z80_version:		equ $A10001
z80_port_1_data:	equ $A10002
z80_port_1_control:	equ $A10008
z80_port_2_control:	equ $A1000A
z80_expansion_control:	equ $A1000C
z80_bus_request:	equ $A11100
z80_reset:		equ $A11200
ym2612_a0: 		equ $A04000
ym2612_d0: 		equ $A04001
ym2612_a1: 		equ $A04002
ym2612_d1: 		equ $A04003

security_addr:		equ $A14000

; Sound driver constants
zTrackSz:	equ $30

; VRAM data
vram_fg:	equ $C000	; foreground namespace
vram_bg:	equ $E000	; background namespace
vram_sonic:	equ $F000	; Sonic graphics
vram_sprites:	equ $F800	; sprite table
vram_hscroll:	equ $FC00	; horizontal scroll table

; Game modes
id_Sega:	equ ptr_GM_Sega-GameModeArray	; $00
id_Title:	equ ptr_GM_Title-GameModeArray	; $04
id_Demo:	equ ptr_GM_Demo-GameModeArray	; $08
id_Level:	equ ptr_GM_Level-GameModeArray	; $0C
id_Special:	equ ptr_GM_Special-GameModeArray; $10
id_Continue:	equ ptr_GM_Cont-GameModeArray	; $14
id_Ending:	equ ptr_GM_Ending-GameModeArray	; $18
id_Credits:	equ ptr_GM_Credits-GameModeArray; $1C

; Levels
id_GHZ:		equ 0
id_LZ:		equ 1
id_MZ:		equ 2
id_SLZ:		equ 3
id_SYZ:		equ 4
id_SBZ:		equ 5
id_EndZ:	equ 6
id_SS:		equ ZoneCount	; 7 by default

; Colours
cBlack:		equ $000		; colour black
cWhite:		equ $EEE		; colour white
cBlue:		equ $E00		; colour blue
cGreen:		equ $0E0		; colour green
cRed:		equ $00E		; colour red
cYellow:	equ cGreen+cRed		; colour yellow
cAqua:		equ cGreen+cBlue	; colour aqua
cMagenta:	equ cBlue+cRed		; colour magenta

; Joypad input
btnStart:	equ %10000000 ; Start button	($80)
btnA:		equ %01000000 ; A		($40)
btnC:		equ %00100000 ; C		($20)
btnB:		equ %00010000 ; B		($10)
btnR:		equ %00001000 ; Right		($08)
btnL:		equ %00000100 ; Left		($04)
btnDn:		equ %00000010 ; Down		($02)
btnUp:		equ %00000001 ; Up		($01)
btnDir:		equ %00001111 ; Any direction	($0F)
btnABC:		equ %01110000 ; A, B or C	($70)
bitStart:	equ 7
bitA:		equ 6
bitC:		equ 5
bitB:		equ 4
bitR:		equ 3
bitL:		equ 2
bitDn:		equ 1
bitUp:		equ 0

; Object variables
obRender:	equ 1	; bitfield for x/y flip, display mode
obGfx:		equ 2	; palette line & VRAM setting (2 bytes)
obMap:		equ 4	; mappings address (4 bytes)
obX:		equ 8	; x-axis position (2-4 bytes)
obScreenY:	equ $A	; y-axis position for screen-fixed items (2 bytes)
obY:		equ $C	; y-axis position (2-4 bytes)
obVelX:		equ $10	; x-axis velocity (2 bytes)
obVelY:		equ $12	; y-axis velocity (2 bytes)
obInertia:	equ $14	; potential speed (2 bytes)
obHeight:	equ $16	; height/2
obWidth:	equ $17	; width/2
obPriority:	equ $18	; sprite stack priority -- 0 is front
obActWid:	equ $19	; action width
obFrame:	equ $1A	; current frame displayed
obAniFrame:	equ $1B	; current frame in animation script
obAnim:		equ $1C	; current animation
obNextAni:	equ $1D	; next animation
obTimeFrame:	equ $1E	; time to next frame
obDelayAni:	equ $1F	; time to delay animation
obColType:	equ $20	; collision response type
obColProp:	equ $21	; collision extra property
obStatus:	equ $22	; orientation or mode
obRespawnNo:	equ $23	; respawn list index number
obRoutine:	equ $24	; routine number
ob2ndRout:	equ $25	; secondary routine number
obAngle:	equ $26	; angle
obSubtype:	equ $28	; object subtype
obSolid:	equ ob2ndRout ; solid status flag

; Object variables (Sonic 2 disassembly nomenclature)
render_flags:	equ 1	; bitfield for x/y flip, display mode
art_tile:	equ 2	; palette line & VRAM setting (2 bytes)
mappings:	equ 4	; mappings address (4 bytes)
x_pos:		equ 8	; x-axis position (2-4 bytes)
y_pos:		equ $C	; y-axis position (2-4 bytes)
x_vel:		equ $10	; x-axis velocity (2 bytes)
y_vel:		equ $12	; y-axis velocity (2 bytes)
y_radius:	equ $16	; height/2
x_radius:	equ $17	; width/2
priority:	equ $18	; sprite stack priority -- 0 is front
width_pixels:	equ $19	; action width
mapping_frame:	equ $1A	; current frame displayed
anim_frame:	equ $1B	; current frame in animation script
anim:		equ $1C	; current animation
next_anim:	equ $1D	; next animation
anim_frame_duration: equ $1E ; time to next frame
collision_flags: equ $20 ; collision response type
collision_property: equ $21 ; collision extra property
status:		equ $22	; orientation or mode
respawn_index:	equ $23	; respawn list index number
routine:	equ $24	; routine number
routine_secondary: equ $25 ; secondary routine number
angle:		equ $26	; angle
subtype:	equ $28	; object subtype

; Animation flags
afEnd:		equ $FF	; return to beginning of animation
afBack:		equ $FE	; go back (specified number) bytes
afChange:	equ $FD	; run specified animation
afRoutine:	equ $FC	; increment routine counter
afReset:	equ $FB	; reset animation and 2nd object routine counter
af2ndRoutine:	equ $FA	; increment 2nd routine counter

; Background music
bgm_GHZ:	equ $01
bgm_LZ:		equ $02
bgm_MZ:		equ $03
bgm_SLZ:	equ $04
bgm_SYZ:	equ $05
bgm_SBZ:	equ $06
bgm_Invincible:	equ $07
bgm_ExtraLife:	equ $08
bgm_SS:		equ $09
bgm_Title:	equ $0A
bgm_Ending:	equ $0B
bgm_Boss:	equ $0C
bgm_FZ:		equ $0D
bgm_GotThrough:	equ $0E
bgm_GameOver:	equ $0F
bgm_Continue:	equ $10
bgm_Credits:	equ $11
bgm_Drowning:	equ $12
bgm_Emerald:	equ $13
bgm_Fade:	equ $E1
bgm_Stop:	equ $E1

; Sound effects
sfx_Jump:	equ $62
sfx_Lamppost:	equ $63
sfx_A2:		equ $A2
sfx_Death:	equ $35
sfx_Skid:	equ $36
sfx_A5:		equ $A5
sfx_HitSpikes:	equ $37
sfx_Push:	equ $69
sfx_SSGoal:	equ $6A
sfx_SSItem:	equ $6B
sfx_Splash:	equ $6C
sfx_AB:		equ $AB
sfx_HitBoss:	equ $6E
sfx_Bubble:	equ $38
sfx_Fireball:	equ $70
sfx_Shield:	equ $71
sfx_Saw:	equ $D8
sfx_Electric:	equ $79
sfx_Drown:	equ $3B
sfx_Flamethrower:equ $48
sfx_Bumper:	equ $AA
sfx_Ring:	equ $33
sfx_SpikesMove:	equ $52
sfx_Rumbling:	equ $6F
sfx_B8:		equ $B8
sfx_Collapse:	equ $59
sfx_SSGlass:	equ $B5
sfx_Door:	equ $6D
sfx_Teleport:	equ $73
sfx_ChainStomp:	equ $5F
sfx_Roll:	equ $3C
sfx_Continue:	equ $AC
sfx_Basaran:	equ $47
sfx_BreakItem:	equ $3D
sfx_Warning:	equ $A9
sfx_GiantRing:	equ $B3
sfx_Bomb:	equ $B4
sfx_Cash:	equ $B0
sfx_RingLoss:	equ $B9
sfx_ChainRise:	equ $D2
sfx_Burning:	equ $D5
sfx_Bonus:	equ $8C
sfx_EnterSS:	equ $AF
sfx_WallSmash:	equ $59
sfx_Spring:	equ $B1
sfx_Switch:	equ $5B
sfx_RingLeft:	equ $34
sfx_Signpost:	equ $CF
sfx_Waterfall:	equ $DB
sfx_Sega:	equ $FF
sfx_SpinDash:	equ $AB
sfx_SpinRelease:equ $B6