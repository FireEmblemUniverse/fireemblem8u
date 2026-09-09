-- GBAHawk Lua: replay the loaded movie headless and screenshot the framebuffer at
-- evenly-spaced checkpoints + the final frame, then exit. Run via:
--   GBAHawk.exe <rom> --movie=<gbmv> --lua=fingerprint.lua
-- Config from out/cfg.txt: line1 = tag (output prefix), line2 = ncheckpoints,
-- line3 = maxframe (0 => full movie length; >0 stops early for testing).
--
-- The framebuffer is the valid shiftability oracle: a correctly-shifted ROM, fed
-- the same TAS inputs, must render identical frames; RAM is NOT comparable (it
-- holds relocated pointers = shifted addresses). invisibleemulation skips the GUI
-- blit (verified to keep client.screenshot() byte-identical) for a little speed.

local OUT = "C:\\gbahawk_test\\out\\"

local cfg = io.open(OUT .. "cfg.txt", "r")
local tag = cfg:read("*l")
local ncp = tonumber(cfg:read("*l"))
local maxf = tonumber(cfg:read("*l"))
cfg:close()

client.invisibleemulation(true)
if client.speedmode then client.speedmode(6399) end

local len = movie.isloaded() and movie.length() or 0
local limit = len
if maxf and maxf > 0 and maxf < len then limit = maxf end

local cps = {}
for k = 1, ncp do cps[math.floor(k * limit / ncp)] = true end
cps[limit - 1] = true

local man = io.open(OUT .. tag .. "_manifest.txt", "w")
while emu.framecount() < limit do
  local fc = emu.framecount()
  if cps[fc] then
    client.screenshot(OUT .. tag .. "_" .. string.format("%07d", fc) .. ".png")
    man:write(fc .. "\n"); man:flush()
  end
  emu.frameadvance()
end
local fc = emu.framecount()
client.screenshot(OUT .. tag .. "_" .. string.format("%07d", fc) .. ".png")
man:write(fc .. "\n"); man:close()

local d = io.open(OUT .. tag .. "_done.txt", "w")
d:write("reached=" .. fc .. " movie_length=" .. len .. " limit=" .. limit)
d:close()
client.exit()
