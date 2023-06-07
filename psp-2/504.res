Wed Jun  7 19:13:04 KST 2023
$PROB Phase IIa Study, One Compartment Model 504.ctl
; Place column names of data file here:
$INPUT C ID TIME DV AMT RATE WT AGE SEX 
$DATA 501.csv IGNORE=C ; Ignore records beginning with letter C
; Select One compartment model ADVAN1, Parameterization TRANS2 (CL, V)
$SUBROUTINE ADVAN1 TRANS2 
; Section to define PK parameters, relationship to fixed effects THETA
; and inter-subject random effects ETA.
$PK 
; Define typical values
  TVCL=THETA(1)*(WT/70)**THETA(3)*(AGE/50)**THETA(5)*THETA(7)**SEX
  TVV= THETA(2)*(WT/70)**THETA(4)*(AGE/50)**THETA(6)*THETA(8)**SEX
  CL=TVCL*EXP(ETA(1))
  V=TVV*EXP(ETA(2))
  S1=V
$THETA ; Enter initial starting values for THETAS
  (0,4)  ;[CL]
  (0,30) ;[V]
  0.8    ;[CL~WT]
  0.8    ;[V~WT]
  -0.1   ;[CL~AGE]
  0.1    ;[V~AGE]
  0.7    ;[CL~SEX]
  0.7    ;[V~SEX]

; Section to relate predicted function F and residual error
; relationship to data DV.  EPS are random error coefficients
$ERROR 
  Y=F*(1+EPS(1))
$OMEGA BLOCK(2) ; Initial OMEGA values in lower triangular format
  0.1         ;[P]
  0.001 0.1   ;[P]
$SIGMA ; Initial SIGMA
  0.04        ;[P]

