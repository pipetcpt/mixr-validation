Wed Jun  7 18:26:40 KST 2023
;Model Desc: Base population model w. covariance step
;Project Name: chapter5
;Project ID: NO PROJECT DESCRIPTION

$PROB RUN# 402 POPULATION DATA
$INPUT C ID TIME DV AMT
$DATA  402.csv IGNORE=C
$SUBROUTINES  ADVAN3 TRANS4

$PK
  TVV1=THETA(1)
  V1=TVV1*EXP(ETA(1))

  TVCL=THETA(2)
  CL=TVCL*EXP(ETA(2))

  TVV2=THETA(3)
  V2=TVV2*EXP(ETA(3))

  TVQ=THETA(4)
  Q=TVQ*EXP(ETA(4))

  S1=V1
$ERROR
  Y=F*(1+EPS(1))

$THETA  
(0,9.8) ;[V1]
(0,3.7) ;[CL]
(0,8.6) ;[V2]
(0,31)  ;[Q]

$OMEGA
    0.02 ; [P]
    0.02 ; [P]
    0.02 ; [P]
    0.02 ; [P]

$SIGMA
    0.02 ; [P]

$ESTIMATION METHOD=1 MAXEVAL=9999 INTER PRINT=5 FORMAT=,1PE13.6
$COV 
$TABLE ID TIME DV IPRE=CIPRED AMT CL V1 Q V2 ETA1 ETA2 ETA3 ETA4 
          CWRES IRES=CIRES IWRE=CIWRES NPD NPDE ESAMPLE=1000          
          NOPRINT FILE=402.tab FORMAT=s1PE12.5


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
 RUN# 402 POPULATION DATA
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:      390
 NO. OF DATA ITEMS IN DATA SET:   7
 ID DATA ITEM IS DATA ITEM NO.:   2
 DEP VARIABLE IS DATA ITEM NO.:   4
 MDV DATA ITEM IS DATA ITEM NO.:  7
0INDICES PASSED TO SUBROUTINE PRED:
   6   3   5   0   0   0   0   0   0   0   0
0LABELS FOR DATA ITEMS:
 C ID TIME DV AMT EVID MDV
0LABELS FOR SPECIAL ITEMS:
 PRED RES WRES
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 V1 CL V2 Q
0FORMAT FOR DATA:
 (5E7.0,2F2.0)

 TOT. NO. OF OBS RECS:      360
 TOT. NO. OF INDIVIDUALS:       30
0LENGTH OF THETA:   4
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   4
0DEFAULT OMEGA BOUNDARY TEST OMITTED:    NO
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
  0.0000E+00     0.9800E+01     0.1000E+07
  0.0000E+00     0.3700E+01     0.1000E+07
  0.0000E+00     0.8600E+01     0.1000E+07
  0.0000E+00     0.3100E+02     0.1000E+07
0INITIAL ESTIMATE OF OMEGA:
 0.2000E-01
 0.0000E+00   0.2000E-01
 0.0000E+00   0.0000E+00   0.2000E-01
 0.0000E+00   0.0000E+00   0.0000E+00   0.2000E-01
0INITIAL ESTIMATE OF SIGMA:
 0.2000E-01
0COVARIANCE STEP OMITTED:        NO
 EIGENVLS. PRINTED:              NO
 SPECIAL COMPUTATION:            NO
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
 MC SAMPLES (ESAMPLE):    1000
 WRES SQUARE ROOT TYPE (WRESCHOL): EIGENVALUE
0-- TABLE   1 --
0RECORDS ONLY:    ALL
04 COLUMNS APPENDED:    YES
 PRINTED:                NO
 HEADER:                YES
 FILE TO BE FORWARDED:   NO
 FORMAT:                s1PE12.5
 IDFORMAT:
 LFORMAT:
 RFORMAT:
 FIXED_EFFECT_ETAS:
0USER-CHOSEN ITEMS:
 ID TIME DV IPRE AMT CL V1 Q V2 ETA1 ETA2 ETA3 ETA4 CWRES IRES IWRE NPD NPDE
1DOUBLE PRECISION PREDPP VERSION 7.5.1

 TWO COMPARTMENT MODEL (ADVAN3)
