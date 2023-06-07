library(nonmem2rx)

mod <- nonmem2rx(system.file("mods/cpt/runODE032.ctl", package="nonmem2rx"), lst=".res", save=FALSE)

mod <- nonmem2rx(system.file("mods/cpt/runODE032.ctl", package="nonmem2rx"), lst=".res", save=FALSE,
                 thetaNames=c("lcl", "lvc", "lq", "lvp", "prop.sd"),
                 etaNames=c("eta.cl", "eta.vc", "eta.q","eta.vp"),
                 cmtNames = c("central", "perip"))
