      MODULE NMPRD4P
      USE SIZES, ONLY: DPSIZE
      USE NMPRD4,ONLY: VRBL
      IMPLICIT NONE
      SAVE
      REAL(KIND=DPSIZE), DIMENSION (:),POINTER ::COM
      REAL(KIND=DPSIZE), POINTER ::TVV1,V1,TVCL,CL,TVV2,V2,TVQ,Q,S1,Y
      REAL(KIND=DPSIZE), POINTER ::A000032,A000034,A000036,A000038
      REAL(KIND=DPSIZE), POINTER ::A000040,A000042,A000044,A000046
      REAL(KIND=DPSIZE), POINTER ::A000047,A000048
      CONTAINS
      SUBROUTINE ASSOCNMPRD4
      COM=>VRBL
      TVV1=>COM(000001);V1=>COM(000002);TVCL=>COM(000003)
      CL=>COM(000004);TVV2=>COM(000005);V2=>COM(000006)
      TVQ=>COM(000007);Q=>COM(000008);S1=>COM(000009);Y=>COM(000010)
      A000032=>COM(000011);A000034=>COM(000012);A000036=>COM(000013)
      A000038=>COM(000014);A000040=>COM(000015);A000042=>COM(000016)
      A000044=>COM(000017);A000046=>COM(000018);A000047=>COM(000019)
      A000048=>COM(000020)
      END SUBROUTINE ASSOCNMPRD4
      END MODULE NMPRD4P
      SUBROUTINE PK(ICALL,IDEF,THETA,IREV,EVTREC,NVNT,INDXS,IRGG,GG,NETAS)      
      USE NMPRD4P
      USE SIZES,     ONLY: DPSIZE,ISIZE
      USE PRDIMS,    ONLY: GPRD,HPRD,GERD,HERD,GPKD
      USE NMBAYES_REAL,    ONLY: PRIOR_INFO
      USE NMBAYES_REAL, ONLY: ADDL_ACTUAL,ADDL_TIMEDIFF,ADDL_TIME
      USE NMPRD_INT, ONLY: PRED_IGNORE_DATA,PRED_IGNORE_DATA_TEST
      USE PRCOM_INT, ONLY: DES_DER=>MITER
      USE NMPRD_REAL,ONLY: ETA,EPS                                            
      USE NMPRD_INT, ONLY: MSEC=>ISECDER,MFIRST=>IFRSTDER,COMACT,COMSAV,IFIRSTEM,FIRSTEM
      USE NMPRD_INT, ONLY: MDVRES,ETASXI,NPDE_MODE,NOFIRSTDERCODE
      USE NMPRD_REAL, ONLY: DV_LOQ,CDF_L,DV_LAQ,CDF_LA
      USE NMPRD_INT, ONLY: IQUIT
      USE PROCM_INT, ONLY: NEWIND=>PNEWIF                                       
      USE NMBAYES_REAL, ONLY: LDF                                             
      USE NMBAYES_INT, ONLY: FLDF                                             
      IMPLICIT REAL(KIND=DPSIZE) (A-Z)                                          
      REAL(KIND=DPSIZE) :: EVTREC                                               
      SAVE
      INTEGER(KIND=ISIZE) :: ICALL,IDEF,IREV,NVNT,INDXS,IRGG,NETAS              
      DIMENSION :: IDEF(7,*),THETA(*),EVTREC(IREV,*),INDXS(*),GG(IRGG,GPKD+1,*) 
      FIRSTEM=IFIRSTEM
      IF (ICALL <= 1) THEN                                                      
      CALL ASSOCNMPRD4
      IDEF(   1,0001)=  -9
      IDEF(   1,0002)=  -1
      IDEF(   1,0003)=   0
      IDEF(   1,0004)=   0
      IDEF(   2,0003)=   0
      IDEF(   2,0004)=   0
      IDEF(   3,0001)=   5
      CALL GETETA(ETA)                                                          
      IF (IQUIT == 1) RETURN                                                    
      RETURN                                                                    
      ENDIF                                                                     
      IF (NEWIND /= 2) THEN
      IF (ICALL == 4) THEN
      CALL SIMETA(ETA)
      ELSE
      CALL GETETA(ETA)
      ENDIF
      IF (IQUIT == 1) RETURN
      ENDIF
 !  level            0
      TVV1=THETA(001) 
      B000001=DEXP(ETA(001)) 
      V1=TVV1*B000001 
      TVCL=THETA(002) 
      B000003=DEXP(ETA(002)) 
      CL=TVCL*B000003 
      TVV2=THETA(003) 
      B000005=DEXP(ETA(003)) 
      V2=TVV2*B000005 
      TVQ=THETA(004) 
      B000007=DEXP(ETA(004)) 
      Q=TVQ*B000007 
      S1=V1 
      IF (FIRSTEM == 1) THEN