;FOCEI is selected
$EST METHOD=COND INTERACTION MAXEVAL=9999 PRINT=5 NOABORT 
; Evaluate variance-covariance of estimates
$COV UNCONDITIONAL MATRIX=R PRINT=E
; Print out individual predicted results and diagnostics
; to file 504.tab
; Various parameters and built in diagnostics may be printed.
; DV=DEPENDENT VARIABLE
; CIPRED=individual predicted function, f(eta_hat), at mode of
; posterior density
; CIRES=DV-F(ETA_HAT)
; CIWRES=conditional individual residual
; (DV-F(ETA_HAT)/SQRT(SIGMA(1,1)*F(ETA_HAT))
; PRED=Population Predicted value F(ETA=0)
; CWRES=Population weighted Residual
; Note numerical Format may be specified for table outputs
$TABLE ID TIME DV CIPRED CIRES CIWRES PRED RES CWRES CL V ETA1 ETA2
       NOPRINT NOAPPEND ONEHEADER FORMAT=,1PE13.6 FILE=504.tab

NM-TRAN MESSAGES
  
 WARNINGS AND ERRORS (IF ANY) FOR PROBLEM    1
             
 (WARNING  2) NM-TRAN INFERS THAT THE DATA ARE POPULATION.
  
Note: Analytical 2nd Derivatives are constructed in FSUBS but are never used.
      You may insert $ABBR DERIV2=NO after the first $PROB to save FSUBS construction and compilation time
  

License Registered to: AIMS BioScience Co Ltd
Expiration Date:    14 MAY 2024
Current Date:        7 JUN 2023
Days until program expires : 342
1NONLINEAR MIXED EFFECTS MODEL PROGRAM (NONMEM) VERSION 7.5.1
 ORIGINALLY DEVELOPED BY STUART BEAL, LEWIS SHEINER, AND ALISON BOECKMANN
 CURRENT DEVELOPERS ARE ROBERT BAUER, ICON DEVELOPMENT SOLUTIONS,
 AND ALISON BOECKMANN. IMPLEMENTATION, EFFICIENCY, AND STANDARDIZATION
 PERFORMED BY NOUS INFOSYSTEMS.

 PROBLEM NO.:         1
 Phase IIa Study, One Compartment Model 504.ctl
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:      300
 NO. OF DATA ITEMS IN DATA SET:  11
 ID DATA ITEM IS DATA ITEM NO.:   2
 DEP VARIABLE IS DATA ITEM NO.:   4
 MDV DATA ITEM IS DATA ITEM NO.: 11
0INDICES PASSED TO SUBROUTINE PRED:
  10   3   5   6   0   0   0   0   0   0   0
0LABELS FOR DATA ITEMS:
 C ID TIME DV AMT RATE WT AGE SEX EVID MDV
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V
0FORMAT FOR DATA:
 (9E7.0,2F2.0)

 TOT. NO. OF OBS RECS:      240
 TOT. NO. OF INDIVIDUALS:       60
0LENGTH OF THETA:   8
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS BLOCK FORM:
  1
  1  1
0DEFAULT OMEGA BOUNDARY TEST OMITTED:    NO
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
  0.0000E+00     0.4000E+01     0.1000E+07
  0.0000E+00     0.3000E+02     0.1000E+07
 -0.1000E+07     0.8000E+00     0.1000E+07
 -0.1000E+07     0.8000E+00     0.1000E+07
 -0.1000E+07    -0.1000E+00     0.1000E+07
 -0.1000E+07     0.1000E+00     0.1000E+07
 -0.1000E+07     0.7000E+00     0.1000E+07
 -0.1000E+07     0.7000E+00     0.1000E+07
0INITIAL ESTIMATE OF OMEGA:
 BLOCK SET NO.   BLOCK                                                                    FIXED
        1                                                                                   NO
                  0.1000E+00
                  0.1000E-02   0.1000E+00
0INITIAL ESTIMATE OF SIGMA:
 0.4000E-01
0COVARIANCE STEP OMITTED:        NO
 R MATRIX SUBSTITUTED:          YES
 S MATRIX SUBSTITUTED:           NO
 EIGENVLS. PRINTED:             YES
 COMPRESSED FORMAT:              NO
 GRADIENT METHOD USED:     NOSLOW
 SIGDIGITS ETAHAT (SIGLO):                  -1
 SIGDIGITS GRADIENTS (SIGL):                -1
 EXCLUDE COV FOR FOCE (NOFCOV):              NO
 Cholesky Transposition of R Matrix (CHOLROFF):0
 KNUTHSUMOFF:                                -1
 RESUME COV ANALYSIS (RESUME):               NO
 SIR SAMPLE SIZE (SIRSAMPLE):
 NON-LINEARLY TRANSFORM THETAS DURING COV (THBND): 1
 PRECONDTIONING CYCLES (PRECOND):        0
 PRECONDTIONING TYPES (PRECONDS):        TOS
 FORCED PRECONDTIONING CYCLES (PFCOND):0
 PRECONDTIONING TYPE (PRETYPE):        0
 FORCED POS. DEFINITE SETTING DURING PRECONDITIONING: (FPOSDEF):0
 SIMPLE POS. DEFINITE SETTING: (POSDEF):-1
0TABLES STEP OMITTED:    NO
 NO. OF TABLES:           1
 SEED NUMBER (SEED):    11456
 NPDTYPE:    0
 INTERPTYPE:    0
 RANMETHOD:             3U
 MC SAMPLES (ESAMPLE):    300
 WRES SQUARE ROOT TYPE (WRESCHOL): EIGENVALUE
0-- TABLE   1 --
0RECORDS ONLY:    ALL
04 COLUMNS APPENDED:    NO
 PRINTED:                NO
 HEADER:                YES
 FILE TO BE FORWARDED:   NO
 FORMAT:                ,1PE13.6
 IDFORMAT:
 LFORMAT:
 RFORMAT:
 FIXED_EFFECT_ETAS:
0USER-CHOSEN ITEMS:
 ID TIME DV CIPRED CIRES CIWRES PRED RES CWRES CL V ETA1 ETA2
1DOUBLE PRECISION PREDPP VERSION 7.5.1

 ONE COMPARTMENT MODEL (ADVAN1)
0MAXIMUM NO. OF BASIC PK PARAMETERS:   2
0BASIC PK PARAMETERS (AFTER TRANSLATION):
   ELIMINATION RATE (K) IS BASIC PK PARAMETER NO.:  1

 TRANSLATOR WILL CONVERT PARAMETERS
 CLEARANCE (CL) AND VOLUME (V) TO K (TRANS2)
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         CENTRAL      ON         NO         YES        YES        YES
    2         OUTPUT       OFF        YES        NO         NO         NO
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            3           *           *           *           *
    2            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0ERROR IN LOG Y IS MODELED
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:     10
   TIME DATA ITEM IS DATA ITEM NO.:          3
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   5
   DOSE RATE DATA ITEM IS DATA ITEM NO.:     6

0PK SUBROUTINE CALLED WITH EVERY EVENT RECORD.
 PK SUBROUTINE NOT CALLED AT NONEVENT (ADDITIONAL OR LAGGED) DOSE TIMES.
0DURING SIMULATION, ERROR SUBROUTINE CALLED WITH EVERY EVENT RECORD.
 OTHERWISE, ERROR SUBROUTINE CALLED ONCE IN THIS PROBLEM.
1


 #TBLN:      1
 #METH: First Order Conditional Estimation with Interaction

 ESTIMATION STEP OMITTED:                 NO
 ANALYSIS TYPE:                           POPULATION
 NUMBER OF SADDLE POINT RESET ITERATIONS:      0
 GRADIENT METHOD USED:               NOSLOW
 CONDITIONAL ESTIMATES USED:              YES
 CENTERED ETA:                            NO
 EPS-ETA INTERACTION:                     YES
 LAPLACIAN OBJ. FUNC.:                    NO
 NO. OF FUNCT. EVALS. ALLOWED:            9999
 NO. OF SIG. FIGURES REQUIRED:            3
 INTERMEDIATE PRINTOUT:                   YES
 ESTIMATE OUTPUT TO MSF:                  NO
 ABORT WITH PRED EXIT CODE 1:             NO
 IND. OBJ. FUNC. VALUES SORTED:           NO
 NUMERICAL DERIVATIVE
       FILE REQUEST (NUMDER):               NONE
 MAP (ETAHAT) ESTIMATION METHOD (OPTMAP):   0
 ETA HESSIAN EVALUATION METHOD (ETADER):    0
 INITIAL ETA FOR MAP ESTIMATION (MCETA):    0
 SIGDIGITS FOR MAP ESTIMATION (SIGLO):      100
 GRADIENT SIGDIGITS OF
       FIXED EFFECTS PARAMETERS (SIGL):     100
 NOPRIOR SETTING (NOPRIOR):                 0
 NOCOV SETTING (NOCOV):                     OFF
 DERCONT SETTING (DERCONT):                 OFF
 FINAL ETA RE-EVALUATION (FNLETA):          1
 EXCLUDE NON-INFLUENTIAL (NON-INFL.) ETAS
       IN SHRINKAGE (ETASTYPE):             NO
 NON-INFL. ETA CORRECTION (NONINFETA):      0
 RAW OUTPUT FILE (FILE): 504.ext
 EXCLUDE TITLE (NOTITLE):                   NO
 EXCLUDE COLUMN LABELS (NOLABEL):           NO
 FORMAT FOR ADDITIONAL FILES (FORMAT):      S1PE12.5
 PARAMETER ORDER FOR OUTPUTS (ORDER):       TSOL
 KNUTHSUMOFF:                               0
 INCLUDE LNTWOPI:                           NO
 INCLUDE CONSTANT TERM TO PRIOR (PRIORC):   NO
 INCLUDE CONSTANT TERM TO OMEGA (ETA) (OLNTWOPI):NO
 ADDITIONAL CONVERGENCE TEST (CTYPE=4)?:    NO
 EM OR BAYESIAN METHOD USED:                 NONE


 THE FOLLOWING LABELS ARE EQUIVALENT
 PRED=PREDI
 RES=RESI
 WRES=WRESI
 IWRS=IWRESI
 IPRD=IPREDI
 IRS=IRESI

 MONITORING OF SEARCH:


0ITERATION NO.:    0    OBJECTIVE VALUE:   1173.07762335215        NO. OF FUNC. EVALS.:  11
 CUMULATIVE NO. OF FUNC. EVALS.:       11
 NPARAMETR:  4.0000E+00  3.0000E+01  8.0000E-01  8.0000E-01 -1.0000E-01  1.0000E-01  7.0000E-01  7.0000E-01  1.0000E-01  1.0000E-03
             1.0000E-01  4.0000E-02
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01 -1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01  1.0000E-01
 GRADIENT:   2.0435E+02 -2.7205E+02  1.4229E+02 -3.4476E+02  3.1911E+01  7.0862E+00  3.2563E+02 -2.0425E+03  2.2631E+00  2.2510E+00
            -4.7241E+01 -5.5370E+01

0ITERATION NO.:    5    OBJECTIVE VALUE:   1085.35374158079        NO. OF FUNC. EVALS.:  63
 CUMULATIVE NO. OF FUNC. EVALS.:       74
 NPARAMETR:  3.0253E+00  3.2901E+01  5.1192E-01  1.4497E+00 -1.7324E-01  9.8036E-02  9.2245E-01  9.7236E-01  9.3091E-02  9.5206E-04
             8.7163E-02  4.7461E-02
 PARAMETER: -1.7929E-01  1.9231E-01  6.3989E-02  1.8122E-01 -1.7324E-01  9.8036E-02  1.3178E-01  1.3891E-01  6.4206E-02  9.8676E-02
             3.1300E-02  1.8552E-01
 GRADIENT:  -3.5179E+00  3.0903E+01 -2.3627E+01  5.7794E+01  3.0120E+01  4.3508E-01 -1.4327E+01  2.0089E+02  4.5204E+01 -4.3976E-01
             3.0766E+01  5.0787E+00

0ITERATION NO.:   10    OBJECTIVE VALUE:   1065.48099639121        NO. OF FUNC. EVALS.:  64
 CUMULATIVE NO. OF FUNC. EVALS.:      138
 NPARAMETR:  2.8813E+00  3.3234E+01  5.1186E-01  1.5571E+00 -5.7113E-01  5.9889E-02  9.5825E-01  9.2575E-01  4.8053E-02  6.3051E-04
             5.1234E-02  5.0602E-02
 PARAMETER: -2.2806E-01  2.0238E-01  6.3983E-02  1.9464E-01 -5.7113E-01  5.9889E-02  1.3689E-01  1.3225E-01 -2.6643E-01  9.0956E-02
            -2.3441E-01  2.1755E-01
 GRADIENT:  -6.2542E+01  4.9387E+01 -9.2499E+01  1.1855E+02 -4.5593E+00  1.7155E+00 -2.2909E+01  1.5766E+02  1.8164E+01  2.0717E-01
            -3.3437E-01  1.3817E+01

0ITERATION NO.:   15    OBJECTIVE VALUE:   1058.33808676990        NO. OF FUNC. EVALS.:  64
 CUMULATIVE NO. OF FUNC. EVALS.:      202
 NPARAMETR:  3.0353E+00  3.2405E+01  6.6843E-01  1.3186E+00 -5.3638E-01  5.1554E-02  9.0060E-01  9.4181E-01  3.1067E-02  6.5678E-04
             4.5717E-02  5.0472E-02
 PARAMETER: -1.7598E-01  1.7711E-01  8.3554E-02  1.6482E-01 -5.3638E-01  5.1554E-02  1.2866E-01  1.3454E-01 -4.8452E-01  1.1784E-01
            -2.9145E-01  2.1627E-01
 GRADIENT:   2.5631E+00 -2.9440E+00  6.4504E+00 -4.0434E+00 -1.0454E-01  9.1723E-02  1.3942E+01 -1.6928E+01  9.0053E-01 -1.6248E-01
            -5.2128E-01  1.2478E+00

0ITERATION NO.:   20    OBJECTIVE VALUE:   1058.30560311991        NO. OF FUNC. EVALS.:  94
 CUMULATIVE NO. OF FUNC. EVALS.:      296
 NPARAMETR:  3.0329E+00  3.2408E+01  6.6074E-01  1.3214E+00 -5.3543E-01  5.1948E-02  9.0222E-01  9.4487E-01  3.0706E-02  1.4978E-03
             4.6623E-02  5.0237E-02
 PARAMETER: -1.7676E-01  1.7721E-01  8.2592E-02  1.6517E-01 -5.3543E-01  5.1948E-02  1.2889E-01  1.3498E-01 -4.9036E-01  2.7031E-01
            -2.8227E-01  2.1394E-01
 GRADIENT:  -4.7524E-01 -2.9980E-01 -3.7415E-01 -8.0998E-01 -1.9891E-01  9.8993E-03 -9.3736E+00 -6.5395E+00 -2.7168E-02  4.2274E-03
            -2.2922E-02 -4.7247E-02

0ITERATION NO.:   23    OBJECTIVE VALUE:   1058.30371062836        NO. OF FUNC. EVALS.:  74
 CUMULATIVE NO. OF FUNC. EVALS.:      370
 NPARAMETR:  3.0313E+00  3.2384E+01  6.5978E-01  1.3215E+00 -5.3407E-01  5.2296E-02  9.0388E-01  9.4676E-01  3.0720E-02  1.4790E-03
             4.6609E-02  5.0258E-02
 PARAMETER: -1.7729E-01  1.7645E-01  8.2473E-02  1.6519E-01 -5.3407E-01  5.2296E-02  1.2913E-01  1.3525E-01 -4.9012E-01  2.6684E-01
            -2.8240E-01  2.1414E-01
 GRADIENT:   1.7084E-02  1.2980E-03  2.9951E-02  2.9271E-03 -3.6918E-03 -1.0596E-03  8.6701E-02  4.6965E-03 -2.9738E-03  4.7094E-05
             3.6905E-05 -2.8812E-03

 #TERM:
0MINIMIZATION SUCCESSFUL
 NO. OF FUNCTION EVALUATIONS USED:      370
 NO. OF SIG. DIGITS IN FINAL EST.:  3.6

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.

 ETABAR:         4.1114E-03 -9.3810E-03
 SE:             1.8817E-02  2.2907E-02
 N:                      60          60

 P VAL.:         8.2704E-01  6.8215E-01

 ETASHRINKSD(%)  1.6841E+01  1.7812E+01
 ETASHRINKVR(%)  3.0845E+01  3.2452E+01
 EBVSHRINKSD(%)  1.7124E+01  1.7497E+01
 EBVSHRINKVR(%)  3.1316E+01  3.1933E+01
 RELATIVEINF(%)  6.8077E+01  6.7467E+01
 EPSSHRINKSD(%)  1.7012E+01
 EPSSHRINKVR(%)  3.1130E+01

  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):          240
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    441.09049593824290     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    1058.3037106283550     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       1499.3942065665979     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           120
  
 #TERE:
 Elapsed estimation  time in seconds:     0.44
 Elapsed covariance  time in seconds:     0.53
 Elapsed postprocess time in seconds:     0.01
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************     1058.304       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      TH 8     
 
         3.03E+00  3.24E+01  6.60E-01  1.32E+00 -5.34E-01  5.23E-02  9.04E-01  9.47E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        3.07E-02
 
 ETA2