0MAXIMUM NO. OF BASIC PK PARAMETERS:   4
0BASIC PK PARAMETERS (AFTER TRANSLATION):
   BASIC PK PARAMETER NO.  1: ELIMINATION RATE (K)
   BASIC PK PARAMETER NO.  2: CENTRAL-TO-PERIPH. RATE (K12)
   BASIC PK PARAMETER NO.  3: PERIPH.-TO-CENTRAL RATE (K21)
 TRANSLATOR WILL CONVERT PARAMETERS
 CL, V1, Q, V2 TO K, K12, K21 (TRANS4)
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         CENTRAL      ON         NO         YES        YES        YES
    2         PERIPH.      ON         NO         YES        NO         NO
    3         OUTPUT       OFF        YES        NO         NO         NO
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            5           *           *           *           *
    2            *           *           *           *           *
    3            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0ERROR IN LOG Y IS MODELED
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      6
   TIME DATA ITEM IS DATA ITEM NO.:          3
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   5

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
 RAW OUTPUT FILE (FILE): 402.ext
 EXCLUDE TITLE (NOTITLE):                   NO
 EXCLUDE COLUMN LABELS (NOLABEL):           NO
 FORMAT FOR ADDITIONAL FILES (FORMAT):      ,1PE13.6
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
 CIWRES=IWRE
 CIPRED=IPRE
 CIRES=IRES

 MONITORING OF SEARCH:


0ITERATION NO.:    0    OBJECTIVE VALUE:   1835.55186142586        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  9.8000E+00  3.7000E+00  8.6000E+00  3.1000E+01  2.0000E-02  2.0000E-02  2.0000E-02  2.0000E-02  2.0000E-02
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   2.4561E+02 -2.6779E+02 -1.0089E+03  8.7754E+02 -2.1339E+01 -1.9200E+00 -3.4413E+02 -2.6729E+02 -2.0293E+03

0ITERATION NO.:    5    OBJECTIVE VALUE:   448.591064233030        NO. OF FUNC. EVALS.:  42
 CUMULATIVE NO. OF FUNC. EVALS.:       49
 NPARAMETR:  9.7316E+00  3.6775E+00  6.4137E+01  9.7920E+00  1.3775E-02  3.3675E-02  2.3362E-01  4.0246E-02  3.6802E-02
 PARAMETER:  9.2999E-02  9.3891E-02  2.1093E+00 -1.0524E+00 -8.6424E-02  3.6051E-01  1.3290E+00  4.4964E-01  4.0492E-01
 GRADIENT:  -9.2382E+01  6.0017E+01  1.3138E+02  6.9434E+01  6.7461E+00  1.2396E+01 -2.4688E+01  1.7744E+01  3.7741E+02

0ITERATION NO.:   10    OBJECTIVE VALUE:   290.456623722493        NO. OF FUNC. EVALS.:  43
 CUMULATIVE NO. OF FUNC. EVALS.:       92
 NPARAMETR:  1.0013E+01  3.9008E+00  7.0608E+01  8.9952E+00  1.8788E-02  3.1519E-02  1.1569E+00  2.3918E-02  1.1386E-02
 PARAMETER:  1.2151E-01  1.5285E-01  2.2054E+00 -1.1373E+00  6.8741E-02  3.2744E-01  2.1289E+00  1.8945E-01 -1.8165E-01
 GRADIENT:   5.2782E+01  4.0997E+01  4.9731E+01  4.0653E+01  6.4706E+00  1.7435E+01  2.3129E+01  2.7371E+00  1.0937E+02

0ITERATION NO.:   15    OBJECTIVE VALUE:   225.703788747280        NO. OF FUNC. EVALS.:  41
 CUMULATIVE NO. OF FUNC. EVALS.:      133
 NPARAMETR:  9.8041E+00  3.9186E+00  3.1281E+01  8.4974E+00  2.3292E-02  3.1004E-03  3.8479E-02  2.7466E-02  9.1937E-03
 PARAMETER:  1.0042E-01  1.5740E-01  1.3912E+00 -1.1942E+00  1.7618E-01 -8.3210E-01  4.2718E-01  2.5860E-01 -2.8861E-01
 GRADIENT:   6.0316E+00  1.8425E+02  2.9008E+01 -5.8021E+01  1.4582E+01 -4.6025E+01 -1.8578E+01  6.6191E+00 -2.0059E+01