!                      A000032 = DERIVATIVE OF V1 W.R.T. ETA(001)
      A000032=TVV1*B000001 
!                      A000036 = DERIVATIVE OF CL W.R.T. ETA(002)
      A000036=TVCL*B000003 
!                      A000040 = DERIVATIVE OF V2 W.R.T. ETA(003)
      A000040=TVV2*B000005 
!                      A000044 = DERIVATIVE OF Q W.R.T. ETA(004)
      A000044=TVQ*B000007 
!                      A000047 = DERIVATIVE OF S1 W.R.T. ETA(001)
      A000047=A000032 
      GG(0001,1,1)=CL
      GG(0001,0003,1)=A000036
      GG(0002,1,1)=V1
      GG(0002,0002,1)=A000032
      GG(0003,1,1)=Q
      GG(0003,0005,1)=A000044
      GG(0004,1,1)=V2
      GG(0004,0004,1)=A000040
      GG(0005,1,1)=S1
      GG(0005,0002,1)=A000047
      ELSE
      GG(0001,1,1)=CL
      GG(0002,1,1)=V1
      GG(0003,1,1)=Q
      GG(0004,1,1)=V2
      GG(0005,1,1)=S1
      ENDIF
      IF (MSEC == 1) THEN
!                      A000034 = DERIVATIVE OF A000032 W.R.T. ETA(001)
      A000034=TVV1*B000001 
!                      A000038 = DERIVATIVE OF A000036 W.R.T. ETA(002)
      A000038=TVCL*B000003 
!                      A000042 = DERIVATIVE OF A000040 W.R.T. ETA(003)
      A000042=TVV2*B000005 
!                      A000046 = DERIVATIVE OF A000044 W.R.T. ETA(004)
      A000046=TVQ*B000007 
