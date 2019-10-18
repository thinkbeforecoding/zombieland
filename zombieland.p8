pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function istile(x,y,t)
 local c = mget(x/8,y/8)
 if (band(fget(c),t)!=0)then
 	return true
 else
  return false
 end
end

function isfloor(x,y)
 return istile(x,y,1)
end

function find_floor(x,y)
 local sy = flr(y/8)*8+8
 while (not isfloor(x,sy)) and sy < 8*32 do
 	sy+=8
 end
 return sy
end 	

function iscoin(x,y)
 return istile(x,y,0x80)
end

function removecoin(x,y)
 mset(x/8,y/8,13)
end
-->8

x = 8
y = 56
jump=false
vy = 0
score=0

function _update()
if (btn(⬅️)) then x-=1 end
if (btn(➡️)) then x+=1 end
if (btn(❎) and not jump) then
		vy = -4
		jump = true
end
vy+=0.3
ny=y+vy
sy=find_floor(x,y)
if ny>=sy-8 then
	jump=false
	vy=0
	ny=sy-8
else
 jump=true
end
x = min(max(x,0),127*8)
y = ny

if iscoin(x+4,y+4) then
		removecoin(x+4,y+4)
		score+=10
		sfx(5)
end
end

function _draw() 
cls(5)
sx = min(max(x-64,0),(128-16)*8)
sy=0
camera(sx,sy)

map(0,0,0,0,128,128)
spr(4,x,y)

camera(0,0)
print("score:"..score,4,4,0)
--fillp(0b1011001110001100)
--rectfill(0,0,127,127,0x89)
end
__gfx__
00000000bbbbbbbb0000000088008800000000000000000044454444000000000000000000111100001111005222222555555555555555550000000000000000
00000000bbbbbbbb0000000088008800001111000011110044545444000000000000000001cccc1001cccc1024444442555ee255555555550000000000000000
00700700333333330000000000880088011fff0000fff1104444445500bbbb0000bbbb00018c8c1001c8c8102433334255eeee255555555500bbbb0000bbbb00
000770004444444500000000008800880114f400004f411054444444008b8b0000b8b80001cccc1001cccc102444344255ee2e255555555500b8b800008b8b00
00077000455444440000000088008800011fff0000fff1104444444400bbbb0000bbbb00001cc100001cc1002443444255ee2e255555555500bbbb0000bbbb00
007007004444444400000000880088000118810000188110444444440bdbd000000dbdb0001cc100001cc1002433334255eeee25555555550009b110011b9000
00000000544445440000000000880088011881000018811045544445000dd000000dd000000110000001100024444442555ee255555555550009100000019000
00000000444454540000000000880088011881000018811044454454000110000001100000000000000000005222222555555555555555550002200000022000
5555555500222200002222005588885555bbbb550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555502eeee2002eeee2058e888855babbbb50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555502e8e820028e8e208e7e8888ba7abbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555502ee8e2002e8ee2088e88882bbabbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555002e82000028e20088888882bbbbbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555550002ee200002ee20088888882bbbbbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555550002200000022000588888255bbbbb350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555500000000000000005582225555b333550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
6060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
6060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
6060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
6060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
6060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
__gff__
00010000000001020204048180000a0a08141440200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0b0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c0d0d0d0c0d0f0d0d0d0c0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c01010101010101010d0d0d0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c06060606060606060101010101010c0c0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0b0d0d0d0d0d0d0d0d0d0d0d0d0c0c0d0d0d0d0c0c0c0c0c0d0d0d0d0c0106060606060606060606060606060101010d0d0d0d0d0d0d0d0d0d0d120d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c0d0d0d0d0c0c0c0c0c0d0d0d0d0c0606060606060606060606060606060606060101010101010101010101010d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d140d0d0d0d0d0d0c0c0d0d0d070d0d0d0d0d0d01010d0d07090c0c0c0c0c0d0d0d0c01060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c0c
0d0d0d0d0d0d01010101010101010d0d0d090d0d06060101010101010101010d0d0d0c06060606060606060606060606060606060606060606060606060d0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c130c
010101010101060606060606060601010101010106060606060606060606060101010106060606060606060606060606060606060606060606060606060d0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c010101
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c010d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0b0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0c01060d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0c0c0d0c0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0d0d0d0d0d0c0d0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c01010d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0d0d0d0d0c0d0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0d0d0d0d0101010d0d0d0d0d0d
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060601010101010101010d0d0d070c0c0c0c0c0d0d0d0d0c0d0d0d0c0d0c0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c0d01010d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0101010101010101010101010101010101010101010101010e0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d120c0d01010d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d01010101010101010101010101010101010101010d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
__sfx__
0006002018570101700f2702f1100f2702f110184700f270101700f570093700f570322100f5700b2700f57016470115703d710092700827005370135700737029110125700b2701b770197701a7701547016470
000f00200c2500000000000000000c2500000000000000000c2500000000000000000e2500000000000000000c2500000000000000000c2500000000000000000c2500000000000000000e250000000000000000
000f00200c674000000000000000396500000000000000000c650000000c65000000396500000000000000000c674000000000000000396500000000000000000c650000000c6500000039650000000000000000
001000191825000000000000000018250000000000000000182500000000000000001a2500000000000000001c250000000000000000000000000000000000001a25000000000000000000000000000000000000
00100020182500000000000000001c2500000000000000001a2500000000000000001a250000000000000000182501a2501c2501d2501f2502125023250242501a2501c2501d2501f250182501a2501c2501d250
000500001e550315503455034c402cd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01020344
00 01020444