+        1.48E-03  4.66E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        5.03E-02
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        1.75E-01
 
 ETA2
+        3.91E-02  2.16E-01
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        2.24E-01
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                            STANDARD ERROR OF ESTIMATE                          ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      TH 8     
 
         1.16E-01  1.58E+00  1.60E-01  2.02E-01  1.03E-01  1.31E-01  5.14E-02  6.75E-02
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        9.17E-03
 
 ETA2
+        7.61E-03  1.39E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        6.77E-03
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        2.62E-02
 
 ETA2
+        1.99E-01  3.21E-02
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        1.51E-02
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          COVARIANCE MATRIX OF ESTIMATE                         ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      TH 8      OM11      OM12      OM22      SG11  

 
 TH 1
+        1.35E-02
 
 TH 2
+        2.90E-02  2.49E+00
 
 TH 3
+       -2.77E-03 -1.11E-02  2.57E-02
 
 TH 4
+       -1.02E-03 -5.58E-02  4.28E-03  4.07E-02
 
 TH 5
+        3.36E-04 -2.56E-03 -1.28E-03 -3.54E-04  1.06E-02
 
 TH 6
+       -2.00E-04  2.34E-03 -3.82E-04 -2.61E-03  2.33E-03  1.73E-02
 
 TH 7
+       -3.62E-03 -6.98E-03 -1.83E-03 -3.56E-04  6.27E-04 -9.47E-05  2.64E-03
 
 TH 8
