# Violating stationary assumption
- Didn't include in Nature E&E submission because I didn't see a logical place to add it at the time.
- In retrospect, I could have said something like

"One key assumption underlying all of our analyses using the model ROC-SEMPPR is that our observations of CUB within and across genes are drawn from the evolutionary stationary distribution for that genome. 
The fact that the exogenous region differs from that of the rest of the genome in terms of its codon usage indicates this stationarity assumption is violated.
Thus it is useful to consider how this violation could impact our parameter estimates and, in turn, inferences."


- Would be nice to have simulation work to validate our insights.
  Cedric, do you dare contemplating revisiting this issue?

## Notes from Mike's labbook.md file on 24 Apr 2019
There are countless ways in which the stationarity assumption can be violated.
To gain insight on what the expected or average effects would be (i.e. we place each genotype on their respective adaptive landscape where every genotype has equal probability of being chosen for `placement') we argue the following.

1. Effect on estimates of \DeltaEta when genes are more (less) adapted than expected at stationarity
   - If the genes, on average, display greater (less) adaptation than we expect understationarity, then we'd over (under) estimate the values of \DeltaEta.
2. Probability of being in the more or less adaptive regions of genotype space
   - Ignoring the effects of mutation bias, the distribution of \eta values across synonymous genotype space is approximately symmetrical.
	 Thus, when \phi = 0, the E(\eta| \phi=0) = Mean(\eta) and 1/2 the space would be more adaptive and 1/2 would be less adaptive than expected.
	 As \phi increases from 0, the E(\eta| \phi) decreases and we have a smaller area of genotype space above our expectation and a larger area below it.
	 As \phi becomes extremely high, almost all of the genotype space would be less adaptive than expected.
	 Based on this reasoning, we would expect 50% (low expression genes) to 99% (high expression genes) of the genotype space to be less adaptive than expected.
	 Thus, naively we'd expect to generally underestimate the strength of selection \DeltaEta values.
   
   

% Would be nice to have simulation work to validate our insights.
%  Cedric, do you dare contemplating revisiting this issue?

Assuming that the relative level of protein synthesis of the introgressed genes is well correlated with the endogenous orthologs they replaced, between the endogenous and exogenous  expression If the exogenous genes, on average, display greater (less) adaptation than we expect understationarity, then we'd over (under) estimate the values of \DeltaEta.

There are countless ways in which the stationarity assumption can be violated.
To gain insight on what the expected or average effects would be (i.e. we place each genotype on their respective adaptive landscape where every genotype has equal probability of being chosen for `placement') we argue the following.

1. Effect on estimates of \DeltaEta when genes are more (less) adapted than expected at stationarity
   - 
2. Probability of being in the more or less adaptive regions of genotype space
   - Ignoring the effects of mutation bias, the distribution of \eta values across synonymous genotype space is approximately symmetrical.
	 Thus, when \phi = 0, the E(\eta| \phi=0) = Mean(\eta) and 1/2 the space would be more adaptive and 1/2 would be less adaptive than expected.
	 As \phi increases from 0, the E(\eta| \phi) decreases and we have a smaller area of genotype space above our expectation and a larger area below it.
	 As \phi becomes extremely high, almost all of the genotype space would be less adaptive than expected.
	 Based on this reasoning, we would expect 50% (low expression genes) to 99% (high expression genes) of the genotype space to be less adaptive than expected.
	 Thus, naively we'd expect to generally underestimate the strength of selection \DeltaEta values.

