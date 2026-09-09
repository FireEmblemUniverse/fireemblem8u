-- GBAHawk Lua: during a movie replay, at each checkpoint frame dump ALL GBA memory
-- regions (EWRAM, IWRAM, Palette, VRAM, OAM) + a screenshot, and optionally a
-- savestate, for matching-vs-shifted diffing (ramdiff.py).
--
-- EWRAM/IWRAM hold game state (incl. FE8's render buffers gOam/gBGxTilemapBuffer/
-- gPaletteBuffer); Palette(0x05)/VRAM(0x06)/OAM(0x07) hold the final composited
-- output, which maps directly to screenshot differences when troubleshooting a UI
-- divergence.
--
-- cfg (out/cfg.txt): line1 = tag, line2 = comma/space-separated dump frames,
--                    line3 = savestate frame (0 = none).

local OUT = "C:\\gbahawk_test\\out\\"
local cfg = io.open(OUT .. "cfg.txt", "r")
local tag = cfg:read("*l")
local frames = {}
for x in cfg:read("*l"):gmatch("%d+") do frames[tonumber(x)] = true end
local ssf = tonumber(cfg:read("*l")) or 0
cfg:close()

client.invisibleemulation(true)
if client.speedmode then client.speedmode(6399) end
memory.usememorydomain("System Bus")

-- whole GBA memory map except ROM (0x08, the program) and BIOS (0x00, fixed).
local REGIONS = {
  { "ew",   0x02000000, 0x40000 },  -- EWRAM (game state, incl. FE8 render buffers)
  { "iw",   0x03000000, 0x08000 },  -- IWRAM
  { "io",   0x04000000, 0x00400 },  -- I/O regs (DISPCNT, DMA src/dst pointers, ...)
  { "pal",  0x05000000, 0x00400 },  -- Palette
  { "vram", 0x06000000, 0x18000 },  -- VRAM (tiles)
  { "oam",  0x07000000, 0x00400 },  -- OAM (sprites)
  { "sram", 0x0E000000, 0x10000 },  -- GamePak save (battery/Flash); empty if Use_SRAM=false
}

local function dump(addr, len, path)
  local t = memory.readbyterange(addr, len)
  local b = {}
  for i = 0, len - 1 do b[i + 1] = string.char(t[i] or 0) end
  local f = io.open(path, "wb"); f:write(table.concat(b)); f:close()
end

local maxf = 0
for fr in pairs(frames) do if fr > maxf then maxf = fr end end

while emu.framecount() <= maxf do
  local fc = emu.framecount()
  if ssf > 0 and fc == ssf then savestate.save(OUT .. tag .. "_" .. fc .. ".State") end
  if frames[fc] then
    client.screenshot(OUT .. tag .. "_" .. string.format("%07d", fc) .. ".png")
    for _, r in ipairs(REGIONS) do
      dump(r[2], r[3], OUT .. tag .. "_" .. fc .. "_" .. r[1] .. ".bin")
    end
  end
  emu.frameadvance()
end

local d = io.open(OUT .. tag .. "_cap_done.txt", "w"); d:write("done@" .. emu.framecount()); d:close()
client.exit()
