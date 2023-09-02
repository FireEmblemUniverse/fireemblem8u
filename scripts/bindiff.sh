#!/bin/sh

xxd fireemblem8.gba > fireemblem8.hex
xxd baserom.gba > baserom.hex
diff fireemblem8.hex baserom.hex
rm fireemblem8.hex baserom.hex