0ITERATION NO.:   20    OBJECTIVE VALUE:   196.074511300629        NO. OF FUNC. EVALS.:  41
 CUMULATIVE NO. OF FUNC. EVALS.:      174
 NPARAMETR:  9.7456E+00  3.8936E+00  3.0686E+01  8.7357E+00  1.5164E-02  1.9687E-02  2.7852E-02  2.3563E-02  8.8207E-03
 PARAMETER:  9.4434E-02  1.5100E-01  1.3721E+00 -1.1666E+00 -3.8392E-02  9.2102E-02  2.6559E-01  1.8198E-01 -3.0931E-01
 GRADIENT:  -3.7959E+00  1.0232E+01  3.9506E+00 -2.7487E+00  7.8803E-01 -7.6489E-01 -1.0415E+00  5.7348E-01 -1.0379E+00

0ITERATION NO.:   25    OBJECTIVE VALUE:   196.008403792224        NO. OF FUNC. EVALS.:  66
 CUMULATIVE NO. OF FUNC. EVALS.:      240
 NPARAMETR:  9.7609E+00  3.8767E+00  3.0819E+01  8.7725E+00  1.4872E-02  1.9983E-02  2.9207E-02  2.3221E-02  8.8423E-03
 PARAMETER:  9.5998E-02  1.4666E-01  1.3764E+00 -1.1624E+00 -4.8126E-02  9.9572E-02  2.8933E-01  1.7467E-01 -3.0809E-01
 GRADIENT:   1.3225E-01 -4.2390E-02  3.0396E-02 -2.9558E-01  1.0989E-02  2.4354E-02  1.6908E-02  6.3653E-02  8.5438E-02

0ITERATION NO.:   28    OBJECTIVE VALUE:   196.008341641257        NO. OF FUNC. EVALS.:  42
 CUMULATIVE NO. OF FUNC. EVALS.:      282
 NPARAMETR:  9.7603E+00  3.8768E+00  3.0818E+01  8.7739E+00  1.4869E-02  1.9972E-02  2.9188E-02  2.3183E-02  8.8412E-03
 PARAMETER:  9.5946E-02  1.4668E-01  1.3763E+00 -1.1622E+00 -4.8211E-02  9.9289E-02  2.8902E-01  1.7385E-01 -3.0815E-01
 GRADIENT:  -6.9190E-03 -9.3288E-03  2.9781E-03  1.0274E-02  2.7063E-03  2.4210E-04 -4.9167E-04  2.5937E-03 -1.2765E-03

 #TERM:
0MINIMIZATION SUCCESSFUL
 NO. OF FUNCTION EVALUATIONS USED:      282
 NO. OF SIG. DIGITS IN FINAL EST.:  3.5

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.

 ETABAR:        -2.3376E-03  2.3641E-03 -2.6894E-03 -1.7748E-04
 SE:             1.9718E-02  2.3009E-02  2.3704E-02  2.4590E-02
 N:                      30          30          30          30

 P VAL.:         9.0563E-01  9.1816E-01  9.0967E-01  9.9424E-01

 ETASHRINKSD(%)  1.1434E+01  1.0825E+01  2.4008E+01  1.1542E+01
 ETASHRINKVR(%)  2.1561E+01  2.0478E+01  4.2252E+01  2.1753E+01
 EBVSHRINKSD(%)  1.1325E+01  1.0912E+01  2.4239E+01  1.1491E+01
 EBVSHRINKVR(%)  2.1367E+01  2.0633E+01  4.2603E+01  2.1662E+01
 RELATIVEINF(%)  7.8240E+01  7.1009E+01  5.1215E+01  7.8202E+01
 EPSSHRINKSD(%)  1.2856E+01
 EPSSHRINKVR(%)  2.4058E+01

  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):          360
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    661.63574390736437     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    196.00834164125718     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       857.64408554862155     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           120
  
 #TERE:
 Elapsed estimation  time in seconds:     0.69
 Elapsed covariance  time in seconds:     0.41
 Elapsed postprocess time in seconds:     0.28
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************      196.008       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         9.76E+00  3.88E+00  3.08E+01  8.77E+00
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.49E-02
 
 ETA2
+        0.00E+00  2.00E-02
 
 ETA3
+        0.00E+00  0.00E+00  2.92E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.32E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        8.84E-03
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.22E-01
 
 ETA2
+        0.00E+00  1.41E-01
 
 ETA3
+        0.00E+00  0.00E+00  1.71E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.52E-01
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        9.40E-02
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                            STANDARD ERROR OF ESTIMATE                          ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         2.43E-01  1.07E-01  1.28E+00  2.73E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.42E-03
 
 ETA2
