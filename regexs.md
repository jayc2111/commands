# regexs

- `PB_2_71_.*0x.{22}89|PB_71_2_.*0x.{22}89`: strings with part-wise same content
- `send_data .*(\n.*){3,}?\n.*send_data end--------`: strings acreoos multiple lines
- `RecAddr=2\t*SndAddr=90.*[^\n]*\n.*Data `: find across line break
- `MVBTPort880|MVBTPort8A0|MVBTPort622`: OR-concatenation
- `sap (?!19)`: find not equal to giving string