+       -6.33E-04 -6.55E-02 -3.72E-04 -3.07E-03 -9.25E-05  9.40E-04  4.51E-04  4.56E-03
 
 OM11
+       -2.59E-05  4.80E-04  1.05E-05  4.33E-05  2.80E-05 -1.65E-05  8.97E-06 -1.59E-05  8.41E-05
 
 OM12
+        6.17E-05  1.96E-04  3.38E-05  3.03E-05  7.64E-06 -2.80E-05 -9.81E-06 -6.28E-06  1.06E-05  5.78E-05
 
 OM22
+       -7.22E-05  2.19E-03 -8.85E-06  2.86E-05 -3.98E-05 -4.56E-05  4.93E-06 -6.42E-05  1.43E-05  2.51E-05  1.92E-04
 
 SG11
+        1.17E-04  5.35E-04 -5.82E-06 -1.94E-05 -6.68E-06  1.80E-05 -6.43E-06  2.06E-05 -1.75E-05 -4.62E-06 -2.41E-05  4.59E-05
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      TH 8      OM11      OM12      OM22      SG11  

 
 TH 1
+        1.16E-01
 
 TH 2
+        1.58E-01  1.58E+00
 
 TH 3
+       -1.49E-01 -4.41E-02  1.60E-01
 
 TH 4
