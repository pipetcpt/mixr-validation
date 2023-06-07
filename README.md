
# mixr-validation

babelmixr2, nonmem2rx validation

## datasets

- The datasets are imported from the article. (CPT Pharmacometrics Syst
  Pharmacol . 2019 Aug;8(8):525-537. doi: 10.1002/psp4.12404. Epub 2019
  Jun 13. NONMEM Tutorial Part I: Description of Commands and Options,
  With Simple Examples of Population Analysis)
  https://ascpt.onlinelibrary.wiley.com/doi/10.1002/psp4.12404

<!-- -->

    nmfe75 402.ctl 402.res -prdefault
    nmfe75 504.ctl 504.res -prdefault

``` r
library(nonmem2rx)
mod1 <- nonmem2rx("psp-1/402.ctl", lst=".res", save=FALSE)
mod2 <- nonmem2rx("psp-2/504.ctl", lst=".res", save=FALSE)
```
