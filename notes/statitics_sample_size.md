# inferential statistics

# random sample

`µ`  expectation  
`sigma` standard deviation

## conditions:
1. all elements must be choosen arbitrarily from the parent population
2. the probability for selecting an element from the parent population must be calculable

## types:
|       | simple random sample  | unrestricted random sample|
|-------|-------|-------|
|*choose elements ...* | *.. with returning* | *.. without returning* |
| sample variables     | independent | depending |

## sample distribution
sample distribution can be determined by choosing multiple times from the parent population. For every sample distribution, we  can calculate an expectation. The frequency distribution of the expectations is the sample distribution, which is similiar to the distribution of the parent population.
- same expectation: `µ_x = µ`
- standard deviation `sigma_x = sigma/sqrt(n)` (*directly depending on the standard deviation of distribution of the parent population*)

**important**:  
The *standard deviation of the sample distribution* is called standard error. This value shows how much the the expectations of the individual samples are scattered around the true expectation.

## central limit theorem
*rule of thumb*: If n > 30 the samples can be regarded as normal-distributed.

[wiki standart deviation](https://de.wikipedia.org/wiki/Standardfehler)  
[central limit theorem](https://ortmann-statistik.de/glossar/zentraler-grenzwertsatz/#:~:text=Der%20zentraler%20Grenzwertsatz%20besagt%2C%20dass,untersuchenden%20Merkmals%20der%20Normalverteilung%20folgt.)  
[sample distribution](https://statistikguru.de/lexikon/stichprobenverteilung.html)  

# parent population
(german *Grundgesamtheit*)  
[german peoples ages](https://www.bpb.de/nachschlagen/zahlen-und-fakten/soziale-situation-in-deutschland/61538/altersgruppen)

For 2018:
- 54 648 000 Inhabitant between 20 and 70 years
- 27 556 000 Men (50,4%)
- 27 096 000 Woman (49,6%)


# about speech
Depending on ...
  1. gender
  2. age

and changing with:
  1. accentuation
  2. rate of speaking
  3. (pauses between words)


```
audio recording --> STFT --> LOG(abs(S)) --> IFFT --> Ceptstrum
                                 |
                                 +--> Filt+DCT --> MFCC
```
From ceptstrum or MFCC, we can get the featutes of an audio signal.

&rarr; features are random variables

## Q1: how much are the features depending on age/ gender/ accentuation?

## Q2: How does the size of the STFT window, or the window overlap, influence the audio features w.r.t. rate of speaking and pauses?
