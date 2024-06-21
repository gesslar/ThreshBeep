-- Beep file downloaded from
-- https://freesound.org/people/tim.kahn/sounds/91926/

local ThresholdBeepFile = getMudletHomeDir() .. "/ThresholdBeep/Media/Sounds/91926__tim-kahn__ding.wav"
playSoundFile(ThresholdBeepFile)

for _, match in pairs(matches) do
  selectString("\a", 1)
  replace("")
end