+       -4.37E-02 -1.75E-01  1.32E-01  2.02E-01
 
 TH 5
+        2.81E-02 -1.57E-02 -7.77E-02 -1.70E-02  1.03E-01
 
 TH 6
+       -1.31E-02  1.13E-02 -1.82E-02 -9.86E-02  1.72E-01  1.31E-01
 
 TH 7
+       -6.07E-01 -8.60E-02 -2.23E-01 -3.44E-02  1.18E-01 -1.40E-02  5.14E-02
 
 TH 8
+       -8.07E-02 -6.15E-01 -3.43E-02 -2.26E-01 -1.33E-02  1.06E-01  1.30E-01  6.75E-02
 
 OM11
+       -2.44E-02  3.32E-02  7.15E-03  2.34E-02  2.96E-02 -1.37E-02  1.90E-02 -2.57E-02  9.17E-03
 
 OM12
+        6.98E-02  1.64E-02  2.78E-02  1.98E-02  9.73E-03 -2.80E-02 -2.51E-02 -1.22E-02  1.52E-01  7.61E-03
 
 OM22
+       -4.48E-02  1.00E-01 -3.98E-03  1.02E-02 -2.78E-02 -2.50E-02  6.93E-03 -6.86E-02  1.12E-01  2.38E-01  1.39E-02
 
 SG11