!                      A000048 = DERIVATIVE OF A000047 W.R.T. ETA(001)
      A000048=A000034 
      GG(0001,0003,0003)=A000038
      GG(0002,0002,0002)=A000034
      GG(0003,0005,0005)=A000046
      GG(0004,0004,0004)=A000042
      GG(0005,0002,0002)=A000048
      ENDIF
      RETURN
      END
      SUBROUTINE ERROR (ICALL,IDEF,THETA,IREV,EVTREC,NVNT,INDXS,F,G,HH)       
      USE NMPRD4P
      USE SIZES,     ONLY: DPSIZE,ISIZE
      USE PRDIMS,    ONLY: GPRD,HPRD,GERD,HERD,GPKD
      USE NMPRD_INT, ONLY: PRED_IGNORE_DATA,PRED_IGNORE_DATA_TEST
      USE NMPRD_REAL,ONLY: ETA,EPS                                            
      USE NMPRD_INT, ONLY: MSEC=>ISECDER,MFIRST=>IFRSTDER,IQUIT,IFIRSTEM,FIRSTEM
      USE NMPRD_INT, ONLY: MDVRES,ETASXI,NPDE_MODE,NOFIRSTDERCODE
      USE NMPRD_REAL, ONLY: DV_LOQ,CDF_L,DV_LAQ,CDF_LA
      USE NMBAYES_REAL, ONLY: ADDL_ACTUAL,ADDL_TIMEDIFF,ADDL_TIME
      USE NMPRD_INT, ONLY: NEWL2
      USE PROCM_INT, ONLY: NEWIND=>PNEWIF                                       
      IMPLICIT REAL(KIND=DPSIZE) (A-Z)                                        
      REAL(KIND=DPSIZE) :: EVTREC                                             
      SAVE
      INTEGER(KIND=ISIZE) :: ICALL,IDEF,IREV,NVNT,INDXS                       
      DIMENSION :: IDEF(*),THETA(*),EVTREC(IREV,*),INDXS(*)                   
      REAL(KIND=DPSIZE) :: G(GERD,*),HH(HERD,*)                               
      FIRSTEM=IFIRSTEM
      IF (ICALL <= 1) THEN                                                    
      CALL ASSOCNMPRD4
      IDEF(2)=2
      IDEF(1)=1
      HH(1,1)=1.0D0
      IDEF(3)=000
      RETURN
      ENDIF
      IF (ICALL == 4) THEN
      IF (NEWL2 == 1) THEN
      CALL SIMEPS(EPS)
      IF (IQUIT == 1) RETURN
      ENDIF
      ENDIF
 !  level            0
      B000001=1.D0+EPS(001) 
      Y=F*B000001 
      IF (FIRSTEM == 1) THEN !1
      ENDIF !1
      F=Y
      RETURN
      END
      SUBROUTINE FSIZESR(NAME_FSIZES,F_SIZES)
      USE SIZES, ONLY: ISIZE
      INTEGER(KIND=ISIZE), DIMENSION(*) :: F_SIZES
      CHARACTER(LEN=*),    DIMENSION(*) :: NAME_FSIZES
      NAME_FSIZES(01)='LTH'; F_SIZES(01)=4
      NAME_FSIZES(02)='LVR'; F_SIZES(02)=5
      NAME_FSIZES(03)='LVR2'; F_SIZES(03)=0
      NAME_FSIZES(04)='LPAR'; F_SIZES(04)=15
      NAME_FSIZES(05)='LPAR3'; F_SIZES(05)=0
      NAME_FSIZES(06)='NO'; F_SIZES(06)=0
      NAME_FSIZES(07)='MMX'; F_SIZES(07)=1
      NAME_FSIZES(08)='LNP4'; F_SIZES(08)=0
      NAME_FSIZES(09)='LSUPP'; F_SIZES(09)=1
      NAME_FSIZES(10)='LIM7'; F_SIZES(10)=0
      NAME_FSIZES(11)='LWS3'; F_SIZES(11)=0
      NAME_FSIZES(12)='MAXIDS'; F_SIZES(12)=30
      NAME_FSIZES(13)='LIM1'; F_SIZES(13)=0
      NAME_FSIZES(14)='LIM2'; F_SIZES(14)=0
      NAME_FSIZES(15)='LIM3'; F_SIZES(15)=0
      NAME_FSIZES(16)='LIM4'; F_SIZES(16)=0
      NAME_FSIZES(17)='LIM5'; F_SIZES(17)=0
      NAME_FSIZES(18)='LIM6'; F_SIZES(18)=0
      NAME_FSIZES(19)='LIM8'; F_SIZES(19)=0
      NAME_FSIZES(20)='LIM10'; F_SIZES(20)=0
      NAME_FSIZES(21)='LIM11'; F_SIZES(21)=0
      NAME_FSIZES(22)='LIM13'; F_SIZES(22)=0
      NAME_FSIZES(23)='LIM15'; F_SIZES(23)=0
      NAME_FSIZES(24)='LIM16'; F_SIZES(24)=0
      NAME_FSIZES(25)='MAXRECID'; F_SIZES(25)=200
      NAME_FSIZES(26)='PC'; F_SIZES(26)=30
      NAME_FSIZES(27)='PCMORE'; F_SIZES(27)=0
      NAME_FSIZES(28)='PCT'; F_SIZES(28)=30
      NAME_FSIZES(29)='PIR'; F_SIZES(29)=700
      NAME_FSIZES(30)='PD'; F_SIZES(30)=50
      NAME_FSIZES(31)='PAL'; F_SIZES(31)=50
      NAME_FSIZES(32)='MAXFCN'; F_SIZES(32)=1000000
      NAME_FSIZES(33)='MAXIC'; F_SIZES(33)=90
      NAME_FSIZES(34)='PG'; F_SIZES(34)=80
      NAME_FSIZES(35)='NPOPMIXMAX'; F_SIZES(35)=0
      NAME_FSIZES(36)='MAXOMEG'; F_SIZES(36)=4
      NAME_FSIZES(37)='MAXPTHETA'; F_SIZES(37)=5
      NAME_FSIZES(38)='MAXITER'; F_SIZES(38)=20
      NAME_FSIZES(39)='ISAMPLEMAX'; F_SIZES(39)=0
      NAME_FSIZES(40)='DIMTMP'; F_SIZES(40)=0
      NAME_FSIZES(41)='DIMCNS'; F_SIZES(41)=0
      NAME_FSIZES(42)='DIMNEW'; F_SIZES(42)=0
      NAME_FSIZES(43)='PDT'; F_SIZES(43)=18
      NAME_FSIZES(44)='LADD_MAX'; F_SIZES(44)=0
      NAME_FSIZES(45)='MAXSIDL'; F_SIZES(45)=0
      NAME_FSIZES(46)='NTT'; F_SIZES(46)=4
      NAME_FSIZES(47)='NOMEG'; F_SIZES(47)=4
      NAME_FSIZES(48)='NSIGM'; F_SIZES(48)=1
      NAME_FSIZES(49)='PPDT'; F_SIZES(49)=4
      NAME_FSIZES(50)='PAST_SIZE'; F_SIZES(50)=4000
      NAME_FSIZES(51)='MAXNRDS'; F_SIZES(51)=30
      RETURN
      END SUBROUTINE FSIZESR
      SUBROUTINE MUMODEL2(THETA,MU_,ICALL,IDEF,NEWIND,&
      EVTREC,DATREC,IREV,NVNT,INDXS,F,G,H,IRGG,GG,NETAS)
      USE NMPRD4P
      USE SIZES,     ONLY: DPSIZE,ISIZE
      USE PRDIMS,    ONLY: GPRD,HPRD,GERD,HERD,GPKD
      USE NMBAYES_REAL,    ONLY: PRIOR_INFO
      USE NMBAYES_REAL, ONLY: ADDL_ACTUAL,ADDL_TIMEDIFF,ADDL_TIME
      USE NMPRD_INT, ONLY: PRED_IGNORE_DATA,PRED_IGNORE_DATA_TEST
      USE PRCOM_INT, ONLY: DES_DER=>MITER
      USE NMPRD_REAL,ONLY: ETA,EPS
      USE NMPRD_INT, ONLY: MSEC=>ISECDER,MFIRST=>IFRSTDER,COMACT,COMSAV,IFIRSTEM,FIRSTEM
      USE NMPRD_INT, ONLY: MDVRES,ETASXI,NPDE_MODE,NOFIRSTDERCODE
      USE NMPRD_REAL, ONLY: DV_LOQ,CDF_L,DV_LAQ,CDF_LA
      USE NMPRD_INT, ONLY: IQUIT
      USE NMBAYES_REAL, ONLY: LDF
      USE NMBAYES_INT, ONLY: FLDF
      IMPLICIT REAL(KIND=DPSIZE) (A-Z)
      REAL(KIND=DPSIZE)   :: MU_(*)
      INTEGER NEWIND
      REAL(KIND=DPSIZE) :: EVTREC
      SAVE
      INTEGER(KIND=ISIZE) :: ICALL,IDEF,IREV,NVNT,INDXS,IRGG,NETAS
      DIMENSION :: IDEF(7,*),THETA(*),EVTREC(IREV,*),INDXS(*),GG(IRGG,GPKD+1,*)
      RETURN
      END
