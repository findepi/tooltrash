#!/bin/bash

# swap right option and right command

# change section key "§" to backtick "`"
# change pound key "£" to tilde "~"
hidutil property --set '{"UserKeyMapping": [
     {"HIDKeyboardModifierMappingSrc":0x7000000e7,
      "HIDKeyboardModifierMappingDst":0x7000000e6},
     {"HIDKeyboardModifierMappingSrc":0x7000000e6,
      "HIDKeyboardModifierMappingDst":0x7000000e7},
     {"HIDKeyboardModifierMappingSrc":0x700000064,
      "HIDKeyboardModifierMappingDst":0x700000035}
]}'