+        1.49E-01  5.00E-02 -5.37E-03 -1.42E-02 -9.55E-03  2.03E-02 -1.85E-02  4.51E-02 -2.82E-01 -8.97E-02 -2.56E-01  6.77E-03
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      TH 8      OM11      OM12      OM22      SG11  

 
 TH 1
+        1.48E+02
 
 TH 2
+       -1.51E+00  8.18E-01
 
 TH 3
+        3.08E+01 -9.25E-02  4.83E+01
 
 TH 4
+       -9.77E-01  2.04E+00 -3.91E+00  3.17E+01
 
 TH 5
+       -1.63E+01  6.60E-01  1.22E-02  1.40E+00  1.01E+02
 
 TH 6
+        7.24E+00 -6.49E-01  1.43E+00  1.45E+00 -1.50E+01  6.18E+01
 
 TH 7
+        2.26E+02 -2.14E+00  7.52E+01 -3.28E+00 -4.79E+01  1.89E+01  7.58E+02
 
 TH 8
+       -2.19E+01  1.32E+01 -3.13E+00  5.02E+01  1.80E+01 -2.19E+01 -7.32E+01  4.52E+02
 
 OM11
+       -2.43E+01 -6.24E+00 -1.12E+01 -2.51E+01 -3.17E+01  9.17E+00 -7.84E+01 -8.56E+01  1.32E+04
 
 OM12
+       -1.68E+02  1.60E+00 -5.42E+01 -7.91E+00 -1.20E+01  1.90E+01 -1.77E+02 -1.22E+01 -1.94E+03  1.89E+04
 
 OM22
+        4.27E+01 -7.64E+00  1.25E+01 -1.44E+01  1.93E+01  8.79E+00  3.66E+01 -5.00E+01 -7.12E+01 -2.37E+03  5.97E+03
 
 SG11
+       -3.24E+02 -1.70E+01 -6.49E+01 -4.98E+01  3.72E+01 -1.41E+01 -4.49E+02 -3.40E+02  4.97E+03  2.89E+02  2.87E+03  2.63E+04
 
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      EIGENVALUES OF COR MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

             1         2         3         4         5         6         7         8         9        10        11        12

 
         2.36E-01  2.95E-01  6.26E-01  7.67E-01  8.37E-01  9.50E-01  1.00E+00  1.09E+00  1.32E+00  1.37E+00  1.64E+00  1.86E+00
 
 Elapsed finaloutput time in seconds:     0.01
 #CPUT: Total CPU Time in Seconds,        1.019
Stop Time:
Wed Jun  7 19:13:07 KST 2023