+       .........  5.25E-03
 
 ETA3
+       ......... .........  1.12E-02
 
 ETA4
+       ......... ......... .........  5.65E-03
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        6.59E-04
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.40E-02
 
 ETA2
+       .........  1.86E-02
 
 ETA3
+       ......... .........  3.27E-02
 
 ETA4
+       ......... ......... .........  1.86E-02
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        3.51E-03
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          COVARIANCE MATRIX OF ESTIMATE                         ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM14      OM22      OM23      OM24      OM33  
             OM34      OM44      SG11  
 
 TH 1
+        5.91E-02
 
 TH 2
+        1.40E-02  1.15E-02
 
 TH 3
+        1.32E-01 -6.80E-03  1.65E+00
 
 TH 4
+        2.52E-02  1.29E-02  2.01E-01  7.45E-02
 
 OM11
+       -1.37E-04 -8.96E-05 -3.96E-04 -2.23E-05  1.17E-05
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -2.30E-04 -6.35E-05 -2.41E-04 -1.29E-04  6.13E-06 ......... ......... .........  2.75E-05
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -3.67E-04 -1.65E-04 -3.51E-03 -5.17E-04  8.94E-06 ......... ......... ......... -1.43E-05 ......... .........  1.25E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM44
+       -6.76E-05 -8.06E-05 -1.32E-03 -4.40E-04  1.61E-06 ......... ......... .........  8.61E-06 ......... .........  2.98E-05
         .........  3.20E-05
 
 SG11
+       -2.51E-05 -1.65E-05 -1.91E-04 -5.83E-05 -2.80E-07 ......... ......... ......... -1.03E-06 ......... .........  1.97E-06
         .........  8.75E-07  4.35E-07
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM14      OM22      OM23      OM24      OM33  
             OM34      OM44      SG11  
 
 TH 1
+        2.43E-01
 
 TH 2
+        5.39E-01  1.07E-01
 
 TH 3
+        4.22E-01 -4.95E-02  1.28E+00
 
 TH 4
+        3.80E-01  4.43E-01  5.73E-01  2.73E-01
 
 OM11
+       -1.64E-01 -2.44E-01 -9.02E-02 -2.39E-02  3.42E-03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.80E-01 -1.13E-01 -3.58E-02 -9.00E-02  3.41E-01 ......... ......... .........  5.25E-03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.35E-01 -1.38E-01 -2.45E-01 -1.69E-01  2.34E-01 ......... ......... ......... -2.43E-01 ......... .........  1.12E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM44
+       -4.92E-02 -1.33E-01 -1.82E-01 -2.85E-01  8.33E-02 ......... ......... .........  2.90E-01 ......... .........  4.71E-01
         .........  5.65E-03
 
 SG11
+       -1.56E-01 -2.34E-01 -2.26E-01 -3.24E-01 -1.24E-01 ......... ......... ......... -2.97E-01 ......... .........  2.67E-01
         .........  2.35E-01  6.59E-04
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM14      OM22      OM23      OM24      OM33  
             OM34      OM44      SG11  
 
 TH 1
+        3.92E+01
 
 TH 2
+       -6.36E+01  2.59E+02
 
 TH 3
+       -4.68E+00  1.43E+01  1.79E+00
 
 TH 4
+        9.84E+00 -5.71E+01 -5.37E+00  3.57E+01
 
 OM11
+       -4.20E+02  1.85E+03  1.07E+02 -4.61E+02  1.33E+05
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        4.32E+02 -3.46E+02 -2.02E+01  1.20E+02 -4.55E+04 ......... ......... .........  7.97E+04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        9.47E+01  3.74E+01  1.87E+01 -5.49E+01 -1.88E+04 ......... ......... .........  2.04E+04 ......... .........  1.71E+04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM44
+       -3.21E+02  1.60E+02  1.33E+00  1.69E+02  2.36E+04 ......... ......... ......... -4.20E+04 ......... ......... -2.03E+04
         .........  6.55E+04
 
 SG11
+        7.62E+01  4.65E+03  2.71E+02  7.33E+02  4.73E+04 ......... ......... .........  1.70E+05 ......... .........  7.64E+03
         ......... -1.13E+05  3.32E+06
 
 Elapsed finaloutput time in seconds:     0.02
 #CPUT: Total CPU Time in Seconds,        1.430
Stop Time:
Wed Jun  7 18:26:43 KST 2023
