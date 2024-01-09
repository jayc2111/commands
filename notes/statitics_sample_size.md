# Inferenzstatistik

# Zufallstichprobe

µ --> Erwartungswert
sigma --> Standardabweichung

## Bedingungen:
1. Die Elemente werden zufällig aus der Grundgesamtheit gezogen und
2. die Wahrscheinlichkeit, mit der ein Element aus der Grundgesamtheit gezogen wird, ist angebbar.

## Typen
Einfache Zufallsstichprobe:         "Ziehen mit Zurücklegen." --> Stichprobenvariablen sind unabhängig!
uneingeschränkte Zufallsstichprobe: "Ziehen ohne Zurücklegen" --> Stichprobenvariablen sind abhängig!

## Stichprobenverteilung
Die Stichprobenverteilung ergibt sich durch mehrfaches Ziehen einer Stichprobe aus dem Grundgesamtheit. Für jede Stichprobe lässt sich ein Erwartungswert bestimmen. Die Häufigkeitsverteilung dieser Erwartungswerte ergibt die Stichprobenverteilung, welche Gemeinsamkeiten mit der Verteilungsfunktion der Grundgesamtheit hat:
 --> gleicher Mittelwert: µ_x = µ
 --> der sog. Standardfehler sigma_x = sigma/sqrt(n) (hängt also direkt mit der Standardabweichung der Verteilung der Grundgesamtheit zusammen)

Achtung:
"Die Standartabweichung der Stichprobenverteilung" ist der sog. Standartfehler. Dieser gibt an, wie sehr die Erwartungswerte der einzelnen Stichproben um den wahren Erwartungswert streuen.

## Zentraler Grenzwertsatz
"Faustregel": Wenn n > 30 kann man für die Stichprobenverteilung in der Regel annehmen, dass sie sich der Normalverteilung nähert.


https://de.wikipedia.org/wiki/Standardfehler
https://ortmann-statistik.de/glossar/zentraler-grenzwertsatz/#:~:text=Der%20zentraler%20Grenzwertsatz%20besagt%2C%20dass,untersuchenden%20Merkmals%20der%20Normalverteilung%20folgt.
https://statistikguru.de/lexikon/stichprobenverteilung.html

# Grundgesamtheit
https://www.bpb.de/nachschlagen/zahlen-und-fakten/soziale-situation-in-deutschland/61538/altersgruppen

Für 2018:
54 648 000 Einwohner zwischen 20 und 70 Jahren
27 556 000 Männer (50,4%)
27 096 000 Frauen (49,6%)


# Sprachsignale
Abhängigkeit von ...
  1. Geschlecht
  2. Alter

und variert mit:
  1. Betonung
  2. Sprechgeschwindigkeit
  3. (Pausen zwischen Worten)



Audioaufnahmen --> STFT --> LOG(abs(S)) --> IFFT --> Ceptstrum
                                 |
                                 +--> Filt+DCT --> MFCC

Aus Ceptstrum oder MFCC erhält man die featutes des Audio Signals.

==> Zufallsvariablen sind die features

Frage1:
  Wie sehr hängen welche features von Alter/ Geschlecht/ Betonung ab?

Frage2:
  Wie beeinflusst die Wahl der Fenstergröße der STFT, bzw. auch des Überlappens der Fenster, die resultierenden audio features im Hinblick auf Sprechgeschwindigkeit/ Pausen?